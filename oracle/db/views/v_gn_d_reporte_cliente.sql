
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GN_D_REPORTE_CLIENTE" ("ID_RPRTE_CLNTE", "ID_RPRTE", "CDGO_CLNTE", "ACTVO_RPRTE_CLNTE", "DSCRPCION_ACTVO", "ID_PRCSO", "CDGO_RPRTE_GRPO", "DSCRPCION_RPRTE_GRPO", "NMBRE_RPRTE", "INDCDOR_GNRCO", "DSCRPCION_INDCDOR_GNRCO") AS
  select nvl( b.id_rprte_clnte , 0 ) as id_rprte_clnte,
        a.id_rprte ,
        c.cdgo_clnte ,
        nvl( b.actvo , 'S') as actvo_rprte_clnte,
		decode( nvl( b.actvo , 'S') , 'S' , 'Sí' , 'No' ) as dscrpcion_actvo,
		a.id_prcso,
		a.cdgo_rprte_grpo,
		a.dscrpcion_rprte_grpo,
		a.nmbre_rprte,
		a.indcdor_gnrco,
		a.dscrpcion_indcdor_gnrco
   from v_gn_d_reportes 			a
   left join gn_d_reporte_cliente 	b 	on a.id_rprte 	= b.id_rprte
   join df_s_clientes			    c 	on ( 'S' = a.indcdor_gnrco or ( b.cdgo_clnte = c.cdgo_clnte ))
  where a.actvo = 'S';

