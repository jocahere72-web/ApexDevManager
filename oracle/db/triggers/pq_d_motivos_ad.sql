
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_D_MOTIVOS_AD" for insert or update or delete on PQ_D_MOTIVOS compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_MTVO", "old": "' || :old.ID_MTVO || '", "new": "' || :new.ID_MTVO || '"},{"nmbre_cmpo": "CDGO_CLNTE", "old": "' || :old.CDGO_CLNTE || '", "new": "' || :new.CDGO_CLNTE || '"},{"nmbre_cmpo": "ID_FLJO", "old": "' || :old.ID_FLJO || '", "new": "' || :new.ID_FLJO || '"},{"nmbre_cmpo": "ID_PRCSO", "old": "' || :old.ID_PRCSO || '", "new": "' || :new.ID_PRCSO || '"},{"nmbre_cmpo": "DSCRPCION", "old": "' || :old.DSCRPCION || '", "new": "' || :new.DSCRPCION || '"},{"nmbre_cmpo": "TPO_DIA", "old": "' || :old.TPO_DIA || '", "new": "' || :new.TPO_DIA || '"},{"nmbre_cmpo": "UNDAD_DRCION_PRYCTDA", "old": "' || :old.UNDAD_DRCION_PRYCTDA || '", "new": "' || :new.UNDAD_DRCION_PRYCTDA || '"},{"nmbre_cmpo": "DRCION_PRYCTDA", "old": "' || :old.DRCION_PRYCTDA || '", "new": "' || :new.DRCION_PRYCTDA || '"},{"nmbre_cmpo": "UNDAD_DRCION_LMTE_LEY", "old": "' || :old.UNDAD_DRCION_LMTE_LEY || '", "new": "' || :new.UNDAD_DRCION_LMTE_LEY || '"},{"nmbre_cmpo": "DRCION_LMTE_LEY", "old": "' || :old.DRCION_LMTE_LEY || '", "new": "' || :new.DRCION_LMTE_LEY || '"},{"nmbre_cmpo": "NTFCAR_RSPNSBLE", "old": "' || :old.NTFCAR_RSPNSBLE || '", "new": "' || :new.NTFCAR_RSPNSBLE || '"},{"nmbre_cmpo": "ACTVO", "old": "' || :old.ACTVO || '", "new": "' || :new.ACTVO || '"},{"nmbre_cmpo": "VLDAR_SJTO_IMPSTO", "old": "' || :old.VLDAR_SJTO_IMPSTO || '", "new": "' || :new.VLDAR_SJTO_IMPSTO || '"},{"nmbre_cmpo": "INDCDOR_RDCCION_ATMTCA", "old": "' || :old.INDCDOR_RDCCION_ATMTCA || '", "new": "' || :new.INDCDOR_RDCCION_ATMTCA || '"},{"nmbre_cmpo": "INDCDOR_ACMLDO_MTVO", "old": "' || :old.INDCDOR_ACMLDO_MTVO || '", "new": "' || :new.INDCDOR_ACMLDO_MTVO || '"},{"nmbre_cmpo": "INDCDOR_ACMLDO_SJTO_IMPSTO", "old": "' || :old.INDCDOR_ACMLDO_SJTO_IMPSTO || '", "new": "' || :new.INDCDOR_ACMLDO_SJTO_IMPSTO || '"},{"nmbre_cmpo": "INDCDOR_FCHA_RSPSTA", "old": "' || :old.INDCDOR_FCHA_RSPSTA || '", "new": "' || :new.INDCDOR_FCHA_RSPSTA || '"},{"nmbre_cmpo": "ID_TPO", "old": "' || :old.ID_TPO || '", "new": "' || :new.ID_TPO || '"},{"nmbre_cmpo": "INDCDOR_PRTAL", "old": "' || :old.INDCDOR_PRTAL || '", "new": "' || :new.INDCDOR_PRTAL || '"}]}';
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
							values(v_id_auditoria, 'PQ_D_MOTIVOS', nvl(:new.ID_MTVO, :old.ID_MTVO),
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
ALTER TRIGGER "PQ_D_MOTIVOS_AD" ENABLE;

