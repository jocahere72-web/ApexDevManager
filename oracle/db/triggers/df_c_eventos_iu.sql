
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_EVENTOS_IU"
	for insert on df_c_eventos
	compound  trigger

	before each row is
		begin
			if inserting then
				:new.id_evnto := sq_df_c_eventos.nextval;
			end if;
		end before each row;
	end;


/
ALTER TRIGGER "DF_C_EVENTOS_IU" ENABLE;

