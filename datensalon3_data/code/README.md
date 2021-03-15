# csv2adj

A Script for transforming csv (tweet) files to an adjacency list.

## Prerequisites
* [Python](https://www.python.org/)
* Python-Libraries [pandas](https://pandas.pydata.org/) / [argparse](https://docs.python.org/3/library/argparse.html) must be installed

## Usage

**usage:** csv2adj&#46;py [-h] [-i I] [-o O] [-c C]

**arguments:**<br>
  -h, --help            show this help message and exit <br>
  -i INPUT, --input INPUT 
                        the input file, should be in csv format<br>
  -o OUTPUT, --output OUTPUT
                        the output file, should be in csv format <br>
  -c COL, --col COL     the column that should be transformed into an
                        adjacency list <br>

**example:** 
* change to command line
* navigate to your folder
* python csv2adj&#46;py -i input.csv -o output.csv -c hashtags