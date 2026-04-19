
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_DCLRCNES_TPOS_SJTO_AD" for insert or update or delete on GI_D_DCLRCNES_TPOS_SJTO compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_DCLRCION_TPO_SJTO", "old": "' || :old.ID_DCLRCION_TPO_SJTO || '", "new": "' || :new.ID_DCLRCION_TPO_SJTO || '"},{"nmbre_cmpo": "ID_DCLRCN_TPO", "old": "' || :old.ID_DCLRCN_TPO || '", "new": "' || :new.ID_DCLRCN_TPO || '"},{"nmbre_cmpo": "ID_SJTO_TPO", "old": "' || :old.ID_SJTO_TPO || '", "new": "' || :new.ID_SJTO_TPO || '"}]}';
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
							values(v_id_auditoria, 'GI_D_DCLRCNES_TPOS_SJTO', nvl(:new.ID_DCLRCION_TPO_SJTO, :old.ID_DCLRCION_TPO_SJTO),
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
ALTER TRIGGER "GI_D_DCLRCNES_TPOS_SJTO_AD" ENABLE;

