/*Open the pg1.storm_range table and examine the columns. Notice that there are four wind measurements for each storm.
Create a new column named WindAvg that is the mean of wind1, wind2, wind3, and wind4.
Create a new column WindRange that is the range of wind1, wind2, wind3, wind4.*/

Run the program and view the data. 

data storm_windavg;
    set pg1.storm_range;
    WindAvg=mean(wind1, wind2, wind3, wind4);
    WindRange=range(of wind1-wind4);
run;

*Note: you can use the shorthand notation OF col1 - colnto list a range of columns when the columns have the same name and end in a consecutive number.
