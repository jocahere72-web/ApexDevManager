
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_VIGENCIAS" ("VGNCIA") AS
  select vgncia
  from df_s_vigencias
order by vgncia;

