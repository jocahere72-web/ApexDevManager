
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_AJUSTE" ("ID_AJSTE", "CDGO_CLNTE", "NMBRE_IMPSTO", "ID_IMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "ID_SJTO", "IDNTFCCION_SJTO", "DRCCION", "CDGO_TPO_AJSTE", "CDGO_AJSTE_MTVO", "ORGEN", "TPO_AJSTE", "VLOR", "FCHA", "FCHA_FRMTDA", "ID_AJSTE_MTVO", "DSCRPCION_MOTIVO", "NMRO_SLCTUD", "CDGO_AJSTE_ESTDO", "DSCRPCION_ESTADO", "OBSRVCION", "FCHA_DCMNTO_SPRTE", "TPO_DCMNTO_SPRTE", "NMRO_DCMTO_SPRTE", "ID_INSTNCIA_FLJO", "ID_FLJO_TREA") AS
  select a.id_ajste,
        a.cdgo_clnte,
        e.nmbre_impsto,
        a.id_impsto,
        f.nmbre_impsto_sbmpsto,
        a.id_impsto_sbmpsto,
        a.id_sjto_impsto,
        b.id_sjto,
        b.idntfccion_sjto,
        b.drccion,
        a.tpo_ajste cdgo_tpo_ajste,
        c.cdgo_ajste_mtvo,
        case when a.orgen = 'A' then 'Automatico'
             else 'Manual'
        end orgen,
         case when a.tpo_ajste = 'DB' then 'Debito'
              else 'Credito'
        end tpo_ajste,
        a.vlor,
        a.fcha,
        to_char(a.fcha, 'DD/MM/YYYY') fcha_frmtda,
        a.id_ajste_mtvo,
        c.dscrpcion dscrpcion_motivo,
        a.nmro_slctud,
        a.cdgo_ajste_estdo,
        d.dscrpcion dscrpcion_estado,
        a.obsrvcion,
        a.fcha_dcmnto_sprte,
        a.tpo_dcmnto_sprte,
        a.nmro_dcmto_sprte,
        a.id_instncia_fljo,
        a.id_fljo_trea
     from gf_g_ajustes 					a
     join v_si_i_sujetos_impuesto		b on a.id_sjto_impsto		= b.id_sjto_impsto
     join gf_d_ajuste_motivo			c on a.id_ajste_mtvo		= c.id_ajste_mtvo
     join gf_d_ajuste_estado			d on a.cdgo_ajste_estdo 	= d.cdgo_ajste_estdo
     join df_c_impuestos				e on a.id_impsto 			= e.id_impsto
     join df_i_impuestos_subimpuesto 	f on a.id_impsto_sbmpsto 	= f.id_impsto_sbmpsto
;

