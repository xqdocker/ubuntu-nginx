REPOSITORY = xqdocker/ubuntu-nginx
GIT_VERSION = 0.1.1
VERSION = $(shell TZ=Asia/Shaanxi date +'%Y%m%d%H%M')

image:
	docker build -t $(REPOSITORY) .

git-release:
	git fetch --tags
	git tag -a v${GIT_VERSION} -m "Release version ${GIT_VERSION}"
	git push --tags

release: image
	docker tag $(REPOSITORY):latest $(REPOSITORY):$(VERSION)
	docker push $(REPOSITORY):latest
	docker push $(REPOSITORY):$(VERSION)
