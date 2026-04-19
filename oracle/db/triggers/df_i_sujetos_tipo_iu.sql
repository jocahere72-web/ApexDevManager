
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_SUJETOS_TIPO_IU"
  for insert or update on df_i_sujetos_tipo
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_sjto_tpo := sq_df_i_sujetos_tipo.nextval;
		end if;
	end before each row;
end df_i_sujetos_tipo_iu;






/
ALTER TRIGGER "DF_I_SUJETOS_TIPO_IU" ENABLE;

