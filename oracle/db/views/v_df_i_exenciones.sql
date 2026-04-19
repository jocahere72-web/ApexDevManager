
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_I_EXENCIONES" ("ID_EXNCION", "CDGO_CLNTE", "ID_DCRTO", "NMRO_DCRTO", "DSCRPCION_DCRTO", "NMTCNCO", "OBSRVCION", "FCHA_INCIO", "FCHA_FIN", "USER_DGTA", "FCHA_DGTA", "USER_MDFCA", "FCHA_MDFCA") AS
  (
select  a.id_exncion
       , a.cdgo_clnte
       , a.id_dcrto
	   , b.nmro_dcrto
       , b.dscrpcion  		dscrpcion_dcrto
       , a.nmtcnco
       , a.obsrvcion
       , a.fcha_incio
       , a.fcha_fin
       , a.user_dgta
       , a.fcha_dgta
       , a.user_mdfca
       , a.fcha_mdfca
from df_i_exenciones a
    join 		v_df_c_decretos b 	on 	a.id_dcrto 		= b.id_dcrto);

