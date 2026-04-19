
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_D_FLUJOS_TRNSCION_PRMTRO_AD" for insert or update or delete on WF_D_FLUJOS_TRNSCION_PRMTRO compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_FLJO_TRNSCION_PRMTRO", "old": "' || :old.ID_FLJO_TRNSCION_PRMTRO || '", "new": "' || :new.ID_FLJO_TRNSCION_PRMTRO || '"},{"nmbre_cmpo": "ID_FLJO_TRNSCION", "old": "' || :old.ID_FLJO_TRNSCION || '", "new": "' || :new.ID_FLJO_TRNSCION || '"},{"nmbre_cmpo": "PRMTRO_ORGEN", "old": "' || :old.PRMTRO_ORGEN || '", "new": "' || :new.PRMTRO_ORGEN || '"},{"nmbre_cmpo": "PRMTRO_DSTNO", "old": "' || :old.PRMTRO_DSTNO || '", "new": "' || :new.PRMTRO_DSTNO || '"},{"nmbre_cmpo": "ACTVO", "old": "' || :old.ACTVO || '", "new": "' || :new.ACTVO || '"}]}';
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
							values(v_id_auditoria, 'WF_D_FLUJOS_TRNSCION_PRMTRO', nvl(:new.ID_FLJO_TRNSCION_PRMTRO, :old.ID_FLJO_TRNSCION_PRMTRO),
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
ALTER TRIGGER "WF_D_FLUJOS_TRNSCION_PRMTRO_AD" ENABLE;

