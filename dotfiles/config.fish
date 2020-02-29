set -gx theme_color_scheme solarized-dark
set -gx EDITOR vim
set -gx TIME_STYLE long-iso
set -gx NPM_CONFIG_PREFIX "$HOME/.npm-global"
set -gx PYTHONDONTWRITEBYTECODE 1
set -gx CC_wasm32_unknown_unknown "/opt/wasi-sdk/bin/clang"
set -gx AR_wasm32_unknown_unknown "/opt/wasi-sdk/bin/llvm-ar"
set -gx N_PREFIX "$HOME/n"
set -gx NODE_REPL_EXTERNAL_MODULE "$NPM_CONFIG_PREFIX/bin/node-prototype-repl"
set -gx TERMINAL "kitty"

for p in $HOME/bin $HOME/n/bin $HOME/.npm-global/bin $HOME/.esvu/bin $HOME/Desktop/tools/wabt/bin $HOME/.cargo/bin $HOME/.gem/ruby/2.6.0/bin $HOME/Desktop/tools/depot_tools $WASMTIME/bin /opt/gradle/gradle-5.6.2/bin
  if test -d $p
    set -gx PATH $p $PATH;
  end
end

if command --search ccache >/dev/null do
  set -gx CXX "ccache clang++"
  set -gx CC "ccache clang"
end

alias erc "$EDITOR ~/.config/fish/config.fish"
alias rrc "source ~/.config/fish/config.fish"

alias https "http --default-scheme=https"
alias vi vim

if command --search nvim >/dev/null do
  alias vim nvim
end

function ls
  if command --search lsd >/dev/null do
    lsd $argv
  else
    eval (which ls) $argv
  end
end

if command --search bat >/dev/null do
  alias cat "bat --style=numbers"
end

function rm
  /usr/bin/rm -i $argv
end

alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."

function fu --description 'Run previous console command with sudo'
  commandline "sudo $history[1]"
end

function weather --description 'Show the current weather (based on IP)'
  curl "https://wttr.in?days=0"
end

git config --global alias.fast '!git add . && git add -A . && git commit -S -m $argv'

function fish_vi_cursor ; end
set fish_greeting ""

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/snek/google-cloud-sdk/path.fish.inc' ]; . '/home/snek/google-cloud-sdk/path.fish.inc'; end
