
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_CONTRATOS_TIPO_IU"
  for insert or update on df_c_contratos_tipo
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_cntrto_tpo := sq_df_c_contratos_tipo.nextval;
		end if;
	end before each row;
end df_c_contratos_tipo_iu;




/
ALTER TRIGGER "DF_C_CONTRATOS_TIPO_IU" ENABLE;

