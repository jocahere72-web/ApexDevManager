
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SI_G_SOLICITANTES" ("CDGO_IDNTFCCION_TPO", "IDNTFCCION", "PRMER_NMBRE", "SGNDO_NMBRE", "PRMER_APLLDO", "SGNDO_APLLDO", "ID_PAIS_NTFCCION", "ID_DPRTMNTO_NTFCCION", "ID_MNCPIO_NTFCCION", "DRCCION_NTFCCION", "EMAIL", "TLFNO", "CLLAR") AS
  select b.cdgo_idntfccion_tpo
         , b.idntfccion
         , b.prmer_nmbre
         , b.sgndo_nmbre
         , b.prmer_aplldo
         , b.sgndo_aplldo
         , nvl(case when b.id_pais_ntfccion is null then
                     b.id_pais
                else b.id_pais_ntfccion
           end,c.id_pais) as id_pais_ntfccion
         , nvl(case when b.id_dprtmnto_ntfccion is null then
                     b.id_dprtmnto
                else b.id_dprtmnto_ntfccion
           end, c.id_dprtmnto) as id_dprtmnto_ntfccion
         , nvl(case when b.id_mncpio_ntfccion is null then
                     b.id_mncpio
                else b.id_mncpio_ntfccion
           end, c.id_mncpio) as id_mncpio_ntfccion
         , b.drccion_ntfccion
         , b.email
         , b.tlfno
         , b.cllar
      from v_sg_g_usuarios a
      join si_c_terceros   b on b.id_trcro   = a.id_trcro
      join df_s_clientes   c on a.cdgo_clnte = c.cdgo_clnte;

