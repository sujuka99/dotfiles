autoload -U +X bashcompinit && bashcompinit
source $HOME/.config/zsh.d/autocompletion/az.completion

# gcloud
source "$(gcloud info --format='value(installation.sdk_root)')/path.zsh.inc"
source "$(gcloud info --format='value(installation.sdk_root)')/completion.zsh.inc"
