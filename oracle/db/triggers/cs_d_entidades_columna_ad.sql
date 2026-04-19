
  CREATE OR REPLACE EDITIONABLE TRIGGER "CS_D_ENTIDADES_COLUMNA_AD" for insert or update or delete on CS_D_ENTIDADES_COLUMNA compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_ENTDAD_CLMNA", "old": "' || :old.ID_ENTDAD_CLMNA || '", "new": "' || :new.ID_ENTDAD_CLMNA || '"},{"nmbre_cmpo": "ID_ENTDAD", "old": "' || :old.ID_ENTDAD || '", "new": "' || :new.ID_ENTDAD || '"},{"nmbre_cmpo": "NMBRE_CLMNA", "old": "' || :old.NMBRE_CLMNA || '", "new": "' || :new.NMBRE_CLMNA || '"},{"nmbre_cmpo": "ALIAS_CLMNA", "old": "' || :old.ALIAS_CLMNA || '", "new": "' || :new.ALIAS_CLMNA || '"},{"nmbre_cmpo": "TPO_CLMNA", "old": "' || :old.TPO_CLMNA || '", "new": "' || :new.TPO_CLMNA || '"},{"nmbre_cmpo": "CNSLTA_SLECT", "old": "' || :old.CNSLTA_SLECT || '", "new": "' || :new.CNSLTA_SLECT || '"},{"nmbre_cmpo": "ID_ENTDAD_CLMNA_PDRE", "old": "' || :old.ID_ENTDAD_CLMNA_PDRE || '", "new": "' || :new.ID_ENTDAD_CLMNA_PDRE || '"},{"nmbre_cmpo": "INDCDOR_MSTRA_USRIO_FNAL", "old": "' || :old.INDCDOR_MSTRA_USRIO_FNAL || '", "new": "' || :new.INDCDOR_MSTRA_USRIO_FNAL || '"},{"nmbre_cmpo": "FRMTO", "old": "' || :old.FRMTO || '", "new": "' || :new.FRMTO || '"}]}';
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
							values(v_id_auditoria, 'CS_D_ENTIDADES_COLUMNA', nvl(:new.ID_ENTDAD_CLMNA, :old.ID_ENTDAD_CLMNA),
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
ALTER TRIGGER "CS_D_ENTIDADES_COLUMNA_AD" ENABLE;

