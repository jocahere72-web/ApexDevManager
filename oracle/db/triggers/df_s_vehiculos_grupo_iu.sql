
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_VEHICULOS_GRUPO_IU"
  for insert or update on df_s_vehiculos_grupo
  compound trigger

  before each row is
  begin
    if inserting then
      if :new.id_vhclo_grpo is null then

        :new.id_vhclo_grpo := sq_df_s_vehiculos_grupo.nextval;

      end if;
    end if;
  end before each row;

end;




/
ALTER TRIGGER "DF_S_VEHICULOS_GRUPO_IU" ENABLE;

