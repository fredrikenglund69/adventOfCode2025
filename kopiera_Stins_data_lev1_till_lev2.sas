
  %let tmpHst_1 = slsasc02.aintern.se 7552;
  signon tmpHst_1 user="kfen01" pass="{SAS002}7A909E5702F321150D8D89A84D04836F5A9D4D1629255575";

 rsubmit;
 	libname kalle '/opt/sas/lagring/Lev2/it/data';
	%kopiera_krypto_macros;
	%hamtaHemlighet(DATASET);
	%fixaHemlighetLasSkriv;


	%macro laddaHem(inlib=, utlib=, ds=, prefix=, dsOpt=);
		proc download data=&inlib..&ds(&dsOpt) out=&utlib..&prefix.&ds;
		run;
	%mend;

	%laddaHem(inlib=s_od_tgl, utlib=itlag, ds=diarie, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_od_ago, utlib=itlag, ds=diarie, prefix=_fen2, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_od_fsk, utlib=itlag, ds=diarie, prefix=_fen3, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_od_liv, utlib=itlag, ds=konst, prefix=_fen1, dsOpt=&hemlighet_las.);

	%laddaHem(inlib=s_ba_ago, utlib=itlag, ds=utbet, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_ba_agb, utlib=itlag, ds=utbet, prefix=_fen2, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_ba_fsk, utlib=itlag, ds=arende, prefix=_fen1, dsOpt=&hemlighet_las.);

	%laddaHem(inlib=s_dm_tgl, utlib=itlag, ds=hat_3, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_dm_tgl, utlib=itlag, ds=IM_ANALYSRAPPORT_TGL, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_dm_tgl, utlib=itlag, ds=IM_MALUPPF_TGL_STINS, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_dm_tgl, utlib=itlag, ds=im_nki_tgl, prefix=_fen1, dsOpt=&hemlighet_las.);

	%laddaHem(inlib=s_dm_ago, utlib=itlag, ds=IM_ANALYSRAPPORT_AGBO, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_dm_ago, utlib=itlag, ds=IM_MALUPPF_AGB_STINS, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_dm_ago, utlib=itlag, ds=im_nki_ago, prefix=_fen1, dsOpt=&hemlighet_las.);

	%laddaHem(inlib=s_dm_fsk, utlib=itlag, ds=utbet, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_dm_fsk, utlib=itlag, ds=datum, prefix=_fen1, dsOpt=&hemlighet_las.);

	%laddaHem(inlib=s_dm_dq, utlib=itlag, ds=fsk_arende, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_dm_dq, utlib=itlag, ds=tgl_arende, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_dm_dq, utlib=itlag, ds=tgl_brev, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_dm_dq, utlib=itlag, ds=tgl_status, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_dm_dq, utlib=itlag, ds=tgl_hat3, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_dm_dq, utlib=itlag, ds=agbo_arutsum, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_dm_dq, utlib=itlag, ds=agbo_aktu, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_dm_dq, utlib=itlag, ds=handelse, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_dm_dq, utlib=itlag, ds=QA0047_LIV_VARDEKONTROLL, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_dm_dq, utlib=itlag, ds=dq_ref_fsk_utbet, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_dm_dq, utlib=itlag, ds=DQ_REF_LIV_KONST, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_dm_dq, utlib=itlag, ds=DQ_REF_LIV_ARENDE, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_dm_dq, utlib=itlag, ds=DQ_REF_LIV_AKTU, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_dm_dq, utlib=itlag, ds=DQ_REF_AMF_ARENDE, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_dm_dq, utlib=itlag, ds=DQ_REF_LIV_RESERV, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_dm_dq, utlib=itlag, ds=DQ_REF_LIV_UTBET, prefix=_fen1, dsOpt=&hemlighet_las.);
	%laddaHem(inlib=s_dm_dq, utlib=itlag, ds=DQ_REF_LIV_ERSATT, prefix=_fen1, dsOpt=&hemlighet_las.);

	%laddaHem(inlib=s_dm_dq, utlib=itlag, ds=DQ_REF_LIV_ERSATT, prefix=_fen1, dsOpt=&hemlighet_las.);

 endrsubmit;

  signoff;