
  %let tmpHst_1 = slsasc02.aintern.se 7552;
  signon tmpHst_1 user="svc_sas_acc_stins" pass="";

 rsubmit;
 	libname kalle '/opt/sas/lagring/Lev2/it/data';
	%kopiera_krypto_macros;
	%hamtaHemlighet(DATASET);
	%fixaHemlighetLasSkriv;


	%macro laddaHem(inlib=, utlib=, ds=, prefix=, dsOpt=, utOpt=);
		proc download data=&inlib..&ds.(&dsOpt.) out=&utlib..&prefix.&ds.(&utOpt.);
		run;
	%mend;

	%laddaHem(inlib=s_od_tgl, utlib=s_od_tgl, ds=diarie, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_od_ago, utlib=s_od_ago, ds=diarie, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_od_fsk, utlib=s_od_fsk, ds=diarie, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_od_liv, utlib=s_od_liv, ds=konst, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);

	%laddaHem(inlib=s_ba_ago, utlib=s_ba_ago, ds=utbet, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_ba_agb, utlib=s_ba_agb, ds=utbet, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_ba_fsk, utlib=s_ba_fsk, ds=arende, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);

	%laddaHem(inlib=s_dm_tgl, utlib=s_dm_tgl, ds=hat_3, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_dm_tgl, utlib=s_dm_tgl, ds=IM_ANALYSRAPPORT_TGL, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_dm_tgl, utlib=s_dm_tgl, ds=IM_MALUPPF_TGL_STINS, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_dm_tgl, utlib=s_dm_tgl, ds=im_nki_tgl, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);

	%laddaHem(inlib=s_dm_ago, utlib=s_dm_ago, ds=IM_ANALYSRAPPORT_AGBO, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_dm_ago, utlib=s_dm_ago, ds=IM_MALUPPF_AGB_STINS, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_dm_ago, utlib=s_dm_ago, ds=im_nki_ago, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);

	%laddaHem(inlib=s_dm_fsk, utlib=s_dm_fsk, ds=utbet, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_dm_fsk, utlib=s_dm_fsk, ds=datum, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);

	%laddaHem(inlib=s_dm_dq, utlib=s_dm_dq, ds=fsk_arende, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_dm_dq, utlib=s_dm_dq, ds=tgl_arende, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_dm_dq, utlib=s_dm_dq, ds=tgl_brev, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_dm_dq, utlib=s_dm_dq, ds=tgl_status, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_dm_dq, utlib=s_dm_dq, ds=tgl_hat3, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_dm_dq, utlib=s_dm_dq, ds=agbo_arutsum, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_dm_dq, utlib=s_dm_dq, ds=agbo_aktu, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_dm_dq, utlib=s_dm_dq, ds=handelse, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_dm_dq, utlib=s_dm_dq, ds=QA0047_LIV_VARDEKONTROLL, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_dm_dq, utlib=s_dm_dq, ds=dq_ref_fsk_utbet, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_dm_dq, utlib=s_dm_dq, ds=DQ_REF_LIV_KONST, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_dm_dq, utlib=s_dm_dq, ds=DQ_REF_LIV_ARENDE, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_dm_dq, utlib=s_dm_dq, ds=DQ_REF_LIV_AKTU, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_dm_dq, utlib=s_dm_dq, ds=DQ_REF_AMF_ARENDE, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_dm_dq, utlib=s_dm_dq, ds=DQ_REF_LIV_RESERV, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_dm_dq, utlib=s_dm_dq, ds=DQ_REF_LIV_UTBET, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);
	%laddaHem(inlib=s_dm_dq, utlib=s_dm_dq, ds=DQ_REF_LIV_ERSATT, prefix=, dsOpt=&hemlighet_las., utOpt=&hemlighet_skriv.);

 endrsubmit;

  signoff;