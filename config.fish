set -gx PATH /Users/gus/bin $PATH
set -gx theme_color_scheme solarized-dark
set -gx EDITOR vim

set fish_greeting ""

alias https "http --default-scheme=https"
alias lua "echo lolno"
alias vi "vim"

alias erc "$EDITOR ~/.config/fish/config.fish"
alias rrc "source ~/.config/fish/config.fish"

alias uuid 'python -c "import uuid; print str(uuid.uuid4())"'

# test $TERM != "screen" -a $TERM_PROGRAM != "platformio-ide-terminal"; and exec tmux
