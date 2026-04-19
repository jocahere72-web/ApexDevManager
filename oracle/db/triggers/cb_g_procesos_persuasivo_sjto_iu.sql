
  CREATE OR REPLACE EDITIONABLE TRIGGER "CB_G_PROCESOS_PERSUASIVO_SJTO_IU"
  for insert on CB_G_PROCESOS_PERSUASIVO_SJTO
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.ID_PRCSOS_PRSSVO_SJTO is null then

        d := SQ_CB_G_PROCESOS_PERSUASIVO_SJTO.nextval();
        :new.ID_PRCSOS_PRSSVO_SJTO := d;

      end if;
    end if;
  end before each row;
end;
/
ALTER TRIGGER "CB_G_PROCESOS_PERSUASIVO_SJTO_IU" ENABLE;

