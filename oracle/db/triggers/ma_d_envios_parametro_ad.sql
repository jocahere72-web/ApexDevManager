
  CREATE OR REPLACE EDITIONABLE TRIGGER "MA_D_ENVIOS_PARAMETRO_AD"
  for INSERT OR DELETE OR UPDATE ON MA_D_ENVIOS_PARAMETRO
  compound trigger

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
                                    v_operacion   := 'Inserci¿n';
                                when updating then
                                    v_tpo_oprcion := 'U';
                                    v_operacion   := 'Actualizaci¿n';
                                else
                                    v_tpo_oprcion := 'D';
                                    v_operacion   := 'Eliminaci¿n';
                            end case;
                            v_json := '{operacion: '|| v_operacion || ', campos: [{nmbre_cmpo: ID_ENVIO_PRMTRO, old: ' || :old.ID_ENVIO_PRMTRO || ', new: ' || :new.ID_ENVIO_PRMTRO || '},{nmbre_cmpo: CDGO_CLNTE, old: ' || :old.CDGO_CLNTE || ', new: ' || :new.CDGO_CLNTE || '},{nmbre_cmpo: NMBRE, old: ' || :old.NMBRE || ', new: ' || :new.NMBRE || '},{nmbre_cmpo: PRMTRO, old: ' || :old.PRMTRO || ', new: ' || :new.PRMTRO || '},{nmbre_cmpo: ACTVO, old: ' || :old.ACTVO || ', new: ' || :new.ACTVO || '}]}';
              --select nvl(max--(id_auditoria)+1, 1) into v_id_auditoria from ad_g_audit_trail;

              select sq_ad_g_audit_trail.nextval into v_id_auditoria from dual;

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
              values(v_id_auditoria, 'MA_D_ENVIOS_PARAMETRO', nvl(:new.ID_ENVIO_PRMTRO, :old.ID_ENVIO_PRMTRO),
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
            --  null;
            --end if;
          end after each row;

          end;



/
ALTER TRIGGER "MA_D_ENVIOS_PARAMETRO_AD" ENABLE;

