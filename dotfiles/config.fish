set -gx theme_color_scheme solarized-dark
set -gx EDITOR vim
set -gx TIME_STYLE long-iso
set -gx NPM_CONFIG_PREFIX "$HOME/.npm-global"
set -gx PYTHONDONTWRITEBYTECODE plz
set -gx CC_wasm32_unknown_unknown "/opt/wasi-sdk/bin/clang"
set -gx AR_wasm32_unknown_unknown "/opt/wasi-sdk/bin/llvm-ar"
set -gx N_PREFIX "$HOME/n"
set -gx NODE_ICU_DATA "$NPM_CONFIG_PREFIX/lib/node_modules/full-icu"
set -gx WASMTIME_HOME "$HOME/.wasmtime"

string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH

for p in $HOME/bin $HOME/n/bin $HOME/.npm-global/bin $HOME/.jsvu $HOME/Desktop/tools/wabt/bin $HOME/.cargo/bin $HOME/.gem/ruby/2.6.0/bin $HOME/Desktop/tools/depot_tools
  if test -d $p
    set -gx PATH $p $PATH;
  end
end

if command --search ccache >/dev/null do
  set -gx CXX "clang++"
  set -gx CC "clang"
end

alias erc "$EDITOR ~/.config/fish/config.fish"
alias rrc "source ~/.config/fish/config.fish"

alias https "http --default-scheme=https"
alias vi vim

if command --search nvim >/dev/null do
  alias vim nvim
end

function ls
  # set argv "--time-style=long-iso" "-h" $argv
  if command --search lsd >/dev/null do
    lsd $argv
  else
    eval (which ls) $argv
  end
end

if command --search bat >/dev/null do
  alias cat "bat --style=numbers"
end

alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."

alias uuid 'python -c "import uuid; print str(uuid.uuid4())"'

alias timer 'echo "Timer started. Stop with Ctrl-D."; and date; and time cat; and date'

function serveo
  ssh -R 80:localhost:$argv[1] serveo.net
end

function fu --description 'Run previous console command with sudo'
  commandline "sudo $history[1]"
end

git config --global alias.fast '!git add . && git add -A . && git commit -S -m $argv'

function fish_vi_cursor ; end
set fish_greeting ""
