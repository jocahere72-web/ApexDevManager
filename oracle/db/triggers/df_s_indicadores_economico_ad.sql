
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_INDICADORES_ECONOMICO_AD" for insert or update or delete on DF_S_INDICADORES_ECONOMICO compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_INDCDOR_ECNMCO", "old": "' || :old.ID_INDCDOR_ECNMCO || '", "new": "' || :new.ID_INDCDOR_ECNMCO || '"},{"nmbre_cmpo": "CDGO_INDCDOR_TPO", "old": "' || :old.CDGO_INDCDOR_TPO || '", "new": "' || :new.CDGO_INDCDOR_TPO || '"},{"nmbre_cmpo": "FCHA_DSDE", "old": "' || :old.FCHA_DSDE || '", "new": "' || :new.FCHA_DSDE || '"},{"nmbre_cmpo": "FCHA_HSTA", "old": "' || :old.FCHA_HSTA || '", "new": "' || :new.FCHA_HSTA || '"},{"nmbre_cmpo": "VLOR", "old": "' || :old.VLOR || '", "new": "' || :new.VLOR || '"}]}';
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
							values(v_id_auditoria, 'DF_S_INDICADORES_ECONOMICO', nvl(:new.ID_INDCDOR_ECNMCO, :old.ID_INDCDOR_ECNMCO),
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
ALTER TRIGGER "DF_S_INDICADORES_ECONOMICO_AD" ENABLE;

