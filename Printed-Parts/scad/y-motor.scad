// PRUSA iteration3
// Y motor mount
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

//include <configuration.scad>

// Modified by Paul Arden <paul@arden.io> to backport the MakerBot endstop
// mount designed by Thomas Sanladerer and provided in his STL files.

module y_motor_base(){
    
    union()
    {
    // Motor holding part
    translate(v = [29,-21+50,0]){
        
    difference()
    {    
     union()
    {
    translate(v = [-21+4.5,0,5]) cube(size = [9,31,10], center=true);
    translate(v = [-15.5,-15.5,0]) cylinder(h = 10, r=5.5, $fn=50);
    translate(v = [-15.5,+15.5,0]) cylinder(h = 10, r=5.5, $fn=50);
    translate([-21,7,0]) rotate([0,0,45]) cube([2, 2, 10]);    

    //end stop
    translate(v = [-10.5,+15.5,0]) cylinder(h = 10, r=5.5, $fn=50);
    translate([-12,0,0]) cube([7, 15, 10]);
    translate([-16,16,0]) cube([6, 5, 10]);
    translate([-21+6,8,0]) cube([12-2, 5, 38]);    
    translate([-17,8-5,0]) cube([4, 10, 38]);
    translate([-21+9.5-2,7,0]) rotate([0,0,45]) cube([2, 2, 38]);
    translate([-1,0,0]) difference(){    
        translate([-20,8-5,10]) cube([4, 10, 4]);
        translate([-20+2,8-5,10+2]) rotate([-90,0,0]) cylinder(r=2, h=10, $fn=80);
        translate([-20,8-5,12]) cube([4, 10, 4]);
        translate([-22,8-5,10]) cube([4, 10, 4]);
    }
    // Joins motor holder and rod plate
    translate(v = [-29,-21,0]) cube(size = [14,30,10]);
    }    
        //selective infill
        //translate([-14.5,5,0.3]) cube([0.1,5.5,35]);
        translate([-16,5,0.3]) cube([0.1,5.5,32]);
        translate([-14,5,0.3]) cube([0.1,5.5,33]);
        translate([-11.5,9,1]) cube([0.1,3,34.3]);
        translate([-6.75,9,6]) cube([0.1,3,29.3]);
        
    }
}
}
     // Front holding part
     translate(v = [0,10,0]) cylinder(h = 10, r=8, $fn=80);
     translate(v = [0,20,5])cube(size = [16,20,10], center=true);	
     translate(v = [0,30,0])cylinder(h = 10, r=8, $fn=80);
}

module y_motor_holes(){
    translate(v = [29,-21+50,0]){
    // Screw head holes
    translate(v = [-15.5,-15.5,-1]) cylinder(h = 10, r=1.8, $fn=20);
    translate(v = [-15.5,+15.5,-1]) cylinder(h = 10, r=1.8, $fn=20);
    // Screw holes
    translate(v = [-15.5,-15.5,7]) cylinder(h = 7, r=3.5, $fn=30);
    translate(v = [-15.5,+15.5,7]) cylinder(h = 35, r=3.5, $fn=30);
 }
    translate(v = [0,10,-1]) cylinder(h = 12, r=4.2, $fn=50);	
    translate(v = [0,30,-1]) cylinder(h = 12, r=4.2, $fn=50);
 
    //endstop
    translate([25,29,0])  cylinder(h = 29, r=8, $fn=20); 
   
    //translate([18,45,15]) rotate([90,0,0]) cylinder(h = 10, r=0.8, $fn=20);
    //translate([18,42.2,15]) rotate([90,0,0]) cylinder(h = 2, r1=1.2, r2=0.8, $fn=20);
 
    //translate([18,45,24.5]) rotate([90,0,0]) cylinder(h = 10, r=0.8, $fn=20);
    //translate([18,42.2,24.5]) rotate([90,0,0]) cylinder(h = 2, r1=1.2, r2=0.8, $fn=20);
   
    // endstop corner cutout
    translate([-6,30,38]) rotate([0,45,0]) cube([15, 19, 15]);	
    translate([-1,40,10]) rotate([0,0,5]) cube([15, 5, 29]);	
    translate([27,33,0]) rotate([0,0,45]) cube([5, 5, 38]);	
    translate([7,28,10.01]) rotate([0,0,45]) cube([5, 5, 28]); 
    
    translate([19,32,0]) rotate([0,30,0]) cube([8, 20, 18]);	
    //translate([24.5-2,32,17]) rotate([0,45,0]) cube([2, 20, 2]);	
    
    translate([23-2,32,38]) rotate([0,45,0]) cube([5, 20, 5]);
    
    translate([19.966, 44.5,34]) rotate([90,0,0]) cylinder(d=2.7, h=10, $fn=80);
    translate([19.966, 44.5,15]) rotate([90,0,0]) cylinder(d=2.7, h=10, $fn=80);
    translate([19.966, 42.01,34]) rotate([90,0,0]) cylinder(d2=2.7, d1=3.0, h=0.25, $fn=80);
    translate([19.966, 42.01,15]) rotate([90,0,0]) cylinder(d2=2.7, d1=3.0, h=0.25, $fn=80);
}




// Final part
module y_motor(){
    difference()
    {
        y_motor_base();
        y_motor_holes();
    }
}


y_motor();
