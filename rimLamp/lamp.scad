use <elements.scad>



spokeLength = 248;
h = ($t+0.1) * 490;

alpha = acos(h/(2*spokeLength));


for (j = [0:1]) {
  translate([0, 0, j*h]) {
    rim();
    axle();
  }


  for (i = [0:2:31]) {
    translate([26*25.4/2*cos(i/32.*360), 26*25.4/2*sin(i/32.*360), j*h]) {
      rotate([0, 0, i/32*360]) {
        rotate([0, alpha+j*(-2*alpha+180), 0]) {
          spoke(spokeLength);
          echo(str("alpha = ", alpha+360*i/32));
        }
      }
    }
  }

  for (i = [1:2:32]) {
    translate([26*25.4/2*cos(i/32.*360), 26*25.4/2*sin(i/32.*360), j*h]) {
      rotate([0, 0, i/32*360]) {
        rotate([0, -90, 0]) {
          spoke(spokeLength);
        }
      }
    }
  }

}

translate([0, 0, (h+500)/2]) {
  cylinder(h+500, 10, 10, center=true);
}


translate([0, 0, h]) {
  cylinder(2, 82, 82, center=true);
}

cylinder(2, 82, 82, center=true);
