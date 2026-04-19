
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_D_TIPOS_MDDA_CTLR_DCMNTO_AD" for insert or update or delete on MC_D_TIPOS_MDDA_CTLR_DCMNTO compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_TPOS_MDDA_CTLAR_DCMNTO", "old": "' || :old.ID_TPOS_MDDA_CTLAR_DCMNTO || '", "new": "' || :new.ID_TPOS_MDDA_CTLAR_DCMNTO || '"},{"nmbre_cmpo": "ID_TPOS_MDDA_CTLAR", "old": "' || :old.ID_TPOS_MDDA_CTLAR || '", "new": "' || :new.ID_TPOS_MDDA_CTLAR || '"},{"nmbre_cmpo": "ID_PLNTLLA", "old": "' || :old.ID_PLNTLLA || '", "new": "' || :new.ID_PLNTLLA || '"},{"nmbre_cmpo": "ID_CNSCTVO", "old": "' || :old.ID_CNSCTVO || '", "new": "' || :new.ID_CNSCTVO || '"},{"nmbre_cmpo": "TPO_DCMNTO", "old": "' || :old.TPO_DCMNTO || '", "new": "' || :new.TPO_DCMNTO || '"},{"nmbre_cmpo": "CLSE_DCMNTO", "old": "' || :old.CLSE_DCMNTO || '", "new": "' || :new.CLSE_DCMNTO || '"},{"nmbre_cmpo": "ID_CSLES_DSMBRGO", "old": "' || :old.ID_CSLES_DSMBRGO || '", "new": "' || :new.ID_CSLES_DSMBRGO || '"},{"nmbre_cmpo": "ACTVO", "old": "' || :old.ACTVO || '", "new": "' || :new.ACTVO || '"}]}';
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
							values(v_id_auditoria, 'MC_D_TIPOS_MDDA_CTLR_DCMNTO', nvl(:new.ID_TPOS_MDDA_CTLAR_DCMNTO, :old.ID_TPOS_MDDA_CTLAR_DCMNTO),
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
ALTER TRIGGER "MC_D_TIPOS_MDDA_CTLR_DCMNTO_AD" ENABLE;

