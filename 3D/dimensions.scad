// -----------------------------------------------------------------------------
// 3D-Model (OpenSCAD): basic dimensions for the sensor-holder
//
// Author: Bernhard Bablok
// License: GPL3
//
// https://github.com/bablokb/sensor-test
// -----------------------------------------------------------------------------

$fa = 1;
$fs = 0.4;
$fn = 48;

fuzz = 0.01;
w2 = 0.86;                 // 2 walls Prusa3D
w4 = 1.67;                 // 4 walls Prusa3D
gap = 0.2;                 // gap pcb to case

// dimensions for standard adafruit-breakout   ---------------------------------

x_stemma     = 8;
z_stemma     = 3.2;
z_pcb        = 1.6;

x_breakout      = 17.98 + gap;
y_breakout      = 25.4  + gap;
z_breakout      = z_pcb + z_stemma;

// dimensions for small breadboards   ------------------------------------------

x_bb = 47.3;
y_bb = 35.2;
z_bb = z_breakout;

x_bb_co = x_bb - 10;    // cutout-dimensions
y_bb_co = y_bb - 10;

// dimensions base-plate   -----------------------------------------------------

o_plate = 5;                                             // offset
x_plate = 4*o_plate + 3*(x_breakout+2*w2) + x_bb + 2*w2;
y_plate = 2*o_plate + y_bb + 2*w2;
z_plate = 1.6;
c_plate = 4;                                             // for internal cutouts
