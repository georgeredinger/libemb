##
# Toplevel Makefile 
#
# Stefan Wendler, sw@kaltpost.de 
##

all: lib test 

clean: clean-lib clean-test 

lib: 
	make -C libserial 
	make -C libconio
	make -C libshell
	make -C libnrf24l01 

test:
	make -C tests/nrf-client-sb
	make -C tests/nrf-server-sb
	make -C tests/nrf-server-esb
	make -C tests/nrf-client-esb
	make -C tests/nrf-client-esbpl
	make -C tests/nrf-client-esbpl-exti
	make -C tests/nrf-server-esbpl
	make -C tests/nrf-ser2air-client-rb
	make -C tests/nrf-ser2air-server-rb
	make -C tests/nrf-ser2air-ptxprx-rb
	make -C tests/conio

clean-lib: 
	make -C libserial clean
	make -C libconio clean
	make -C libshell clean
	make -C libnrf24l01 clean

clean-test: 
	make -C tests/nrf-client-sb clean
	make -C tests/nrf-server-sb clean
	make -C tests/nrf-client-esb clean
	make -C tests/nrf-server-esb clean
	make -C tests/nrf-client-esbpl clean
	make -C tests/nrf-client-esbpl-exti clean
	make -C tests/nrf-server-esbpl clean
	make -C tests/nrf-ser2air-client-rb clean
	make -C tests/nrf-ser2air-server-rb clean
	make -C tests/nrf-ser2air-ptxprx-rb clean
	make -C tests/conio clean

gen-docs: lib
	make -C libserial gen-docs
	make -C libconio gen-docs 
	make -C libshell gen-docs 
	make -C libnrf24l01 gen-docs 

install:  
	make -C libnrf24l01 install
	make -C libserial install
	make -C libconio install
	make -C libshell install

