
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_D_CONSULTAS_DCLRCION_IU"
  for insert on ws_d_prvdor_cnslta_dclrcion
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_cnslta_dclrcion is null then

        d := sq_ws_d_consultas_dclrcion.nextval;

        :new.id_cnslta_dclrcion := d;

      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "WS_D_CONSULTAS_DCLRCION_IU" ENABLE;

