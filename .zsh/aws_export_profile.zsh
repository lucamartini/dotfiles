aws_export_profile() {

    local config_file="${AWS_CONFIG_FILE:-$HOME/.aws/config}"
    local profiles
    profiles=(${(f)"$(grep '^\[profile ' $config_file | sed 's/^\[profile \(.*\)\]$/\1/')"})
    [[ -f $config_file && $(grep '^\[default\]' $config_file) ]] && profiles+=("default")

    if [[ $# -ne 1 ]]; then
        echo "Usage: aws_export_profile <aws-profile>"
        return 1
    fi

    local profile="$1"
    local credential_file="$HOME/.aws/credentials"
    local section
    [[ "$profile" == "default" ]] && section="default" || section="profile $profile"

    if ! grep -q "^\[$section\]" "$config_file"; then
        echo "Profile '$profile' not found in $config_file"
        return 2
    fi

    aws sso login --profile "$profile" || {
        echo "Failed to log in to AWS SSO for profile '$profile'"
        return 3
    }

    local credentials
    credentials=$(aws configure export-credentials --profile "$profile" --output json)

    # Extract specific credentials
    local aws_access_key_id=$(echo "$credentials" | jq -r '.AccessKeyId')
    local aws_secret_access_key=$(echo "$credentials" | jq -r '.SecretAccessKey')
    local aws_session_token=$(echo "$credentials" | jq -r '.SessionToken')

    # Removes the existing block for the specific profile from the credentials file
    sed -i.bak "/^\[$profile\]/,/^$/d" "$credential_file"

    # Adds the new credentials for the profile
    {
        echo "[$profile]"
        echo "aws_access_key_id = $aws_access_key_id"
        echo "aws_secret_access_key = $aws_secret_access_key"
        echo "aws_session_token = $aws_session_token"
        echo ""
    } >> "$credential_file"

    export AWS_PROFILE="$profile"
    echo "AWS_PROFILE set to '$profile'"
}

# Completion
_aws_export_profile() {
    local config_file="${AWS_CONFIG_FILE:-$HOME/.aws/config}"
    local -a profiles
    profiles=(${(f)"$(grep '^\[profile ' $config_file | sed 's/^\[profile \(.*\)\]$/\1/')"})
    [[ -f $config_file && $(grep '^\[default\]' $config_file) ]] && profiles+=("default")
    _describe 'aws profiles' profiles
}
compdef _aws_export_profile aws_export_profile