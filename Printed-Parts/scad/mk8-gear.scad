module torus(r1,r2) {
    
    ra = r1 / 2;
    rb = r2 / 2 - r1 / 2;

    rotate_extrude(convexity = 10, $fn = 200)
    translate([rb, 0, 0]) circle(r = ra, $fn = 144);
}

module mk8_gear() {
    difference() {
        cylinder(d=9, h=11, $fn=200);
        translate([0,0,7.75]) torus(3.5,14);
        translate([0,0,-0.5]) cylinder(d=5, h=12, $fn=200);
    }
}
