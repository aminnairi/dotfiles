.PHONY: install collections

collections:
	sudo ansible-galaxy collection install -p collections kewlfft.aur

install: collections
	ansible-playbook --ask-become-pass playbook.yml
