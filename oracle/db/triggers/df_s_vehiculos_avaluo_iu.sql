
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_VEHICULOS_AVALUO_IU"
  for insert or update on df_s_vehiculos_avaluo
  compound trigger

  before each row is
  begin
    if inserting then
      if :new.id_vhclo_avluo is null then

        :new.id_vhclo_avluo := sq_df_s_vehiculos_avaluo.nextval;

      end if;
    end if;
  end before each row;

end;




/
ALTER TRIGGER "DF_S_VEHICULOS_AVALUO_IU" ENABLE;

