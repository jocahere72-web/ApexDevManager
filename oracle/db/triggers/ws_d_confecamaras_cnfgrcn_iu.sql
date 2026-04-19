
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_D_CONFECAMARAS_CNFGRCN_IU"
  for insert on ws_d_confecamaras_cnfgrcn
  compound trigger  d number;

  before each row is
  begin
    if inserting then
      if :new.id_cnfcmra_cnfgrcion is null then
        d                         := sq_ws_d_confecamaras_cnfgrcn.nextval();
        :new.id_cnfcmra_cnfgrcion := d;
      end if;
    end if;
  end before each row;
end;


/
ALTER TRIGGER "WS_D_CONFECAMARAS_CNFGRCN_IU" ENABLE;

