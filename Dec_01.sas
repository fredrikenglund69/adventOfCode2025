data dd;
 
 currVal = 50;
 passwd = 0;
 dial = 100;

 rot = 'L152';

 step = input(substr(rot,2),8.);
 if step > dial then do;
    noorot = int(step/dial);
    step = step - dial*noorot;
 end;

 oldCurrVal = currVal;

 if upcase(substr(rot,1,1)) = 'L' then newVal = currVal - step;
 if upcase(substr(rot,1,1)) = 'R' then newVal = currVal + step;

 if newVal >= dial then currVal = newVal - dial;
 else if newVal < 0 then currVal = dial + newVal;
 else currVal = NewVal;

 if currVal = 0 then passwd + 1;

 
run;
 
 