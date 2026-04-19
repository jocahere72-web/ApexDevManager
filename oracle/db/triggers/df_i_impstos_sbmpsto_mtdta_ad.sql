
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_IMPSTOS_SBMPSTO_MTDTA_AD" for insert or update or delete on DF_I_IMPSTOS_SBMPSTO_MTDTA compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_IMPSTO_SBMPSTO_MTDTA", "old": "' || :old.ID_IMPSTO_SBMPSTO_MTDTA || '", "new": "' || :new.ID_IMPSTO_SBMPSTO_MTDTA || '"},{"nmbre_cmpo": "CDGO_CLNTE", "old": "' || :old.CDGO_CLNTE || '", "new": "' || :new.CDGO_CLNTE || '"},{"nmbre_cmpo": "ID_IMPSTO", "old": "' || :old.ID_IMPSTO || '", "new": "' || :new.ID_IMPSTO || '"},{"nmbre_cmpo": "ID_IMPSTO_SBMPSTO", "old": "' || :old.ID_IMPSTO_SBMPSTO || '", "new": "' || :new.ID_IMPSTO_SBMPSTO || '"},{"nmbre_cmpo": "NMBRE", "old": "' || :old.NMBRE || '", "new": "' || :new.NMBRE || '"},{"nmbre_cmpo": "TPO_DTO", "old": "' || :old.TPO_DTO || '", "new": "' || :new.TPO_DTO || '"},{"nmbre_cmpo": "TPO_OBJTO", "old": "' || :old.TPO_OBJTO || '", "new": "' || :new.TPO_OBJTO || '"},{"nmbre_cmpo": "TPO_ORGEN", "old": "' || :old.TPO_ORGEN || '", "new": "' || :new.TPO_ORGEN || '"},{"nmbre_cmpo": "INDCDOR_RQRDO", "old": "' || :old.INDCDOR_RQRDO || '", "new": "' || :new.INDCDOR_RQRDO || '"},{"nmbre_cmpo": "ACTVO", "old": "' || :old.ACTVO || '", "new": "' || :new.ACTVO || '"},{"nmbre_cmpo": "ORDEN", "old": "' || :old.ORDEN || '", "new": "' || :new.ORDEN || '"},{"nmbre_cmpo": "ORGEN", "old": "' || :old.ORGEN || '", "new": "' || :new.ORGEN || '"}]}';
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
							values(v_id_auditoria, 'DF_I_IMPSTOS_SBMPSTO_MTDTA', nvl(:new.ID_IMPSTO_SBMPSTO_MTDTA, :old.ID_IMPSTO_SBMPSTO_MTDTA),
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
ALTER TRIGGER "DF_I_IMPSTOS_SBMPSTO_MTDTA_AD" DISABLE;

