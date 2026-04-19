
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_I_PRSNAS_ACTVDAD_ECNMCA_AD" for insert or update or delete on SI_I_PRSNAS_ACTVDAD_ECNMCA compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_PRSNA_ACTVDAD_ECNMCA", "old": "' || :old.ID_PRSNA_ACTVDAD_ECNMCA || '", "new": "' || :new.ID_PRSNA_ACTVDAD_ECNMCA || '"},{"nmbre_cmpo": "ID_PRSNA", "old": "' || :old.ID_PRSNA || '", "new": "' || :new.ID_PRSNA || '"},{"nmbre_cmpo": "ID_ACTVDAD_ECNMCA", "old": "' || :old.ID_ACTVDAD_ECNMCA || '", "new": "' || :new.ID_ACTVDAD_ECNMCA || '"},{"nmbre_cmpo": "USER_DGTA", "old": "' || :old.USER_DGTA || '", "new": "' || :new.USER_DGTA || '"},{"nmbre_cmpo": "FCHA_DGTA", "old": "' || :old.FCHA_DGTA || '", "new": "' || :new.FCHA_DGTA || '"},{"nmbre_cmpo": "USER_MDFCA", "old": "' || :old.USER_MDFCA || '", "new": "' || :new.USER_MDFCA || '"},{"nmbre_cmpo": "FCHA_MDFCA", "old": "' || :old.FCHA_MDFCA || '", "new": "' || :new.FCHA_MDFCA || '"},{"nmbre_cmpo": "ID_NVDAD_PRSNA", "old": "' || :old.ID_NVDAD_PRSNA || '", "new": "' || :new.ID_NVDAD_PRSNA || '"}]}';
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
							values(v_id_auditoria, 'SI_I_PRSNAS_ACTVDAD_ECNMCA', nvl(:new.ID_PRSNA_ACTVDAD_ECNMCA, :old.ID_PRSNA_ACTVDAD_ECNMCA),
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
ALTER TRIGGER "SI_I_PRSNAS_ACTVDAD_ECNMCA_AD" ENABLE;

