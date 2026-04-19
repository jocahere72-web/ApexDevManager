
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_RCDOS_ARCHV_CNCLCN_ARC" ("ID_ARCHVO_CNCLCN_ARC", "ID_RCDO_ARCHVO_CNCLCION", "FILE_BLOB", "FILE_NAME", "FILE_MIMETYPE", "FCHA_RGSTRO") AS
  select 	a.id_archvo_cnclcn_arc
	  , a.id_rcdo_archvo_cnclcion
	  , a.file_blob
	  , a.file_name
	  , a.file_mimetype
	  , a.fcha_rgstro
from re_g_rcdos_archv_cnclcn_arc a;

