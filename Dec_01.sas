data dd;

 length rot $200;
 retain currVal oldCurrVal;

 filename _infile '/opt/sas/lagring/Lev4/it/adventOfCode/aoc2025/dec_01_test.txt';
 infile _infile delimiter='';

 input rot;

dial = 100;

 if _n_ = 1 then do;
    currVal = 50;
    passwd = 0;
 end;
 

 /* remove multiple rotaions and keep only number of steps within the dial */
 partOfDial = mod(input(substr(rot,2),8.)/dial,1);
 step = dial * partOfDial;

 oldCurrVal = currVal;

 if upcase(substr(rot,1,1)) = 'L' then newVal = currVal + (dial - step); /* -10 is the same as +90 for dial = 100 */
 if upcase(substr(rot,1,1)) = 'R' then newVal = currVal + step;

 if newVal >= dial then currVal = newVal - dial;
 else if newVal < 0 then currVal = dial + newVal;
 else currVal = NewVal;

 if currVal = 0 then passwd + 1;


run;
 
 