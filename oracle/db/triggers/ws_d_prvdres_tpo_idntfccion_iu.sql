
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_D_PRVDRES_TPO_IDNTFCCION_IU"
  for insert on ws_d_prvdres_tpo_idntfccion
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prvdor_tpo_idntfccion is null then
        d := sq_ws_d_prvdres_tpo_idntfccion.nextval();
        :new.id_prvdor_tpo_idntfccion := d;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "WS_D_PRVDRES_TPO_IDNTFCCION_IU" ENABLE;

