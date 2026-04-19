
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_S_CAJAS_BANCO" ("ID_CJA_BNCO", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_BNCO", "NMBRE_BNCO", "ID_BNCO_CNTA", "NMRO_CNTA") AS
  select  a.id_cja_bnco
	  , a.cdgo_clnte
	  , b.nmbre_clnte
	  , a.id_bnco
	  , c.nmbre_bnco
	  , a.id_bnco_cnta
	  , d.nmro_cnta
from	df_s_cajas_banco	a
join	df_s_clientes		b	on	b.cdgo_clnte 	= 	a.cdgo_clnte
join	df_c_bancos			c	on	c.id_bnco		=	a.id_bnco
join	df_c_bancos_cuenta	d	on	d.id_bnco_cnta	=	a.id_bnco_cnta
								and d.id_bnco		=	c.id_bnco;

