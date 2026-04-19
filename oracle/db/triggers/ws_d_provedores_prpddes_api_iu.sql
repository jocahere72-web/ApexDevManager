
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_D_PROVEDORES_PRPDDES_API_IU"
  for insert on ws_d_provedores_prpddes_api
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prvdor_prpdde_api is null then

        d := sq_ws_d_provedores_prpddes_api.nextval;

        :new.id_prvdor_prpdde_api := d;

      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "WS_D_PROVEDORES_PRPDDES_API_IU" ENABLE;

