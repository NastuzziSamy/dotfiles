ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

all: backup prepare install


prepare:
	sudo apt update
	sudo apt install exa zsh


clean:
	rm -rf ~/.config/zsh || true
	rm -rf ~/.fonts || true
	rm ~/.bashrc || true
	rm ~/.zshrc || true


restore: clean
	mv ~/.config/zsh.bkp ~/.config/zsh || true
	mv ~/.fonts.bkp ~/.fonts || true
	mv ~/.bashrc.bkp ~/.bashrc || true
	mv ~/.zshrc.bkp ~/.zshrc || true


backup:
	mv ~/.config/zsh ~/.config/zsh.bkp || true
	mv ~/.fonts ~/.fonts.bkp || true
	mv ~/.bashrc ~/.bashrc.bkp || true
	mv ~/.zshrc ~/.zshrc.bkp || true


install:
	ln -s $(ROOT_DIR)/.config/zsh ~/.config/zsh
	ln -s $(ROOT_DIR)/.fonts ~/.fonts
	ln -s $(ROOT_DIR)/.bashrc ~/.bashrc
	ln -s $(ROOT_DIR)/.zshrc ~/.zshrc
