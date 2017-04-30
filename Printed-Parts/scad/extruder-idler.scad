// PRUSA iteration3
// Extruder idler
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

// Modified by Paul Arden <paul@arden.io> to reduce extruder side by 1mm
// Also added Thomas Sanladerer's modifications to remove the need for washers
// and use a printed pin for the bearing

module part_body(){
    
    //bottom round edge
    translate([ -7, 4, 6 ]) rotate([0,90,0]) cylinder(r=4, h=21.5, $fn=200 );
    translate([ -7, 4, 5 ]) rotate([0,90,0]) cylinder(r=4, h=21.5, $fn=200 );
    translate([ 11, 8, 5 ])  cube([3.5,4,5]);
    

    difference()
    {
        translate([ -7, 0, 5 ])  cube([21.5,5,5]);
        translate([ -8, -1, 8 ])  rotate([45,0,0]) cube([25,5,6]);
    }
    
    translate([ -7, 8, 5 ]) rotate([0,90,0]) cylinder(r=4, h=21.5, $fn=200 );
    translate([ 11, 0, 5]) cube([3.5,12,1]);
    translate([ 11, 4, 8]) cube([3.5,4,2]);
    translate([ 11, 4, 1]) cube([3.5,4,2]);
    

    // body
    translate([ -7, 4, 1 ]) cube([18,10,9]);
    translate([ -7, 0, 5 ]) cube([18,32,1]);
    translate([ -5, 4, 3 ]) cube([10,48,7]);
    translate([ -11, 11, 1 ]) cube([22,28,9]);
    translate([ -9, 11, 1 ]) cube([18,30,9]);

    // upper round edges    
    translate([ 9, 39, 1 ]) cylinder(r=2, h=9, $fn=25);
    translate([ -9, 39, 1 ]) cylinder(r=2, h=9, $fn=25);
        
    // upper round piece
    translate([ 0, 52, 6.5 ]) rotate([0,0,0]) cylinder(r=5, h=7, $fn=200, center=true);
}    

module cut_away(){

    // axis
    translate([ 0, 4, 6 ]) rotate([0,90,0]) cylinder(r=1.7, h=30, $fn=200, center=true); 

    // bolt holes
    translate([ 7.5, 35.8, -1 ]) cylinder(r=1.75, h=12, $fn=20);
    translate([ 7.5, 36.5, -1 ]) cylinder(r=1.75, h=12, $fn=20);
    translate([ 7.5, 37.2, -1 ]) cylinder(r=1.75, h=12, $fn=20);

    translate([ -7.5, 35.8, -1 ])cylinder(r=1.75, h=12, $fn=20);
    translate([ -7.5, 36.5, -1 ])cylinder(r=1.75, h=12, $fn=20);
    translate([ -7.5, 37.2, -1 ])cylinder(r=1.75, h=12, $fn=20);
    
    translate([0,52,0]) sphere(r=5, $fn=20);
    
    //bearing hole
    translate([ 0, 20, 4 ]){
        rotate([0,90,0]){
            cylinder(r=8.5, h=7.5, $fn=200, center=true);
            %cylinder(r=8, h=7.5, $fn=200, center=true);
            cylinder(r=2.5, h=17, $fn=200, center=true);
            }
        translate([0,0,-5]) cube([17,5,10], center=true);
        translate([0,0,-5]) cube([7.5,17,10], center=true);
    }
}

module bearing_face() {
        difference() {
            union() {
                rotate([0,90,0]) cylinder(h=1.25, $fn=200, d1=8, d2=10.5);
                translate([0,-5.25,0]) cube([1.25,10.5,5]);
            }
            translate([2,-7.75,-0.5]) rotate([0,0,45]) cube([1.25,5.5,6]);
            translate([-2,3.75,-0.5]) rotate([0,0,-45]) cube([1.25,5.5,6]);
            translate([-0.25,-5.25,3]) rotate([0,0,0]) cube([1.75,10.5,4]);
            translate([0,0,5]) cube([17,5,10], center=true);
            rotate([0,90,0]) cylinder(r=2.5, h=17, $fn=200, center=true);
        }
}

module idler(){
    
    // final part
    translate([0,0,10]) mirror([0,0,1])
    union(){
        translate([2.5,20,4]) rotate([180,0,0]) bearing_face();
        translate([-2.5,20,4]) rotate([180,0,180]) bearing_face();
        difference(){
            part_body();
            cut_away();
        }
    }
}

module pin() {
    translate([20,30,1.6972]) rotate([90,0,0]){
        difference(){
            union(){
                translate([0,0,15]) cylinder(d1=4.7998, d2=3.8, h=0.5, $fn=200);
                translate([0,0,0]) rotate([180,0,0]) cylinder(d1=4.7998, d2=3.8, h=0.5, $fn=200);
                cylinder(d=4.7998, h=15, $fn=200);
            }
            translate([-2.5,-2.6972,-1]) cube([5,1,17]);
        }
    }
}

idler();
pin();