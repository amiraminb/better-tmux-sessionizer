PREFIX ?= $(HOME)/.local

install:
	mkdir -p $(PREFIX)/bin
	cp better-tmux-sessionizer $(PREFIX)/bin/better-tmux-sessionizer
	chmod +x $(PREFIX)/bin/better-tmux-sessionizer

uninstall:
	rm -f $(PREFIX)/bin/better-tmux-sessionizer

.PHONY: install uninstall
