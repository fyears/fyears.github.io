#!/usr/bin/env Rscript

# modified from
# https://github.com/yihui/cn/blob/gh-pages/_posts/_knit-all.R

# MIT License

library(knitr)

setwd('./_posts')
opts_knit$set(upload.fun = knitr::image_uri)
opts_chunk$set(fig.path = '_knit_figure/')

local({
  all.md = list.files(pattern = '^_.*\\.Rmd$')
  
  for (f in all.md) {
    b = gsub('^_|\\.Rmd$', '', f)
    unlink(paste0(b, '.html'))
    unlink(list.files('_knit_figure/', '^(^\\d)+', full.names = TRUE),
        recursive = TRUE, force = TRUE)
    opts_chunk$set(fig.path = paste('_knit_figure', b, sep = '/'))
    message('processing ', f)
    knit(f, output = paste0(b, '.md'))
  }

  unlink('_knit_figure', recursive = TRUE, force = TRUE)
  unlink('.Rhistory', recursive = TRUE, force = TRUE)
})
