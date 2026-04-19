
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_CONVENIOS_FINALIZACION" ("CDGO_CLNTE", "ID_CNVNIO", "ID_CNVNIO_FNLZCION", "FCHA", "OBSRVCION", "ID_ACTO", "NMRO_CNVNIO", "FCHA_APLCCION", "ID_SJTO", "ID_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "IDNTFCCION_SJTO", "IDNTFCCION_SJTO_FRMTDA", "NMRO_ACTO", "NMRO_IDNTFCCION_SLCTNTE", "NMBRE_SLCTNTE", "DSCRPCION_CNVNIO_TPO", "ID_CNVNIO_TPO", "CDGO_SJTO_TPO") AS
  select   b.cdgo_clnte,
            a.id_cnvnio,
			a.id_cnvnio_fnlzcion,
			a.fcha,
			a.obsrvcion,
			a.id_acto,
			b.nmro_cnvnio,
            b.fcha_aplccion,
			c.id_sjto,
			b.id_impsto,
			b.nmbre_impsto,
			b.id_impsto_sbmpsto,
			b.nmbre_impsto_sbmpsto,
			d.idntfccion idntfccion_sjto,
			case when length(d.idntfccion) = 15 then
					pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => d.idntfccion, p_frmto => 'xx-xx-xxxx-xxxx-xxx' , p_crcter_dlmtdor => '-' )
				when length(d.idntfccion) = 25 then
					pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => d.idntfccion, p_frmto => 'xx-xx-xx-xx-xxxx-xxxx-x-xx-xx-xxxx' , p_crcter_dlmtdor => '-' )
			end as idntfccion_sjto_frmtda,
			h.nmro_acto,
			f.idntfccion nmro_idntfccion_slctnte,
			upper(f.prmer_nmbre || ' ' || nvl2(f.sgndo_nmbre, f.sgndo_nmbre || ' ' ,'') || f.prmer_aplldo || ' ' ||nvl2(f.sgndo_aplldo, f.sgndo_aplldo || ' ' ,'')) nmbre_slctnte,
			g.dscrpcion dscrpcion_cnvnio_tpo,
			g.id_cnvnio_tpo,
			g.cdgo_sjto_tpo
	from gf_g_convenios_finalizacion	a
	join v_gf_g_convenios			b on a.id_cnvnio 		= b.id_cnvnio
	join si_i_sujetos_impuesto		c on b.id_sjto_impsto	= c.id_sjto_impsto
	join si_c_sujetos				d on c.id_sjto			= d.id_sjto
	join pq_g_solicitudes			e on b.id_slctud		= e.id_slctud
	join pq_g_solicitantes			f on e.id_slctud		= f.id_slctud
	join gf_d_convenios_tipo		g on g.id_cnvnio_tpo	= b.id_cnvnio_tpo
	left join gn_g_actos			h on a.id_acto			= h.id_acto;

