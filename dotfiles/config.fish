set -gx theme_color_scheme solarized-dark
set -gx EDITOR vim
set -gx TIME_STYLE long-iso
set -gx NPM_CONFIG_PREFIX "$HOME/.npm-global"
set -gx PYTHONDONTWRITEBYTECODE 1
set -gx N_PREFIX "$HOME/n"
set -gx TERMINAL "kitty"
set -gx MODDABLE "$HOME/Desktop/misc/moddable"
set -gx MSFS_SDK "/run/media/Windows/MSFS SDK/"
set -gx CARGO_MOMMYS_MOODS "chill/thirsty"
set -gx KANIDM_URL "https://idm.snek.dev"
set -gx DEVKITPRO "/opt/devkitpro"
set -gx DEVKITARM "/opt/devkitpro/devkitARM"
set -gx DEVKITPPC "/opt/devkitpro/devkitPPC"
set -gx WASMTIME_HOME "$HOME/.wasmtime"
set -gx DOTNET_ROOT "$HOME/.dotnet"

for p in $HOME/bin $HOME/n/bin $HOME/.npm-global/bin $HOME/.esvu/bin $HOME/tools/wabt/bin $HOME/.cargo/bin $HOME/.gem/ruby/2.6.0/bin $HOME/tools/depot_tools $WASMTIME/bin /usr/lib/ccache/bin $HOME/.local/bin
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
  /bin/rm -i $argv
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

string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH

direnv hook fish | source
