
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_REGIMENES_TIPO_IU"
  for insert or update on df_c_regimenes_tipo
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_rgmen_tpo := sq_df_c_regimenes_tipo.nextval;
		end if;
	end before each row;
end df_c_regimenes_tipo_iu;






/
ALTER TRIGGER "DF_C_REGIMENES_TIPO_IU" ENABLE;

