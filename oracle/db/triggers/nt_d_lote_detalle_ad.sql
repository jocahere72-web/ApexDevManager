
  CREATE OR REPLACE EDITIONABLE TRIGGER "NT_D_LOTE_DETALLE_AD" for insert or update or delete on NT_D_LOTE_DETALLE compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_LTE_DTLLE", "old": "' || :old.ID_LTE_DTLLE || '", "new": "' || :new.ID_LTE_DTLLE || '"},{"nmbre_cmpo": "ID_LTE", "old": "' || :old.ID_LTE || '", "new": "' || :new.ID_LTE || '"},{"nmbre_cmpo": "ID_ACTO", "old": "' || :old.ID_ACTO || '", "new": "' || :new.ID_ACTO || '"},{"nmbre_cmpo": "ID_ACTO_RSPNSBLE", "old": "' || :old.ID_ACTO_RSPNSBLE || '", "new": "' || :new.ID_ACTO_RSPNSBLE || '"},{"nmbre_cmpo": "ID_NTFCCION_RSPNSBLE", "old": "' || :old.ID_NTFCCION_RSPNSBLE || '", "new": "' || :new.ID_NTFCCION_RSPNSBLE || '"},{"nmbre_cmpo": "NMRO_GUIA", "old": "' || :old.NMRO_GUIA || '", "new": "' || :new.NMRO_GUIA || '"},{"nmbre_cmpo": "CDGO_CSAL_ENTDAD", "old": "' || :old.CDGO_CSAL_ENTDAD || '", "new": "' || :new.CDGO_CSAL_ENTDAD || '"},{"nmbre_cmpo": "FCHA_NTFCCION", "old": "' || :old.FCHA_NTFCCION || '", "new": "' || :new.FCHA_NTFCCION || '"},{"nmbre_cmpo": "NMRO_IDNTFCCION", "old": "' || :old.NMRO_IDNTFCCION || '", "new": "' || :new.NMRO_IDNTFCCION || '"},{"nmbre_cmpo": "NMBRE_NTFCCION", "old": "' || :old.NMBRE_NTFCCION || '", "new": "' || :new.NMBRE_NTFCCION || '"},{"nmbre_cmpo": "ORDEN_SRVCIO", "old": "' || :old.ORDEN_SRVCIO || '", "new": "' || :new.ORDEN_SRVCIO || '"}]}';
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
							values(v_id_auditoria, 'NT_D_LOTE_DETALLE', nvl(:new.ID_LTE_DTLLE, :old.ID_LTE_DTLLE),
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
ALTER TRIGGER "NT_D_LOTE_DETALLE_AD" DISABLE;

