data _input;

 length interVal $200;

 filename _infile '/opt/sas/lagring/Lev4/it/adventOfCode/aoc2025/dec_02_test.txt';
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

 if len > 1 and half1 = half2 then match = pid;

run;

proc summary data=_output nway missing;
 var match;
 output out=_sum sum=;
run;

/*
44487518100 - too high
44487518055 - correct

Part 2

*/