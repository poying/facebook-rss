LIST := freemarketfreepeople bloggerYangSzuPang sophist4ever
TARGETS := $(addprefix feeds/,$(LIST))

all: generate push

push:
	@git add feeds
	@status=$$(git status -uno --porcelain); \
		if [[ "$${status}" ]]; then \
			git commit -m "$$(date "+%Y-%m-%d %H:%M:%S")"; \
			git push; \
		fi

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
