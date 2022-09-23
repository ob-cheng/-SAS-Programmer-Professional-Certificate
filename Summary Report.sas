title "Weather Statistics by Year and Park";

ods noproctitle;

proc means data=pg1.np_westweather mean min max maxdec=2;
var Precip Snow TempMin TempMax;
class Year Name;
run;

title;
