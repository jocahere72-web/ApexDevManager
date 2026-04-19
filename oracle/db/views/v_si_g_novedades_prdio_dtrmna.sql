
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SI_G_NOVEDADES_PRDIO_DTRMNA" ("ID_NVD_PRD_DTR", "ID_SJTO_IMPSTO", "ID_NVDAD_PRDIO", "VGNCIA", "FCHA_RGSTRO", "ID_USRIO_RGSTRO", "INDCDOR_DTRMNDO", "IDNTFCCION_SJTO", "NMRO_DCMTO_SPRTE", "FCHA_DCMNTO_SPRTE", "OBSRVCION", "NMBRE_TRCRO") AS
  select  a."ID_NVD_PRD_DTR",a."ID_SJTO_IMPSTO",a."ID_NVDAD_PRDIO",a."VGNCIA",a."FCHA_RGSTRO",a."ID_USRIO_RGSTRO",a."INDCDOR_DTRMNDO",
        b.idntfccion_sjto,
        c.nmro_dcmto_sprte,
        c.fcha_dcmnto_sprte,
        c.obsrvcion,
        d.nmbre_trcro
from    si_g_novedades_prdio_dtrmna a
join    v_si_i_sujetos_impuesto     b on a.id_sjto_impsto = b.id_sjto_impsto
join    si_g_novedades_predio       c on a.id_nvdad_prdio = c.id_nvdad_prdio
join    v_sg_g_usuarios             d on c.id_usrio = d.id_usrio
;

