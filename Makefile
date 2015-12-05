all: build

install:
	gem install bundler
	bundle install

build: _site

_site: _posts ./*.md ./*.markdown ./*.html ./_config.yml
	bundle exec jekyll build .

serve: 
	bundle exec jekyll serve .

clean:
	rm -rf _site/
	rm -rf Gemfile.lock

.PHONY: install build serve clean
