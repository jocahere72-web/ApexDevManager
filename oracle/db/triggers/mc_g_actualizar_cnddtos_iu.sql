
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_ACTUALIZAR_CNDDTOS_IU"
  for insert or update on MC_G_ACTUALIZAR_CNDDTOS
  compound trigger  d number;

  before each row is
  begin
    if inserting then
      if :new.ID_ACT_CNDDTO is null then
        :new.ID_ACT_CNDDTO := sq_MC_G_ACTUALIZAR_CNDDTOS.nextval;
      end if;
    end if;
  end before each row;
end;
/
ALTER TRIGGER "MC_G_ACTUALIZAR_CNDDTOS_IU" ENABLE;

