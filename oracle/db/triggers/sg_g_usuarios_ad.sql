
  CREATE OR REPLACE EDITIONABLE TRIGGER "SG_G_USUARIOS_AD"
  for insert or update on sg_g_usuarios
  compound trigger  v_id_auditoria ad_g_audit_trail.id_auditoria%type;
  v_json         varchar2(4000);
  x              varchar2(1000);
  after each row is
  begin
    select regexp_substr(sys_context('userenv', 'client_identifier'),
                         '^[^:]*')
      into x
      from dual;
    v_json := '{"operacion": "Insert", "campos": [{"nmbre_cmpo": "ID_USRIO", "old": "' ||
              :old.id_usrio || '", "new": "' || :new.id_usrio ||
              '"},{"nmbre_cmpo": "USER_NAME", "old": "' || :old.user_name ||
              '", "new": "' || :new.user_name ||
              '"},{"nmbre_cmpo": "ID_TRCRO", "old": "' || :old.id_trcro ||
              '", "new": "' || :new.id_trcro ||
              '"},{"nmbre_cmpo": "FCHA_CRCION", "old": "' ||
              :old.fcha_crcion || '", "new": "' || :new.fcha_crcion ||
              '"},{"nmbre_cmpo": "ADMIN", "old": "' || :old.admin ||
              '", "new": "' || :new.admin ||
              '"},{"nmbre_cmpo": "ADMIN_RNION", "old": "' ||
              :old.admin_rnion || '", "new": "' || :new.admin_rnion ||
              '"},{"nmbre_cmpo": "PASSWORD", "old": "' || :old.password ||
              '", "new": "' || :new.password ||
              '"},{"nmbre_cmpo": "FCHA_EXPRCION", "old": "' ||
              :old.fcha_exprcion || '", "new": "' || :new.fcha_exprcion ||
              '"},{"nmbre_cmpo": "ACTVO", "old": "' || :old.actvo ||
              '", "new": "' || :new.actvo ||
              '"},{"nmbre_cmpo": "USERNAME_DIGITA", "old": "' ||
              :old.username_digita || '", "new": "' || :new.username_digita ||
              '"},{"nmbre_cmpo": "FECHA_DIGITA", "old": "' ||
              :old.fecha_digita || '", "new": "' || :new.fecha_digita ||
              '"},{"nmbre_cmpo": "USERNAME_MODIFICA", "old": "' ||
              :old.username_modifica || '", "new": "' ||
              :new.username_modifica ||
              '"},{"nmbre_cmpo": "FECHA_MODIFICA", "old": "' ||
              :old.fecha_modifica || '", "new": "' || :new.fecha_modifica ||
              '"}]}';
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
       'SG_G_USUARIOS',
       :new.id_usrio,
       'I',
       v_json,
       coalesce(sys_context('APEX$SESSION', 'app_user'),
                x,
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
  end after each row;
end sg_g_usuarios_ad;


/
ALTER TRIGGER "SG_G_USUARIOS_AD" ENABLE;

