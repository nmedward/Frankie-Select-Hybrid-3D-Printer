// PRUSA iteration3
// X end motor
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

// Modified by Paul Arden <paul@arden.io> to backport the MakerBot endstop
// mount designed by Thomas Sanladerer and provided in his STL files.

use <x-end.scad>

module x_end_motor_base(){
 x_end_base();
 translate(v=[-15,31,26.5]) cube(size = [17,44,53], center = true);
}

module x_end_motor_endstop_base(){
    translate([-23.5,-28.5,58]){
        difference(){
            // Base block
            cube([17,18.2,4]);
            // Nice edge
            translate([-1,10,10])rotate([-45,0,0])cube(20,20,20);
            } 
        }
}

module x_end_motor_endstop_holes(){
    translate([-23.5,-28.5,58]){
        translate([17/2,7.5,-3]){
            // Back screw hole for endstop
            translate([-4.75,0,0])cylinder(r=1,h=19,$fn=20);
            translate([-4.75,0,6])cylinder(r1=1, r2=1.5, h=2,$fn=20);
            // Front screw hole for endstop
            translate([4.75,0,0])cylinder(r=1,h=19,$fn=20);
            translate([4.75,0,6])cylinder(r1=1, r2=1.5, h=2,$fn=20);
            }
        }
}



module x_end_motor_holes(){
 x_end_holes();
 // Position to place
 translate(v=[-1,32,30.25]){
  // Belt hole
  translate(v=[-14,1,0]) cube(size = [10,46,22], center = true);
  // Motor mounting holes
  translate(v=[20,-15.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.8, $fn=30);
  translate(v=[1,-15.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);
  translate(v=[20,-15.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.8, $fn=30);
  translate(v=[1,-15.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);
  translate(v=[20,15.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.8, $fn=30);
  translate(v=[1,15.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);
  translate(v=[20,15.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.8, $fn=30);
  translate(v=[1,15.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);

  // Material saving cutout 
  translate(v=[-10,12,10]) cube(size = [60,42,42], center = true);

  // Material saving cutout
  translate(v=[-10,40,-30]) rotate(a=[45,0,0])  cube(size = [60,42,42], center = true);
  
 }
}

// Motor shaft cutout
module x_end_motor_shaft_cutout(){
    union(){
    difference(){
        translate(v=[0,32,30]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=17, $fn=6);
       
        translate(v=[-10,-17+32,30]) cube(size = [60,2,10], center = true);
        translate(v=[-10,-8+32,-15.5+30]) rotate(a=[60,0,0]) cube(size = [60,2,10], center = true); 
        translate(v=[-10,8+32,-15.5+30]) rotate(a=[-60,0,0]) cube(size = [60,2,10], center = true);
        
        
    }
    translate(v=[-30,25.2,-11.8 +30]) rotate(a=[0,90,0]) cylinder(h = 30, r=3, $fn=30);
    translate(v=[-30,19.05,30]) rotate(a=[0,90,0]) cylinder(h = 30, r=3.5, $fn=100);
}
}



module selective_infill()mirror([0,1,0]) translate([-50, -33, 0.6])
{ 
   difference()
    {
    union()
    {
        difference()
        {
        translate([50,50,0.6]) rotate([0,0,90]) cylinder( h=6, r=11.7, $fn=30);//0, 17, 0.6
        translate([50,50,-1]) rotate([0,0,90]) cylinder( h=10, r=11.5, $fn=30);
        }
        difference()
        {
        translate([50,50,0.6]) rotate([0,0,90]) cylinder( h=6, r=10.7, $fn=30); //0, 17, 0.6
        translate([50,50,-1]) rotate([0,0,90]) cylinder( h=10, r=10.5, $fn=30);
        } 
        difference()
        {
        translate([50,50,0.6]) rotate([0,0,90]) cylinder( h=6, r=9.9, $fn=30); //0, 17, 0.6
        translate([50,50,-1]) rotate([0,0,90]) cylinder( h=10, r=9.7, $fn=30);
        } 
        difference()
        {
        translate([50,50,0.6]) rotate([0,0,90]) cylinder( h=6, r=9, $fn=30); //0, 17, 0.6
        translate([50,50,-1]) rotate([0,0,90]) cylinder( h=10, r=8.8, $fn=30);
        } 
    }
    translate([57.5,50.5,-1]) rotate([0,0,45]) cube([8,10,9]); // front
    translate([52,30.5,-1]) rotate([0,0,45]) cube([10,20,20]);  // front angled
    translate([32,35.5,-1]) cube([8,30,9]); // inner horizontal
    }
   } 
   
 module reinforcement_selective_infill()
   {
    rotate([90,0,-15,]) translate ([-1.5, 8, 26])linear_extrude(height = 0.2) polygon( points=[[-2,0],[0,12],[8,0]] ); //bearings
    
    rotate([90,0,-50,]) translate ([8.5, 8, 1.4])linear_extrude(height = 0.2) polygon( points=[[0,0],[0,12],[8,0]] ); //body
    
    }
    
   
// Final part
module x_end_motor(){
 difference(){
     union(){
            x_end_motor_base();
            x_end_motor_endstop_base();
            
         }
  x_end_motor_shaft_cutout();
  x_end_motor_holes();
  //x_end_motor_endstop_holes();      
  selective_infill();
  reinforcement_selective_infill();
         
      translate([-12,-42,65]) rotate([-35,0,0])  rotate([0,0,45]) cube(10,10,10);
      translate([-15,8.5,6]) rotate([90,0,0]) cylinder(h=5, r=5, $fn=30);   
      translate([-15,8.5,51]) rotate([90,0,0]) cylinder(h=5, r=5, $fn=30);   
      translate([-15,3.5,6]) rotate([90,0,0]) cylinder(h=3, r1=5, r2=4, $fn=30);   
      translate([-15,3.5,51]) rotate([90,0,0]) cylinder(h=3, r1=5, r2=4, $fn=30); 
 }
}

//x_end_motor();

module endstop_base(){
    union() {
        //main body
        difference(){
            //base
            translate([0,-14,0]) cube([3,14,38.663]);
            //large overhang
            translate([1.5,-10*sqrt(2),0]) rotate([45,0,0]) cube([4,20,20], center = true);
            //cut for top chamfer
            translate([1.5,-10*sqrt(2),38.663+2.925]) rotate([45,0,0]) cube([4,10,10], center = true);
            //cut for middle chamfer
            translate([1.5,-14+4-5,38.663-4-19-5]) difference(){
                rotate([0,0,0]) cube([4,10,10], center = true);
                translate([0,(sqrt(2)/2)*7.5,-((sqrt(2)/2)*7.5)]) rotate([45,0,0]) cube([5,15,15], center = true);
            }
        }
        //top chamfer
        translate([0,-14+4,38.663-4]) rotate([0,90,0]) cylinder(r=4, h=3, $fn=80);
        //middle chamfer
        translate([0,-14+4,38.663-4-19]) rotate([0,90,0]) cylinder(r=4, h=3, $fn=80);
    }
}

module endstop_fillet(){
    difference(){
        translate([0,0,0]) rotate([45,0,0]) cube([0.25,0.25,0.25]);
        translate([-0.125,0,0]) cube(0.5,0.25,0.25);
    }
}

module endstop_countersink(){
    rotate([0,90,0]) cylinder(d1=2.7,d2=3.2,h=0.25,$fn=80);
}

module endstop_buttons(){
    intersection() {
        union() {
            translate([0,-14+4,38.663-4]) rotate([0,90,0]) cylinder(r1=5, r2=4, h=2, $fn=80);
            translate([0,-14+4,38.663-4-19]) rotate([0,90,0]) cylinder(r1=5, r2=4, h=2, $fn=80);
        }
        endstop_base();
    }
}

module endstop(){
    difference(){
        union(){
            endstop_base();
            translate([3,0,0]) endstop_buttons();
            translate([0,0,38.663-(sqrt(2)*0.125)]) scale([12,1,1]) endstop_fillet();
        }
        //top hole
        translate([-0.5,-14+4,38.663-4]) rotate([0,90,0]) cylinder(d=2.7, h=6, $fn=80);
        //bottom hole
        translate([-0.5,-14+4,38.663-4-19]) rotate([0,90,0]) cylinder(d=2.7, h=6, $fn=80);
        //countersinks
        translate([4.76,-14+4,38.663-4]) endstop_countersink();
        translate([4.76,-14+4,38.663-4-19]) endstop_countersink();
        translate([0.24,-14+4,38.663-4-19]) rotate([0,0,180]) endstop_countersink();
        translate([0.24,-14+4,38.663-4]) rotate([0,0,180]) endstop_countersink();
    }
}

union(){
    translate([-9.5,-28.5,13.337]) endstop();
    x_end_motor();
}
