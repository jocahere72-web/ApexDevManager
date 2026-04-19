
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_G_USUARIOS_WEBSERVICE_IU"
  for insert on ws_g_usuarios_webservice
  compound trigger  d number;

  before each row is
  begin
    if inserting then
      if :new.id_usrio_wbsrvce is null then

        d                     := sq_ws_g_usuarios_webservice.nextval();
        :new.id_usrio_wbsrvce := d;

      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "WS_G_USUARIOS_WEBSERVICE_IU" ENABLE;

