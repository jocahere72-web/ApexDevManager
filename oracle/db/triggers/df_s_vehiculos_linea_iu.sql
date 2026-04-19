
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_VEHICULOS_LINEA_IU"
  for insert or update on df_s_vehiculos_linea
  compound trigger

  before each row is
  begin
    if inserting then
      if :new.id_vhclo_lnea is null then

        :new.id_vhclo_lnea := SQ_DF_S_VEHICULOS_LINEA.Nextval;

      end if;
    end if;
  end before each row;

end;




/
ALTER TRIGGER "DF_S_VEHICULOS_LINEA_IU" ENABLE;

