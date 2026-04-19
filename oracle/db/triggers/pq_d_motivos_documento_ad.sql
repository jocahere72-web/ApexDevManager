
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_D_MOTIVOS_DOCUMENTO_AD" for insert or update or delete on PQ_D_MOTIVOS_DOCUMENTO compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_MTVO_DCMNTO", "old": "' || :old.ID_MTVO_DCMNTO || '", "new": "' || :new.ID_MTVO_DCMNTO || '"},{"nmbre_cmpo": "ID_MTVO", "old": "' || :old.ID_MTVO || '", "new": "' || :new.ID_MTVO || '"},{"nmbre_cmpo": "ID_RPRTE", "old": "' || :old.ID_RPRTE || '", "new": "' || :new.ID_RPRTE || '"},{"nmbre_cmpo": "CDGO_DCMNTO", "old": "' || :old.CDGO_DCMNTO || '", "new": "' || :new.CDGO_DCMNTO || '"},{"nmbre_cmpo": "INDCDOR_OBLGTRIO", "old": "' || :old.INDCDOR_OBLGTRIO || '", "new": "' || :new.INDCDOR_OBLGTRIO || '"},{"nmbre_cmpo": "ACTVO", "old": "' || :old.ACTVO || '", "new": "' || :new.ACTVO || '"}]}';
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
							values(v_id_auditoria, 'PQ_D_MOTIVOS_DOCUMENTO', nvl(:new.ID_MTVO_DCMNTO, :old.ID_MTVO_DCMNTO),
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
ALTER TRIGGER "PQ_D_MOTIVOS_DOCUMENTO_AD" ENABLE;

