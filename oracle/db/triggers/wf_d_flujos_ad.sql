
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_D_FLUJOS_AD" for insert or update or delete on WF_D_FLUJOS compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_FLJO", "old": "' || :old.ID_FLJO || '", "new": "' || :new.ID_FLJO || '"},{"nmbre_cmpo": "CDGO_CLNTE", "old": "' || :old.CDGO_CLNTE || '", "new": "' || :new.CDGO_CLNTE || '"},{"nmbre_cmpo": "CDGO_FLJO", "old": "' || :old.CDGO_FLJO || '", "new": "' || :new.CDGO_FLJO || '"},{"nmbre_cmpo": "DSCRPCION_FLJO", "old": "' || :old.DSCRPCION_FLJO || '", "new": "' || :new.DSCRPCION_FLJO || '"},{"nmbre_cmpo": "UNDAD_DRCION", "old": "' || :old.UNDAD_DRCION || '", "new": "' || :new.UNDAD_DRCION || '"},{"nmbre_cmpo": "DRCION", "old": "' || :old.DRCION || '", "new": "' || :new.DRCION || '"},{"nmbre_cmpo": "UNDAD_DRCION_OPTMA", "old": "' || :old.UNDAD_DRCION_OPTMA || '", "new": "' || :new.UNDAD_DRCION_OPTMA || '"},{"nmbre_cmpo": "DRCION_OPTMA", "old": "' || :old.DRCION_OPTMA || '", "new": "' || :new.DRCION_OPTMA || '"},{"nmbre_cmpo": "ACTVO", "old": "' || :old.ACTVO || '", "new": "' || :new.ACTVO || '"},{"nmbre_cmpo": "ID_FLJO_TREA_INCIAL", "old": "' || :old.ID_FLJO_TREA_INCIAL || '", "new": "' || :new.ID_FLJO_TREA_INCIAL || '"},{"nmbre_cmpo": "ID_PRCSO", "old": "' || :old.ID_PRCSO || '", "new": "' || :new.ID_PRCSO || '"},{"nmbre_cmpo": "INDCDOR_INCIA_USRIO_FNAL", "old": "' || :old.INDCDOR_INCIA_USRIO_FNAL || '", "new": "' || :new.INDCDOR_INCIA_USRIO_FNAL || '"}]}';
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
							values(v_id_auditoria, 'WF_D_FLUJOS', nvl(:new.ID_FLJO, :old.ID_FLJO),
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
ALTER TRIGGER "WF_D_FLUJOS_AD" ENABLE;

