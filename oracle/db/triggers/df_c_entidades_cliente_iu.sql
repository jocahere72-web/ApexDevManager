
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_ENTIDADES_CLIENTE_IU"
  for insert or update on df_c_entidades_cliente
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_entdad_clnte := sq_df_c_entidades_cliente.nextval;
		end if;
	end before each row;
end;



/
ALTER TRIGGER "DF_C_ENTIDADES_CLIENTE_IU" ENABLE;

