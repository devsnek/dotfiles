for p in $HOME/bin $HOME/.cargo/bin $HOME/go/bin
  if test -d $p
    set -gx PATH $p $PATH;
  end
end

set -gx theme_color_scheme solarized-dark
set -gx EDITOR vim

set fish_greeting ""

alias https "http --default-scheme=https"
alias lua "echo lolno"
alias vi "vim"

if command --search nvim >/dev/null do
  alias vim "nvim"
end

if command --search exa >/dev/null do
  alias ls "exa"
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

alias fpackagelock "echo 'package-lock=false' > .npmrc"

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
function fuu -d "Correct your previous console command"
  set -l fucked_up_command $history[1]
  env TF_ALIAS=fuu PYTHONIOENCODING=utf-8 thefuck $fucked_up_command | read -l unfucked_command
  if [ "$unfucked_command" != "" ]
    eval $unfucked_command
    history --delete $fucked_up_command
    history --merge ^ /dev/null
  end
end

for e in fuuu fuuuu fuk fuuk fuuuk fuc fuuc fuuuc fuck fuuck fuuuck
  alias $e fuu
end

function fcom
  git add .
  git add -A .
  git commit -S -m $argv[1]
end

# test $TERM != "screen" -a $TERM_PROGRAM != "platformio-ide-terminal"; and exec tmux
