
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_IMPUESTOS_SUBIMPUESTO_AD" for insert or update or delete on DF_I_IMPUESTOS_SUBIMPUESTO compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_IMPSTO_SBMPSTO", "old": "' || :old.ID_IMPSTO_SBMPSTO || '", "new": "' || :new.ID_IMPSTO_SBMPSTO || '"},{"nmbre_cmpo": "CDGO_CLNTE", "old": "' || :old.CDGO_CLNTE || '", "new": "' || :new.CDGO_CLNTE || '"},{"nmbre_cmpo": "ID_IMPSTO", "old": "' || :old.ID_IMPSTO || '", "new": "' || :new.ID_IMPSTO || '"},{"nmbre_cmpo": "CDGO_IMPSTO_SBMPSTO", "old": "' || :old.CDGO_IMPSTO_SBMPSTO || '", "new": "' || :new.CDGO_IMPSTO_SBMPSTO || '"},{"nmbre_cmpo": "NMBRE_IMPSTO_SBMPSTO", "old": "' || :old.NMBRE_IMPSTO_SBMPSTO || '", "new": "' || :new.NMBRE_IMPSTO_SBMPSTO || '"},{"nmbre_cmpo": "CDGO_EAN", "old": "' || :old.CDGO_EAN || '", "new": "' || :new.CDGO_EAN || '"},{"nmbre_cmpo": "ACTVO", "old": "' || :old.ACTVO || '", "new": "' || :new.ACTVO || '"},{"nmbre_cmpo": "LQDCION_MLTPLE", "old": "' || :old.LQDCION_MLTPLE || '", "new": "' || :new.LQDCION_MLTPLE || '"},{"nmbre_cmpo": "INDCDOR_LQDCION_PBLCO", "old": "' || :old.INDCDOR_LQDCION_PBLCO || '", "new": "' || :new.INDCDOR_LQDCION_PBLCO || '"},{"nmbre_cmpo": "INDCDOR_USA_FCHA_VNCMNTO_CLCLD", "old": "' || :old.INDCDOR_USA_FCHA_VNCMNTO_CLCLD || '", "new": "' || :new.INDCDOR_USA_FCHA_VNCMNTO_CLCLD || '"},{"nmbre_cmpo": "INDCDOR_RQRE_AUTRZCION", "old": "' || :old.INDCDOR_RQRE_AUTRZCION || '", "new": "' || :new.INDCDOR_RQRE_AUTRZCION || '"}]}';
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
							values(v_id_auditoria, 'DF_I_IMPUESTOS_SUBIMPUESTO', nvl(:new.ID_IMPSTO_SBMPSTO, :old.ID_IMPSTO_SBMPSTO),
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
ALTER TRIGGER "DF_I_IMPUESTOS_SUBIMPUESTO_AD" ENABLE;

