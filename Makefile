PREFIX := /usr/bin

build:
	@cabal install --only-dependencies && cabal configure && cabal build

clean:
	@cabal clean

install: build
	@mv ./dist/build/facebook-rss/facebook-rss $(PREFIX)/facebook-rss
