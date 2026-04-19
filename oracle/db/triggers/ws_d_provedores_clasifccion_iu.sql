
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_D_PROVEDORES_CLASIFCCION_IU"
  for insert on ws_d_provedores_clasifccion
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prvdor_clsfccion is null then
        d := sq_ws_d_provedores_clasifccion.nextval();
        :new.id_prvdor_clsfccion := d;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "WS_D_PROVEDORES_CLASIFCCION_IU" ENABLE;

