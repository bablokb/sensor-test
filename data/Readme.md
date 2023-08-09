Data from Measurements
======================

Raw Data
--------

The raw measurement data as recorded by the dataloggers are in
`sensor-test1-ST1-raw.csv` and `sensor-test1-ST2-raw.csv`.

Sensor configuration is in `sensor-test-1.py` and `sensor-test-2.py`.

For a list of columns, see [colums](columns.md).


Clean Data
----------

A few steps were needed to cleanup the data:

  - remove the very first measurement (not within 5 minute grid)
  - adapt time-stamps from xx:xx:06 to xx:xx:00 (just for optics)
  - three observations on ST1 were lost due to a technical issue. Since this
    was in a steady-state situation, these observations were replaced
    with adjacent values (should not change results)

Cleaned data is in `sensor-test1-ST1-clean.csv` and `sensor-test1-ST2-clean.csv`.


Combined Data
-------------

The data was combined with

    grep -v "^#" sensor-test1-ST1-clean.csv >  sensor-test1-ST1-work.csv
    grep -v "^#" sensor-test1-ST2-clean.csv >  sensor-test1-ST2-work.csv
    join -t , -j 1 *work.csv > sensor-test1-combined.csv
    rm *work.csv


Difference to Mean
------------------

The difference to the mean was calculated on the respective columns, i.e.
temperature-mean was calculated for every measurement point across all
temperature measurements and so on for humidity and pressure. This was
done with Pandas using [this script](./calculations.py).
