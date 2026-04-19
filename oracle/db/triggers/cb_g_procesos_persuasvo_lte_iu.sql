
  CREATE OR REPLACE EDITIONABLE TRIGGER "CB_G_PROCESOS_PERSUASVO_LTE_IU"
  for insert on cb_g_procesos_persuasvo_lte
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prcso_prssvo_lte is null then
        d := sq_cb_g_procesos_persuasvo_lte.nextval();
        :new.id_prcso_prssvo_lte := d;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "CB_G_PROCESOS_PERSUASVO_LTE_IU" ENABLE;

