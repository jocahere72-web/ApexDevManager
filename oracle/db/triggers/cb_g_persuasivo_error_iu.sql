
  CREATE OR REPLACE EDITIONABLE TRIGGER "CB_G_PERSUASIVO_ERROR_IU"
  for insert on CB_G_PERSUASIVO_ERROR
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.ID_PRSSVO_ERROR is null then
        d := SQ_CB_G_PERSUASIVO_ERROR.nextval();
        :new.ID_PRSSVO_ERROR := d;
      end if;
    end if;
  end before each row;
end;
/
ALTER TRIGGER "CB_G_PERSUASIVO_ERROR_IU" ENABLE;

