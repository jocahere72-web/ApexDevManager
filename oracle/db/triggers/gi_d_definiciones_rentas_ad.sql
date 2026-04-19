
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_DEFINICIONES_RENTAS_AD" for insert or update or delete on GI_D_DEFINICIONES_RENTAS compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_DFNCION_RNTA", "old": "' || :old.ID_DFNCION_RNTA || '", "new": "' || :new.ID_DFNCION_RNTA || '"},{"nmbre_cmpo": "CDGO_CLNTE", "old": "' || :old.CDGO_CLNTE || '", "new": "' || :new.CDGO_CLNTE || '"},{"nmbre_cmpo": "INDCDOR_USA_MXTO", "old": "' || :old.INDCDOR_USA_MXTO || '", "new": "' || :new.INDCDOR_USA_MXTO || '"},{"nmbre_cmpo": "PRCNTJE_LQDCION_PRVDO", "old": "' || :old.PRCNTJE_LQDCION_PRVDO || '", "new": "' || :new.PRCNTJE_LQDCION_PRVDO || '"},{"nmbre_cmpo": "PRCNTJE_LQDCION_PBLCO", "old": "' || :old.PRCNTJE_LQDCION_PBLCO || '", "new": "' || :new.PRCNTJE_LQDCION_PBLCO || '"},{"nmbre_cmpo": "INDCDOR_USA_EXTRNJRO", "old": "' || :old.INDCDOR_USA_EXTRNJRO || '", "new": "' || :new.INDCDOR_USA_EXTRNJRO || '"},{"nmbre_cmpo": "TPO_DIAS", "old": "' || :old.TPO_DIAS || '", "new": "' || :new.TPO_DIAS || '"},{"nmbre_cmpo": "DIAS_MRGN_MRA", "old": "' || :old.DIAS_MRGN_MRA || '", "new": "' || :new.DIAS_MRGN_MRA || '"},{"nmbre_cmpo": "LBEL_FCHA_EXPDCION", "old": "' || :old.LBEL_FCHA_EXPDCION || '", "new": "' || :new.LBEL_FCHA_EXPDCION || '"}]}';
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
							values(v_id_auditoria, 'GI_D_DEFINICIONES_RENTAS', nvl(:new.ID_DFNCION_RNTA, :old.ID_DFNCION_RNTA),
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
ALTER TRIGGER "GI_D_DEFINICIONES_RENTAS_AD" ENABLE;

