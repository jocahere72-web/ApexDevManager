
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_ACCIONES_IU"
	for insert on df_c_acciones
	compound  trigger

	before each row is
		begin
			if inserting then
				:new.id_accion := sq_df_c_acciones.nextval;
			end if;
		end before each row;
	end;


/
ALTER TRIGGER "DF_C_ACCIONES_IU" ENABLE;

