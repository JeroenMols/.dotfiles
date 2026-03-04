#!/bin/bash
ln -s ~/.dotfiles/zsh/config ~/.zshrc
ln -s ~/.dotfiles/alacritty/config.toml ~/.alacritty.toml
ln -s ~/.dotfiles/tmux/config ~/.tmux.conf

mkdir -p ~/.claude
ln -s ~/.dotfiles/claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -s ~/.dotfiles/claude/settings.json ~/.claude/settings.json
