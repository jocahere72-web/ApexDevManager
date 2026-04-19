
  CREATE OR REPLACE EDITIONABLE TRIGGER "CB_G_PRCSOS_JRDCO_DCMNT_ERR_IU"
  for insert on cb_g_prcsos_jrdco_dcmnt_err
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prcso_jrdco_dcmnto_error is null then
        d := sq_cb_g_prcsos_jrdco_dcmnt_err.nextval;
        :new.id_prcso_jrdco_dcmnto_error := d;
        :new.fcha_rgstro := systimestamp;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "CB_G_PRCSOS_JRDCO_DCMNT_ERR_IU" ENABLE;

