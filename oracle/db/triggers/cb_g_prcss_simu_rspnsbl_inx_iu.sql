
  CREATE OR REPLACE EDITIONABLE TRIGGER "CB_G_PRCSS_SIMU_RSPNSBL_INX_IU"
  for insert on cb_g_prcss_simu_rspnsbl_inx
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prcsos_smu_rspnsbl_inx is null then
        d := sq_cb_g_prcss_simu_rspnsbl_inx.nextval();
        :new.id_prcsos_smu_rspnsbl_inx := d;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "CB_G_PRCSS_SIMU_RSPNSBL_INX_IU" ENABLE;

