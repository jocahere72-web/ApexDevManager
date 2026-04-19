
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_DESTINOS_IGAC" ("CDGO_DSTNO_IGAC", "NMBRE_DSTNO_IGAC") AS
  select cdgo_dstno_igac,
       nmbre_dstno_igac
  from df_s_destinos_igac
order by nmbre_dstno_igac;

