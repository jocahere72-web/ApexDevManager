
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_D_PREDIOS_CLCLO_CLSFCCION" ("ID_PRDIO_CLCLO_CLSFCCION", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "NMBRE_IMPSTO", "CDGO_PRDIO_CLSFCCION", "CRCTER_INCIAL", "CRCTER_FNAL", "FCHA_INCIAL", "FCHA_FNAL", "NMRO_CRCTER") AS
  select a.id_prdio_clclo_clsfccion
		 , a.cdgo_clnte
		 , b.nmbre_clnte
		 , a.id_impsto
		 , c.nmbre_impsto
		 , a.cdgo_prdio_clsfccion
		 , a.crcter_incial
		 , a.crcter_fnal
		 , a.fcha_incial
		 , a.fcha_fnal
		 , a.nmro_crcter
	from gi_d_predios_clclo_clsfccion a
	join df_s_clientes 	b	on a.cdgo_clnte 	= b.cdgo_clnte
	join df_c_impuestos c 	on a.id_impsto 		= c.id_impsto;

