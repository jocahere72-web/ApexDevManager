
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_CINTA_IGAC" ("ID_CNTA_IGAC", "ID_PRCSO_CRGA", "FILE_NAME", "VGNCIA", "CDGO_CLNTE", "ID_IMPSTO", "DPRTMNTO_IGAC", "MNCPIO_IGAC", "RFRNCIA_IGAC", "TPO_RGSTRO", "NMRO_ORDEN_IGAC", "TTAL_ORDEN_IGAC", "NMBRE_PRPTRIO_IGAC", "ESTDO_CVIL_IGAC", "TPO_DCMNTO_IGAC", "NMRO_DCMNTO_IGAC", "DRCCION_PRDIO_IGAC", "CMNA_IGAC", "DSTNO_ECNMCO_IGAC", "AREA_TRRNO_IGAC", "AREA_CNSTRDA_IGAC", "AVLUO_IGAC", "VGNCIA_IGAC", "RFRNCIA_IGAC_ANTRIOR", "ESPCIOS", "ESTDO_RGSTRO", "ID_SJTO_IMPSTO", "PRDIO_NVO", "NMRO_CRCTER", "ID_PRCSO_INTRMDIA") AS
  select a.id_cnta_igac,
              a.id_prcso_crga,
              b.file_name,
              b.vgncia,
              b.cdgo_clnte,
              b.id_impsto,
              a.dprtmnto_igac,
              a.mncpio_igac,
              a.rfrncia_igac,
              a.tpo_rgstro,
              a.nmro_orden_igac,
              a.ttal_orden_igac,
              a.nmbre_prptrio_igac,
              a.estdo_cvil_igac,
              a.tpo_dcmnto_igac,
              a.nmro_dcmnto_igac,
              a.drccion_prdio_igac,
              a.cmna_igac,
              a.dstno_ecnmco_igac,
              a.area_trrno_igac,
              a.area_cnstrda_igac,
              a.avluo_igac,
              a.vgncia_igac,
              a.rfrncia_igac_antrior,
              a.espcios,
              a.estdo_rgstro,
              a.id_sjto_impsto,
              a.prdio_nvo,
              a.nmro_crcter,
              a.id_prcso_intrmdia
         from gi_g_cinta_igac a
         join et_g_procesos_carga b
           on a.id_prcso_crga = b.id_prcso_crga;

