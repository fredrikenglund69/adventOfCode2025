data _input _ranges(keep=row fromn tomn);

 length row msg $500 fromn tomn 8;
 array intFrom{200} $20;
 array intTom{200} $20;
 retain intFrom intTom;

 filename _infile '/opt/sas/lagring/Lev4/it/adventOfCode/aoc2025/dec_05_test.txt';
 infile _infile delimiter='' end=last;

 input row;
 row = strip(row);

 if _n_ = 1 then i = 1;

 if indexc(row,'-') then do;
 	intFrom{i} = scan(row,1,'-');
 	intTom{i}  = scan(row,2,'-');
 	fromn = input(strip(intFrom(i)),15.);
	tomn = input(strip(intTom(i)),15.);
	output _ranges _input;
	i + 1;
 end;
 else do;
	 do a = 1 to i;
	 	fromn = input(strip(intFrom(a)),15.);
		tomn = input(strip(intTom(a)),15.);
		id = input(strip(row),15.);
/*	 	if strip(intFrom(a)) <= strip(row) <= strip(intTom(a)) then do;*/
	 	if fromn <= id <= tomn then do;
			fresh = 1;
			msg = cat(strip(row)," är mellan ",strip(intFrom(a))," och ", strip(intTom(a)));
			put row= msg= fromn= tomn= id=;
		end;
	 end;
 end;

 if last then do;
	 do a = 1 to i;
	 	put intFrom(a);
		put intTom(a);
	 end;
 end;

 output _input;
run;

proc summary data=_input nway missing;
 var fresh;
 output out=_sum sum=;
 run;

proc sql; 
 create table _overlaps as
  select a.row as rowa, a.fromn as fromna, a.tomn as tomna, b.row as rowb, b.fromn as fromnb, b.tomn as tomnb from _ranges a
  left join _ranges b
  on a.fromn <= b.tomn
  and a.tomn >= b.fromn
  ;
run;

data _max;
 set _overlaps;
 if rowa eq rowb then delete;
 frommin = min(fromna,fromnb);
 tommax = max(tomna,tomnb);
 antids = tommax - frommin;
run;

proc summary data=_max nway missing;
 var antids;
 output out=_tots sum=;
run;

 /* 
 920 - too high
 643 -correct


 */