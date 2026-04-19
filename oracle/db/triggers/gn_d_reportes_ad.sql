
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_D_REPORTES_AD" for insert or update or delete on GN_D_REPORTES compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_RPRTE", "old": "' || :old.ID_RPRTE || '", "new": "' || :new.ID_RPRTE || '"},{"nmbre_cmpo": "ID_PRCSO", "old": "' || :old.ID_PRCSO || '", "new": "' || :new.ID_PRCSO || '"},{"nmbre_cmpo": "CDGO_RPRTE_GRPO", "old": "' || :old.CDGO_RPRTE_GRPO || '", "new": "' || :new.CDGO_RPRTE_GRPO || '"},{"nmbre_cmpo": "CDGO_FRMTO_TPO", "old": "' || :old.CDGO_FRMTO_TPO || '", "new": "' || :new.CDGO_FRMTO_TPO || '"},{"nmbre_cmpo": "CDGO_FRMTO_PLNTLLA", "old": "' || :old.CDGO_FRMTO_PLNTLLA || '", "new": "' || :new.CDGO_FRMTO_PLNTLLA || '"},{"nmbre_cmpo": "NMBRE_RPRTE", "old": "' || :old.NMBRE_RPRTE || '", "new": "' || :new.NMBRE_RPRTE || '"},{"nmbre_cmpo": "NMBRE_PLNTLLA", "old": "' || :old.NMBRE_PLNTLLA || '", "new": "' || :new.NMBRE_PLNTLLA || '"},{"nmbre_cmpo": "NMBRE_CNSLTA", "old": "' || :old.NMBRE_CNSLTA || '", "new": "' || :new.NMBRE_CNSLTA || '"},{"nmbre_cmpo": "INDCDOR_GNRCO", "old": "' || :old.INDCDOR_GNRCO || '", "new": "' || :new.INDCDOR_GNRCO || '"},{"nmbre_cmpo": "ACTVO", "old": "' || :old.ACTVO || '", "new": "' || :new.ACTVO || '"},{"nmbre_cmpo": "ID_RPRTE_OLD", "old": "' || :old.ID_RPRTE_OLD || '", "new": "' || :new.ID_RPRTE_OLD || '"},{"nmbre_cmpo": "ID_RPRTE_NEW", "old": "' || :old.ID_RPRTE_NEW || '", "new": "' || :new.ID_RPRTE_NEW || '"}]}';
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
							values(v_id_auditoria, 'GN_D_REPORTES', nvl(:new.ID_RPRTE, :old.ID_RPRTE),
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
ALTER TRIGGER "GN_D_REPORTES_AD" DISABLE;

