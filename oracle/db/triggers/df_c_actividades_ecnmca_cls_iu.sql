
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_ACTIVIDADES_ECNMCA_CLS_IU" for insert or update on DF_C_ACTIVIDADES_ECNMCA_CLS compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_ACTVDAD_ECNMCA_CLS is null then

				select nvl(max(ID_ACTVDAD_ECNMCA_CLS)+1, 1) into d from DF_C_ACTIVIDADES_ECNMCA_CLS;
				:new.ID_ACTVDAD_ECNMCA_CLS := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_C_ACTIVIDADES_ECNMCA_CLS_IU" ENABLE;

