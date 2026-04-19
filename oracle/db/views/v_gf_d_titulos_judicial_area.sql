
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_D_TITULOS_JUDICIAL_AREA" ("ID_TTLO_JDCIAL_AREA", "CDGO_CLNTE", "ID_AREA", "NMBRE_AREA", "ACTVO", "DSCRPCION_ACTVO") AS
  select a.id_ttlo_jdcial_area,
        b.cdgo_clnte,
        a.id_area,
        b.nmbre_area,
        a.actvo,
        decode (a.actvo, 'S', 'Si','N', 'No') dscrpcion_actvo
   from gf_d_titulos_judicial_area  a
   join df_c_areas                  b on a.id_area = b.id_area;

