use <../utils/elements.scad>



spokeLength = 284;
h = 140;
hLamp = h + 40;

alpha = acos(h/(2*spokeLength));


for (j = [0:1]) {
  translate([0, 0, j*(hLamp)]) {
    *rim();
    axle();
  }


  for (i = [0:31]) {
    translate([42*cos(i/32.*360), 42*sin(i/32.*360), j*(hLamp)]) {
      rotate([0, 0, i/32*360]) {
        rotate([0, alpha+j*(-2*alpha+180), 0]) {
          spoke(spokeLength);
          echo(str("alpha = ", alpha+360*i/32));
        }
      }
    }
  }

}

translate([0, 0, (h+500)/2]) {
  cylinder(h+500, 10, 10, center=true);
}


translate([0, 0, hLamp]) {
  cylinder(2, 42, 42, center=true);
}

cylinder(2, 42, 42, center=true);
