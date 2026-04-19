
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_G_REPORTES_AUDITORIA_TRAZA_IU"
  for insert or update on gn_g_reportes_auditoria_traza
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_rprte_audtria_trza := sq_gn_g_reportes_auditoria_traza.nextval;
		end if;
	end before each row;
end gn_g_reportes_auditoria_traza_iu;


/
ALTER TRIGGER "GN_G_REPORTES_AUDITORIA_TRAZA_IU" ENABLE;

