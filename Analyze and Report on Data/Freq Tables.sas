title "Frequency Report for Basin and Storm Month";

proc freq data=pg1.storm_final order=freq noprint;
	tables StartDate / out=storm_count;
	format StartDate monname.;
run;

