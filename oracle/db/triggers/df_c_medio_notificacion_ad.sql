
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_MEDIO_NOTIFICACION_AD" for insert or update or delete on DF_C_MEDIO_NOTIFICACION compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_MDIO_NTFCCION", "old": "' || :old.ID_MDIO_NTFCCION || '", "new": "' || :new.ID_MDIO_NTFCCION || '"},{"nmbre_cmpo": "CODGO_CLNTE", "old": "' || :old.CODGO_CLNTE || '", "new": "' || :new.CODGO_CLNTE || '"},{"nmbre_cmpo": "CDGO_MDIO_NTFCCION", "old": "' || :old.CDGO_MDIO_NTFCCION || '", "new": "' || :new.CDGO_MDIO_NTFCCION || '"},{"nmbre_cmpo": "DSCRPCION_CLSE_PRBA", "old": "' || :old.DSCRPCION_CLSE_PRBA || '", "new": "' || :new.DSCRPCION_CLSE_PRBA || '"}]}';
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
							values(v_id_auditoria, 'DF_C_MEDIO_NOTIFICACION', nvl(:new.ID_MDIO_NTFCCION, :old.ID_MDIO_NTFCCION),
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
ALTER TRIGGER "DF_C_MEDIO_NOTIFICACION_AD" ENABLE;

