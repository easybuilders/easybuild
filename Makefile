all: build

build:
	mkdocs build

deploy:
	mkdocs gh-deploy --force

check test:
	mkdocs build --strict

preview:
	mkdocs serve
