
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_GRUPOS_ACTO_ENTIDAD_IU"
for insert or update on df_c_grupos_acto_entidad
	compound trigger
	before each row is
	begin
		if inserting then
			:new.id_grp_acto_entdad := sq_df_c_grupos_acto_entidad.nextval;
		end if;
	end before each row;
end df_c_grupos_acto_entidad_iu;



/
ALTER TRIGGER "DF_C_GRUPOS_ACTO_ENTIDAD_IU" ENABLE;

