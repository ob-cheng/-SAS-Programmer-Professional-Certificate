***********************************************************;
*  Exporting Results to PDF                               *;
***********************************************************;
*  Syntax                                                 *;
*                                                         *;
*    ODS PDF FILE="filename.xlsx" STYLE=style             *;
*            STARTPAGE=NO PDFTOC=1;                       *;
*    ODS PROCLABEL "label";                               *;
*        /* SAS code that produces output */              *;
*    ODS PDF CLOSE;                                       *;
***********************************************************;

***********************************************************;
*  Demo                                                   *;
*    1) Run the program and open the PDF file to examine  *;
*       the results. Notice that bookmarks are created,   *;
*       and they are linked to each procedure's output.   *;
*    2) Add the STARTPAGE=NO option to eliminate page     *;
*       breaks between procedures. Add the STYLE=JOURNAL  *;
*       option.                                           *;
*    3) To customize the PDF bookmarks, add the PDFTOC=1  *;
*       option to ensure that bookmarks are expanded only *;
*       one level when the PDF is opened. To customize    *;
*       the bookmark labels, add the ODS PROCLABEL        *;
*       statement before each PROC with custom text. Run  *;
*       the program and open the PDF file.                *;
***********************************************************;

ods pdf file="&outpath/wind.pdf";
ods noproctitle;

title "Wind Statistics by Basin";
proc means data=pg1.storm_final min mean median max maxdec=0;
    class BasinName;
    var MaxWindMPH;
run;

title "Distribution of Maximum Wind";
proc sgplot data=pg1.storm_final;
    histogram MaxWindMPH;
    density MaxWindMPH;
run; 
title;  

ods proctitle;
ods pdf close;


----------------

ods excel file="&outpath/StormStats.xlsx"
    style=snow
    options(sheet_name='South Pacific Summary');
ods noproctitle;

proc means data=pg1.storm_detail maxdec=0 median 
           max;
    class Season;
    var Wind;
    where Basin='SP' and Season in 
         (2014,2015,2016);
run;

ods excel options(sheet_name='Detail');

proc print data=pg1.storm_detail noobs;
    where Basin='SP' and Season in 
         (2014,2015,2016);
    by Season;
run;

ods excel close;
ods proctitle;
