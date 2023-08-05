// -----------------------------------------------------------------------------
// 3D-Model (OpenSCAD): A holder for various sensor-breakouts.
//
// Author: Bernhard Bablok
// License: CC-BY-SA
//
// https://github.com/bablokb/sensor-test
// -----------------------------------------------------------------------------

include <dimensions.scad>
include <BOSL2/std.scad>

// --- standard-breakout from Adafruit   ---------------------------------------

module breakout() {
  difference() {
     // wall around breadboard
     rect_tube(size=[x_breakout+2*w2,y_breakout+2*w2],wall=w2,h=z_breakout,
                     anchor=BOTTOM+CENTER);
     // cutouts for Stemma/Qt
     translate([0,-y_breakout/2-w2/2-fuzz,0])
         cuboid([x_stemma,w2+2*fuzz,z_breakout+2*fuzz],anchor=BOTTOM+CENTER);
     translate([0,+y_breakout/2+w2/2+fuzz,0]) 
         cuboid([x_stemma,w2+2*fuzz,z_breakout+2*fuzz],anchor=BOTTOM+CENTER);
   }
   // wall around sensor (not needed for this project)
   // translate([0,y_sensor_off,0])
   //     rect_tube(size=[x_sensor+2*w2,y_sensor+2*w2],wall=w2,h=z_stemma+2*fuzz,
   //               anchor=BOTTOM+CENTER);
}

// --- mini-breadboard   -------------------------------------------------------

module breadboard() {
  difference() {
     // wall around breadboard
     rect_tube(size=[x_bb+2*w2,y_bb+2*w2],wall=w2,h=z_bb,
                     anchor=BOTTOM+CENTER);
     // cutouts to prevent conflicts with extrusions
     translate([-x_bb/2-w2/2-fuzz,0,0])
         cuboid([w2+2*fuzz,y_bb_co,z_bb+2*fuzz],anchor=BOTTOM+CENTER);
     translate([+x_bb/2+w2/2+fuzz,0,0]) 
         cuboid([w2+2*fuzz,y_bb_co,z_bb+2*fuzz],anchor=BOTTOM+CENTER);
     translate([0,-y_bb/2-w2/2-fuzz,0])
         cuboid([x_bb_co,w2+2*fuzz,z_bb+2*fuzz],anchor=BOTTOM+CENTER);
     translate([0,+y_bb/2+w2/2+fuzz,0]) 
         cuboid([x_bb_co,w2+2*fuzz,z_bb+2*fuzz],anchor=BOTTOM+CENTER);
   }
}

// --- cutout below breakout/breadboard   --------------------------------------

module cutout(x,y) {
  cuboid([x-2*c_plate,y-2*c_plate,z_plate+2*fuzz],anchor=BOTTOM+CENTER);
}

// --- base-plate   ------------------------------------------------------------

module base() {
  difference() {
    cuboid([x_plate,y_plate,z_plate],anchor=BOTTOM+CENTER);
    offset1 = -x_plate/2+x_breakout/2+o_plate;
    translate([offset1,0,-fuzz]) cutout(x_breakout,y_breakout);
    offset2 = offset1 + x_breakout+o_plate;
    translate([offset2,0,-fuzz]) cutout(x_breakout,y_breakout);
    offset3 = offset2 + x_breakout+o_plate;
    translate([offset3,0,-fuzz]) cutout(x_breakout,y_breakout);
    offset4 = x_plate/2 - x_bb/2 - o_plate;
    translate([offset4,0,-fuzz]) cutout(x_bb,y_bb);
  }
}

// --- complete holder   -------------------------------------------------------

module holder() {
  base();
  offset1 = -x_plate/2+x_breakout/2+o_plate;
  translate([offset1,0,z_plate-fuzz]) breakout();
  offset2 = offset1 + x_breakout+o_plate;
  translate([offset2,0,z_plate-fuzz]) breakout();
  offset3 = offset2 + x_breakout+o_plate;
  translate([offset3,0,z_plate-fuzz]) breakout();
  offset4 = x_plate/2 - x_bb/2 - o_plate;
  translate([offset4,0,z_plate-fuzz]) breadboard();
}

// --- final model   -----------------------------------------------------------

holder();
