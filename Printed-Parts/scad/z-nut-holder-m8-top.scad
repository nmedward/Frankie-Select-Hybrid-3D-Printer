// Top part of M8 nut holder
// Updated by Alex Volkov
// From backport by Paul Arden <paul@arden.io> from Thomas Sanladerer's design.

render_fn = 20;

// All M8 values refer to M8 Nut dimension
m8_outer = 15.2;
m8_inner=8.5;
m8_height = 5.3;

max_height = m8_height + 0.9;


top_thick = 5;

module m3_holes(d,r,h){
     for (i = [0:6]) {
        translate([r*cos(i*180),r*sin(i*180),0]) cylinder(d=d,h=h,$fn=render_fn);
    }    
}

translate([0,0,-1.8]) 
difference(){
    union() {
        //base
        cylinder(d=25, h=3.3, $fn=render_fn);
        //outer wall for m8 nut
        translate([0,0, top_thick + 1])
        cube([m8_outer-1, m8_outer+2, max_height + top_thick], center=true);
        }
     
    rotate([0,0,90])
    cylinder(d1=m8_outer, d2=m8_outer, h=m8_height,$fn=6);
    
    //cone-shaped hole in top wall
    cone_height =  top_thick - 2;
    translate([0, 0, m8_height])
    cylinder(d1=m8_outer-1.4, d2=m8_inner, h=cone_height, $fn=render_fn);
    
    //round hole in top wall
    translate([0, 0, max_height+cone_height - 2])
    cylinder(d1=m8_inner, d2=m8_inner, h=top_thick +5, $fn=render_fn);
       
    
    m3_holes(3.5,9.5,4);
    
    translate([0,0,3.3-1.8])
    rotate([0,0,90])
    m3_holes(1,8.937/2,4);
    cylinder(d1=6.5,d2=5.5,h=0.5,$fn=render_fn);
}
