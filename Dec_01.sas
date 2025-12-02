data dd;

 length rot $200;
 retain currVal prevVal passwd passwd2;

 filename _infile '/opt/sas/lagring/Lev4/it/adventOfCode/aoc2025/dec_01_input.txt';
 infile _infile delimiter='' end=last;

 input rot;

 if _n_ = 1 then do;
 	currVal = 50;
 end;

 prevVal = currVal;

 dir = substr(rot,1,1);
 steps = input(substr(rot,2),8.);

 *put dir= steps=;

 do i = 1 to steps;
	 if dir = 'L' then currVal = currVal - 1;
	 else currVal = currVal + 1;

	 if currVal = 100 then currVal = 0;
	 if currVal < 0 then currVal = 99;
	 *put currVal=;

	 if currVal = 0 then passwd2 + 1;
 end;

 if currVal = 0 then do;
	passwd + 1;
 end;

 if last then put passwd= passwd2=;
run;
 
/*
5738 - too high
1169 - too low 
1172 - correct


part 2
1308 - too low
6780 - too low
7825 - nc
6985 - nc
7100 - nc
6932 - 
*/