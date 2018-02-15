source ~/.iterm2_shell_integration.fish

if test -f $HOME/.emscripten
  set -l root (cat ~/.emscripten | python -c 'import sys; import re; src = sys.stdin.read().split("\\n"); entry = [x for x in src if "EMSCRIPTEN_ROOT" in x][0]; entry = re.sub(r"EMSCRIPTEN_ROOT=\'|\'$", "", entry); print entry')
  set -gx PATH $root $PATH;
end

for p in $HOME/bin $HOME/.cargo/bin $HOME/go/bin $HOME/bin/emsdk-portable $HOME/.npm-global/bin $HOME/.jsvu $HOME/Desktop/tools/depot_tools
  if test -d $p
    set -gx PATH $p $PATH;
  end
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
  set argv "--time-style=long-iso" $argv
  if command --search exa >/dev/null do
    exa $argv
  else
    ls $argv
  end
end

if command --search exa >/dev/null do
  alias ls exa
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
