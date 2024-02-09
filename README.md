Sensor-Test
===========

This repository contains data and plots of a large scale non-scientifc
comparison test of various temperature/humidity sensors.


Test-Setup
----------

Eight different sensors with a total of 21 units were tested simultaniously
using two Raspberry Pi Picos
(see [Pico-Datalogger](https://github.com/bablokb/pcb-pico-datalogger)).

![](setup.jpg)

Besides normal indoor measurements there were two special phases: one
period within a refrigerator and one within an oven.


Data
----

Raw and processed data is within the [`data`-directory](data/Readme.md).

Besides raw and clean data, there is also a calculated "difference from
mean". Since the setup did not include a high precision reference, this
mean is likely to be the most exact measurement.


Plots
-----

Various plots are within the `plots`-directory. These plots were generated
using <https://github.com/bablokb/py-datamon> which is based on Pandas
and Matplotlib. Configuration-files for the plots are within the
`config`-directory.

Matplotlib allows to zoom into the plots, so for a detailed view of the
data it is recommended to install "py-datamon" and run e.g.

    py-datamon -c configs/bme280-absolute.json data/sensor-test1-combined.csv

![](plots/bme280-absolute.png)


Results
-------

The test did not bring up any unexpected results. All sensors are within
the specifications as claimed by their datasheets.

Looking at difference to mean, the cheapest sensor (DS18B20) did the
best job. The main drawback of the DS18B20 is that it only measures
temperature.

Some sensors seem to underestimate (e.g. AHT20, BME280), some seem to
overestimate (e.g. HTU31D). But this is not systematic and not alway true
for all specimen of a sensor, so this should not be seen as a property
of the sensor, but as an artifact of the given measurement series.

All in all, the measurement setup will have a higher influence on the
measured values than the choice of the sensor.

Some Recommendations:

  - Separate sensors from sources that influence the measurements. This
    implies /not/ to use a Pi or even worse a sensor Pi-hat.
  - Shutdown the MCU or at least use deep-sleep modes inbetween
    measurements to minimize heat-creap.
  - Check the sensor-initialization. Some drivers don't use ideal
    setups. The BMx280 is a very good example. The datasheet gives
    advice on how to initialize the sensor but some drivers/docs
    don't make it transparent on what they do. The Arduino-driver
    for the BME280 is perfect in this regard. The driver even provides
    presets to easily switch between settings.


License for the Breakout Holder
-------------------------------

The breakout-holder in the `3D`-directory is licensed under:

[![CC BY-SA 4.0][cc-by-sa-shield]][cc-by-sa]

This work is licensed under a
[Creative Commons Attribution-ShareAlike 4.0 International
License][cc-by-sa].

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

[cc-by-sa]: http://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
[cc-by-sa-shield]:
https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg
