DOCKER_TAG := devenv_compile_ruby

ruby:
	docker build -t $(DOCKER_TAG) .
	docker create --name $(DOCKER_TAG) $(DOCKER_TAG)
	docker cp $(DOCKER_TAG):/home/leighmcculloch/ruby/ $(PWD)/
	docker rm $(DOCKER_TAG)
	docker rmi $(DOCKER_TAG)
