
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_D_PRVDORS_DCLRCN_HMLGCN_IU"
  for insert on ws_d_prvdors_dclrcn_hmlgcn
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prvdor_dclrcion_hmlgcion is null then

        d := sq_ws_d_prvdors_dclrcn_hmlgcn.nextval;

        :new.id_prvdor_dclrcion_hmlgcion := d;

      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "WS_D_PRVDORS_DCLRCN_HMLGCN_IU" ENABLE;

