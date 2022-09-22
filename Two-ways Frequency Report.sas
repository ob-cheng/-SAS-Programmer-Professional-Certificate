libname pg1 "/home/u59754845/EPG1V2/data";

title1 "Categories of Reported Species";

ods graphics on;
ods noproctitle;
title1 "Categories of Reported Species";
title2 "in the Everglades";
proc freq data=pg1.np_species order=freq;
    tables Category / nocum plots=freqplot;
    where Species_ID like "EVER%" and 
          Category ne "Vascular Plant";
run;
title; 


-------
with plot


title1 'Selected Park Types by Region';
ods graphics on;
proc freq data=pg1.np_codelookup order=freq;
    tables Type*Region /  nocol crosslist 
           plots=freqplot(groupby=row scale=grouppercent 
           orient=horizontal);
    where Type in ('National Historic Site', 'National 
                  Monument', 'National Park');
run;
title;
