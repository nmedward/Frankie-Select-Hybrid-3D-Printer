// PRUSA iteration3
// Extruder-body
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

// Modified by Paul Arden <paul@arden.io> to use updated base which moves
// filament path over by 1mm and shifts the inductive probe mount out to make 
// room for the cable.

use <extruder-main.scad>

preview = 5;
final = 20;
quality = 5;

module m3nut(){
    difference(){    
        cube([2,6,8]);
        translate([-0.5,3,3]) rotate([0,90,0]) cylinder(r=1.25, h=3, $fn=quality);
    }
}


module ext_body(){
    
    difference(){
       extruder_body();
       extruder_mount_holes();
        
        // PINDA entry hole
        //translate([-5.5,37,6])rotate([90,0,0])cylinder(r=4.4, h=4, $fn=quality); 
    }
    
}

module ex_body()
{ 
    
    difference()
    {
        
        union()
        {    
            // body
            // round body
            translate([-2.65,0,0]) translate([-5.5,36.5,6])rotate([-90,0,0])cylinder(r=8.5, h=19, $fn=final);
            // body block
            translate([-2.65,0,0]) translate([-5.5,36.5,6])rotate([-90,0,0])cube([12.15,10,20]);
            translate([-13-2.65,36.5,5]) cube([17+2.65,19,10]);
            translate([-13-2.65,36.5,15]) cube([5,19,1]);
            
            // extruder body joint
            translate([-0,33.5,0]) cube([3,2,15]);
            translate([0,34,0]) cube([4,3,15]);
            translate([0,35.5,0]) rotate([0,0,45]) cube([2,2,15]);
            
            // fillet from probe mount to body
            translate([4.99,44,0]) rotate([0,0,90]) difference(){
                translate([0,0,0]) cube([1,1,15]);
                translate([-0.0606601717798212/2,-0.0606601717798212/2,-0.5]) rotate([0,0,-45]) cube([1.5,1.5,16]);
                translate([-0.25,-0.25,14]) rotate([45,0,45]) cube([2,2,2]);
            }
        }   


        // PINDA lower hole
        translate([-2.65,0,0])translate([-5.5,50,6])rotate([-90,0,0])cylinder(r=4.1, h=40, $fn=quality);

        // M3 screws
        translate([0,-5.25,0]){
            translate([-2.65,0,0]){
                translate([-20,49,12])rotate([0,90,0])cylinder(r=1.5, h=24, $fn=quality);    
                //translate([-20,40,12])rotate([0,90,0])cylinder(r=1.5, h=24, $fn=quality);    
                translate([-14,49,12])rotate([0,90,0])cylinder(r=3, h=5, $fn=quality);    
                //translate([-14,40,12])rotate([0,90,0])cylinder(r=3, h=5, $fn=quality);
            }

            translate([-2.65,0,0]){
                // lower M3 screw end opening
                translate([2,49,11.5])rotate([0,90,0])cylinder(r=1.5, h=3, $fn=quality);    
                translate([2,49,12])rotate([0,90,0])cylinder(r=1.5, h=3, $fn=quality);    
                translate([2,49,12.5])rotate([0,90,0])cylinder(r=1.5, h=3, $fn=quality);    

                // upper M3 screw end opening
                //translate([2,40,11.5])rotate([0,90,0])cylinder(r=1.5, h=3+2.65, $fn=quality); 
                //translate([2,40,12])rotate([0,90,0])cylinder(r=1.5, h=3+2.65, $fn=quality); 
                //translate([2,40,12.5])rotate([0,90,0])cylinder(r=1.5, h=3+2.65, $fn=quality); 
            }
            // M3 nuts opening
            translate([-2.65,0,0]) translate([0,46,9]) m3nut();
            //translate([-2.65,0,0]) translate([0,37,9]) m3nut();
        }
        
        // flat bottom side
        translate([-2.65,0,0]) translate([-20,33,-10]) cube([30,35,10]);

        // slot
        translate([-2.65,0,0]) translate([-6,33,8]) cube([1,25,10]);

        // 45 / 30 deg edges 
        translate([-2.65,0,0]) translate([-15,32,12]) rotate([45,0,0]) cube([15,10,10]);
        translate([-2.65,-3.5,0]) translate([-20,55,13]) rotate([45,0,0]) cube([25+2.65,3,5]);

        translate([-2,45,-1]) rotate([0,30,0]) cube([15,15,15]);
        translate([7,46-3.5,-1]) rotate([0,0,30]) cube([15,11,25]);

        //PINDA mounting hole
        // translate([-2.65,0,0])translate([-5.5,60,6])rotate([90,0,0])cylinder(r=3.9, h=30, $fn=quality); 
        // translate([-2.65,0,0])translate([-5.5,41,6])rotate([90,0,0])cylinder(r=4.1, h=5, $fn=quality); 

        // bottom cut
        translate([-2.65,0,0]) translate([-15,51,-1])  cube([25 , 8,20]);
        
        // top and bottom probe washer cutout
        translate([-8.15,37.05,6])rotate([90,0,0])cylinder(d=14.75, h=0.8, $fn=quality);
        translate([-8.15,51.3,6])rotate([90,0,0])cylinder(d=14.75, h=0.85, $fn=quality);

        translate([-2.65,0,0]){
        for ( i = [0 : 14] )
            {
            translate([-5.5,39+i,6])rotate([90,0,0])cylinder(r1=4.3, r2=2.8, h=1, $fn=quality); 
            translate([-5.5,40+i,6])rotate([90,0,0])cylinder(r1=2.8, r2=4.3, h=1, $fn=quality);
            }
        }
    }

}

union(){
    difference(){
        ext_body();
        
        // remove old pinda
        translate([-20,26,-2]) cube([20,30,30]);

        //translate([0,-5.25,0]){
            // screw end larger hole
            //translate([-20,40,12])rotate([0,90,0])cylinder(r=1.5, h=24, $fn=quality);    
            //translate([2,40,11.5])rotate([0,90,0])cylinder(r=1.5, h=3, $fn=quality); 
            //translate([2,40,12])rotate([0,90,0])cylinder(r=1.5, h=3, $fn=quality); 
            //translate([2,40,12.5])rotate([0,90,0])cylinder(r=1.5, h=3, $fn=quality); 

            // M3 nuts 
            //translate([0,46,9]) m3nut();
            //translate([0,37,9]) m3nut();
        //}

        // M3 screws
        // translate([0,-5.25,0]){
        //     translate([-2.65,0,0]){
        //         // lower M3 screw end opening
        //         translate([2,49,11.5])rotate([0,90,0])cylinder(r=1.5, h=3, $fn=quality);    
        //         translate([2,49,12])rotate([0,90,0])cylinder(r=1.5, h=3, $fn=quality);    
        //         translate([2,49,12.5])rotate([0,90,0])cylinder(r=1.5, h=3, $fn=quality);
        //     }
        // }

        translate([-8.15,41,6])rotate([90,0,0])cylinder(r=4.5, h=50, $fn=2*quality); 

    }
    ex_body();
}