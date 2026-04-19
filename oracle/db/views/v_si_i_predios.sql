
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SI_I_PREDIOS" ("ID_PRDIO", "ID_SJTO_IMPSTO", "ID_IMPSTO", "ID_PRDIO_DSTNO", "DSCRPCION_PRDO_DSTNO", "NMTCNCO", "CDGO_ESTRTO", "DSCRPCION_ESTRTO", "CDGO_DSTNO_IGAC", "NMBRE_DSTNO_IGAC", "CDGO_PRDIO_CLSFCCION", "DSCRPCION_PRDIO_CLSFCCION", "ID_PRDIO_USO_SLO", "DSCRPCION_USO_SUELO", "AVLUO_CTSTRAL", "AVLUO_CMRCIAL", "AREA_TRRNO", "AREA_CNSTRDA", "AREA_GRVBLE", "MTRCLA_INMBLRIA", "INDCDOR_PRDIO_MNCPIO", "DSCRPCION_INDCDOR_PRDIO_MNCPIO", "ID_ENTDAD", "NMBRE_ENTDAD", "ID_BRRIO", "NMBRE_BRRIO", "BSE_GRVBLE", "DSTNCIA", "LTTUD", "LNGTUD", "DSCRPCION_TPO_PRDIO", "AVLUO_TRRNO", "AVLUO_CNSTRCCION", "DSCRPCION_PRO_INDVSO", "USO_CNSTRCCION", "DSCRPCION_USO_CNSTRCCION", "VGNCIA_ACTLZDA") AS
  select a.id_prdio,
       a.id_sjto_impsto,
       b.id_impsto,
       a.id_prdio_dstno,
       c.dscrpcion dscrpcion_prdo_dstno,
       c.nmtcnco,
       a.cdgo_estrto,
       d.dscrpcion_estrto dscrpcion_estrto,
       a.cdgo_dstno_igac,
       e.nmbre_dstno_igac,
       a.cdgo_prdio_clsfccion,
       f.dscrpcion_prdio_clsfccion,
       a.id_prdio_uso_slo,
       g.dscrpcion dscrpcion_uso_suelo,
       a.avluo_ctstral,
       a.avluo_cmrcial,
       a.area_trrno,
       a.area_cnstrda,
       a.area_grvble,
       a.mtrcla_inmblria,
       a.indcdor_prdio_mncpio,
       decode(a.indcdor_prdio_mncpio, 'S', 'Sí', 'N', 'No') dscrpcion_indcdor_prdio_mncpio,
       a.id_entdad,
       case
         when a.id_entdad is null then
          null
         else
          h.nmbre_entdad || '-' || h.idntfccion
       end as nmbre_entdad,
       a.id_brrio,
       i.nmbre_brrio,
       a.bse_grvble,
       a.dstncia,
       a.lttud,
       a.lngtud,
       j.dscrpcion dscrpcion_tpo_prdio,
       a.avluo_trrno,
       a.avluo_cnstrccion,
       decode(a.pro_indvso, 0, 'No', 1, 'Sí') dscrpcion_pro_indvso,
       a.uso_cnstrccion,
       k.dscrpcion dscrpcion_uso_cnstrccion,
       a.vgncia_actlzda
  from si_i_predios a
  join si_i_sujetos_impuesto b
    on a.id_sjto_impsto = b.id_sjto_impsto
  join df_i_predios_destino c
    on a.id_prdio_dstno = c.id_prdio_dstno
  join df_s_estratos d
    on a.cdgo_estrto = d.cdgo_estrto
  join df_s_destinos_igac e
    on a.cdgo_dstno_igac = e.cdgo_dstno_igac
  join df_s_predios_clasificacion f
    on a.cdgo_prdio_clsfccion = f.cdgo_prdio_clsfccion
  join df_c_predios_uso_suelo g
    on a.id_prdio_uso_slo = g.id_prdio_uso_slo
  left join df_c_predios_uso_suelo k
    on a.uso_cnstrccion = k.id_prdio_uso_slo
  left join df_i_entidades h
    on a.id_entdad = h.id_entdad
  left join df_c_barrios i
    on a.id_brrio = i.id_brrio
  left join df_c_predios_tipo j
    on a.cdgo_prdio_tpo = j.cdgo_prdio_tpo
;

