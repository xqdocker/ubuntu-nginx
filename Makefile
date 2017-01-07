REPOSITORY = xqdocker/ubuntu-nginx
VERSION = `cat VERSION`

image:
	docker build -t $(REPOSITORY) .

git-release:
	git fetch --tags
	git tag -a ${VERSION} -m "Release version ${VERSION}"
	git push --tags

release: image
	docker tag $(REPOSITORY):latest $(REPOSITORY):$(VERSION)
	docker push $(REPOSITORY):latest
	docker push $(REPOSITORY):$(VERSION)
