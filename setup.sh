function install_stuff() {
	brew install starship
}

function create_symlinks() {
	sudo ln -s starship.toml ~/.config/starship.toml
	sudo ln -s zsh/zshrc ~/.zshrc
}

install_stuff
create_symlinks
