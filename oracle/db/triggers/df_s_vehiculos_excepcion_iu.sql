
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_VEHICULOS_EXCEPCION_IU" for insert or update on df_s_vehiculos_excepcion compound trigger

  d number;

  before each row is
  begin
    if inserting then
      if :new.id_vhclo_excpcion is null then

        select nvl(max(id_vhclo_excpcion)+1, 1) into d from df_s_vehiculos_excepcion;
        :new.id_vhclo_excpcion := d;

      end if;
    end if;
  end before each row;

end;




/
ALTER TRIGGER "DF_S_VEHICULOS_EXCEPCION_IU" ENABLE;

