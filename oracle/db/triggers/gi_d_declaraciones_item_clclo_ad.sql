
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_DECLARACIONES_ITEM_CLCLO_AD" for insert or update or delete on GI_D_DECLARACIONES_ITEM_CLCLO compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_DCLRCION_ITEM_CLCLO", "old": "' || :old.ID_DCLRCION_ITEM_CLCLO || '", "new": "' || :new.ID_DCLRCION_ITEM_CLCLO || '"},{"nmbre_cmpo": "ID_DCLRCION_ITEM", "old": "' || :old.ID_DCLRCION_ITEM || '", "new": "' || :new.ID_DCLRCION_ITEM || '"},{"nmbre_cmpo": "ORDEN", "old": "' || :old.ORDEN || '", "new": "' || :new.ORDEN || '"},{"nmbre_cmpo": "ID_DCLRCION_ITEM_RLCNDO", "old": "' || :old.ID_DCLRCION_ITEM_RLCNDO || '", "new": "' || :new.ID_DCLRCION_ITEM_RLCNDO || '"},{"nmbre_cmpo": "OPRCION", "old": "' || :old.OPRCION || '", "new": "' || :new.OPRCION || '"},{"nmbre_cmpo": "MLJE", "old": "' || :old.MLJE || '", "new": "' || :new.MLJE || '"},{"nmbre_cmpo": "TPO_CLCLO", "old": "' || :old.TPO_CLCLO || '", "new": "' || :new.TPO_CLCLO || '"},{"nmbre_cmpo": "NMBRE_FNCION", "old": "' || :old.NMBRE_FNCION || '", "new": "' || :new.NMBRE_FNCION || '"}]}';
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
							values(v_id_auditoria, 'GI_D_DECLARACIONES_ITEM_CLCLO', nvl(:new.ID_DCLRCION_ITEM_CLCLO, :old.ID_DCLRCION_ITEM_CLCLO),
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
ALTER TRIGGER "GI_D_DECLARACIONES_ITEM_CLCLO_AD" ENABLE;

