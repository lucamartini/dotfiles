# The list of segments shown on the left. Fill it with the most important segments.
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  # =========================[ Line #1 ]=========================
  os_icon                 # os identifier
  context                 # user@hostname
  dir                     # current directory
  vcs                     # git status
  # =========================[ Line #2 ]=========================
  newline                 # \n
  prompt_char             # prompt symbol
)
# The list of segments shown on the right. Fill it with less important segments.
# Right prompt on the last prompt line (where you are typing your commands) gets
# automatically hidden when the input line reaches it. Right prompt above the
# last prompt line gets hidden if it would overlap with left prompt.
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  # =========================[ Line #1 ]=========================
  status                  # exit code of the last command
  command_execution_time  # duration of the last command
  background_jobs         # presence of background jobs
  direnv                  # direnv status (https://direnv.net/)
  # asdf                    # asdf version manager (https://github.com/asdf-vm/asdf)
  # anaconda                # conda environment (https://conda.io/)
  # pyenv                   # python environment (https://github.com/pyenv/pyenv)
  # goenv                   # go environment (https://github.com/syndbg/goenv)
  # nodenv                  # node.js version from nodenv (https://github.com/nodenv/nodenv)
  # nodeenv                 # node.js environment (https://github.com/ekalinin/nodeenv)
  # go_version            # go version (https://golang.org)
  # rust_version          # rustc version (https://www.rust-lang.org)
  # dotnet_version        # .NET version (https://dotnet.microsoft.com)
  # php_version           # php version (https://www.php.net/)
  # laravel_version       # laravel php framework version (https://laravel.com/)
  # java_version          # java version (https://www.java.com/)
  # package               # name@version from package.json (https://docs.npmjs.com/files/package.json)
  # rbenv                   # ruby version from rbenv (https://github.com/rbenv/rbenv)
  # rvm                     # ruby version from rvm (https://rvm.io)
  # fvm                     # flutter version management (https://github.com/leoafarias/fvm)
  luaenv                  # lua version from luaenv (https://github.com/cehoffman/luaenv)
  # jenv                    # java version from jenv (https://github.com/jenv/jenv)
  # plenv                   # perl version from plenv (https://github.com/tokuhirom/plenv)
  # perlbrew                # perl version from perlbrew (https://github.com/gugod/App-perlbrew)
  # phpenv                  # php version from phpenv (https://github.com/phpenv/phpenv)
  # scalaenv                # scala version from scalaenv (https://github.com/scalaenv/scalaenv)
  # haskell_stack           # haskell version from stack (https://haskellstack.org/)
  kubecontext             # current kubernetes context (https://kubernetes.io/)
  # terraform               # terraform workspace (https://www.terraform.io)
  # terraform_version     # terraform version (https://www.terraform.io)
  # aws                     # aws profile (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)
  # aws_eb_env              # aws elastic beanstalk environment (https://aws.amazon.com/elasticbeanstalk/)
  # azure                   # azure account name (https://docs.microsoft.com/en-us/cli/azure)
  gcloud                  # google cloud cli account and project (https://cloud.google.com/)
  google_app_cred         # google application credentials (https://cloud.google.com/docs/authentication/production)
  # toolbox                 # toolbox name (https://github.com/containers/toolbox)
  # nordvpn                 # nordvpn connection status, linux only (https://nordvpn.com/)
  # ranger                  # ranger shell (https://github.com/ranger/ranger)
  yazi                    # yazi shell (https://github.com/sxyazi/yazi)
  # nnn                     # nnn shell (https://github.com/jarun/nnn)
  # lf                      # lf shell (https://github.com/gokcehan/lf)
  # xplr                    # xplr shell (https://github.com/sayanarijit/xplr)
  vim_shell               # vim shell indicator (:sh)
  # midnight_commander      # midnight commander shell (https://midnight-commander.org/)
  # nix_shell               # nix shell (https://nixos.org/nixos/nix-pills/developing-with-nix-shell.html)
  # chezmoi_shell           # chezmoi shell (https://www.chezmoi.io/)
  # vi_mode               # vi mode (you don't need this if you've enabled prompt_char)
  # vpn_ip                # virtual private network indicator
  # load                  # CPU load
  # disk_usage            # disk usage
  # ram                   # free RAM
  # swap                  # used swap
  # todo                    # todo items (https://github.com/todotxt/todo.txt-cli)
  # timewarrior             # timewarrior tracking status (https://timewarrior.net/)
  # taskwarrior             # taskwarrior task count (https://taskwarrior.org/)
  # per_directory_history   # Oh My Zsh per-directory-history local/global indicator
  # cpu_arch              # CPU architecture
  node_env
  aws_profile
  time                    # current time
  # =========================[ Line #2 ]=========================
  newline
  # ip                    # ip address and bandwidth usage for a specified network interface
  # public_ip             # public IP address
  # proxy                 # system-wide http/https/ftp proxy
  # battery               # internal battery
  # wifi                  # wifi speed
  # example               # example user-defined segment (see prompt_example function below)
  node_version          # node.js version
  # nvm                     # node.js version from nvm (https://github.com/nvm-sh/nvm)
  # virtualenv              # python virtual environment (https://docs.python.org/3/library/venv.html)
  amplify
)

# Formatter for Git status.
#
# Example output: master wip ⇣42⇡42 *42 merge ~42 +42 !42 ?42.
#
# You can edit the function to customize how Git status looks.
#
# VCS_STATUS_* parameters are set by gitstatus plugin. See reference:
# https://github.com/romkatv/gitstatus/blob/master/gitstatus.plugin.zsh.
function my_git_formatter() {
  emulate -L zsh

  if [[ -n $P9K_CONTENT ]]; then
    # If P9K_CONTENT is not empty, use it. It's either "loading" or from vcs_info (not from
    # gitstatus plugin). VCS_STATUS_* parameters are not available in this case.
    typeset -g my_git_format=$P9K_CONTENT
    return
  fi

  # Styling for different parts of Git status.
  local       meta='%7F' # white foreground
  local      clean='%0F' # black foreground
  local   modified='%0F' # black foreground
  local  untracked='%0F' # black foreground
  local conflicted='%1F' # red foreground

  local res

  if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
    local branch=${(V)VCS_STATUS_LOCAL_BRANCH}
    # If local branch name is at most 32 characters long, show it in full.
    # Otherwise show the first 12 … the last 12.
    # Tip: To always show local branch name in full without truncation, delete the next line.
    (( $#branch > 32 )) && branch[13,-13]="…"  # <-- this line
    res+="${clean}${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}${branch//\%/%%}"
  fi

  if [[ -n $VCS_STATUS_TAG
        # Show tag only if not on a branch.
        # Tip: To always show tag, delete the next line.
        # && -z $VCS_STATUS_LOCAL_BRANCH  # <-- this line
      ]]; then
    local tag=${(V)VCS_STATUS_TAG}
    # If tag name is at most 32 characters long, show it in full.
    # Otherwise show the first 12 … the last 12.
    # Tip: To always show tag name in full without truncation, delete the next line.
    (( $#tag > 32 )) && tag[13,-13]="…"  # <-- this line
    res+="${clean}#${tag//\%/%%}"
  fi

  # Display the current Git commit if there is no branch and no tag.
  # Tip: To always display the current Git commit, delete the next line.
  [[ -z $VCS_STATUS_LOCAL_BRANCH && -z $VCS_STATUS_TAG ]] &&  # <-- this line
    res+="${meta}@${clean}${VCS_STATUS_COMMIT[1,8]}"

  # Show tracking branch name if it differs from local branch.
  if [[ -n ${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH} ]]; then
    res+="${meta}:${clean}${(V)VCS_STATUS_REMOTE_BRANCH//\%/%%}"
  fi

  # Display "wip" if the latest commit's summary contains "wip" or "WIP".
  if [[ $VCS_STATUS_COMMIT_SUMMARY == (|*[^[:alnum:]])(wip|WIP)(|[^[:alnum:]]*) ]]; then
    res+=" ${modified}wip"
  fi

  if (( VCS_STATUS_COMMITS_AHEAD || VCS_STATUS_COMMITS_BEHIND )); then
    # ⇣42 if behind the remote.
    (( VCS_STATUS_COMMITS_BEHIND )) && res+=" ${clean}⇣${VCS_STATUS_COMMITS_BEHIND}"
    # ⇡42 if ahead of the remote; no leading space if also behind the remote: ⇣42⇡42.
    (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && res+=" "
    (( VCS_STATUS_COMMITS_AHEAD  )) && res+="${clean}⇡${VCS_STATUS_COMMITS_AHEAD}"
  elif [[ -n $VCS_STATUS_REMOTE_BRANCH ]]; then
    # Tip: Uncomment the next line to display '=' if up to date with the remote.
    # res+=" ${clean}="
  fi

  # ⇠42 if behind the push remote.
  (( VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" ${clean}⇠${VCS_STATUS_PUSH_COMMITS_BEHIND}"
  (( VCS_STATUS_PUSH_COMMITS_AHEAD && !VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" "
  # ⇢42 if ahead of the push remote; no leading space if also behind: ⇠42⇢42.
  (( VCS_STATUS_PUSH_COMMITS_AHEAD  )) && res+="${clean}⇢${VCS_STATUS_PUSH_COMMITS_AHEAD}"
  # *42 if have stashes.
  (( VCS_STATUS_STASHES        )) && res+=" ${clean}*${VCS_STATUS_STASHES}"
  # 'merge' if the repo is in an unusual state.
  [[ -n $VCS_STATUS_ACTION     ]] && res+=" ${conflicted}${VCS_STATUS_ACTION}"
  # ~42 if have merge conflicts.
  (( VCS_STATUS_NUM_CONFLICTED )) && res+=" ${conflicted}~${VCS_STATUS_NUM_CONFLICTED}"
  # +42 if have staged changes.
  (( VCS_STATUS_NUM_STAGED     )) && res+=" ${modified}+${VCS_STATUS_NUM_STAGED}"
  # !42 if have unstaged changes.
  (( VCS_STATUS_NUM_UNSTAGED   )) && res+=" ${modified}!${VCS_STATUS_NUM_UNSTAGED}"
  # ?42 if have untracked files. It's really a question mark, your font isn't broken.
  # See POWERLEVEL9K_VCS_UNTRACKED_ICON above if you want to use a different icon.
  # Remove the next line if you don't want to see untracked files at all.
  (( VCS_STATUS_NUM_UNTRACKED  )) && res+=" ${untracked}${(g::)POWERLEVEL9K_VCS_UNTRACKED_ICON}${VCS_STATUS_NUM_UNTRACKED}"
  # "─" if the number of unstaged files is unknown. This can happen due to
  # POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY (see below) being set to a non-negative number lower
  # than the number of files in the Git index, or due to bash.showDirtyState being set to false
  # in the repository config. The number of staged and untracked files may also be unknown
  # in this case.
  (( VCS_STATUS_HAS_UNSTAGED == -1 )) && res+=" ${modified}─"

  typeset -g my_git_format=$res
}

typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND="#000000"
typeset -g POWERLEVEL9K_CONTEXT_BACKGROUND="#FD6EA0"
typeset -g POWERLEVEL9K_DIR_BACKGROUND="#FD9F75"
typeset -g POWERLEVEL9K_DIR_FOREGROUND="#000000"
typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND="#000000"
typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND="#000000"
typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
typeset -g POWERLEVEL9K_STATUS_ERROR=true
typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=true
typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND="#ffde57"
typeset -g POWERLEVEL9K_VIRTUALENV_BACKGROUND="#4584b6"
typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND="#000000"
typeset -g POWERLEVEL9K_NODE_VERSION_BACKGROUND=green
typeset -g POWERLEVEL9K_NODE_VERSION_VISUAL_IDENTIFIER_EXPANSION='󰎙'
typeset -g POWERLEVEL9K_NODE_VERSION_PROJECT_ONLY=false

# unset POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION

function prompt_aws_profile() {
  [[ -n $AWS_PROFILE ]] || return 1
  p10k segment -b 1 -f 7 -i  -t "$AWS_PROFILE"
}

function prompt_node_env() {
  [[ -n $NODE_ENV ]] || return 1
  local bg icon fg
  case $NODE_ENV in
    development)
      bg=green
      fg=black
      ;;
    production)
      bg=red
      fg=white
      ;;
    test)
      bg=yellow
      fg=black
      ;;
    staging)
      bg=yellow
      fg=black
      ;;
    *)
      bg=magenta
      fg=white
      ;;
  esac
  p10k segment -b "$bg" -f "$fg" -i 󰎙 -t "NODE_ENV=$NODE_ENV"
}

function prompt_amplify() {
  PROJECT_DIR=$(git rev-parse --show-toplevel 2>/dev/null)
  AMPLIFY_ENV=$PROJECT_DIR/amplify/.config/local-env-info.json
  if [ -f "$AMPLIFY_ENV" ]; then
    output=$(grep <"$AMPLIFY_ENV" -o '"envName": "[^"]*' | grep -o '[^"]*$')
    if [ "$output" = production ]; then
      local state=PRODUCTION
    else
      local state=NOTPRODUCTION
    fi
    p10k segment -s $state -f 3 -i '󰸏'  -t ${output}
  else
    return 1
  fi
}
POWERLEVEL9K_AMPLIFY_PRODUCTION_BACKGROUND=red
POWERLEVEL9K_AMPLIFY_BACKGROUND=16
