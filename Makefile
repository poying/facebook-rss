LIST := freemarketfreepeople bloggerYangSzuPang sophist4ever
TARGETS := $(addprefix feeds/,$(LIST))

generate: install $(TARGETS)

feeds/%: feeds
	@echo $@
	@./fb-rss --token "$(FACEBOOK_TOKEN)" --id "$$(basename $@)" > $@

feeds:
	@-mkdir -p feeds

install:
	@wget https://github.com/poying/facebook-rss/releases/download/v0.1.0.0/facebook-rss-linux
	@mv facebook-rss-linux fb-rss
	@chmod 755 ./fb-rss

clean:
	@-rm -rf facebook-rss fb-rss feeds
