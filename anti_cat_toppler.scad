wall_thickness = 1.7;

inner_diameter = 75;
outer_lip_thickness = 15;
leg_height = 55;

module top()
{
    difference() {
        cube([inner_diameter + outer_lip_thickness * 2, inner_diameter + outer_lip_thickness*2, wall_thickness],center=true);
        cube([inner_diameter, inner_diameter, wall_thickness],center=true);
    }
}

module leg() {
    difference() {
        union() {
            cube([outer_lip_thickness, outer_lip_thickness, leg_height]);
            translate([outer_lip_thickness/2, outer_lip_thickness/2, leg_height-outer_lip_thickness/2])
                rotate([180, 0, 45])
                cylinder(outer_lip_thickness,outer_lip_thickness,0,$fn=4,center=true);
        }
        union() {
            cube([outer_lip_thickness-wall_thickness, outer_lip_thickness-wall_thickness, leg_height]);
            translate([-outer_lip_thickness/2, -outer_lip_thickness/2, 0])
                cube([outer_lip_thickness-wall_thickness+outer_lip_thickness/2, outer_lip_thickness-wall_thickness+outer_lip_thickness/2, leg_height]);
        }
    }
}

module legs() {
    translate([inner_diameter/2, inner_diameter/2, wall_thickness/2])
        leg();
    translate([-inner_diameter/2, inner_diameter/2, wall_thickness/2])
        rotate([0, 0, 90])
        leg();
    translate([-inner_diameter/2, -inner_diameter/2, wall_thickness/2])
        rotate([0, 0, 180])
        leg();
    translate([inner_diameter/2, -inner_diameter/2, wall_thickness/2])
        rotate([0, 0, 270])
        leg();
}

top();
legs();
