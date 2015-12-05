all: build_all

install:
	gem install bundler
	bundle install

build_rmd:
	Rscript _knit_posts.R

_site: _posts ./*.md ./*.markdown ./*.html ./_config.yml
	bundle exec jekyll build .

build: _site

build_all: build_rmd build

serve: build_rmd
	bundle exec jekyll serve .

clean:
	rm -rf _site/
	rm -rf Gemfile.lock

.PHONY: install build_rmd build build_all serve clean
