
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_D_PLANTILLAS_AD" for insert or update or delete on GN_D_PLANTILLAS compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_PLNTLLA", "old": "' || :old.ID_PLNTLLA || '", "new": "' || :new.ID_PLNTLLA || '"},{"nmbre_cmpo": "CDGO_CLNTE", "old": "' || :old.CDGO_CLNTE || '", "new": "' || :new.CDGO_CLNTE || '"},{"nmbre_cmpo": "ID_ACTO_TPO", "old": "' || :old.ID_ACTO_TPO || '", "new": "' || :new.ID_ACTO_TPO || '"},{"nmbre_cmpo": "DSCRPCION", "old": "' || :old.DSCRPCION || '", "new": "' || :new.DSCRPCION || '"},{"nmbre_cmpo": "ACTVO", "old": "' || :old.ACTVO || '", "new": "' || :new.ACTVO || '"},{"nmbre_cmpo": "DFCTO", "old": "' || :old.DFCTO || '", "new": "' || :new.DFCTO || '"},{"nmbre_cmpo": "ID_RPRTE", "old": "' || :old.ID_RPRTE || '", "new": "' || :new.ID_RPRTE || '"},{"nmbre_cmpo": "FCHA_INCIO", "old": "' || :old.FCHA_INCIO || '", "new": "' || :new.FCHA_INCIO || '"},{"nmbre_cmpo": "FCHA_FIN", "old": "' || :old.FCHA_FIN || '", "new": "' || :new.FCHA_FIN || '"},{"nmbre_cmpo": "ID_PRCSO", "old": "' || :old.ID_PRCSO || '", "new": "' || :new.ID_PRCSO || '"},{"nmbre_cmpo": "TPO_PLNTLLA", "old": "' || :old.TPO_PLNTLLA || '", "new": "' || :new.TPO_PLNTLLA || '"}]}';
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
							values(v_id_auditoria, 'GN_D_PLANTILLAS', nvl(:new.ID_PLNTLLA, :old.ID_PLNTLLA),
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
ALTER TRIGGER "GN_D_PLANTILLAS_AD" ENABLE;

