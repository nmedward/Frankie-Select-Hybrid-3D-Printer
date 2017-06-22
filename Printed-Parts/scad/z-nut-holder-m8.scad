// Backported by Paul Arden <paul@arden.io> from Thomas Sanladerer's design.

render_fn = 24;

max_height = 8;
m8_outer_d = 15.1;
m8_bolt_h = 7;
m8_d=8.5;

top_thick = 5;

module m3_holes(d,r,h){
     for (i = [0:6]) {
        translate([r*cos(i*90),r*sin(i*90),0]) cylinder(d=d,h=h,$fn=render_fn);
    }    
}

translate([0,0,-1.8]) 
difference(){
    union() {
        cylinder(d=25, h=3.3, $fn=render_fn);
        //outer wall for m8
        //cylinder(d=m8_outer_d+0.4, h=max_height, $fn=6);
        translate([0,0, 4])
        cube([m8_outer_d, m8_outer_d+4.5, max_height], center=true);
        
        // top wall for the M8 
        translate([0, 0, max_height])
        cylinder(d=m8_outer_d+0.4, h=top_thick, $fn=render_fn);
        //translate([0, 0, 4])
        //cube([m8_outer_d, m8_outer_d, top_thick], center=true);
        
        }
    
    //translate([0,0,3.3-1.8])
    rotate([0,0,90])
    cylinder(d1=m8_outer_d, d2=m8_outer_d, h=m8_bolt_h,$fn=6);
    
    //cone-shaped hole in top wall
    translate([0, 0, m8_bolt_h])
    cylinder(d1=m8_outer_d-1, d2=m8_d, h=top_thick -2, $fn=render_fn);
    
    //round hole in top wall
    translate([0, 0, max_height+2])
    cylinder(d1=m8_d, d2=m8_d, h=top_thick -2, $fn=render_fn);
       
    
    m3_holes(3.5,9.5,4);
    
    translate([0,0,3.3-1.8])
    rotate([0,0,90])
    m3_holes(1,8.937/2,4);
    cylinder(d1=6.5,d2=5.5,h=0.5,$fn=render_fn);
}
