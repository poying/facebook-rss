PREFIX := /usr/bin

build:
	@cabal build

clean:
	@cabal clean

install: build
	@mv ./dist/build/facebook-rss/facebook-rss $(PREFIX)/facebook-rss
