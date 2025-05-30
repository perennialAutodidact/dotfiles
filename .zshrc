eval "$(starship init zsh)"

# fnm
export PATH="$FNM_DIR:$PATH"
eval "$(fnm env --use-on-cd --shell zsh)"

