tol = 0.1;
eps = 0.0001;
outer_r = 50;
nut_s = 17.2;
inner_r = (nut_s/2)/cos(30);
plate_t = 3;
outer_sm = 100;
test_s = 17;
nub_o = 1;
nub_r = 0.5;
nub_sm = 10;

module plate() {
difference() {
  union() {
    cylinder(r=outer_r,h=plate_t/2,$fn=outer_sm);
    translate([0,0,plate_t/2-eps])
      cylinder(r1=outer_r,r2=outer_r-1,h=plate_t/2+eps,$fn=outer_sm);
  }
  hull() {
    translate([0,0,-tol])
      cylinder(r=inner_r,h=plate_t+2*tol,$fn=6);
    translate([outer_r+nut_s,0,-tol])
      cylinder(r=inner_r,h=plate_t+2*tol,$fn=6);
  }
}
// nubs
translate([inner_r/2+nub_r+tol,nut_s/2,0])
  cylinder(r=nub_r,h=plate_t,$fn=nub_sm);
translate([inner_r/2+nub_r+tol,-nut_s/2,0])
  cylinder(r=nub_r,h=plate_t,$fn=nub_sm);
}

module test1() {
color([0.1,0.8,0.1,0.4])
translate([-test_s/2,-test_s/2,-test_s/2])
  cube([test_s,test_s,test_s]);
}

module test2() {
color([0.1,0.8,0.1,0.4])
    translate([0,0,-plate_t])
      cylinder(r=inner_r,h=3*plate_t,$fn=6);
}

plate();
//test1();
test2();
