
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_VEHICULOS_COLOR_IU" for insert or update on df_s_vehiculos_color compound trigger

  d number;

  before each row is
  begin
    if inserting then
      if :new.id_color is null then

        select nvl(max(id_color)+1, 1) into d from df_s_vehiculos_color;
        :new.id_color := d;

      end if;
    end if;
  end before each row;

end;




/
ALTER TRIGGER "DF_S_VEHICULOS_COLOR_IU" ENABLE;

