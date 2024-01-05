#-----------------------------------------------------------------------------
# Configuration constants for main.py.
#
# !!! This file is not maintained within Github !!!
#
# Author: Bernhard Bablok
#
# Website: https://github.com/pcb-pico-datalogger
#-----------------------------------------------------------------------------

TEST_MODE   = False       # set to FALSE for a production setup
NET_UPDATE  = True        # update RTC from time-server if time is invalid
OFF_MINUTES = 5           # turn off for x minutes
BLINK_TIME_START  = 0.5   # blink time of LED before start of data-collection
BLINK_TIME_END  = 0.25    # blink time of LED  after finish of data-collection
BLINK_START = 3           # blink n times before start of data-collection
BLINK_END   = 5           # blink n times after finish of data-collection

FORCE_CONT_MODE       = False      # Use continuous mode (with CONT_INT) even when on battery
FORCE_STROBE_MODE     = True      # Use strobe mode (with OFF_MINUTES) even when on power
CONT_INT              = 60         #  interval in continuous mode (in seconds)

TIME_TABLE = [
  ((0,24,1),(0,60,5)),
  ((0,24,1),(0,60,5)),
  ((0,24,1),(0,60,5)),
  ((0,24,1),(0,60,5)),
  ((0,24,1),(0,60,5)),
  ((0,24,1),(0,60,5)),
  ((0,24,1),(0,60,5))
  ]

HAVE_SD      = True
HAVE_DISPLAY = None                # 'Inky-Pack', 'Display-Pack' or None
HAVE_LORA    = False
HAVE_PCB     = True
HAVE_I2C0    = True               # also use second I2C-bus

sens_i2c0 = "aht20(0) mcp9808(0) am2320(0) bmp280(0) bme280(0)"
sens_i2c1 = "aht20(1) sht45(1) htu31d(1) bmp280(1) bme280(1)"

SENSORS      = f"battery {sens_i2c0} {sens_i2c1}"
CSV_FILENAME = f'/sd/sensor-test-{{ID}}.csv'

LOGGER_NAME  = 'Sensor-Test'
LOGGER_ID    = 'ST2'
LOGGER_LOCATION = '56JR+G5 FFB'
LOGGER_TITLE = f'{LOGGER_NAME} {LOGGER_ID}'

# font for the display
FONT_DISPLAY = 'DejaVuSansMono-Bold-16-subset'
SIMPLE_UI    = False
#FONT_DISPLAY = 'DejaVuSans-16-subset'
SHOW_UNITS = True
