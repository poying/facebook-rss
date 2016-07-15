SRC := *.hs

build: build/facebook-feed

test: build/test

build/facebook-feed: $(SRC)
	@-mkdir -p build
	@ghc -o $@ Main.hs

build/test: $(SRC)
	@-mkdir -p build
	@ghc -v -o $@ tests/Main.hs

clean:
	@-rm -rf build *.hi *.o

.PHONY: build
