%let noDig = 12;

data _input;

 length batt $200 digit curr_digit 8 jolt $&noDig.;

 filename _infile '/opt/sas/lagring/Lev4/it/adventOfCode/aoc2025/dec_03_test.txt';
 infile _infile delimiter='' end=last;

 input batt;

 maxpos=1;
 jolt='';
 len = length(strip(batt));
 max = 0;

 i = 1;
 found = 0;

 put batt=;

 do until (found);
 	curr_digit = input(substr(batt,i,1),best.);
	max = curr_digit;
	maxpos = i;

	put curr_digit= i=;

	do a = i+1 to (len -&noDig. + 1);
	 	digit = input(substr(batt,a,1),best.);
		put digit= a= max=;

		if digit > max  then do;
			max = digit;
			maxpos = a;
		end;

	end;

	put max= maxpos=;

	if max > curr_digit then do;
		jolt=cats(jolt,put(max,best.)); 
		max = 0;
		i = maxpos + 1;
	end;
	else do;
		if (len - maxpos) + 1 < &noDig. then do;
			jolt=cats(jolt,substr(batt,maxpos)); 
		end;
		else jolt=cats(jolt,curr_digit); 
		i + 1;
	end;


	if length(jolt) >= &noDig. then found = 1;

	put jolt= found=;

 end;

run;
