
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MC_G_EMBARGOS_CARTERA" ("ID_EMBRGOS_CRTRA", "CDGO_CLNTE", "CDGO_CRTRA", "ID_SJTO", "IDNTFCCION", "FCHA_INGRSO", "ID_ESTDOS_CRTRA", "CDGO_ESTDOS_CRTRA", "DSCRPCION_ESTADO_CRTRA", "ID_TPOS_EMBRGO", "DSCRPCION_TIPO_EMBARGO", "VLOR_MDDA_CTLAR", "ID_INSTNCIA_FLJO", "VGNCIAS", "ID_FLJO_TREA", "ID_FNCNRIO", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "ID_PRCSOS_JRDCO", "NMRO_PRCSO_JRDCO") AS
  select  a.id_embrgos_crtra,
        a.cdgo_clnte,
        a.cdgo_crtra,
        f.id_sjto,
        f.idntfccion,
        a.fcha_ingrso,
        a.id_estdos_crtra,
        d.cdgo_estdos_crtra,
        d.dscrpcion            as dscrpcion_estado_crtra,
        a.id_tpos_mdda_ctlar   as id_tpos_embrgo,
        c.dscrpcion            as dscrpcion_tipo_embargo,
        a.vlor_mdda_ctlar,
        a.id_instncia_fljo,
        b.vgncias,
        d.id_fljo_trea,
        g.id_fncnrio,
        b.id_impsto,
        b.id_impsto_sbmpsto,
        b.id_sjto_impsto,
        x.id_prcsos_jrdco,
        y.nmro_prcso_jrdco
from mc_g_embargos_cartera   a
join (with w_mc_g_embargos_cartera_detalle as (
        select
            a.id_embrgos_crtra,
            a.vgncia,
            a.id_sjto_impsto,
            a.id_impsto,
            a.id_impsto_sbmpsto
        from
            mc_g_embargos_cartera_detalle a
        group by
            a.id_embrgos_crtra,
            a.vgncia,
            a.id_sjto_impsto,
            a.id_impsto,
            a.id_impsto_sbmpsto
    )
    select listagg(distinct a.VGNCIA, ',') within group(order by a.vgncia) as vgncias,
           a.id_embrgos_crtra,
           a.id_impsto,
           a.id_impsto_sbmpsto,
           a.id_sjto_impsto
    from w_mc_g_embargos_cartera_detalle a
    group by a.id_embrgos_crtra,
             a.id_impsto,
             a.id_impsto_sbmpsto,
             a.id_sjto_impsto
) b on a.id_embrgos_crtra = b.id_embrgos_crtra
join mc_d_tipos_mdda_ctlar   c on a.id_tpos_mdda_ctlar = c.id_tpos_mdda_ctlar
join mc_d_estados_cartera    d on a.id_estdos_crtra = d.id_estdos_crtra
join mc_g_embargos_sjto      e on a.id_embrgos_crtra = e.id_embrgos_crtra
join si_c_sujetos            f on e.id_sjto = f.id_sjto
join mc_g_lotes_mdda_ctlar   g on g.id_lte_mdda_ctlar = a.id_lte_mdda_ctlar
left join mc_g_embrgos_crt_prc_jrd x on x.id_embrgos_crtra = a.id_embrgos_crtra
left join cb_g_procesos_juridico y on y.id_prcsos_jrdco = x.id_prcsos_jrdco;

