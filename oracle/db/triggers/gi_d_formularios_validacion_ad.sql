
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_FORMULARIOS_VALIDACION_AD" for insert or update or delete on GI_D_FORMULARIOS_VALIDACION compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_FRMLRIO_VLDCION", "old": "' || :old.ID_FRMLRIO_VLDCION || '", "new": "' || :new.ID_FRMLRIO_VLDCION || '"},{"nmbre_cmpo": "ID_FRMLRIO", "old": "' || :old.ID_FRMLRIO || '", "new": "' || :new.ID_FRMLRIO || '"},{"nmbre_cmpo": "ID_FRMLRIO_RGION", "old": "' || :old.ID_FRMLRIO_RGION || '", "new": "' || :new.ID_FRMLRIO_RGION || '"},{"nmbre_cmpo": "TPO_VLOR1", "old": "' || :old.TPO_VLOR1 || '", "new": "' || :new.TPO_VLOR1 || '"},{"nmbre_cmpo": "VLOR1", "old": "' || :old.VLOR1 || '", "new": "' || :new.VLOR1 || '"},{"nmbre_cmpo": "ID_OPRDOR_TPO", "old": "' || :old.ID_OPRDOR_TPO || '", "new": "' || :new.ID_OPRDOR_TPO || '"},{"nmbre_cmpo": "TPO_VLOR2", "old": "' || :old.TPO_VLOR2 || '", "new": "' || :new.TPO_VLOR2 || '"},{"nmbre_cmpo": "VLOR2", "old": "' || :old.VLOR2 || '", "new": "' || :new.VLOR2 || '"},{"nmbre_cmpo": "TPO_VLOR3", "old": "' || :old.TPO_VLOR3 || '", "new": "' || :new.TPO_VLOR3 || '"},{"nmbre_cmpo": "VLOR3", "old": "' || :old.VLOR3 || '", "new": "' || :new.VLOR3 || '"},{"nmbre_cmpo": "ITEM_MNSJE_VLDCION", "old": "' || :old.ITEM_MNSJE_VLDCION || '", "new": "' || :new.ITEM_MNSJE_VLDCION || '"},{"nmbre_cmpo": "MNSJE_VLDCION", "old": "' || :old.MNSJE_VLDCION || '", "new": "' || :new.MNSJE_VLDCION || '"}]}';
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
							values(v_id_auditoria, 'GI_D_FORMULARIOS_VALIDACION', nvl(:new.ID_FRMLRIO_VLDCION, :old.ID_FRMLRIO_VLDCION),
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
ALTER TRIGGER "GI_D_FORMULARIOS_VALIDACION_AD" ENABLE;

