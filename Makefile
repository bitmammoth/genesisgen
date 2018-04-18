
BIN = genesis
SOURCE = genesis.c
CFLAGS = -g -Wall -Werror
LDFLAGS = -lcrypto

all: $(BIN)

$(BIN): $(SOURCE)
	gcc $(CFLAGS) $(LDFLAGS) -o $@ $<

.PHONY: clean
clean:
	rm -rf *.o $(BIN)

SATOSHI_PUBKEY = 04678afdb0fe5548271967f1a67130b7105cd6a828e03909a67962e0ea1f61deb649f6bc3f4cef38c4f35504e51ec112de5c384df7ba0b8d578a4c702b6bf11d5f
PSZTIMESTAMP = "The Times 03/Jan/2009 Chancellor on brink of second bailout for banks"
DIFF = 486604799
test: $(BIN)
	./$(BIN) $(SATOSHI_PUBKEY) $(PSZTIMESTAMP) $(DIFF) 2083236893 1231006505
	@echo
	./$(BIN) 048E794284AD7E4D776919BDA05CDD38447D89B436BDAF5F65EBE9D7AD3A0B084908B88162BB60B1AA5ED6542063A30FC9584A335F656A54CD9F66D6C742B67F55 "More Jobs, Faster Growth and Now, the Threat of a Trade War" $(DIFF) 640408438 1524015188
	@echo