function install_stuff() {
	brew install starship
	brew install fzf
	brew install exa
	brew install fd
	brew install bat
	brew tap homebrew/cask-fonts && brew install --cask font-fira-mono-nerd-font
}


function create_symlinks() {
	sudo ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
	sudo ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
}

install_stuff
create_symlinks
