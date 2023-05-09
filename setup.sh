function install_stuff() {
	brew install starship
  brew install neovim
	brew install fzf
	brew install exa
	brew install fd
  brew install rg  # Better grep
	brew install bat
	brew tap homebrew/cask-fonts && brew install --cask font-fira-mono-nerd-font
  brew install npm  # required for neovim
  brew install lua-language-server
  brew install texlive
}


function create_symlinks() {
	sudo ln -fs ~/dotfiles/starship.toml ~/.config/starship.toml
	sudo ln -fs ~/dotfiles/zsh/zshrc ~/.zshrc
	sudo ln -fs ~/dotfiles/nvim ~/.config/
}

install_stuff
create_symlinks
