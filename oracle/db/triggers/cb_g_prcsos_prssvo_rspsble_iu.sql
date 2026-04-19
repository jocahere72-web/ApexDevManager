
  CREATE OR REPLACE EDITIONABLE TRIGGER "CB_G_PRCSOS_PRSSVO_RSPSBLE_IU"
  for insert on cb_g_prcsos_prssvo_rspsble
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prcsos_prssvo_rspnsble is null then
        d := sq_cb_g_prcsos_prssvo_rspsble.nextval();
        :new.id_prcsos_prssvo_rspnsble := d;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "CB_G_PRCSOS_PRSSVO_RSPSBLE_IU" ENABLE;

