
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_VEHICULOS_CLASE_CTGRIA_IU"
  for insert or update on df_s_vehiculos_clase_ctgria
  compound trigger

  before each row is
  begin
    if inserting then
      if :new.id_vhclo_clse_ctgria is null then
        :new.id_vhclo_clse_ctgria := SQ_df_s_vehiculos_clase_ctgria.Nextval;

      end if;
    end if;
  end before each row;

end;




/
ALTER TRIGGER "DF_S_VEHICULOS_CLASE_CTGRIA_IU" ENABLE;

