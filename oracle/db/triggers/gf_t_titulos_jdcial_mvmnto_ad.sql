
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_T_TITULOS_JDCIAL_MVMNTO_AD"
	for insert or update or delete on GF_T_TITULOS_JDCIAL_MVMNTO
	compound trigger

	v_id_auditoria ad_g_audit_trail.id_auditoria%type;
	v_json varchar2(4000);
	v_tpo_oprcion   varchar2(1);
	v_operacion     varchar2(50);
	after each row is
	begin
		--if inserting then
			case true
				when inserting then
					v_tpo_oprcion := 'I';
					v_operacion   := 'Inserción';
				when updating then
					v_tpo_oprcion := 'U';
					v_operacion   := 'Actualización';
				else
					v_tpo_oprcion := 'D';
					v_operacion   := 'Eliminación';
			end case;
			v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_TTLO_JDCIAL_MVMNTO", "old": "' || :old.ID_TTLO_JDCIAL_MVMNTO || '", "new": "' || :new.ID_TTLO_JDCIAL_MVMNTO || '"},{"nmbre_cmpo": "ID_TTLO_JDCIAL", "old": "' || :old.ID_TTLO_JDCIAL || '", "new": "' || :new.ID_TTLO_JDCIAL || '"},{"nmbre_cmpo": "ID_IMPSTO", "old": "' || :old.ID_IMPSTO || '", "new": "' || :new.ID_IMPSTO || '"},{"nmbre_cmpo": "ID_IMPSTO_SBMPSTO", "old": "' || :old.ID_IMPSTO_SBMPSTO || '", "new": "' || :new.ID_IMPSTO_SBMPSTO || '"},{"nmbre_cmpo": "ID_SJTO_IMPSTO", "old": "' || :old.ID_SJTO_IMPSTO || '", "new": "' || :new.ID_SJTO_IMPSTO || '"},{"nmbre_cmpo": "VGNCIA", "old": "' || :old.VGNCIA || '", "new": "' || :new.VGNCIA || '"},{"nmbre_cmpo": "ID_PRDO", "old": "' || :old.ID_PRDO || '", "new": "' || :new.ID_PRDO || '"},{"nmbre_cmpo": "ID_CNCPTO", "old": "' || :old.ID_CNCPTO || '", "new": "' || :new.ID_CNCPTO || '"},{"nmbre_cmpo": "CNTDAD", "old": "' || :old.CNTDAD || '", "new": "' || :new.CNTDAD || '"}]}';
			select nvl(max(id_auditoria)+1, 1) into v_id_auditoria from ad_g_audit_trail;

			insert into ad_g_audit_trail(
				  id_auditoria
				, nmbre_tbla
				, id_llve_prmria
				, tpo_oprcion
				, json
				, usrio
				, fecha
				, host
				, ip_address
				, server_host
				, os_user
				, terminal
				, authentication_method
				, proxy_user
				, proxy_userid)
			values(v_id_auditoria, 'GF_T_TITULOS_JDCIAL_MVMNTO', nvl(:new.ID_TTLO_JDCIAL_MVMNTO, :old.ID_TTLO_JDCIAL_MVMNTO),
				 v_tpo_oprcion,
				 v_json,
				 coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') ), systimestamp,
				 sys_context('userenv','host'),
				 sys_context('userenv','ip_address'),
				 sys_context('userenv','server_host'),
				 sys_context('userenv','os_user'),
				 sys_context('userenv','terminal'),
				 sys_context('userenv','authentication_method'),
				 sys_context('userenv','proxy_user'),
				 sys_context('userenv','proxy_userid') );

		--elsif updating then
		--	null;
		--end if;
	end after each row;

	end;


/
ALTER TRIGGER "GF_T_TITULOS_JDCIAL_MVMNTO_AD" ENABLE;

