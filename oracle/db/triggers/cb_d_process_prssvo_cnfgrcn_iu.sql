
  CREATE OR REPLACE EDITIONABLE TRIGGER "CB_D_PROCESS_PRSSVO_CNFGRCN_IU"
  for insert on cb_d_process_prssvo_cnfgrcn
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prcso_prssvo_cnfgrcion is null then
        d := sq_cb_d_process_prssvo_cnfgrcn.nextval();
        :new.id_prcso_prssvo_cnfgrcion := d;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "CB_D_PROCESS_PRSSVO_CNFGRCN_IU" ENABLE;

