
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_SANCIONES_CALCULO_VALOR_AD" for insert or update or delete on GI_D_SANCIONES_CALCULO_VALOR compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_SNCION_CLCLO_VLR", "old": "' || :old.ID_SNCION_CLCLO_VLR || '", "new": "' || :new.ID_SNCION_CLCLO_VLR || '"},{"nmbre_cmpo": "ID_SNCION", "old": "' || :old.ID_SNCION || '", "new": "' || :new.ID_SNCION || '"},{"nmbre_cmpo": "VLOR", "old": "' || :old.VLOR || '", "new": "' || :new.VLOR || '"},{"nmbre_cmpo": "CDGO_NMBRE_VLOR", "old": "' || :old.CDGO_NMBRE_VLOR || '", "new": "' || :new.CDGO_NMBRE_VLOR || '"},{"nmbre_cmpo": "ID_INDCDOR_ECNMCO", "old": "' || :old.ID_INDCDOR_ECNMCO || '", "new": "' || :new.ID_INDCDOR_ECNMCO || '"},{"nmbre_cmpo": "UNDAD_VLOR", "old": "' || :old.UNDAD_VLOR || '", "new": "' || :new.UNDAD_VLOR || '"}]}';
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
							values(v_id_auditoria, 'GI_D_SANCIONES_CALCULO_VALOR', nvl(:new.ID_SNCION_CLCLO_VLR, :old.ID_SNCION_CLCLO_VLR),
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
ALTER TRIGGER "GI_D_SANCIONES_CALCULO_VALOR_AD" ENABLE;

