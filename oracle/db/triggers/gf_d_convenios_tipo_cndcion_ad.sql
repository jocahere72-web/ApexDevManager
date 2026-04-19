
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_CONVENIOS_TIPO_CNDCION_AD" for insert or update or delete on GF_D_CONVENIOS_TIPO_CNDCION compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_CNVNIO_TPO_CNDCION", "old": "' || :old.ID_CNVNIO_TPO_CNDCION || '", "new": "' || :new.ID_CNVNIO_TPO_CNDCION || '"},{"nmbre_cmpo": "ID_CNVNIO_TPO", "old": "' || :old.ID_CNVNIO_TPO || '", "new": "' || :new.ID_CNVNIO_TPO || '"},{"nmbre_cmpo": "ID_CNVNIO_ATRBTO", "old": "' || :old.ID_CNVNIO_ATRBTO || '", "new": "' || :new.ID_CNVNIO_ATRBTO || '"},{"nmbre_cmpo": "ID_OPRDOR_TPO", "old": "' || :old.ID_OPRDOR_TPO || '", "new": "' || :new.ID_OPRDOR_TPO || '"},{"nmbre_cmpo": "VLOR1", "old": "' || :old.VLOR1 || '", "new": "' || :new.VLOR1 || '"},{"nmbre_cmpo": "VLOR2", "old": "' || :old.VLOR2 || '", "new": "' || :new.VLOR2 || '"},{"nmbre_cmpo": "CMPRTA_LGCA", "old": "' || :old.CMPRTA_LGCA || '", "new": "' || :new.CMPRTA_LGCA || '"},{"nmbre_cmpo": "ORDEN_AGRPCION", "old": "' || :old.ORDEN_AGRPCION || '", "new": "' || :new.ORDEN_AGRPCION || '"}]}';
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
							values(v_id_auditoria, 'GF_D_CONVENIOS_TIPO_CNDCION', nvl(:new.ID_CNVNIO_TPO_CNDCION, :old.ID_CNVNIO_TPO_CNDCION),
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
ALTER TRIGGER "GF_D_CONVENIOS_TIPO_CNDCION_AD" ENABLE;

