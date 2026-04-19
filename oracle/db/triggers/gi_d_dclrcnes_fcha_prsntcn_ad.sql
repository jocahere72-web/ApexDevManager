
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_DCLRCNES_FCHA_PRSNTCN_AD" for insert or update or delete on GI_D_DCLRCNES_FCHA_PRSNTCN compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_DCLRCION_FCHA_PRSNTCION", "old": "' || :old.ID_DCLRCION_FCHA_PRSNTCION || '", "new": "' || :new.ID_DCLRCION_FCHA_PRSNTCION || '"},{"nmbre_cmpo": "ID_DCLRCION_TPO_VGNCIA", "old": "' || :old.ID_DCLRCION_TPO_VGNCIA || '", "new": "' || :new.ID_DCLRCION_TPO_VGNCIA || '"},{"nmbre_cmpo": "DSCRPCION", "old": "' || :old.DSCRPCION || '", "new": "' || :new.DSCRPCION || '"},{"nmbre_cmpo": "FCHA_INCIAL", "old": "' || :old.FCHA_INCIAL || '", "new": "' || :new.FCHA_INCIAL || '"},{"nmbre_cmpo": "FCHA_FNAL", "old": "' || :old.FCHA_FNAL || '", "new": "' || :new.FCHA_FNAL || '"},{"nmbre_cmpo": "VLOR", "old": "' || :old.VLOR || '", "new": "' || :new.VLOR || '"},{"nmbre_cmpo": "ACTVO", "old": "' || :old.ACTVO || '", "new": "' || :new.ACTVO || '"},{"nmbre_cmpo": "ID_SJTO_TPO", "old": "' || :old.ID_SJTO_TPO || '", "new": "' || :new.ID_SJTO_TPO || '"},{"nmbre_cmpo": "CDGO_TPO_FCHA_PRSNTCION", "old": "' || :old.CDGO_TPO_FCHA_PRSNTCION || '", "new": "' || :new.CDGO_TPO_FCHA_PRSNTCION || '"}]}';
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
							values(v_id_auditoria, 'GI_D_DCLRCNES_FCHA_PRSNTCN', nvl(:new.ID_DCLRCION_FCHA_PRSNTCION, :old.ID_DCLRCION_FCHA_PRSNTCION),
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
ALTER TRIGGER "GI_D_DCLRCNES_FCHA_PRSNTCN_AD" ENABLE;

