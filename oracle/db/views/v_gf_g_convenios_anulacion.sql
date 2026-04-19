
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_CONVENIOS_ANULACION" ("ID_CNVNIO", "ID_CNVNIO_ANLCION", "FCHA", "OBSRVCION", "ID_ACTO", "CDGO_CLNTE", "ACTVO", "DSCRPCION", "NMRO_CNVNIO", "FCHA_APLCCION", "ID_IMPSTO", "ID_SJTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "IDNTFCCION_SJTO", "IDNTFCCION_SJTO_FRMTDA", "NMRO_ACTO", "NMRO_IDNTFCCION_SLCTNTE", "NMBRE_SLCTNTE", "DSCRPCION_CNVNIO_TPO", "ID_CNVNIO_TPO", "CDGO_SJTO_TPO", "ID_MTVO_ANLCN") AS
  select a.id_cnvnio,
			a.id_cnvnio_anlcion,
			a.fcha,
			a.obsrvcion,
			a.id_acto,
			b.cdgo_clnte,
			b.actvo,
			b.dscrpcion,
			c.nmro_cnvnio,
            c.fcha_aplccion,
			d.id_impsto,
			d.id_sjto,
			e.nmbre_impsto,
			f.id_impsto_sbmpsto,
			f.nmbre_impsto_sbmpsto,
			g.idntfccion idntfccion_sjto,
			case when length(g.idntfccion) = 15 then
					pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => g.idntfccion, p_frmto => 'xx-xx-xxxx-xxxx-xxx' , p_crcter_dlmtdor => '-' )
				when length(g.idntfccion) = 25 then
					pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => g.idntfccion, p_frmto => 'xx-xx-xx-xx-xxxx-xxxx-x-xx-xx-xxxx' , p_crcter_dlmtdor => '-' )
			end as idntfccion_sjto_frmtda,
			k.nmro_acto,
			i.idntfccion nmro_idntfccion_slctnte,
			upper(i.prmer_nmbre || ' ' || nvl2(i.sgndo_nmbre, i.sgndo_nmbre || ' ' ,'') || i.prmer_aplldo || ' ' ||nvl2(i.sgndo_aplldo, i.sgndo_aplldo || ' ' ,'')) nmbre_slctnte,
			j.dscrpcion dscrpcion_cnvnio_tpo,
			j.id_cnvnio_tpo,
			j.cdgo_sjto_tpo,
            a.id_mtvo_anlcn
	from gf_g_convenios_anulacion	a
	join gf_d_anulacion_motivo		b on a.id_mtvo_anlcn	= b.id_mtvo_anlcn
	join v_gf_g_convenios			c on a.id_cnvnio 		= c.id_cnvnio
	join si_i_sujetos_impuesto		d on c.id_sjto_impsto	= d.id_sjto_impsto
	join df_c_impuestos				e on d.id_impsto		= e.id_impsto
	join df_i_impuestos_subimpuesto	f on e.id_impsto		= f.id_impsto
                                     and c.id_impsto_sbmpsto = f.id_impsto_sbmpsto
	join si_c_sujetos				g on d.id_sjto			= g.id_sjto
	join pq_g_solicitudes			h on c.id_slctud		= h.id_slctud
	join pq_g_solicitantes			i on h.id_slctud		= i.id_slctud
	join gf_d_convenios_tipo		j on j.id_cnvnio_tpo	= c.id_cnvnio_tpo
left join gn_g_actos				k on a.id_acto			= k.id_acto;

