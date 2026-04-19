
  CREATE OR REPLACE EDITIONABLE TRIGGER "CB_G_PROCESOS_PERSUASIVO_JSON_IU"
  for insert or update on CB_G_PROCESOS_PERSUASIVO_JSON
  compound trigger  d number;

  before each row is
  begin
    if inserting then
      if :new.ID_PRCSOS_PRSSVO_JSON is null then
        :new.ID_PRCSOS_PRSSVO_JSON := SQ_CB_G_PROCESOS_PERSUASIVO_JSON.nextval;
      end if;
    end if;
  end before each row;
end;
/
ALTER TRIGGER "CB_G_PROCESOS_PERSUASIVO_JSON_IU" ENABLE;

