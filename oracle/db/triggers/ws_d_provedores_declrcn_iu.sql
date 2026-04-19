
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_D_PROVEDORES_DECLRCN_IU"
  for insert on ws_d_provedores_declrcn
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prvdor_dclrcion is null then

        d := sq_ws_d_provedores_declrcn.nextval;

        :new.id_prvdor_dclrcion := d;

      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "WS_D_PROVEDORES_DECLRCN_IU" ENABLE;

