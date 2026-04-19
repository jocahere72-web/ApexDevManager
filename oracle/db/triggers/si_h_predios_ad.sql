
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_H_PREDIOS_AD" for insert or update or delete on SI_H_PREDIOS compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_PRDIO_HSTRCO", "old": "' || :old.ID_PRDIO_HSTRCO || '", "new": "' || :new.ID_PRDIO_HSTRCO || '"},{"nmbre_cmpo": "ID_SJTO_IMPSTO", "old": "' || :old.ID_SJTO_IMPSTO || '", "new": "' || :new.ID_SJTO_IMPSTO || '"},{"nmbre_cmpo": "ID_PRDIO_DSTNO", "old": "' || :old.ID_PRDIO_DSTNO || '", "new": "' || :new.ID_PRDIO_DSTNO || '"},{"nmbre_cmpo": "CDGO_ESTRTO", "old": "' || :old.CDGO_ESTRTO || '", "new": "' || :new.CDGO_ESTRTO || '"},{"nmbre_cmpo": "CDGO_DSTNO_IGAC", "old": "' || :old.CDGO_DSTNO_IGAC || '", "new": "' || :new.CDGO_DSTNO_IGAC || '"},{"nmbre_cmpo": "CDGO_PRDIO_CLSFCCION", "old": "' || :old.CDGO_PRDIO_CLSFCCION || '", "new": "' || :new.CDGO_PRDIO_CLSFCCION || '"},{"nmbre_cmpo": "ID_PRDIO_USO_SLO", "old": "' || :old.ID_PRDIO_USO_SLO || '", "new": "' || :new.ID_PRDIO_USO_SLO || '"},{"nmbre_cmpo": "AVLUO_CTSTRAL", "old": "' || :old.AVLUO_CTSTRAL || '", "new": "' || :new.AVLUO_CTSTRAL || '"},{"nmbre_cmpo": "AVLUO_CMRCIAL", "old": "' || :old.AVLUO_CMRCIAL || '", "new": "' || :new.AVLUO_CMRCIAL || '"},{"nmbre_cmpo": "AREA_TRRNO", "old": "' || :old.AREA_TRRNO || '", "new": "' || :new.AREA_TRRNO || '"},{"nmbre_cmpo": "AREA_CNSTRDA", "old": "' || :old.AREA_CNSTRDA || '", "new": "' || :new.AREA_CNSTRDA || '"},{"nmbre_cmpo": "AREA_GRVBLE", "old": "' || :old.AREA_GRVBLE || '", "new": "' || :new.AREA_GRVBLE || '"},{"nmbre_cmpo": "MTRCLA_INMBLRIA", "old": "' || :old.MTRCLA_INMBLRIA || '", "new": "' || :new.MTRCLA_INMBLRIA || '"},{"nmbre_cmpo": "INDCDOR_PRDIO_MNCPIO", "old": "' || :old.INDCDOR_PRDIO_MNCPIO || '", "new": "' || :new.INDCDOR_PRDIO_MNCPIO || '"},{"nmbre_cmpo": "ID_ENTDAD", "old": "' || :old.ID_ENTDAD || '", "new": "' || :new.ID_ENTDAD || '"},{"nmbre_cmpo": "ID_BRRIO", "old": "' || :old.ID_BRRIO || '", "new": "' || :new.ID_BRRIO || '"},{"nmbre_cmpo": "ID_SJTO_ESTDO", "old": "' || :old.ID_SJTO_ESTDO || '", "new": "' || :new.ID_SJTO_ESTDO || '"},{"nmbre_cmpo": "ID_PRDO", "old": "' || :old.ID_PRDO || '", "new": "' || :new.ID_PRDO || '"}]}';
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
							values(v_id_auditoria, 'SI_H_PREDIOS', nvl(:new.ID_PRDIO_HSTRCO, :old.ID_PRDIO_HSTRCO),
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
ALTER TRIGGER "SI_H_PREDIOS_AD" ENABLE;

