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

    aws-utils copy-credentials --profile "$profile" || {
        echo "Failed to copy credentials for profile '$profile'"
        return 4
    }

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