data _input;

 length interVal $200;

 filename _infile '/opt/sas/lagring/Lev4/it/adventOfCode/aoc2025/dec_02_input.txt';
 infile _infile delimiter=',' end=last;

 input interVal @@;

 _start = input(scan(interVal,1,'-'),best.);
 _stop  = input(scan(interVal,2,'-'),best.);

 do i = _start to _stop;
 	pid = i;
	output;
 end;

run;

proc sort data=_input nodupkey;
 by pid;
run;

data _output;
 set _input;
 length pidC $200 half1 half2 $100;

 pidC = strip(put(pid,best.));
 len = length(pidC);
 halflen = int(len/2);
 half1 = substr(pidC,1,halflen);
 half2 = substr(pidC,halflen+1);

 do i = 1 to halflen;
 	matchm = 0;
 	part = substr(pidC,1,i);
	rest = substr(pidC,i+1);
	comp = substr(pidC,i+1,i);
	put pidC= part= rest= comp=;
	if part = comp then do;
		/* check if rest of pidC is repeating parts */
		do a = i+1+i to len by length(part);
			chkpart = substr(pidC,a,length(part));
			if chkpart = part then matchm = 1;
			else do;
				matchm = 0;
				leave;
			end;
			put a= chkpart=;
		end;
		put matchm=;
	end;
	if matchm = 1 then leave;
 end;

 if len > 1 and half1 = half2 then match = pid;
 if len > 1 and matchm = 1 then match2 = pid;
 if match ne . then match2 = match;

run;

proc summary data=_output nway missing;
 var match match2;
 output out=_sum sum=;
run;

/*
44487518100 - too high
44487518055 - correct

Part 2

*/