// ====================================================================================
// REVOLUTIONARY TECHNOLOGY COMPANY & UNIVERSITY OF WASHINGTON DEPARTMENT OF PHYSICS
// Subsystem: malibu_ss_4door_body.scad (2027 Malibu SS 4-Door Stamping Template)
// Core Application: 1969 Malibu Silhouette Mated to the Low-Slung COPO Frame Rails
// COMPLIANCE GATE: Maintains absolute 65mm lower open clearance for underbody armor
// Center Origin (0,0,0) = Geometric Centerpoint of the 115-Inch Intermediate Wheelbase
// ====================================================================================

$fn = 100; // Parametric panel contour surface finish tooling resolution

// --- 1969/2027 Malibu SS Intermediate Dimensions (mm) ---
inch_to_mm         = 25.4;
malibu_wheelbase   = 115.0 * inch_to_mm; // Exactly 2921.00 mm intermediate wheelbase stance
body_total_width   = 76.0 * inch_to_mm;  // 1930.40 mm compact mid-size track profile
sheet_metal_thick  = 1.50;               // Heavy fleet-gauge stamped steel skin scale

// Underbody Clearance Rule Compliance [INDEX]
UNDER_ARMOR_CLEARANCE_MM = 65.00;

module stamped_front_malibu_clip() {
    echo("STAMPING 2027 MALIBU SS 4-DOOR SEDAN HOOD AND FLAT FENDER LINERS");
    // Front clip housing the 1,350 Nm Square-Tooth propulsion engine core [INDEX]
    color("ButternutYellow") {
        difference() {
            // Front clip exterior boundary envelope
            translate([0, malibu_wheelbase/2 + 350, 150])
                cube([body_total_width, 1300, 580], center=true);
            
            // Hollow inner engine bay cavity clearing the front space-frame rails
            translate([0, malibu_wheelbase/2 + 350, 150])
                cube([body_total_width - 32, 1304, 560], center=true);
                
            // LOWER PROFILE STANDOFF: Cuts base line to leave open armor installation room [INDEX]
            translate([0, malibu_wheelbase/2 + 350, -150])
                cube([body_total_width + 10, 1310, UNDER_ARMOR_CLEARANCE_MM * 3], center=true);
                
            // MALIBU HORIZONTAL LIGHT BUCKETS: Sockets cut into front grille face for street lamps [INDEX]
            for (side = [-1, 1]) {
                translate([side * (body_total_width/2 - 140), malibu_wheelbase/2 + 1000, 220])
                    rotate([-90, 0, 0])
                        cylinder(d=146.05, h=40, center=true); // 5.75" intermediate lenses [INDEX]
            }
        }
    }
}

module midsize_4door_greenhouse() {
    // Stamped four-door sedan passenger cell matching 2016 fabric set profiles [INDEX]
    color("DarkSlateGrey") {
        difference() {
            // Main greenhouse roof and side pillar panels
            translate([0, -50, 500])
                cube([body_total_width, 2100, 920], center=true);
            // Hollow inner cockpit cave clearing the wave dashboard and pedal encoders [INDEX]
            translate([0, -50, 500])
                cube([body_total_width - 40, 2080, 880], center=true);
                
            // LOWER ROCKER PANEL ARMOR STANDOFF CLEARANCE (Rule Compliance) [INDEX]
            translate([0, -50, -30])
                cube([body_total_width + 10, 2110, UNDER_ARMOR_CLEARANCE_MM * 2], center=true);
        }
    }
}

module compact_rear_trunk_deck() {
    // Stamped rear trunk deck sheets matching intermediate fastback aspect ratios
    color("ButternutYellow") {
        translate([0, -malibu_wheelbase/2 - 450, 120]) {
            difference() {
                cube([body_total_width, 1400, 480], center=true);
                cube([body_total_width - 32, 1404, 460], center=true); // Hollow fuel tank pocket
                
                // Base clearance plane saving the 65mm underbody shield gap [INDEX]
                translate([0, 0, -200])
                    cube([body_total_width + 10, 1410, UNDER_ARMOR_CLEARANCE_MM * 2], center=true);
            }
        }
    }
}

// --- Composite Malibu SS Body Instantiation ---
union() {
    stamped_front_malibu_clip();
    midsize_4door_greenhouse();
    compact_rear_trunk_deck();
}
