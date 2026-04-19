
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_D_PRVDRES_RSPNSBLE_TPO_IU"
  for insert on ws_d_prvdres_rspnsble_tpo
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prvdor_rspnsble_tpo is null then
        d := sq_ws_d_prvdres_rspnsble_tpo.nextval();
        :new.id_prvdor_rspnsble_tpo := d;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "WS_D_PRVDRES_RSPNSBLE_TPO_IU" ENABLE;

