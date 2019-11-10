DOCKER_TAG := devenv_compile_ruby

ruby:
	docker build -t $(DOCKER_TAG) .
	docker create --name $(DOCKER_TAG) $(DOCKER_TAG)
	docker cp $(DOCKER_TAG):/home/leighmcculloch/ruby/ $(PWD)/
	docker rm $(DOCKER_TAG)
	docker rmi $(DOCKER_TAG)

VERSION = $(shell basename $$(ls ruby/ruby-*.tar.bz2) .tar.bz2 | cut -d'-' -f2)

upload: ruby
	@echo $(VERSION)
	@test -z "$(git status -s)" || (echo "A clean working directory is required to upload." ; exit 1)
	curl -uleighmcculloch:$(BINTRAY_API_KEY) 'https://api.bintray.com/content/leighmcculloch/devenv/ruby/$(VERSION)/ruby-$(VERSION).tar.bz2' -T ruby/ruby-$(VERSION).tar.bz2
	curl -uleighmcculloch:$(BINTRAY_API_KEY) 'https://api.bintray.com/content/leighmcculloch/devenv/ruby/$(VERSION)/publish' -X POST -d '{"discard":"false"}'

clean:
	rm -fr ruby
