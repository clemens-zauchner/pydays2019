---
title: "Surpassing the R vs Python dogma"
author: "Dana Jomar, Clemens Zauchner"
date: "May 2019"
output: 
  ioslides_presentation:
    toc: true
    df_print: null
    theme: null
    css: style.css
    widescreen: true
    keep_md: true
    #smaller: true  ## only works without "---" slide breaks (use ##)
    slide_level: 2
---



## Contents

- Background?
- Feather
- Ursa / Apache Arrow
- Rstudio 1.2 / reticulated python

## Why?

- A lot of data science teams use both
- both languages have rich interfaces to C++
- most of under-the-hood coding is done in C++

## Feather

## Ursa Labs

## Apache Arrow

## Rstudio 1.2 / reticulated python

- A package that makes it possible to embed a Python session within an R process.
- Provides wrapper functions to use python modules and scripts
  + import, python_source, repl_python, use_python, py_install, …… 
- Data conversion back and forth between the two languages happens through C++.
- R and Python variables are accessible from both environments.
  + The objects  py and r provide this access.
  
## Type conversion

![](pydays2019_files/figure-html/unnamed-chunk-1-1.png)<!-- -->


## test

![](pydays2019_files/figure-html/unnamed-chunk-2-1.png)<!-- -->


