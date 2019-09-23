use <tools.scad>


module spoke(spokeLength){
  translate([0, 0, spokeLength/2]) {
    linear_extrude(height = spokeLength, center=true, convexity=10, $fn=20)
    circle(r = 1.5);
  }

}


module rim(){
  torus(26*25.4/2., 10);
}


module axle(){
  torus((26*25.4)/2.-284, 5);
}
