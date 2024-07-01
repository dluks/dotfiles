#!/bin/bash

show_help() {
	echo "Usage: $0 [-b]"
	echo "  -b    Create backup of existing package git directories"
}

create_backup=false

while getopts "bh" opt; do
	case ${opt} in
	o)
		create_backup=true
		;;
	h)
		show_help
		exit 0
		;;
	\?)
		echo "Invalid option: $OPTARG" 1>&2
		show_help
		exit 1
		;;
	esac
done

# Install Tmux Plugin Manager (TPM)
tpm_dir="$HOME/.tmux/plugins/tpm"
if [ -d "$tpm_dir" ]; then
	if $create_backup; then
		echo "Found existing TPM directory. Creating backup and overwriting..."
		mv "$tpm_dir" "$HOME/.tmux/plugins/tpm.bak"
	else
		echo "Found existing TPM directory. Removing without backup..."
	fi
	rm -rf "$tpm_dir"
fi
git clone https://github.com/tmux-plugins/tpm "$tpm_dir"

# Install LazyVIM
nvim_dir="$HOME/.config/nvim"
if [ -d "$nvim_dir" ]; then
	if $create_backup; then
		echo "Found existing nvim directory. Creating backup and overwriting..."
		mv "$nvim_dir" "$HOME/.config/nvim.bak"
	else
		echo "Found existing nvim directory. Removing without backup..."
	fi
	rm -rf "$nvim_dir"
fi
git clone https://github.com/LazyVim/starter "$nvim_dir"

# Install Oh My Zsh
ohmyzsh_dir="$HOME/.oh-my-zsh"
if [ -d "$ohmyzsh_dir" ]; then
	if $create_backup; then
		echo "Found existing Oh My Zsh directory. Creating backup and overwriting..."
		mv "$ohmyzsh_dir" "$HOME/.oh-my-zsh.bak"
	else
		echo "Found existing Oh My Zsh directory. Removing without backup..."
	fi
	rm -rf "$ohmyzsh_dir"
fi

RUNZSH=no zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Zsh Autosuggestions
zsh_autosuggestions_dir="$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
if [ -d "$zsh_autosuggestions_dir" ]; then
	if $create_backup; then
		echo "Found existing Zsh Autosuggestions directory. Creating backup and overwriting..."
		mv "$zsh_autosuggestions_dir" "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions.bak"
	else
		echo "Found existing Zsh Autosuggestions directory. Removing without backup..."
	fi
	rm -rf "$zsh_autosuggestions_dir"
fi

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install Zsh Syntax Highlighting
zsh_syntax_highlighting_dir="$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
if [ -d "$zsh_syntax_highlighting_dir" ]; then
	if $create_backup; then
		echo "Found existing Zsh Syntax Highlighting directory. Creating backup and overwriting..."
		mv "$zsh_syntax_highlighting_dir" "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting.bak"
	else
		echo "Found existing Zsh Syntax Highlighting directory. Removing without backup..."
	fi
	rm -rf "$zsh_syntax_highlighting_dir"
fi

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install Meslo Nerd Fonts
curl -o /tmp/Meslo.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Meslo.zip
# Check if .local/share/fonts exists
if [ ! -d "$HOME/.local/share/fonts" ]; then
	mkdir -p "$HOME/.local/share/fonts"
fi
unzip /tmp/Meslo.zip -d "$HOME/.local/share/fonts"
fc-cache -f -v

# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# Remove existing .zshrc
if [ -f "$HOME/.zshrc" ]; then

	echo "Found existing .zshrc. Creating backup and overwriting..."
	mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
fi

# Remove existing .tmux.conf
if [ -f "$HOME/.tmux.conf" ]; then
	if $create_backup; then
		echo "Found existing .tmux.conf. Creating backup and overwriting..."
		mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.bak"
	else
		echo "Found existing .tmux.conf. Removing without backup..."
	fi
	rm -f "$HOME/.tmux.conf"
fi

# Stow dotfiles
stow .

# Source stowed .zshrc
source ~/.zshrc

# Run powerlevel10k configuration wizard
p10k configure

# Source .zshrc again to register p10k configuration
source ~/.zshrc
