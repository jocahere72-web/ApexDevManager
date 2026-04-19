
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_NT_G_MEDIO_ENTIDAD_EVDNCIA" ("ID_NTFCION_MDIO_EVDNCIA", "ID_MDIO", "CDGO_MDIO", "DSCRPCION", "FILE_BLOB", "FILE_NAME", "FILE_MIMETYPE", "FCHA_NTFCCION", "CDGO_CLNTE") AS
  select	a.id_ntfcion_mdio_evdncia
		,a.id_mdio
        ,b.cdgo_mdio
		,b.dscrpcion
		,a.file_blob
		,a.file_name
		,a.file_mimetype
		,a.fcha_ntfccion
		,a.cdgo_clnte
from nt_g_medio_entidad_evdncia a join nt_d_medio b on b.id_mdio = a.id_mdio;

