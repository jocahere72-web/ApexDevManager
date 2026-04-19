
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_ENTIDADES_NVDD_ACT_TPO_AD" for insert or update or delete on DF_I_ENTIDADES_NVDD_ACT_TPO compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_ENTDD_NVDAD_ACT_TPO", "old": "' || :old.ID_ENTDD_NVDAD_ACT_TPO || '", "new": "' || :new.ID_ENTDD_NVDAD_ACT_TPO || '"},{"nmbre_cmpo": "CDGO_CLNTE", "old": "' || :old.CDGO_CLNTE || '", "new": "' || :new.CDGO_CLNTE || '"},{"nmbre_cmpo": "ID_IMPSTO", "old": "' || :old.ID_IMPSTO || '", "new": "' || :new.ID_IMPSTO || '"},{"nmbre_cmpo": "ID_ENTDAD_NVDAD", "old": "' || :old.ID_ENTDAD_NVDAD || '", "new": "' || :new.ID_ENTDAD_NVDAD || '"},{"nmbre_cmpo": "ID_ACTO_TPO", "old": "' || :old.ID_ACTO_TPO || '", "new": "' || :new.ID_ACTO_TPO || '"}]}';
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
							values(v_id_auditoria, 'DF_I_ENTIDADES_NVDD_ACT_TPO', nvl(:new.ID_ENTDD_NVDAD_ACT_TPO, :old.ID_ENTDD_NVDAD_ACT_TPO),
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
ALTER TRIGGER "DF_I_ENTIDADES_NVDD_ACT_TPO_AD" ENABLE;

