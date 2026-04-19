
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_IMPUESTOS_ACTO_AD" for insert or update or delete on DF_I_IMPUESTOS_ACTO compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_IMPSTO_ACTO", "old": "' || :old.ID_IMPSTO_ACTO || '", "new": "' || :new.ID_IMPSTO_ACTO || '"},{"nmbre_cmpo": "ID_IMPSTO", "old": "' || :old.ID_IMPSTO || '", "new": "' || :new.ID_IMPSTO || '"},{"nmbre_cmpo": "ID_IMPSTO_SBMPSTO", "old": "' || :old.ID_IMPSTO_SBMPSTO || '", "new": "' || :new.ID_IMPSTO_SBMPSTO || '"},{"nmbre_cmpo": "CDGO_IMPSTO_ACTO", "old": "' || :old.CDGO_IMPSTO_ACTO || '", "new": "' || :new.CDGO_IMPSTO_ACTO || '"},{"nmbre_cmpo": "NMBRE_IMPSTO_ACTO", "old": "' || :old.NMBRE_IMPSTO_ACTO || '", "new": "' || :new.NMBRE_IMPSTO_ACTO || '"},{"nmbre_cmpo": "ACTVO", "old": "' || :old.ACTVO || '", "new": "' || :new.ACTVO || '"},{"nmbre_cmpo": "TPO_DIAS", "old": "' || :old.TPO_DIAS || '", "new": "' || :new.TPO_DIAS || '"},{"nmbre_cmpo": "DIAS_MRGN_MRA", "old": "' || :old.DIAS_MRGN_MRA || '", "new": "' || :new.DIAS_MRGN_MRA || '"},{"nmbre_cmpo": "TXTO_BSE_GRVBLE", "old": "' || :old.TXTO_BSE_GRVBLE || '", "new": "' || :new.TXTO_BSE_GRVBLE || '"},{"nmbre_cmpo": "INDCDOR_LQDCION_PBLCO", "old": "' || :old.INDCDOR_LQDCION_PBLCO || '", "new": "' || :new.INDCDOR_LQDCION_PBLCO || '"},{"nmbre_cmpo": "INDCDOR_RQRE_ASCSDA", "old": "' || :old.INDCDOR_RQRE_ASCSDA || '", "new": "' || :new.INDCDOR_RQRE_ASCSDA || '"},{"nmbre_cmpo": "CDGO_UNDAD_TMPO", "old": "' || :old.CDGO_UNDAD_TMPO || '", "new": "' || :new.CDGO_UNDAD_TMPO || '"}]}';
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
							values(v_id_auditoria, 'DF_I_IMPUESTOS_ACTO', nvl(:new.ID_IMPSTO_ACTO, :old.ID_IMPSTO_ACTO),
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
ALTER TRIGGER "DF_I_IMPUESTOS_ACTO_AD" ENABLE;

