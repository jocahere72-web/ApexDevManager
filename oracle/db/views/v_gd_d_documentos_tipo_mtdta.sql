
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GD_D_DOCUMENTOS_TIPO_MTDTA" ("ID_DCMNTO_TPO", "CDGO_CLNTE", "CDGO_DCMNTO_TPO", "NMBRE", "ACTVO", "DSCRPCION_ACTVO", "ID_DCMNTO_TPO_MTDTA", "METADATA", "DTO_TPO", "DSCRPCION_DTO_TPO", "OBJTO_TPO", "DSCRPCION_OBJTO_TPO", "ORGEN_TPO", "DSCRPCION_ORGEN_TPO", "ORGEN", "INDCDOR_RQRDO", "DSCRPCION_INDCDOR_RQRDO", "ACTVO_MTDTA", "DSCRPCION_ACTVO_MTDTA", "ORDEN", "INDCDOR_UNCO", "DSCRPCION_INDCDOR_UNCO") AS
  select a.id_dcmnto_tpo
     , a.cdgo_clnte
     , a.cdgo_dcmnto_tpo
     , a.nmbre
     , a.actvo
     , decode(a.actvo, 'S', 'Si', 'N', 'No') dscrpcion_actvo
     , b.id_dcmnto_tpo_mtdta
     , b.nmbre metadata
     , b.dto_tpo
     , decode(b.dto_tpo, 'C','Caracter','N', 'Numerico', 'D', 'Fecha') dscrpcion_dto_tpo
     , b.objto_tpo
     , decode(b.objto_tpo, 'T','TextBox','S', 'Select', 'A','Textarea') dscrpcion_objto_tpo
     , b.orgen_tpo
     , decode(b.orgen_tpo, 'E','Contenido Estatico','S', 'Consulta SQL') dscrpcion_orgen_tpo
     , b.orgen
     , b.indcdor_rqrdo
     , decode(b.indcdor_rqrdo, 'S', 'Si', 'N', 'No') dscrpcion_indcdor_rqrdo
     , b.actvo actvo_mtdta
     , decode(b.actvo, 'S', 'Si', 'N', 'No') dscrpcion_actvo_mtdta
	 , b.orden
     , b.indcdor_unco
     , decode(b.indcdor_unco, 'S', 'Si', 'N', 'No') dscrpcion_indcdor_unco
  from gd_d_documentos_tipo a
  join gd_d_documentos_tipo_mtdta b
    on b.id_dcmnto_tpo = a.id_dcmnto_tpo;

