#!/usr/bin/env python
# ----------------------------------------------------------------------------
# Data-conversion script: replace raw-values with difference to mean.
#
# Author: Bernhard Bablok
# License: GPL3
#
# ----------------------------------------------------------------------------

INFILE="data/sensor-test1-combined.csv"
OUTFILE="data/sensor-test1-diff.csv"

import pandas as pd

data = pd.read_csv(INFILE,header=None,sep=',')

cols_temp = [
  2, 4, 5, 7, 9, 12, 13, 14, 15, 17, 18, 20, 22, 26,
  28, 29, 31, 33, 36, 38, 40, 42, 44
]

cols_hum = [
  3, 6, 10, 16, 19, 23, 27, 30, 34, 37, 39, 41, 45
]

cols_press = [
  8, 11, 21, 24, 32, 35, 43, 46
]

# calculate diff for temperature ...
data_temp = data.iloc[:,cols_temp]
temp_mean = data_temp.mean(axis=1)
data_temp_diff = data_temp.subtract(temp_mean,axis=0)

# ... for humidity ...
data_hum = data.iloc[:,cols_hum]
hum_mean = data_hum.mean(axis=1)
data_hum_diff = data_hum.subtract(hum_mean,axis=0)

# ... and pressure
data_press = data.iloc[:,cols_press]
press_mean = data_press.mean(axis=1)
data_press_diff = data_press.subtract(press_mean,axis=0)

# ... and replace colums
data[cols_temp] = data_temp_diff[cols_temp]
data[cols_hum]  = data_hum_diff[cols_hum]
data[cols_press]  = data_press_diff[cols_press]

# save result
data.to_csv(OUTFILE,index=False,header=False)
