libname pg1 "/home/u59754845/EPG1V2/data";
libname out "/home/u59754845/EPG1V2/output";

data out.Storm_cat5;
	set pg1.storm_summary;
	WHERE MaxWindMPH >= 156 and StartDate >="01JAN2000"d;
	keep Season Basin Name Type MaxWindMPH;
run;

*note: to help SAS read the date, put quotation mark around the date followed by letter "d"

***********************************************************;
*  LESSON 4, PRACTICE 1                                   *;
*    a) Open the PG1.EU_OCC table and examine the column  *;
*       names and values.                                 *;
*    b) Modify the code to create a temporary table named *;
*       EU_OCC2016 and read PG1.EU_OCC.                   *;
*    c) Complete the WHERE statement to select only the   *;
*       stays that were reported in 2016. Notice that     *;
*       YearMon is a character column and the first four  *;
*       positions represent the year.                     *;
*    d) Complete the FORMAT statement in the DATA step to *;
*       apply the COMMA17. format to the Hotel,           *;
*       ShortStay, and Camp columns.                      *;
*    e) Complete the DROP statement to exclude Geo from   *;
*       the output table.                                 *;
***********************************************************;


data eu_occ2016;
    set pg1.eu_occ;
    where YearMon like "2016%";
    format Hotel ShortStay Camp comma17.;
    drop geo;
run;
