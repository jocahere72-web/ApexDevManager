
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_D_ACTOS_TIPO_TAREA_AD" for insert or update or delete on GN_D_ACTOS_TIPO_TAREA compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_ACTOS_TPO_TREA", "old": "' || :old.ID_ACTOS_TPO_TREA || '", "new": "' || :new.ID_ACTOS_TPO_TREA || '"},{"nmbre_cmpo": "ID_FLJO_TREA", "old": "' || :old.ID_FLJO_TREA || '", "new": "' || :new.ID_FLJO_TREA || '"},{"nmbre_cmpo": "ID_ACTO_TPO", "old": "' || :old.ID_ACTO_TPO || '", "new": "' || :new.ID_ACTO_TPO || '"},{"nmbre_cmpo": "NTFCCION_ATMTCA", "old": "' || :old.NTFCCION_ATMTCA || '", "new": "' || :new.NTFCCION_ATMTCA || '"},{"nmbre_cmpo": "ID_ACTO_TPO_RQRDO", "old": "' || :old.ID_ACTO_TPO_RQRDO || '", "new": "' || :new.ID_ACTO_TPO_RQRDO || '"},{"nmbre_cmpo": "UNDAD_DRCION", "old": "' || :old.UNDAD_DRCION || '", "new": "' || :new.UNDAD_DRCION || '"},{"nmbre_cmpo": "DRCION", "old": "' || :old.DRCION || '", "new": "' || :new.DRCION || '"},{"nmbre_cmpo": "DIA_TPO", "old": "' || :old.DIA_TPO || '", "new": "' || :new.DIA_TPO || '"},{"nmbre_cmpo": "ACTVO", "old": "' || :old.ACTVO || '", "new": "' || :new.ACTVO || '"},{"nmbre_cmpo": "CDGO_CLNTE", "old": "' || :old.CDGO_CLNTE || '", "new": "' || :new.CDGO_CLNTE || '"},{"nmbre_cmpo": "INDCDOR_OBLGTRIO", "old": "' || :old.INDCDOR_OBLGTRIO || '", "new": "' || :new.INDCDOR_OBLGTRIO || '"}]}';
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
							values(v_id_auditoria, 'GN_D_ACTOS_TIPO_TAREA', nvl(:new.ID_ACTOS_TPO_TREA, :old.ID_ACTOS_TPO_TREA),
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
ALTER TRIGGER "GN_D_ACTOS_TIPO_TAREA_AD" ENABLE;

