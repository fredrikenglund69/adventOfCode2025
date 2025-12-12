 filename _infile '/opt/sas/lagring/Lev4/it/adventOfCode/aoc2025/dec_04_input.txt';

/* find out size of grid */
data _null_;;
 length row $200 a 8.;
 infile _infile delimiter='' end=last;

 input row;
 if _n_ = 1 then do;
 	a = length(row);
	put a=;
	call symput('gridsize',put(a,best.));
 end;
run;

%macro printgrid(grid=grid);
	 /* print grid */
	 do y = 1 to &gridsize.;
	 	do x = 1 to &gridsize.;
		  put &grid{x,y} @;
		end;
		put ' ';
	 end;
	 put ' ';
%mend;


data indata;
 length row $200 i x y currx curry searchx searchy distx disty adotx adoty sqsize 8 part $1;
 array grid{&gridsize.,&gridsize.} $1  ;
 array adot{&gridsize.,&gridsize.} $1  ;

 infile _infile delimiter='';
 retain grid adot;

 input row;

 /* read grid into array */
 do i = 1 to &gridsize.;
	grid{i,_n_} = substr(row,i,1);
	adot{i,_n_} = substr(row,i,1);
 end;


 /* last row read now - go! */
 if _n_ = &gridsize. then do;
 	%printgrid;

	/* loop grid */
	do curry = 1 to &gridsize.;
		do currx = 1 to &gridsize.;
			antal = 0;

			if grid{currx,curry} = '@' then do;

				/* above */
				if curry  > 1 then do;
					if grid{currx,curry-1} = '@' then antal + 1;

					if currx >  1  then do;
						if grid{currx-1,curry-1} = '@' then antal + 1;
					end;
					if currx <  &gridsize.  then do;
						if grid{currx+1,curry-1} = '@' then antal + 1;
					end;
				end;

				/* right */
				if currx < &gridsize. then do;
					if grid{currx+1,curry} = '@' then antal + 1;
				end;

				/* below */
				if curry < &gridsize. then do;
					if grid{currx,curry+1} = '@' then antal + 1;

					if currx >  1  then do;
						if grid{currx-1,curry+1} = '@' then antal + 1;
					end;
					if currx <  &gridsize.  then do;
						if grid{currx+1,curry+1} = '@' then antal + 1;
					end;
				end;

				/* left */
				if currx >  1  then do;
					if grid{currx-1,curry} = '@' then antal + 1;
				end;

				if antal < 4 then do;
					totantal + 1;
					adot(currx,curry) = '#';
				end;

				put currx= curry= antal= totantal=;
			end;
		end;
	end;

	%printgrid(grid=adot);

	cnt=0;
	do y = 1 to &gridsize.;
		do x = 1 to &gridsize.;
		if adot(x,y) = '#' then cnt + 1;;
		end;
	end;

	put cnt=;


 end;

run;