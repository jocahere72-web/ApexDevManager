
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_TTLOS_MC_G_EMBRGS_RES" ("ID_EMBRGOS_CRTRA", "ID_EMBRGOS_RSLCION", "NMRO_ACTO", "FCHA_ACTO", "ID_ESTDOS_CRTRA", "CDGO_ESTDOS_CRTRA", "DSCRPCION_ESTADO_CRTRA", "IDNTFCCION", "VGNCIAS", "VLOR_EMBRGO", "IMPUESTO", "IDNTFCCION_RSPNSBLE", "NMBRE_RSPNSBLE") AS
  select a.id_embrgos_crtra,
           a.id_embrgos_rslcion,
           a.nmro_acto,
           a.fcha_acto,
           a.id_estdos_crtra,
           a.cdgo_estdos_crtra,
           a.dscrpcion_estado_crtra,
           trim(a.idntfccion) as idntfccion,
           a.vgncias,
           --sum((2*b.vlor_cptal)+b.vlor_intres) vlor_embrgo,
           sum(z.vlor_sldo_cptal+z.vlor_intres) vlor_embrgo,
           (select listagg(c.nmbre_impsto,', ') within group(order by c.nmbre_impsto) impuestos
            from (select a.id_embrgos_crtra,a.id_sjto_impsto
                  from mc_g_embargos_cartera_detalle a
                  group by a.id_embrgos_crtra,a.id_sjto_impsto) b
            join v_si_i_sujetos_impuesto c on c.id_sjto_impsto = b.id_sjto_impsto
            where b.id_embrgos_crtra = a.id_embrgos_crtra) as impuesto,
           trim(d.idntfccion) as idntfccion_rspnsble,
           trim(d.nmbre_cmplto) as nmbre_rspnsble
    from v_mc_g_embargos_resolucion    a
    join mc_d_tipos_mdda_ctlar         e on e.id_tpos_mdda_ctlar = a.id_tpos_embrgo
    join mc_g_embargos_cartera_detalle b on b.id_embrgos_crtra = a.id_embrgos_crtra
    --join mc_d_estados_cartera          x on x.id_estdos_crtra = a.id_estdos_crtra
    join mc_g_embrgs_rslcion_rspnsbl   c on c.id_embrgos_rslcion = a.id_embrgos_rslcion
    join v_mc_g_embargos_responsable   d on d.id_embrgos_rspnsble = c.id_embrgos_rspnsble
                                      and d.id_embrgos_crtra = b.id_embrgos_crtra
   join v_gf_g_cartera_x_concepto       z on  z.id_mvmnto_fncro = b.id_mvmnto_fncro
                                          and z.id_impsto = b.id_impsto
                                          and z.id_impsto_sbmpsto = b.id_impsto_sbmpsto
                                          and z.vgncia = b.vgncia
                                          and z.id_prdo = b.id_prdo
                                          and z.id_cncpto = b.id_cncpto
    where a.id_acto is not null
    --and e.cdgo_tpos_mdda_ctlar = 'FNC'
    and a.cdgo_estdos_crtra = 'E'
    group by a.id_embrgos_crtra,
            a.id_embrgos_rslcion,
            a.nmro_acto,
            a.fcha_acto,
            a.id_estdos_crtra,
            a.cdgo_estdos_crtra,
            a.dscrpcion_estado_crtra,
            a.idntfccion,
            a.vgncias,
            d.idntfccion,
            d.nmbre_cmplto
    order by 1;

