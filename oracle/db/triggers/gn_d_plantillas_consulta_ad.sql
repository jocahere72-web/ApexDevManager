
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_D_PLANTILLAS_CONSULTA_AD"
  for insert or update or delete on GN_D_PLANTILLAS_CONSULTA
  compound trigger

  v_id_auditoria ad_g_audit_trail.id_auditoria%type;
  v_json         clob;
  v_tpo_oprcion  varchar2(1);
  v_operacion    varchar2(50);
  after each row is
  begin
    --if inserting then
    case true
      when inserting then
        v_tpo_oprcion := 'I';
        v_operacion   := 'Insercion';
      when updating then
        v_tpo_oprcion := 'U';
        v_operacion   := 'Actualizacion';
      else
        v_tpo_oprcion := 'D';
        v_operacion   := 'Eliminacion';
    end case;
    v_json := '{"operacion": "' || v_operacion ||
              '", "campos": [{"nmbre_cmpo": "ID_PLNTLLA_CNSLTA", "old": "' ||
              :old.ID_PLNTLLA_CNSLTA || '", "new": "' ||
              :new.ID_PLNTLLA_CNSLTA ||
              '"},{"nmbre_cmpo": "ID_PLNTLLA", "old": "' || :old.ID_PLNTLLA ||
              '", "new": "' || :new.ID_PLNTLLA ||
              '"},{"nmbre_cmpo": "DSCRPCION", "old": "' || :old.DSCRPCION ||
              '", "new": "' || :new.DSCRPCION ||
              '"},{"nmbre_cmpo": "CNSLTA", "old": "' || :old.CNSLTA ||
              '", "new": "' || :new.CNSLTA ||
              '"},{"nmbre_cmpo": "PRMTROS", "old": "' || :old.PRMTROS ||
              '", "new": "' || :new.PRMTROS ||
              '"},{"nmbre_cmpo": "DSCRPCION_CRTA", "old": "' ||
              :old.DSCRPCION_CRTA || '", "new": "' || :new.DSCRPCION_CRTA ||
              '"},{"nmbre_cmpo": "TPO_CNSLTA", "old": "' || :old.TPO_CNSLTA ||
              '", "new": "' || :new.TPO_CNSLTA || '"}]}';
    select nvl(max(id_auditoria) + 1, 1)
      into v_id_auditoria
      from ad_g_audit_trail;

    insert into ad_g_audit_trail
      (id_auditoria,
       nmbre_tbla,
       id_llve_prmria,
       tpo_oprcion,
       json,
       usrio,
       fecha,
       host,
       ip_address,
       server_host,
       os_user,
       terminal,
       authentication_method,
       proxy_user,
       proxy_userid)
    values
      (v_id_auditoria,
       'GN_D_PLANTILLAS_CONSULTA',
       nvl(:new.ID_PLNTLLA_CNSLTA, :old.ID_PLNTLLA_CNSLTA),
       v_tpo_oprcion,
       v_json,
       coalesce(sys_context('APEX$SESSION', 'app_user'),
                regexp_substr(sys_context('userenv', 'client_identifier'),
                              '^[^:]*'),
                sys_context('userenv', 'session_user')),
       systimestamp,
       sys_context('userenv', 'host'),
       sys_context('userenv', 'ip_address'),
       sys_context('userenv', 'server_host'),
       sys_context('userenv', 'os_user'),
       sys_context('userenv', 'terminal'),
       sys_context('userenv', 'authentication_method'),
       sys_context('userenv', 'proxy_user'),
       sys_context('userenv', 'proxy_userid'));

    --elsif updating then
    --  null;
    --end if;
  end after each row;

end;


/
ALTER TRIGGER "GN_D_PLANTILLAS_CONSULTA_AD" ENABLE;

