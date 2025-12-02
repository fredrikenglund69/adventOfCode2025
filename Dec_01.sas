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

 if dir = 'L' then currVal = currVal - steps;
 else currVal = currVal + steps;

 if prevVal ne 0 and (200 > currVal > 100) or (-200 < currVal < -100) then passwd2 + 1;

 /* handle toggle around 0 */
 if prevVal < 0 and currVal > 0 then passwd2 + 1;
 if prevVal > 0 and currVal < 0 then passwd2 + 1;

 laps = abs(int(steps/100));
 currVal = mod(currVal/100,1) * 100;
 passwd2 = passwd2 + laps;


 if currVal = 0 then do;
	passwd + 1;
	passwd2 + 1;
 end;

 if currVal < 0 then currVal = 100 + currVal;

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
*/