
  %let tmpHst_1 = slsasc02.aintern.se 7552;
  signon tmpHst_1 user="svc_sas_acc_stins" pass="";

 rsubmit;
 	libname kalle '/opt/sas/lagring/Lev2/it/data';
	%kopiera_krypto_macros;
	%hamtaHemlighet(DATASET);
	%fixaHemlighetLasSkriv;


	%macro laddaHem(inlib=, utlib=, ds=, prefix=, dsOpt=, utOpt=);
		proc upload data=&inlib..&ds.(&dsOpt.) out=&utlib..&prefix.&ds.(&utOpt.);
		run;
	%mend;

	%laddaHem(inlib=s_ba_tgl, utlib=s_ba_tgl, ds=arende, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_ba_tgl, utlib=s_ba_tgl, ds=beslut, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);

	%laddaHem(inlib=s_dm_tgl, utlib=s_dm_tgl, ds=hat_3, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);

 endrsubmit;

  signoff;