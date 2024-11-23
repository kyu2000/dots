# Install and set up Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d $ZINIT_HOME ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Zinit extensions
zinit light zdharma-continuum/zinit-annex-bin-gem-node
zinit light zdharma-continuum/zinit-annex-patch-dl

# Prompt
zinit for \
    lucid \
    from"gh-r" \
    cp"posh-* -> oh-my-posh" \
    atclone"./oh-my-posh init zsh --config ~/.config/omp.toml > init.zsh; ./oh-my-posh completion zsh > _oh_my_posh" \
    atpull"%atclone" \
    src"init.zsh" \
    sbin"oh-my-posh" \
      @jandedobbeleer/oh-my-posh

# Programs
zinit wait lucid from"gh-r" as"null" for \
    dl"https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh -> _fzf" \
    dl"https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh -> key-bindings.zsh" \
    dl"https://raw.githubusercontent.com/junegunn/fzf/master/man/man1/fzf-tmux.1 -> $ZINIT[MAN_DIR]/man1/fzf-tmux.1" \
    dl"https://raw.githubusercontent.com/junegunn/fzf/master/man/man1/fzf.1 -> $ZINIT[MAN_DIR]/man1/fzf.1" \
    atinit"export FZF_DEFAULT_OPTS=' \
        --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
        --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
        --color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
        --color=selected-bg:#494d64 \
        --multi'" \
    sbin"fzf" \
    src"key-bindings.zsh"\
    completions \
        @junegunn/fzf \
    cp"nvim*/**/nvim.1 -> $ZINIT[MAN_DIR]/man1/nvim.1" \
    sbin"nvim*/bin/nvim -> nvim" \
    atload"alias vim=nvim; export VISUAL=nvim; export EDITOR=nvim" \
        @neovim/neovim \
    cp"ripgrep*/**/rg.1 -> $ZINIT[MAN_DIR]/man1/rg.1" \
    atclone"ripgrep*/rg --generate complete-zsh > _rg" \
    atpull"%atclone" \
    sbin"ripgrep*/rg -> rg" \
    completions \
        @BurntSushi/ripgrep \
    atclone"delta*/delta --generate-completion zsh > _delta" \
    atpull"%atclone" \
    sbin"delta*/delta -> delta" \
    completions \
        @dandavison/delta

# Plugins
zinit wait lucid for \
    atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay;" \
        zdharma-continuum/fast-syntax-highlighting \
    atload"_zsh_autosuggest_start;" \
        zsh-users/zsh-autosuggestions \
    blockf atpull"zinit creinstall -q ." \
        zsh-users/zsh-completions \
    OMZP::aliases \
    OMZP::colored-man-pages \
    OMZL::git.zsh \
    OMZP::git \
    OMZP::mvn

# Keybindings
bindkey -e

# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HIST_STAMPS="yyyy-mm-dd"
setopt appendhistory            # Zsh append history list to file, instead of replacing it
setopt share_history            # Write to history file immediately and imports new commands from HISTFILE
setopt extended_history         # Record timestamp and elapsed time
setopt hist_expire_dups_first   # Prefer erasing oldest duplicate before unique events
setopt hist_ignore_space        # Ignore commands leading with space
setopt hist_ignore_dups         # Ignore commands that are duplicates of previous event
setopt hist_find_no_dups        # When searchignhistory, do not display duplicates of previously found lines

# Aliases
alias ll='ls -l'

rgl() {
    rg -p "$@" | less -RM
}
