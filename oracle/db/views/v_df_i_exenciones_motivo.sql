
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_I_EXENCIONES_MOTIVO" ("ID_EXNCION_MTVO", "ID_EXNCION", "NMTCNCO", "MTVO", "USER_DGTA", "FCHA_DGTA", "USER_MDFCA", "FCHA_MDFCA", "NMRO_DCRTO", "DSCRPCION_DCRTO", "OBSRVCION_DCRTO") AS
  (
select    a.id_exncion_mtvo
		, a.id_exncion
		, a.nmtcnco
		, a.mtvo
		, a.user_dgta
		, a.fcha_dgta
		, a.user_mdfca
		, a.fcha_mdfca
		, b.nmro_dcrto
		, b.dscrpcion_dcrto
		, b.obsrvcion			obsrvcion_dcrto
from df_i_exenciones_motivo a
		join v_df_i_exenciones b on a.id_exncion = b.id_exncion );

