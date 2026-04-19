
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_CONTRATOS_TIPO_ENTIDAD_IU"
  for insert or update on df_c_contratos_tipo_entidad
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_cntrto_tpo_entdad := sq_df_c_contratos_tipo_entidad.nextval;
		end if;
	end before each row;
end df_c_contratos_tipo_entidad_iu;




/
ALTER TRIGGER "DF_C_CONTRATOS_TIPO_ENTIDAD_IU" ENABLE;

