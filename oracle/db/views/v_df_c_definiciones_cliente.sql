
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_C_DEFINICIONES_CLIENTE" ("ID_DFNCION_CLNTE", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_DFNCION_CLNTE_CTGRIA", "CDGO_DFNCION_CLNTE_CTGRIA", "DSCRPCION_DFNCION_CLNTE_CTGRIA", "CDGO_DFNCION_CLNTE", "DSCRPCION_DFNCION_CLNTE", "FRMTO", "VLOR", "DSCRPCION_FRMTO") AS
  select a.id_dfncion_clnte
	  , a.cdgo_clnte
	  , b.nmbre_clnte
	  , a.id_dfncion_clnte_ctgria
	  , c.cdgo_dfncion_clnte_ctgria
	  , c.dscrpcion_dfncion_clnte_ctgria
	  , a.cdgo_dfncion_clnte
	  , a.dscrpcion_dfncion_clnte
	  , a.frmto
	  , a.vlor
      , e.dscrpcion_dto_tpo as dscrpcion_frmto
  from df_c_definiciones_cliente 		a
  join df_s_clientes 					b	on a.cdgo_clnte 				= b.cdgo_clnte
  join df_c_definiciones_clnte_ctgria	c	on a.id_dfncion_clnte_ctgria 	= c.id_dfncion_clnte_ctgria
  join et_d_datos_tipo                  e   on a.frmto                      = e.cdgo_dto_tpo;

