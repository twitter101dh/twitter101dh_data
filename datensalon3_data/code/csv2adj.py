#import pandas
import pandas as pd
import argparse

# add command-line options
parser = argparse.ArgumentParser(description='A Script for transforming csv (tweet) files to an adjacency list.')
parser.add_argument("--i", default=1, help="the input variable, should be in csv format")
parser.add_argument("--o", default=1, help="the output variable, should be in csv format")
parser.add_argument("--c", default=1, help="the column that should be transformed into an adjacency list")

args = parser.parse_args()
i = args.i
o = args.o
c = args.c

#read csv as dataframe
data = pd.read_csv(i, index_col=0, parse_dates=True) #i = Name (/Pfad) der CSV-Datei ändern

#drop NaN values in col c
data=data.dropna(subset=[c]) 

# define function to see if row contains only one word or more than one word (=contains whitespace)
# turn all strings to lowercase characters here as well
def check_wordcount(dataframe, index):
    for row in dataframe:
        dataframe.iloc[index] = str(dataframe.iloc[index]).lower() 
        if " " in dataframe.iloc[index]:
            pass
        else:
            dataframe.iloc[index] = float("NaN") #for one-word-values assign NaN values as placeholders
        index += 1

# call check_wordcount() on col c
check_wordcount(data[c], 0)

# drop (new) NaN values again
data=data.dropna(subset=[c]) 

# define variable as col
col = data[c]

#write col to csv and set index=false (for excluding user_ids=index)
col.to_csv(path_or_buf=o, index=False) #o ist der Name der ausgegebenen Datei

