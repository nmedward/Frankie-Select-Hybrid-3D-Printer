// Bottom part of M8 nut holder
// Updated by Alex Volkov
// From backport by Paul Arden <paul@arden.io> from Thomas Sanladerer's design.

render_fn = 20;

m8_inner=8.5;
hh = 3.3;

module m3_holes(d,r,h){
     for (i = [0:6]) {
        translate([r*cos(i*60),r*sin(i*60),0]) cylinder(d=d,h=h,$fn=render_fn);
    }    
}

translate([0,0,-1.8])
difference(){
    cylinder(d=25, h=hh, $fn=render_fn);
    cylinder(d=m8_inner, h=hh, $fn=render_fn);
    m3_holes(3.5,9.5,4);
}