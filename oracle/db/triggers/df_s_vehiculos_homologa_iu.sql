
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_VEHICULOS_HOMOLOGA_IU" for insert or update on df_s_vehiculos_homologa compound trigger

  d number;

  before each row is
  begin
    if inserting then
      if :new.id_vhclo_hmlga is null then

        select nvl(max(id_vhclo_hmlga)+1, 1) into d from df_s_vehiculos_homologa;
        :new.id_vhclo_hmlga := d;

      end if;
    end if;
  end before each row;

end;




/
ALTER TRIGGER "DF_S_VEHICULOS_HOMOLOGA_IU" ENABLE;

