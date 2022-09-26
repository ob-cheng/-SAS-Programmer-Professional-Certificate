libname pg1 "/home/u59754845/EPG1V2/data";

%let outpath=/home/u59754845/EPG1V2/output;

proc export data=pg1.storm_final 
  outfile="&outpath/storm_finals.csv";
run;
