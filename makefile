.PHONY: install

install:
	ansible-playbook --ask-become-pass playbook.yml
