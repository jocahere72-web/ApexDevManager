
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_DEFINICIONES_CLIENTE_AD" for insert or update or delete on DF_C_DEFINICIONES_CLIENTE compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_DFNCION_CLNTE", "old": "' || :old.ID_DFNCION_CLNTE || '", "new": "' || :new.ID_DFNCION_CLNTE || '"},{"nmbre_cmpo": "CDGO_CLNTE", "old": "' || :old.CDGO_CLNTE || '", "new": "' || :new.CDGO_CLNTE || '"},{"nmbre_cmpo": "ID_DFNCION_CLNTE_CTGRIA", "old": "' || :old.ID_DFNCION_CLNTE_CTGRIA || '", "new": "' || :new.ID_DFNCION_CLNTE_CTGRIA || '"},{"nmbre_cmpo": "CDGO_DFNCION_CLNTE", "old": "' || :old.CDGO_DFNCION_CLNTE || '", "new": "' || :new.CDGO_DFNCION_CLNTE || '"},{"nmbre_cmpo": "DSCRPCION_DFNCION_CLNTE", "old": "' || :old.DSCRPCION_DFNCION_CLNTE || '", "new": "' || :new.DSCRPCION_DFNCION_CLNTE || '"},{"nmbre_cmpo": "FRMTO", "old": "' || :old.FRMTO || '", "new": "' || :new.FRMTO || '"},{"nmbre_cmpo": "VLOR", "old": "' || :old.VLOR || '", "new": "' || :new.VLOR || '"}]}';
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
							values(v_id_auditoria, 'DF_C_DEFINICIONES_CLIENTE', nvl(:new.ID_DFNCION_CLNTE, :old.ID_DFNCION_CLNTE),
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
ALTER TRIGGER "DF_C_DEFINICIONES_CLIENTE_AD" ENABLE;

