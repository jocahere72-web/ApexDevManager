
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_DECLARACIONES_ITEM_AD" for insert or update or delete on GI_D_DECLARACIONES_ITEM compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_DCLRCION_ITEM", "old": "' || :old.ID_DCLRCION_ITEM || '", "new": "' || :new.ID_DCLRCION_ITEM || '"},{"nmbre_cmpo": "CDGO_CLNTE", "old": "' || :old.CDGO_CLNTE || '", "new": "' || :new.CDGO_CLNTE || '"},{"nmbre_cmpo": "ID_IMPSTO", "old": "' || :old.ID_IMPSTO || '", "new": "' || :new.ID_IMPSTO || '"},{"nmbre_cmpo": "ID_IMPSTO_SBMPSTO", "old": "' || :old.ID_IMPSTO_SBMPSTO || '", "new": "' || :new.ID_IMPSTO_SBMPSTO || '"},{"nmbre_cmpo": "ID_TPO_FRMLRIO", "old": "' || :old.ID_TPO_FRMLRIO || '", "new": "' || :new.ID_TPO_FRMLRIO || '"},{"nmbre_cmpo": "VGNCIA", "old": "' || :old.VGNCIA || '", "new": "' || :new.VGNCIA || '"},{"nmbre_cmpo": "ID_PRDO", "old": "' || :old.ID_PRDO || '", "new": "' || :new.ID_PRDO || '"},{"nmbre_cmpo": "CDGO_DCLRCION", "old": "' || :old.CDGO_DCLRCION || '", "new": "' || :new.CDGO_DCLRCION || '"},{"nmbre_cmpo": "DSCRPCION", "old": "' || :old.DSCRPCION || '", "new": "' || :new.DSCRPCION || '"},{"nmbre_cmpo": "ID_CNCPTO", "old": "' || :old.ID_CNCPTO || '", "new": "' || :new.ID_CNCPTO || '"},{"nmbre_cmpo": "OPRCION", "old": "' || :old.OPRCION || '", "new": "' || :new.OPRCION || '"},{"nmbre_cmpo": "EDTBLE", "old": "' || :old.EDTBLE || '", "new": "' || :new.EDTBLE || '"}]}';
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
							values(v_id_auditoria, 'GI_D_DECLARACIONES_ITEM', nvl(:new.ID_DCLRCION_ITEM, :old.ID_DCLRCION_ITEM),
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
ALTER TRIGGER "GI_D_DECLARACIONES_ITEM_AD" ENABLE;

