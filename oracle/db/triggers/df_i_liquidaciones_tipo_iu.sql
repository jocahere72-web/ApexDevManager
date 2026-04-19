
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_LIQUIDACIONES_TIPO_IU" for insert or update on DF_I_LIQUIDACIONES_TIPO compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_LQDCION_TPO is null then

				select nvl(max(ID_LQDCION_TPO)+1, 1) into d from DF_I_LIQUIDACIONES_TIPO;
				:new.ID_LQDCION_TPO := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_I_LIQUIDACIONES_TIPO_IU" ENABLE;

