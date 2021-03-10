# csv2adj

A Script for transforming csv (tweet) files to an adjacency matrix.

## Prerequisites
* [Python](https://www.python.org/)
* Python-Libraries [pandas](https://pandas.pydata.org/) / [argparse](https://docs.python.org/3/library/argparse.html) must be installed

## Usage

usage: csv2adj&#46;py [-h] [--i I] [--o O] [--c C]

optional arguments:<br>
  -h, --help  show this help message and exit<br>
  --i I       the input variable, should be in csv format<br>
  --o O       the output variable, should be in csv format<br>
  --c C       the column that should be transformed into an adjacency list<br>