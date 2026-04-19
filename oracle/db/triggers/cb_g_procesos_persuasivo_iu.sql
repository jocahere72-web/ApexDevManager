
  CREATE OR REPLACE EDITIONABLE TRIGGER "CB_G_PROCESOS_PERSUASIVO_IU"
  for insert on cb_g_procesos_persuasivo
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prcsos_prssvo is null then
        d := sq_cb_g_procesos_persuasivo.nextval();
        :new.id_prcsos_prssvo := d;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "CB_G_PROCESOS_PERSUASIVO_IU" ENABLE;

