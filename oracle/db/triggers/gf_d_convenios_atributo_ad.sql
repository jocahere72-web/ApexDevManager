
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_CONVENIOS_ATRIBUTO_AD" for insert or update or delete on GF_D_CONVENIOS_ATRIBUTO compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_CNVNIO_ATRBTO", "old": "' || :old.ID_CNVNIO_ATRBTO || '", "new": "' || :new.ID_CNVNIO_ATRBTO || '"},{"nmbre_cmpo": "CDGO_CLNTE", "old": "' || :old.CDGO_CLNTE || '", "new": "' || :new.CDGO_CLNTE || '"},{"nmbre_cmpo": "CDGO_SJTO_TPO", "old": "' || :old.CDGO_SJTO_TPO || '", "new": "' || :new.CDGO_SJTO_TPO || '"},{"nmbre_cmpo": "NMBRE", "old": "' || :old.NMBRE || '", "new": "' || :new.NMBRE || '"},{"nmbre_cmpo": "DSCRPCION", "old": "' || :old.DSCRPCION || '", "new": "' || :new.DSCRPCION || '"},{"nmbre_cmpo": "TOOLTIP", "old": "' || :old.TOOLTIP || '", "new": "' || :new.TOOLTIP || '"},{"nmbre_cmpo": "NMBRE_TBLA", "old": "' || :old.NMBRE_TBLA || '", "new": "' || :new.NMBRE_TBLA || '"},{"nmbre_cmpo": "NMBRE_CLMNA", "old": "' || :old.NMBRE_CLMNA || '", "new": "' || :new.NMBRE_CLMNA || '"},{"nmbre_cmpo": "TPO_DTO", "old": "' || :old.TPO_DTO || '", "new": "' || :new.TPO_DTO || '"},{"nmbre_cmpo": "TPO_OBJTO", "old": "' || :old.TPO_OBJTO || '", "new": "' || :new.TPO_OBJTO || '"},{"nmbre_cmpo": "SLCT_TPO", "old": "' || :old.SLCT_TPO || '", "new": "' || :new.SLCT_TPO || '"},{"nmbre_cmpo": "CNSLTA_SLCT", "old": "' || :old.CNSLTA_SLCT || '", "new": "' || :new.CNSLTA_SLCT || '"},{"nmbre_cmpo": "CLMNA_MSTRA", "old": "' || :old.CLMNA_MSTRA || '", "new": "' || :new.CLMNA_MSTRA || '"},{"nmbre_cmpo": "CLMNA_RTRNO", "old": "' || :old.CLMNA_RTRNO || '", "new": "' || :new.CLMNA_RTRNO || '"},{"nmbre_cmpo": "VLOR_DFCTO", "old": "' || :old.VLOR_DFCTO || '", "new": "' || :new.VLOR_DFCTO || '"},{"nmbre_cmpo": "ACTVO", "old": "' || :old.ACTVO || '", "new": "' || :new.ACTVO || '"}]}';
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
							values(v_id_auditoria, 'GF_D_CONVENIOS_ATRIBUTO', nvl(:new.ID_CNVNIO_ATRBTO, :old.ID_CNVNIO_ATRBTO),
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
ALTER TRIGGER "GF_D_CONVENIOS_ATRIBUTO_AD" ENABLE;

