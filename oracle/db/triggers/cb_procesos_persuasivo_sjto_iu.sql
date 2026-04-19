
  CREATE OR REPLACE EDITIONABLE TRIGGER "CB_PROCESOS_PERSUASIVO_SJTO_IU"
  for insert on cb_procesos_persuasivo_sjto
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prcsos_prssvo_sjto is null then
        d := sq_cb_procesos_persuasivo_sjto.nextval();
        :new.id_prcsos_prssvo_sjto := d;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "CB_PROCESOS_PERSUASIVO_SJTO_IU" ENABLE;

