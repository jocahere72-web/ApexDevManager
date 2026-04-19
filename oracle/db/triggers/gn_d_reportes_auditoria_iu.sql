
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_D_REPORTES_AUDITORIA_IU"
  for insert or update on gn_d_reportes_auditoria
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_rprte_audtria := sq_gn_d_reportes_auditoria.nextval;
            :new.username_digita  := user;
            :new.fecha_digita     := systimestamp;
		end if;
		if updating then
            :new.username_modifica := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
			:new.fecha_modifica := systimestamp;
		end if;
	end before each row;
end gn_d_reportes_auditoria_iu;


/
ALTER TRIGGER "GN_D_REPORTES_AUDITORIA_IU" ENABLE;

