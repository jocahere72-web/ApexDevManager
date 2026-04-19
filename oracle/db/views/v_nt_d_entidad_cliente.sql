
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_NT_D_ENTIDAD_CLIENTE" ("ID_ENTDAD_CLNTE", "CDGO_CLNTE", "CDGO_ENTDAD", "DSCRPCION") AS
  select ec.id_entdad_clnte,
         ec.cdgo_clnte,
         ec.cdgo_entdad,
         e.dscrpcion
  from nt_d_entidad_cliente ec
  inner join nt_d_entidad e on ec.cdgo_entdad = e.cdgo_entdad
  order by 3;

