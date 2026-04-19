
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_D_PROVEDORES_DCLRCN_ITM_IU"
  for insert on ws_d_provedores_dclrcn_itm
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prvdor_dclrcion_itm is null then

        d := sq_ws_d_provedores_dclrcn_itm.nextval;

        :new.id_prvdor_dclrcion_itm := d;

      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "WS_D_PROVEDORES_DCLRCN_ITM_IU" ENABLE;

