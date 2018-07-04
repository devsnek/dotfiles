for p in $HOME/bin $HOME/n/bin $HOME/.npm-global/bin $HOME/.jsvu $HOME/Desktop/tools/depot_tools
  if test -d $p
    set -gx PATH $p $PATH;
  end
end

if test -d $HOME/Documents/filmic-blender-master
  set -gx OCIO $HOME/Documents/filmic-blender-master/config.ocio
end

set -gx theme_color_scheme solarized-dark
set -gx EDITOR vim
set -gx TIME_STYLE long-iso
set -gx NPM_CONFIG_PREFIX ~/.npm-global
set -gx PYTHONDONTWRITEBYTECODE plz

alias https "http --default-scheme=https"
alias lua "echo lolno"
alias vi vim

set fish_greeting ""

if command --search nvim >/dev/null do
  alias vim nvim
end

function ls
  set argv "--time-style=long-iso" "-h" $argv
  if command --search exa >/dev/null do
    exa --git $argv
  else
    ls $argv
  end
end

alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."

alias erc "$EDITOR ~/.config/fish/config.fish"
alias rrc "source ~/.config/fish/config.fish"

alias uuid 'python -c "import uuid; print str(uuid.uuid4())"'

alias timer 'echo "Timer started. Stop with Ctrl-D."; and date; and time cat; and date'

alias sniff "sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump 'sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*"'

for method in GET HEAD POST PUT DELETE TRACE OPTIONS
  alias "$method"="https '$method'"
end

alias afk 'pmset displaysleepnow'

function serveo
  ssh -R 80:localhost:$argv[1] serveo.net
end

function fu --description 'Run previous console command with sudo'
  commandline "sudo $history[1]"
end

function fuck -d "Correct your previous console command"
  set -l fucked_up_command $history[1]
  env TF_ALIAS=fuck PYTHONIOENCODING=utf-8 thefuck $fucked_up_command | read -l unfucked_command
  if [ "$unfucked_command" != "" ]
    eval $unfucked_command
    builtin history delete --exact --case-sensitive -- $fucked_up_command
    builtin history merge ^ /dev/null
  end
end

for e in fuuu fuuuu fuk fuuk fuuuk fuc fuuc fuuuc fuuck fuuuck FUCK FUUUUCK FUUCK FUUUCK
  alias $e fuck
end

git config --global alias.fast '!git add . && git add -A . && git commit -S -m $argv'

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/sbin" $fish_user_paths

set -gx N_PREFIX "$HOME/n"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gus/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/gus/google-cloud-sdk/path.fish.inc'; else; . '/Users/gus/google-cloud-sdk/path.fish.inc'; end; end
