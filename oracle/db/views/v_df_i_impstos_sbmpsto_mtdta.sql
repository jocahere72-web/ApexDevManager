
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_DF_I_IMPSTOS_SBMPSTO_MTDTA" ("ID_IMPSTO_SBMPSTO_MTDTA", "CDGO_CLNTE", "ID_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE", "TPO_DTO", "DSCRPCION_TPO_DTO", "TPO_OBJTO", "DSCRPCION_TPO_OBJTO", "TPO_ORGEN", "DSCRPCION_TPO_ORGEN", "INDCDOR_RQRDO", "DSCRPCION_INDCDOR_RQRDO", "ACTVO", "DSCRPCION_ACTVO", "ORDEN", "ORGEN") AS
  select  a.id_impsto_sbmpsto_mtdta,
       a.cdgo_clnte,
       a.id_impsto,
       a.id_impsto_sbmpsto,
       a.nmbre,
       a.tpo_dto,
       decode(a.tpo_dto, 'C','Carácter','N', 'Numérico', 'D', 'Fecha') dscrpcion_tpo_dto,
       a.tpo_objto,
       decode(a.tpo_objto, 'T','Texto','S', 'Lista de Selección', 'A','Área de Texto') dscrpcion_tpo_objto,
       a.tpo_orgen,
       decode(a.tpo_orgen, 'E','Contenido Estático','S', 'Consulta SQL') dscrpcion_tpo_orgen,
       a.indcdor_rqrdo,
       decode(a.indcdor_rqrdo, 'S','Sí', 'N', 'No') dscrpcion_indcdor_rqrdo,
       a.actvo,
       decode(a.actvo, 'S','Sí', 'N', 'No') dscrpcion_actvo,
a.orden,
a.orgen
from df_i_impstos_sbmpsto_mtdta a;

