data _input;

 length batt $200 battno joln 8 jolt $2;

 filename _infile '/opt/sas/lagring/Lev4/it/adventOfCode/aoc2025/dec_03_input.txt';
 infile _infile delimiter='' end=last;

 input batt @@;

 batt = strip(batt);

 battno = _n_;

 do i = 1 to length(batt);
 	do a = i+1 to length(batt);
		jolt = cats(substr(batt,i,1),substr(batt,a,1));
		joln = input(jolt,best.);
		output;
	end;
 end;

run;

proc summary data=_input nway missing;
 class battno;
 var joln;
 output out=_max max=jolm;
run;

proc summary data=_max nway missing;
 var jolm;
 output out=_sum sum=;
run;