BIN_DIR='/usr/local/bin'
PWD=$(shell pwd)

.PHONY: install
install:                          # Create symlinks to Orgmk scripts
	@echo "Creating symlinks..."
	ln -f -s 	$(PWD)/orgmk		$(BIN_DIR)/orgmk 
	ln -f -s 	$(PWD)/tex2pdf		$(BIN_DIR)/tex2pdf 
