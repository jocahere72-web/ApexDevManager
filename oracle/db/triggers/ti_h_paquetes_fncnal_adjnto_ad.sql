
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_H_PAQUETES_FNCNAL_ADJNTO_AD" for insert or update or delete on TI_H_PAQUETES_FNCNAL_ADJNTO compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_PQTE_FNCNAL_ADJNTO_HSTRCO", "old": "' || :old.ID_PQTE_FNCNAL_ADJNTO_HSTRCO || '", "new": "' || :new.ID_PQTE_FNCNAL_ADJNTO_HSTRCO || '"},{"nmbre_cmpo": "ID_PQTE_FNCNAL_ADJNTO", "old": "' || :old.ID_PQTE_FNCNAL_ADJNTO || '", "new": "' || :new.ID_PQTE_FNCNAL_ADJNTO || '"},{"nmbre_cmpo": "CDGO_ADJNTO_TPO", "old": "' || :old.CDGO_ADJNTO_TPO || '", "new": "' || :new.CDGO_ADJNTO_TPO || '"},{"nmbre_cmpo": "FCHA", "old": "' || :old.FCHA || '", "new": "' || :new.FCHA || '"},{"nmbre_cmpo": "OBSRVCION", "old": "' || :old.OBSRVCION || '", "new": "' || :new.OBSRVCION || '"},{"nmbre_cmpo": "NMRO_APLCCION", "old": "' || :old.NMRO_APLCCION || '", "new": "' || :new.NMRO_APLCCION || '"},{"nmbre_cmpo": "NMRO_PGNA", "old": "' || :old.NMRO_PGNA || '", "new": "' || :new.NMRO_PGNA || '"},{"nmbre_cmpo": "FILE_NAME", "old": "' || :old.FILE_NAME || '", "new": "' || :new.FILE_NAME || '"},{"nmbre_cmpo": "FILE_MIMETYPE", "old": "' || :old.FILE_MIMETYPE || '", "new": "' || :new.FILE_MIMETYPE || '"},{"nmbre_cmpo": "NMRO_VRSION", "old": "' || :old.NMRO_VRSION || '", "new": "' || :new.NMRO_VRSION || '"}]}';
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
							values(v_id_auditoria, 'TI_H_PAQUETES_FNCNAL_ADJNTO', nvl(:new.ID_PQTE_FNCNAL_ADJNTO_HSTRCO, :old.ID_PQTE_FNCNAL_ADJNTO_HSTRCO),
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
ALTER TRIGGER "TI_H_PAQUETES_FNCNAL_ADJNTO_AD" ENABLE;

