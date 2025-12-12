%*let _user = svc_sas_acc_stins;
%*let _pass = ;
%let _user = kfen01;
%let _pass = {SAS002}7A909E5702F321150D8D89A84D04836F5A9D4D1629255575;

  %let tmpHst_1 = slsasc02.aintern.se 7552;
  signon tmpHst_1 user="&_user" pass="&_pass";

 rsubmit;
 	libname kalle '/opt/sas/lagring/Lev2/it/data/fen';
	%kopiera_krypto_macros;
	%hamtaHemlighet(DATASET);
	%fixaHemlighetLasSkriv;


	%macro laddaHem(inlib=, utlib=, ds=, prefix=, dsOpt=, utOpt=);
		proc upload data=&inlib..&ds.(&dsOpt.) out=&utlib..&prefix.&ds.(&utOpt.);
		run;
	%mend;

	%macro laddaHemLib(inlib=, utlib=);
		proc upload inlib=&inlib. outlib=&utlib.;
		run;
	%mend;

	%*laddaHem(inlib=s_dm_dq, utlib=s_dm_dq, ds=DQ_REF_LIV_ERSATT, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);

	%laddaHemLib(inlib=s_styr, utlib=kalle);

 endrsubmit;

  signoff;