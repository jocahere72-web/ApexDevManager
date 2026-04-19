
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_FUNCIONARIOS_BITACORA_IU" for insert or update on DF_C_FUNCIONARIOS_BITACORA compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_FNCNRIO_BTCRA is null then

				select nvl(max(ID_FNCNRIO_BTCRA)+1, 1) into d from DF_C_FUNCIONARIOS_BITACORA;
				:new.ID_FNCNRIO_BTCRA := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_C_FUNCIONARIOS_BITACORA_IU" ENABLE;

