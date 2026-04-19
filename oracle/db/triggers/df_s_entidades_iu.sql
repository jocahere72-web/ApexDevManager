
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_ENTIDADES_IU"
  for insert or update on df_s_entidades
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_entdad := sq_df_s_entidades.nextval;
		end if;
	end before each row;
end df_s_entidades_iu;




/
ALTER TRIGGER "DF_S_ENTIDADES_IU" ENABLE;

