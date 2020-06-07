

windowWidth = 23;
windowDepth = 5;
windowMiddleBarWidth = 3;
windowMiddleBarProtrusion = 1;
windowSecondaryBarWidth = 0.3;
windowSecondaryBarProtrusion = 0.5;

window01Gap = 9;
window1Height = 35;
window12Gap = 25;
window2Height = 78;
window23Gap = 31;
window3Height = 38;
window34Gap = 16;
window4Height = 13;

verticalSmallBarHeight = 1; 
verticalSmallBarProtrusion = 0.5;
verticalThickBarHeight = 2;
verticalThickBarProtrusion = 1;


window2();

module window2() {
    translate([0,0,window2Height/2]) {
        window(window2Height);
        verticalBar(verticalThickBarHeight, verticalThickBarProtrusion);
        for(i = [1, -1]) {
            translate([0,0,(window2Height+verticalThickBarHeight*2)/4*i]) {
                verticalBar(verticalSmallBarHeight, verticalSmallBarProtrusion);
            }
        }
    }
}

module window1() {
    translate([0,0,window1Height/2]) {
        window(window1Height);
        verticalBar(verticalSmallBarHeight, verticalSmallBarProtrusion);
    }
}

module verticalBar(height, depth) {
    translate([0,(windowDepth+depth)/2, 0]) cube([windowWidth, depth, height], center = true);
}

module window(height) {
    cube([windowWidth, windowDepth, height], center = true);
    windowMiddleBar(height);
    windowSecondaryBars(height);
   
}

module windowMiddleBar(height) {
    translate([0,(windowDepth+windowMiddleBarProtrusion)/2, 0]) {
         cube([windowMiddleBarWidth, windowMiddleBarProtrusion, height], center = true);
    }
}

module windowSecondaryBars(height) {
    for(i = [-1, 1]) {
        translate([(windowWidth+windowMiddleBarWidth*2)/4*i, (windowDepth+windowSecondaryBarProtrusion)/2, 0]) {
            windowSecondaryBar(height);
        }
    }
}

module windowSecondaryBar(height) {
    cube([windowSecondaryBarWidth, windowSecondaryBarProtrusion, height], center = true);
    
}


