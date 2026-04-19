
  CREATE OR REPLACE EDITIONABLE TRIGGER "CB_G_PROCESOS_PRSSVO_MVMNTO_IU"
  for insert on cb_g_procesos_prssvo_mvmnto
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prcsos_prssvo_mvmnto is null then
        d := sq_cb_g_procesos_prssvo_mvmnto.nextval();
        :new.id_prcsos_prssvo_mvmnto := d;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "CB_G_PROCESOS_PRSSVO_MVMNTO_IU" ENABLE;

