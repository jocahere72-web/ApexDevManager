
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_D_USUARIOS_CUENTA_IMPUESTO_IU"
  for insert on ws_d_usuarios_cuenta_impuesto
  compound trigger  d number;

  before each row is
  begin
    if inserting then
      if :new.id_usrios_cnta_impsto is null then

        d                          := sq_ws_d_usuarios_cuenta_impsto.nextval();
        :new.id_usrios_cnta_impsto := d;

      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "WS_D_USUARIOS_CUENTA_IMPUESTO_IU" ENABLE;

