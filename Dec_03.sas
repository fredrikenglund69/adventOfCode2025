data _input;

 length batt $200 battno joln 8 jolt $2;

 filename _infile '/opt/sas/lagring/Lev4/it/adventOfCode/aoc2025/dec_03_input.txt';
 infile _infile delimiter='' end=last;

 input batt @@;

 batt = strip(batt);

 battno = _n_;

 do i = 1 to length(batt);
 	do a = i+1 to length(batt);
	 	do a1 = i+a to length(batt);
 			do a2 = i+a1 to length(batt);
 				do a3 = i+a2 to length(batt);
 					do a4 = i+a3 to length(batt);
 						do a5 = i+a4 to length(batt);
 							do a6 = i+a5 to length(batt);
 								do a7 = i+a6 to length(batt);
 									do a8 = i+a7 to length(batt);
 										do a9 = i+a8 to length(batt);
 											do a10 = i+a9 to length(batt);
												jolt = cats(substr(batt,i,1),substr(batt,a,1),substr(batt,a1,1),substr(batt,a2,1),substr(batt,a3,1),substr(batt,a4,1),substr(batt,a5,1),substr(batt,a6,1),substr(batt,a7,1),substr(batt,a8,1),substr(batt,a9,1),substr(batt,a10,1));
												joln = input(jolt,best.);
											end;
										end;
									end;
								end;
							end;
						end;
					end;
				end;
			end;
		end;	
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