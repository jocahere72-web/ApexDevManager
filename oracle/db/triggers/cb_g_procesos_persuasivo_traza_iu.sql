
  CREATE OR REPLACE EDITIONABLE TRIGGER "CB_G_PROCESOS_PERSUASIVO_TRAZA_IU"
  for insert or update on cb_g_procesos_persuasivo_traza
  compound trigger  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prcsos_prssvo_trza is null then
        :new.id_prcsos_prssvo_trza := sq_cb_g_procesos_persuasivo_traza.nextval;
      end if;
    end if;
  end before each row;
end;
/
ALTER TRIGGER "CB_G_PROCESOS_PERSUASIVO_TRAZA_IU" ENABLE;

