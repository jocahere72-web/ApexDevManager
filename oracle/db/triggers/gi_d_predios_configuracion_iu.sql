
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_PREDIOS_CONFIGURACION_IU"
  for insert or update on gi_d_predios_configuracion
  compound trigger

  before each row is
  begin
    if inserting then
      :new.id_prdio_cnfgrcion := sq_gi_d_predios_configuracion.nextval;
            :new.user_dgta      := user;
      :new.fcha_dgta      := systimestamp;
    elsif updating then
      :new.user_mdfca := coalesce( sys_context('apex$session','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
      :new.fcha_mdfca := systimestamp;
    end if;
  end before each row;
end;



/
ALTER TRIGGER "GI_D_PREDIOS_CONFIGURACION_IU" ENABLE;

