libname pg1 "/home/u59754845/EPG1V2/data";
libname out "/home/u59754845/EPG1V2/output";

data out.Storm_cat5;
	set pg1.storm_summary;
	WHERE MaxWindMPH >= 156 and StartDate >="01JAN2000"d;
	keep Season Basin Name Type MaxWindMPH;
run;

*note: to help SAS read the date, put quotation mark around the date followed by letter "d"
