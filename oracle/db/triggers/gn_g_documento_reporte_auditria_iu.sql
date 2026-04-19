
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_G_DOCUMENTO_REPORTE_AUDITRIA_IU"
  for insert or update on gn_g_documento_reporte_auditria
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_dcmnto_rprte_audtria := sq_gn_g_documento_reporte_auditria.nextval;
		end if;
	end before each row;
end gn_g_documento_reporte_auditria_iu;


/
ALTER TRIGGER "GN_G_DOCUMENTO_REPORTE_AUDITRIA_IU" ENABLE;

