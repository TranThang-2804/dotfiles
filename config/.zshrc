# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

eval "$(devbox global shellenv)"

typeset -U path cdpath fpath manpath

path+="$(devbox global path)/.devbox/nix/profile/default/share/powerlevel10k"
fpath+="$(devbox global path)/.devbox/nix/profile/default/share/powerlevel10k"

source $(devbox global path)/.devbox/nix/profile/default/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
source $(devbox global path)/.devbox/nix/profile/default/share/oh-my-zsh/oh-my-zsh.sh
source $(devbox global path)/.devbox/nix/profile/default/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(devbox global path)/.devbox/nix/profile/default/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# History options should be set in .zshrc and after oh-my-zsh sourcing.
HISTSIZE="10000"
SAVEHIST="10000"

HISTFILE="$HOME/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
unsetopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY

bindkey -v
export LC_ALL="en_US.UTF-8"
export dry="--dry-run=client -o yaml";
export PATH=$PATH:$HOME/go/bin;
export GOBIN=$HOME/go/bin;
eval $(thefuck --alias)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan,underline"


# Aliases
alias -- 'fnvim'='nvim $(fzf --height 40% --preview "bat --color=always --style=numbers {}")'
alias -- 'ga'='git add'
alias -- 'gc'='git commit -m'
alias -- 'gp'='git push'
alias -- 'gs'='git status'
alias -- 'jh'='./mvnw spring-boot:run'
alias -- 'k'='kubectl'
alias -- 'ka'='kubectl apply -f'
alias -- 'kc'='kubectl create'
alias -- 'kd'='kubectl delete'
alias -- 'kds'='kubectl describe'
alias -- 'ke'='kubectl edit'
alias -- 'kg'='kubectl get'
alias -- 'kr'='kubectl run'
alias -- 'krp'='kubectl replace'
alias -- 'krpf'='kubectl replace --force -f'
alias -- 'ksetns'='kubectl config set-context --current --namespace'
alias -- 'ls'='ls -la --color'
alias -- 'note'='/Users/tranthang/Library/Mobile Documents/iCloud~md~obsidian/Documents/tommy-note-vault'
alias -- 'ta'='tmux attach-session -t'
alias -- 'tera'='terraform'
alias -- 'tk'='tmux kill-session -t'
alias -- 'tka'='tmux kill-session -a'
alias -- 'tl'='tmux ls'
alias -- 'tn'='tmux new-session -t'

source <(kubectl completion zsh)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tranthang/Documents/development/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tranthang/Documents/development/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tranthang/Documents/development/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tranthang/Documents/development/google-cloud-sdk/completion.zsh.inc'; fi
