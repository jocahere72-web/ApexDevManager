
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_EDICIONES_IU"
	for insert or update on df_s_ediciones
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_edcion is null then
				:new.id_edcion := sq_df_s_ediciones.nextval;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "DF_S_EDICIONES_IU" ENABLE;

