
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_INDICADORES_ECONOMICO_IU" for insert or update on DF_S_INDICADORES_ECONOMICO compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_INDCDOR_ECNMCO is null then

				select nvl(max(ID_INDCDOR_ECNMCO)+1, 1) into d from DF_S_INDICADORES_ECONOMICO;
				:new.ID_INDCDOR_ECNMCO := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_S_INDICADORES_ECONOMICO_IU" ENABLE;

