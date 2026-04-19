
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_REVOCATORIA_METODO_AD" for insert or update or delete on GF_D_REVOCATORIA_METODO compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_RVCTRIA_MTDO", "old": "' || :old.ID_RVCTRIA_MTDO || '", "new": "' || :new.ID_RVCTRIA_MTDO || '"},{"nmbre_cmpo": "CDGO_CLNTE", "old": "' || :old.CDGO_CLNTE || '", "new": "' || :new.CDGO_CLNTE || '"},{"nmbre_cmpo": "DSCRPCION", "old": "' || :old.DSCRPCION || '", "new": "' || :new.DSCRPCION || '"},{"nmbre_cmpo": "CDGO_RVCTRIA_TPO", "old": "' || :old.CDGO_RVCTRIA_TPO || '", "new": "' || :new.CDGO_RVCTRIA_TPO || '"},{"nmbre_cmpo": "ID_ACTO_TPO_INCMPLMNTO", "old": "' || :old.ID_ACTO_TPO_INCMPLMNTO || '", "new": "' || :new.ID_ACTO_TPO_INCMPLMNTO || '"},{"nmbre_cmpo": "NMRO_CTAS", "old": "' || :old.NMRO_CTAS || '", "new": "' || :new.NMRO_CTAS || '"},{"nmbre_cmpo": "NMRO_DIAS_VNCMNTO", "old": "' || :old.NMRO_DIAS_VNCMNTO || '", "new": "' || :new.NMRO_DIAS_VNCMNTO || '"},{"nmbre_cmpo": "NMRO_OFCIOS_EMTDO_RVOCAR", "old": "' || :old.NMRO_OFCIOS_EMTDO_RVOCAR || '", "new": "' || :new.NMRO_OFCIOS_EMTDO_RVOCAR || '"},{"nmbre_cmpo": "INDCDOR_MSMA_CTA_OFCIO", "old": "' || :old.INDCDOR_MSMA_CTA_OFCIO || '", "new": "' || :new.INDCDOR_MSMA_CTA_OFCIO || '"},{"nmbre_cmpo": "ID_ACTO_TPO_RVCTRIA", "old": "' || :old.ID_ACTO_TPO_RVCTRIA || '", "new": "' || :new.ID_ACTO_TPO_RVCTRIA || '"},{"nmbre_cmpo": "ACTVO", "old": "' || :old.ACTVO || '", "new": "' || :new.ACTVO || '"},{"nmbre_cmpo": "INDCDOR_APLCA_RVCTRIA_INMDTA", "old": "' || :old.INDCDOR_APLCA_RVCTRIA_INMDTA || '", "new": "' || :new.INDCDOR_APLCA_RVCTRIA_INMDTA || '"},{"nmbre_cmpo": "INDCDOR_VLDA_PGO_CTA", "old": "' || :old.INDCDOR_VLDA_PGO_CTA || '", "new": "' || :new.INDCDOR_VLDA_PGO_CTA || '"}]}';
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
							values(v_id_auditoria, 'GF_D_REVOCATORIA_METODO', nvl(:new.ID_RVCTRIA_MTDO, :old.ID_RVCTRIA_MTDO),
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
ALTER TRIGGER "GF_D_REVOCATORIA_METODO_AD" ENABLE;

