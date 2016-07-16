LIST := freemarketfreepeople
TARGETS := $(addprefix feeds/,$(LIST))

generate: install $(TARGETS)

feeds/%: feeds
	@echo $@
	@./fb-rss --token $$(FACEBOOK_TOKEN) --id $$(basename $@)

feeds:
	@-mkdir -p feeds

install:
	@git clone https://github.com/poying/facebook-rss.git
	@cd facebook-rss
	@cd facebook-rss && make build
	@mv ./facebook-rss/dist/build/facebook-rss/facebook-rss fb-rss

clean:
	@-rm -rf facebook-rss fb-rss feeds
