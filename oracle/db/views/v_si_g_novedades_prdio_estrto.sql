
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SI_G_NOVEDADES_PRDIO_ESTRTO" ("ID_NVD_PRD_EST", "ID_SJTO_IMPSTO", "ID_NVDAD_PRDIO", "CDGO_ESTRTO", "VGNCIA", "FCHA_RGSTRO", "ID_USRIO_RGSTRO", "INDCDOR_ACTLZDO", "OBSRVCION_ACTLZDO", "IDNTFCCION_SJTO", "NMRO_DCMTO_SPRTE", "FCHA_DCMNTO_SPRTE", "OBSRVCION", "NMBRE_TRCRO") AS
  select  a."ID_NVD_PRD_EST",a."ID_SJTO_IMPSTO",a."ID_NVDAD_PRDIO",a."CDGO_ESTRTO",a."VGNCIA",a."FCHA_RGSTRO",a."ID_USRIO_RGSTRO",a."INDCDOR_ACTLZDO",a."OBSRVCION_ACTLZDO",
        b.idntfccion_sjto,
        c.nmro_dcmto_sprte,
        c.fcha_dcmnto_sprte,
        c.obsrvcion,
        d.nmbre_trcro
from    si_g_novedades_prdio_estrto a
join    v_si_i_sujetos_impuesto     b on a.id_sjto_impsto = b.id_sjto_impsto
join    si_g_novedades_predio       c on a.id_nvdad_prdio = c.id_nvdad_prdio
join    v_sg_g_usuarios             d on c.id_usrio = d.id_usrio
join    df_s_estratos               e on a.cdgo_estrto = e.cdgo_estrto
;

