
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_PREDIOS_CALCULO_USO_AD" for insert or update or delete on GI_D_PREDIOS_CALCULO_USO compound trigger

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
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_PRDIO_CLCLO_USO", "old": "' || :old.ID_PRDIO_CLCLO_USO || '", "new": "' || :new.ID_PRDIO_CLCLO_USO || '"},{"nmbre_cmpo": "CDGO_CLNTE", "old": "' || :old.CDGO_CLNTE || '", "new": "' || :new.CDGO_CLNTE || '"},{"nmbre_cmpo": "ID_IMPSTO", "old": "' || :old.ID_IMPSTO || '", "new": "' || :new.ID_IMPSTO || '"},{"nmbre_cmpo": "ID_IMPSTO_SBMPSTO", "old": "' || :old.ID_IMPSTO_SBMPSTO || '", "new": "' || :new.ID_IMPSTO_SBMPSTO || '"},{"nmbre_cmpo": "FCHA_INCIAL", "old": "' || :old.FCHA_INCIAL || '", "new": "' || :new.FCHA_INCIAL || '"},{"nmbre_cmpo": "FCHA_FNAL", "old": "' || :old.FCHA_FNAL || '", "new": "' || :new.FCHA_FNAL || '"},{"nmbre_cmpo": "CDGO_PRDIO_CLSFCCION", "old": "' || :old.CDGO_PRDIO_CLSFCCION || '", "new": "' || :new.CDGO_PRDIO_CLSFCCION || '"},{"nmbre_cmpo": "CDGO_DSTNO_IGAC", "old": "' || :old.CDGO_DSTNO_IGAC || '", "new": "' || :new.CDGO_DSTNO_IGAC || '"},{"nmbre_cmpo": "INDCDOR_CLCLO_AREA", "old": "' || :old.INDCDOR_CLCLO_AREA || '", "new": "' || :new.INDCDOR_CLCLO_AREA || '"},{"nmbre_cmpo": "ID_PRDIO_USO_SLO", "old": "' || :old.ID_PRDIO_USO_SLO || '", "new": "' || :new.ID_PRDIO_USO_SLO || '"},{"nmbre_cmpo": "AREA_TRRNO_MNMA", "old": "' || :old.AREA_TRRNO_MNMA || '", "new": "' || :new.AREA_TRRNO_MNMA || '"},{"nmbre_cmpo": "AREA_TRRNO_MXMA", "old": "' || :old.AREA_TRRNO_MXMA || '", "new": "' || :new.AREA_TRRNO_MXMA || '"},{"nmbre_cmpo": "AREA_CNSCTRDA_MNMA", "old": "' || :old.AREA_CNSCTRDA_MNMA || '", "new": "' || :new.AREA_CNSCTRDA_MNMA || '"},{"nmbre_cmpo": "AREA_CNSCTRDA_MXMA", "old": "' || :old.AREA_CNSCTRDA_MXMA || '", "new": "' || :new.AREA_CNSCTRDA_MXMA || '"},{"nmbre_cmpo": "PRCNTJE_MNMO", "old": "' || :old.PRCNTJE_MNMO || '", "new": "' || :new.PRCNTJE_MNMO || '"},{"nmbre_cmpo": "PRCNTJE_MXMO", "old": "' || :old.PRCNTJE_MXMO || '", "new": "' || :new.PRCNTJE_MXMO || '"}]}';
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
							values(v_id_auditoria, 'GI_D_PREDIOS_CALCULO_USO', nvl(:new.ID_PRDIO_CLCLO_USO, :old.ID_PRDIO_CLCLO_USO),
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
ALTER TRIGGER "GI_D_PREDIOS_CALCULO_USO_AD" ENABLE;

