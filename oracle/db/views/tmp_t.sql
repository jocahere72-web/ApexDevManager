
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "TMP_T" ("CDGO_CRTRA", "NMRO_PRCSO_JRDCO", "ID_PRCSOS_JRDCO", "ID_EMBRGOS_CRTRA") AS
  select c.cdgo_crtra
     , a.nmro_prcso_jrdco
     , a.id_prcsos_jrdco
     , c.id_embrgos_crtra
  from cb_g_procesos_juridico a
  join mc_g_embrgos_crt_prc_jrd b
    on b.id_prcsos_jrdco = a.id_prcsos_jrdco
  join mc_g_embargos_cartera c
    on c.id_embrgos_crtra = b.id_embrgos_crtra;

