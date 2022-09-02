data cars_update;
    set sashelp.cars;
	keep Make Model MSRP Invoice AvgMPG;
	AvgMPG=mean(MPG_Highway, MPG_City);
	label MSRP="Manufacturer Suggested Retail Price"
          AvgMPG="Average Miles per Gallon"
          Invoice="Invoice Price";
run;

proc means data=cars_update min mean max;
    var MSRP Invoice;
run;

proc print data=cars_update label;
    var Make Model MSRP Invoice AvgMPG;
run;
