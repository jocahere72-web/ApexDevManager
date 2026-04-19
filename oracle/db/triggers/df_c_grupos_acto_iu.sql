
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_GRUPOS_ACTO_IU"
for insert or update on df_c_grupos_acto
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_grpo_acto := sq_df_c_grupos_acto.nextval;
		end if;
	end before each row;
end df_c_grupos_acto_iu;



/
ALTER TRIGGER "DF_C_GRUPOS_ACTO_IU" ENABLE;

