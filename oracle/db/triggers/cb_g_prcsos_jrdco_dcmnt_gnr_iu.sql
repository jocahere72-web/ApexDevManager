
  CREATE OR REPLACE EDITIONABLE TRIGGER "CB_G_PRCSOS_JRDCO_DCMNT_GNR_IU"
  for insert on cb_g_prcsos_jrdco_dcmnt_gnr
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prcsos_jrdco_dcmnto_gnrar is null then
        d := sq_cb_g_prcsos_jrdco_dcmnt_gnr.nextval;
        :new.id_prcsos_jrdco_dcmnto_gnrar := d;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "CB_G_PRCSOS_JRDCO_DCMNT_GNR_IU" ENABLE;

