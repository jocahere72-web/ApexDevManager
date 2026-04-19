
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_PREDIOS_CONFIGURACION_AD"
for insert or update or delete on gi_d_predios_configuracion compound trigger

  v_id_auditoria  ad_g_audit_trail.id_auditoria%type;
  v_json      varchar2(4000);
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

    v_json := '{"operacion": "'|| v_operacion || '",
    "campos": [{"nmbre_cmpo": "ID_PRDIO_CNFGRCION", "old": "' || :old.ID_PRDIO_CNFGRCION || '", "new": "' || :new.ID_PRDIO_CNFGRCION || '"},
    {"nmbre_cmpo": "CDGO_CLNTE", "old": "' || :old.CDGO_CLNTE || '", "new": "' || :new.CDGO_CLNTE || '"},
    {"nmbre_cmpo": "INDCDOR_CLCLO_ESTRTO", "old": "' || :old.INDCDOR_CLCLO_ESTRTO || '", "new": "' || :new.INDCDOR_CLCLO_ESTRTO || '"},
    {"nmbre_cmpo": "INDCDOR_CLCLO_USO", "old": "' || :old.INDCDOR_CLCLO_USO || '", "new": "' || :new.INDCDOR_CLCLO_USO || '"},
    {"nmbre_cmpo": "USER_DGTA", "old": "' || :old.USER_DGTA || '", "new": "' || :new.USER_DGTA || '"},
    {"nmbre_cmpo": "FCHA_DGTA", "old": "' || :old.FCHA_DGTA || '", "new": "' || :new.FCHA_DGTA || '"},
    {"nmbre_cmpo": "USER_MDFCA", "old": "' || :old.USER_MDFCA || '", "new": "' || :new.USER_MDFCA || '"},
    {"nmbre_cmpo": "FCHA_MDFCA", "old": "' || :old.FCHA_MDFCA || '", "new": "' || :new.FCHA_MDFCA || '"}
    ]}';

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
    values(v_id_auditoria, 'GI_D_PREDIOS_CONFIGURACION', nvl(:new.ID_PRDIO_CNFGRCION, :old.ID_PRDIO_CNFGRCION),
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

  end after each row;
end;



/
ALTER TRIGGER "GI_D_PREDIOS_CONFIGURACION_AD" ENABLE;

