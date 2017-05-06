// Backported by Paul Arden <paul@arden.io> from Thomas Sanladerer's design.

module m3_holes(d,r,h){
     for (i = [0:6]) {
        translate([r*cos(i*60),r*sin(i*60),0]) cylinder(d=d,h=h,$fn=128);
    }    
}

translate([0,0,-1.8]) difference(){
    cylinder(d=25, h=3.3, $fn=128);
    translate([0,0,3.3-1.8]) rotate([0,0,90]) cylinder(d1=8.937,d2=9.353,h=2,$fn=6);
    translate([0,0,-0.05]) cylinder(d=5.5, h=2, $fn=128);
    m3_holes(3.5,9.5,4);
    translate([0,0,3.3-1.8]) rotate([0,0,90]) m3_holes(1,8.937/2,4);
    cylinder(d1=6.5,d2=5.5,h=0.5,$fn=128);
}
