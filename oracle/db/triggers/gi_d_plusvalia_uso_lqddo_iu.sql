
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_PLUSVALIA_USO_LQDDO_IU"

  for insert or update on GI_D_PLUSVALIA_USO_LQDDO
  compound trigger

  d number;

  before each row is
  begin
    if inserting then
      if :new.ID_USO_LQDDO is null then

        select nvl(max(ID_USO_LQDDO) + 1, 1)
          into d
          from GI_D_PLUSVALIA_USO_LQDDO;
        :new.ID_USO_LQDDO := d;

      end if;
    end if;
  end before each row;
END;


/
ALTER TRIGGER "GI_D_PLUSVALIA_USO_LQDDO_IU" ENABLE;

