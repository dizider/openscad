wallSize = 1.2;
overlapSize = 0.6;
sideSize = 67;

boxCoverSideSize = sideSize-(2*wallSize+overlapSize);
echo("Box cover side size ", boxCoverSideSize); 

union(){
    emptyBox(sideSize, sideSize, 12, 1.2);
    translate([0,70,0]) boxCover(sideSize, sideSize, 1.2, overlapSize);
}

module emptyBox(side1, side2, height, wall){
    difference(){
        cube([side1,side2,height]);
        translate([wall,wall,wall]) cube([side1-2*wall,side2-2*wall,height]);
        echo("Empty box size: ", side1-2*wall, " ", side2-2*wall);
    }
}

module boxCover(side1, side2, wall, overlap){
    union(){
        cube([side1, side2, wall]);
        translate([(wall+overlap), (wall+overlap), .01]) emptyBox(side1-(2*wall+overlap), side2-(2*wall+overlap), 3, wall);
    }
}