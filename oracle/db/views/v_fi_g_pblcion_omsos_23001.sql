
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_FI_G_PBLCION_OMSOS_23001" ("CDGO_CLNTE", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "IDNTFCCION_SJTO", "VGNCIA", "ID_PRDO", "ID_DCLRCION_VGNCIA_FRMLRIO", "ID_DCLRCION", "ID_DCLRCN_TPO", "CDGO_PRDCDAD", "ID_SJTO_TPO", "TPO_PRSNA", "CDGO_IDNTFCCION_TPO", "ID_ACTVDAD_ECNMCA", "FCHA_MXMA_PRSNTCION", "ANIO_LMTE_DCLRCION") AS
  with declaraciones_placa as
 (select a.id_sjto_impsto,
         LISTAGG(a.vgncia, ', ') WITHIN GROUP(ORDER BY a.vgncia) vgncias_plca
    from temp_t_canditatos_omisos a
   where a.nmro_cnsctvo_plca is not null
   group by a.id_sjto_impsto)

select I.cdgo_clnte,
       i.id_impsto,
       i.id_impsto || 2 ID_IMPSTO_SBMPSTO,
       i.id_sjto_impsto,
       i.idntfccion_sjto,
       t.vgncia,
       t.id_prdo,
       t.id_dclrcion_vgncia_frmlrio,
       null ID_DCLRCION,
       t.id_dclrcn_tpo,
       'ANU' CDGO_PRDCDAD,
       p.id_sjto_tpo,
       p.tpo_prsna,
       p.cdgo_idntfccion_tpo,
       p.id_actvdad_ecnmca,
       trunc(pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(p_id_dclrcion_vgncia_frmlrio => t.id_dclrcion_vgncia_frmlrio,
                                                            p_idntfccion                 => i.idntfccion_sjto,
                                                            p_id_sjto_tpo                => p.id_sjto_tpo)) fcha_mxma_prsntcion,
                                                            --Valida los anios que deben ser cumplidos para poder aplicar a fiscalización
       floor(months_between(trunc(systimestamp),
                            trunc(pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(p_id_dclrcion_vgncia_frmlrio => t.id_dclrcion_vgncia_frmlrio,
                                                                                 p_idntfccion                 => i.idntfccion_sjto,
                                                                                 p_id_sjto_tpo                => p.id_sjto_tpo))) / 12) anio_lmte_dclrcion
  from temp_t_canditatos_omisos t
  join v_si_i_sujetos_impuesto i
    on t.id_sjto_impsto = i.id_sjto_impsto
  join si_i_personas p
    on p.id_sjto_impsto = i.id_sjto_impsto
  left join declaraciones_placa b
    on b.id_sjto_impsto = i.id_sjto_impsto
 where t.nmro_cnsctvo is null
   and i.id_sjto_impsto not in (2917119, 3182093, 2959366)
   and not exists(select k.id_sjto_impsto
                from fi_g_candidatos k
                join fi_g_candidatos_vigencia n on n.id_cnddto = k.id_cnddto
                where k.id_sjto_impsto  =   i.id_sjto_impsto
                and n.vgncia = t.vgncia
                and n.id_prdo = t.id_prdo
                and k.id_prgrma = 1 -- Programa de omisos
                )
--and i.idntfccion_sjto like '%901053934%'
-- order by i.idntfccion_sjto
;

