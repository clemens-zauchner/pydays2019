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
    logo: img/py_r_logo.png
    incremental: true
---




## Contents

- Background - why we are talking about it
- Apache Arrow
- Feather
- Ursa Labs
- Rstudio 1.2 / reticulated python

# Background

## Background

- There is an argument in the data science space
- Can be observed by countless articles / blog posts etc on R vs Python
- <strong>BUT</strong>: this argument is not very helpful and divisive
- Focus should be on the task at hand, not the tools
  + you can drill a hole with a hammer, but it won't be elegant
- Both tools have strengths and weaknesses (not part of this talk)
- You are here to solve a problem, not to have a favourite algorithm or tool

## Reality check

- KD Nuggets Poll 2018: most of the people who use Python or R use both (44.1%)



<img src="pydays2019_files/figure-html/unnamed-chunk-2-1.png" width="720" />

## What Python and R have in common

- A lot of data science teams use both
- both languages have rich interfaces to C / C++
- most of under-the-hood coding is done in C / C++

\

<strong>Would it not make sense to aim for interoperability?</strong>

# placeholder

## placeholder

add some bow to the story, outlook on the talk? 

## Feather

- Python and R use data frames as a fundamental data structure
  + Pandas data frame are based on the idea of R's data frames
- Implemented after the announcement of Apache Arrow
  + Aim: share data between Python and R 
  + Use a binary file format for data frames
  + bridge time until Apache Arrow is implemented
- Uses the Apache Arrow columnar specification to represent binary data **on disk** (zero-copy access)
- Fast, lightweight, and easy-to-use binary file format for storing data frames.
- High read and write performance.


- Quickly exchange data between Python and R code, however it's not designed for long-term data storage.

## Limitations of Feather

- Supports limited scalar value types, adequate only for representing typical data found in R and pandas
- Supports only a single batch of rows (no ability to append to existing files)
- Only non-nested data types and categorical (dictionary-encoded) types are supported

## Apache Arrow
A standarised, language-independent representation of in-memory columnar data

- Exchange data without conversion between the different languages including python and R (also C, C++, C#, Go, Java, JavaScript, MATLAB, Ruby, and Rust.)
- Zero-copy dataflow
- Optimised for analysing purposes
- Supports flat and nested format and conveniently many native data types
- Backed by key developers of 13 major open source projects (including Cassandra, Hadoop, HBase, Parquet, Spark, ... )



## Apache Arrow

<!--html_preserve-->
<table style="border-collapse:collapse;" class=table_8566 border=1>
<caption id="footer" align="bottom">source: arrow.apache.org</caption>
<thead>
<tr style="border:1px solid transparent;">
  <th id="tableHTML_header_1" style="border:1px solid transparent;"><img src="https://arrow.apache.org/img/copy.png" width="450" height="400"></img></th>
  <th id="tableHTML_header_2" style="border:1px solid transparent;"><img src="https://arrow.apache.org/img/shared.png" width="450" height="400"></img></th>
</tr>
</thead>
<tbody>
<tr style="border:1px solid transparent;">
  <td id="tableHTML_column_1" style="border:1px solid transparent;"><ul> <li> Each system has its own internal memory format</td>
  <td id="tableHTML_column_2" style="border:1px solid transparent;"><ul> <li>All systems utilize the same memory format</td>
</tr>
<tr style="border:1px solid transparent;">
  <td id="tableHTML_column_1" style="border:1px solid transparent;"><ul> <li> 70-80% computation wasted on serialization and deserialization</td>
  <td id="tableHTML_column_2" style="border:1px solid transparent;"><ul> <li>No overhead for cross-system communication</td>
</tr>
<tr style="border:1px solid transparent;">
  <td id="tableHTML_column_1" style="border:1px solid transparent;"><ul> <li> Similar functionaltiy implemented in multiple projects</td>
  <td id="tableHTML_column_2" style="border:1px solid transparent;"><ul> <li>Projects can share functionality</td>
</tr>
<tr style="border:1px solid transparent;">
  <td id="tableHTML_column_1" style="border:1px solid transparent;"></td>
  <td id="tableHTML_column_2" style="border:1px solid transparent;"></td>
</tr>
</tbody>
</table><!--/html_preserve-->


## Ursa Labs

When to comes to the most fundamental tasks (data access, data manipulation, data analysis, ……. ), data science tools are not optimised to make use of state-of-the-art hardware, as the efforts has been mainly focused on machine learning problems.

- Ursa Labs is an organisation founded 
  + by Wes McKinney (and Hadley Wickham as advisor for R)
  + with the goal of advancing open source, cross-language software for data scientists
- Focuses on the data science tools of the Apache Arrow Project (Arrow has a broader application scope) 
- May expand to create software artifacts focused more specifically on the data science domain


## Rstudio 1.2 / reticulated python
### The package: reticulate
- Reticulate is an R package that makes it possible to embed a Python session within an R process.
- Provides wrapper functions to use python modules and scripts
    + import, python_source, repl_python, use_python, py_install, …… 
- Data conversion back and forth between the two languages happens through C++.
- R and Python variables are accessible from both environments.
    + The objects  py and r provide this access.

## Rstudio 1.2 / reticulated python
### The IDE: Rstudio 1.2
- Automatic access to a python REPL when stepping in a python script.
- Line-by-line execution of Python code.
- Support for Python syntax highlighting. 
- Autocompletion and Inline help for Python ...... HOOORAY!!!  
- R notebooks with Python code chunks.
- Automatic switch in the code history pane between Python and R.
- Sourcing full Python scripts.
- Display of matplotlib plots within the plots pane in RStudio and inline in the notebooks.

## Type conversion

![](pydays2019_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

## test code

- Python chunk 

```python
import numpy as np

var_py = np.array([i for i in range(10)])
```

- R chunk - access python variables from R

```r
library(reticulate)
# see what's in the python variable
py$var_py
```

 [1] 0 1 2 3 4 5 6 7 8 9

```r
# define a new variable in R 
r_var = py$var_py*2
```

- Or access R variables form python

```python
var_reshaped = np.reshape(r.r_var, (5, 2))
print(var_reshaped)
```

[[ 0.  2.]
 [ 4.  6.]
 [ 8. 10.]
 [12. 14.]
 [16. 18.]]

## test

![](pydays2019_files/figure-html/unnamed-chunk-8-1.png)<!-- -->

## backup
<img src="img/arrow_before_after.png" alt="drawing" width="1000" height="400"/>
<small> Source: https://arrow.apache.org/ </small>

## backup

usual practice:

- Each system has its own internal memory format 
- 70-80% computation wasted on serialization and deserialization 
- Similar functionaltiy implemented in multiple projects

with arrow:

- All systems utilize the same memory format 
- No overhead for cross-systemcommunication 
- Projects can share functionality 

