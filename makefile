ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
FILES=.config/zsh .config/mimeapps.list .config/user-dirs.dirs .fonts .themes \
	.bashrc .gitconfig .gitconfig-bricavrac .gitconfig-github .gitignore .gitignore_global .gitmessage .npmrc .pam_environment .profile .zshrc

all: backup prepare install


prepare-google:
	sudo apt update
	sudo apt install apt-transport-https ca-certificates gnupg

	echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
	curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

	sudo apt-get update && sudo apt-get install google-cloud-sdk


prepare: prepare-google
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
	for file in $(FILES); do \
		mv ~/$(file) ~/$(file).bkp || true \
	done


install:
	ln -s $(ROOT_DIR)/.config/zsh ~/.config/zsh
	ln -s $(ROOT_DIR)/.fonts ~/.fonts
	ln -s $(ROOT_DIR)/.bashrc ~/.bashrc
	ln -s $(ROOT_DIR)/.zshrc ~/.zshrc

	fc-cache -f -v
