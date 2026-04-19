
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GN_G_REPORTES_AUDITORIA" ("ID_RPRTE_AUDTRIA_TRZA", "ID_RPRTE", "ID_SJTO_IMPSTO", "ID_USRIO", "FCHA_IMPRSION", "ID_DCMNTO_RPRTE_AUDTRIA", "FILE_NAME", "FILE_MIMETYPE", "FILE_BLOB", "FILE_BFILE", "FCHA") AS
  select a.id_rprte_audtria_trza
	 , a.id_rprte
	 , a.id_sjto_impsto
	 , a.id_usrio
     , a.fcha_imprsion
     , d.id_dcmnto_rprte_audtria
     , d.file_name
     , d.file_mimetype
     , d.file_blob
     , d.file_bfile
     , d.fcha
from gn_g_reportes_auditoria_traza   a
join gn_g_documento_reporte_auditria d on a.id_rprte_audtria_trza = d.id_rprte_audtria_trza
;

