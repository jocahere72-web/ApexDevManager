
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_VERSIONES_IU"
	for insert or update on df_s_versiones
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_vrsion is null then
				:new.id_vrsion := sq_df_s_versiones.nextval;
			end if;
		end if;
	end before each row;
end;






/
ALTER TRIGGER "DF_S_VERSIONES_IU" ENABLE;

