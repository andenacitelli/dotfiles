# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#? $PATH
export PATH="$HOME/.local/bin:$PATH"

#? oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 28
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)
source "$ZSH/oh-my-zsh.sh"

#? Shell
[[ -f ~/.zshrc.secrets.sh ]] && source ~/.zshrc.secrets.sh
alias sz="source ~/.zprofile && source ~/.zshrc"
alias secrets="code -r ~/.zshrc.secrets.sh"

#? Brew/Mise 
eval "$(~/.local/bin/mise activate zsh)"  
alias mi="mise install"

# pnpm
export PNPM_HOME="/Users/kal/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

#? Python
alias uvs="uv sync"
alias plint="uv run ruff check . --fix && uv run pyright ."

#? Final p10k Setup (needs to run after any console)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh