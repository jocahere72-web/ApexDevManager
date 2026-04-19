
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_PRESCRIPCIONES_DCMNTO_AD" for insert or update or delete on GF_D_PRESCRIPCIONES_DCMNTO compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_PRSCRPCN_DCMNTO", "old": "' || :old.ID_PRSCRPCN_DCMNTO || '", "new": "' || :new.ID_PRSCRPCN_DCMNTO || '"},{"nmbre_cmpo": "ID_PRSCRPCION_TPO", "old": "' || :old.ID_PRSCRPCION_TPO || '", "new": "' || :new.ID_PRSCRPCION_TPO || '"},{"nmbre_cmpo": "CDGO_RSPSTA", "old": "' || :old.CDGO_RSPSTA || '", "new": "' || :new.CDGO_RSPSTA || '"},{"nmbre_cmpo": "ID_ACTOS_TPO_TREA", "old": "' || :old.ID_ACTOS_TPO_TREA || '", "new": "' || :new.ID_ACTOS_TPO_TREA || '"},{"nmbre_cmpo": "ID_FLJO_TREA_CNFRMCION", "old": "' || :old.ID_FLJO_TREA_CNFRMCION || '", "new": "' || :new.ID_FLJO_TREA_CNFRMCION || '"},{"nmbre_cmpo": "INDCDOR_RSLVE_PRSCRPCION", "old": "' || :old.INDCDOR_RSLVE_PRSCRPCION || '", "new": "' || :new.INDCDOR_RSLVE_PRSCRPCION || '"},{"nmbre_cmpo": "ORDEN", "old": "' || :old.ORDEN || '", "new": "' || :new.ORDEN || '"}]}';
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
							values(v_id_auditoria, 'GF_D_PRESCRIPCIONES_DCMNTO', nvl(:new.ID_PRSCRPCN_DCMNTO, :old.ID_PRSCRPCN_DCMNTO),
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
ALTER TRIGGER "GF_D_PRESCRIPCIONES_DCMNTO_AD" ENABLE;

