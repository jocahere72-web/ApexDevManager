
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_D_TAREAS_AD" for insert or update or delete on WF_D_TAREAS compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_TREA", "old": "' || :old.ID_TREA || '", "new": "' || :new.ID_TREA || '"},{"nmbre_cmpo": "CDGO_CLNTE", "old": "' || :old.CDGO_CLNTE || '", "new": "' || :new.CDGO_CLNTE || '"},{"nmbre_cmpo": "NMBRE_TREA", "old": "' || :old.NMBRE_TREA || '", "new": "' || :new.NMBRE_TREA || '"},{"nmbre_cmpo": "DSCRPCION_TREA", "old": "' || :old.DSCRPCION_TREA || '", "new": "' || :new.DSCRPCION_TREA || '"},{"nmbre_cmpo": "CDGO_ACCION_TPO", "old": "' || :old.CDGO_ACCION_TPO || '", "new": "' || :new.CDGO_ACCION_TPO || '"},{"nmbre_cmpo": "ID_APLCCION", "old": "' || :old.ID_APLCCION || '", "new": "' || :new.ID_APLCCION || '"},{"nmbre_cmpo": "NMRO_PGNA", "old": "' || :old.NMRO_PGNA || '", "new": "' || :new.NMRO_PGNA || '"},{"nmbre_cmpo": "NMBRE_UP", "old": "' || :old.NMBRE_UP || '", "new": "' || :new.NMBRE_UP || '"},{"nmbre_cmpo": "NMBRE_RPRTE", "old": "' || :old.NMBRE_RPRTE || '", "new": "' || :new.NMBRE_RPRTE || '"},{"nmbre_cmpo": "NTFCCION_CRREO", "old": "' || :old.NTFCCION_CRREO || '", "new": "' || :new.NTFCCION_CRREO || '"},{"nmbre_cmpo": "INDCDOR_ENVIAR", "old": "' || :old.INDCDOR_ENVIAR || '", "new": "' || :new.INDCDOR_ENVIAR || '"}]}';
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
							values(v_id_auditoria, 'WF_D_TAREAS', nvl(:new.ID_TREA, :old.ID_TREA),
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
ALTER TRIGGER "WF_D_TAREAS_AD" ENABLE;

