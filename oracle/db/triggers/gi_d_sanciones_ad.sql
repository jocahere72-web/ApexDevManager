
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_SANCIONES_AD" for insert or update or delete on GI_D_SANCIONES compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_SNCION", "old": "' || :old.ID_SNCION || '", "new": "' || :new.ID_SNCION || '"},{"nmbre_cmpo": "CDGO_CLNTE", "old": "' || :old.CDGO_CLNTE || '", "new": "' || :new.CDGO_CLNTE || '"},{"nmbre_cmpo": "VGNCIA", "old": "' || :old.VGNCIA || '", "new": "' || :new.VGNCIA || '"},{"nmbre_cmpo": "ID_PRDO", "old": "' || :old.ID_PRDO || '", "new": "' || :new.ID_PRDO || '"},{"nmbre_cmpo": "CDGO_SNCION_TPO", "old": "' || :old.CDGO_SNCION_TPO || '", "new": "' || :new.CDGO_SNCION_TPO || '"},{"nmbre_cmpo": "PRCNTJE_TRFA", "old": "' || :old.PRCNTJE_TRFA || '", "new": "' || :new.PRCNTJE_TRFA || '"},{"nmbre_cmpo": "PRCNTJE_MXMO_INGR_BRT", "old": "' || :old.PRCNTJE_MXMO_INGR_BRT || '", "new": "' || :new.PRCNTJE_MXMO_INGR_BRT || '"},{"nmbre_cmpo": "PRCNTJE_MXMO_IMPST_CRG", "old": "' || :old.PRCNTJE_MXMO_IMPST_CRG || '", "new": "' || :new.PRCNTJE_MXMO_IMPST_CRG || '"},{"nmbre_cmpo": "UNDAD_VLOR_SNCION_MNMO", "old": "' || :old.UNDAD_VLOR_SNCION_MNMO || '", "new": "' || :new.UNDAD_VLOR_SNCION_MNMO || '"},{"nmbre_cmpo": "ID_INDCDOR_ECNMCO", "old": "' || :old.ID_INDCDOR_ECNMCO || '", "new": "' || :new.ID_INDCDOR_ECNMCO || '"},{"nmbre_cmpo": "VLOR_SNCION_MNMO", "old": "' || :old.VLOR_SNCION_MNMO || '", "new": "' || :new.VLOR_SNCION_MNMO || '"},{"nmbre_cmpo": "ID_IMPSTO", "old": "' || :old.ID_IMPSTO || '", "new": "' || :new.ID_IMPSTO || '"},{"nmbre_cmpo": "ID_IMPSTO_SBMPSTO", "old": "' || :old.ID_IMPSTO_SBMPSTO || '", "new": "' || :new.ID_IMPSTO_SBMPSTO || '"},{"nmbre_cmpo": "PRCNTJE_TRFA_INGRSO_BRTO", "old": "' || :old.PRCNTJE_TRFA_INGRSO_BRTO || '", "new": "' || :new.PRCNTJE_TRFA_INGRSO_BRTO || '"},{"nmbre_cmpo": "AUMNT_PRCNTJ_X_DCLRCN_INC_EXTM", "old": "' || :old.AUMNT_PRCNTJ_X_DCLRCN_INC_EXTM || '", "new": "' || :new.AUMNT_PRCNTJ_X_DCLRCN_INC_EXTM || '"},{"nmbre_cmpo": "PRCNTJE_TRFA_EMPL", "old": "' || :old.PRCNTJE_TRFA_EMPL || '", "new": "' || :new.PRCNTJE_TRFA_EMPL || '"},{"nmbre_cmpo": "PRCNTJE_MXMO_INGR_BRT_EMPL", "old": "' || :old.PRCNTJE_MXMO_INGR_BRT_EMPL || '", "new": "' || :new.PRCNTJE_MXMO_INGR_BRT_EMPL || '"},{"nmbre_cmpo": "PRCNTJE_MXMO_IMPST_CRG_EMPL", "old": "' || :old.PRCNTJE_MXMO_IMPST_CRG_EMPL || '", "new": "' || :new.PRCNTJE_MXMO_IMPST_CRG_EMPL || '"},{"nmbre_cmpo": "PRCNTJE_TRFA_INGRSO_BRTO_EMPL", "old": "' || :old.PRCNTJE_TRFA_INGRSO_BRTO_EMPL || '", "new": "' || :new.PRCNTJE_TRFA_INGRSO_BRTO_EMPL || '"}]}';
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
							values(v_id_auditoria, 'GI_D_SANCIONES', nvl(:new.ID_SNCION, :old.ID_SNCION),
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
ALTER TRIGGER "GI_D_SANCIONES_AD" ENABLE;

