
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_IMPUESTOS_ACTO_IU" for insert or update on DF_I_IMPUESTOS_ACTO compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_IMPSTO_ACTO is null then

				select nvl(max(ID_IMPSTO_ACTO)+1, 1) into d from DF_I_IMPUESTOS_ACTO;
				:new.ID_IMPSTO_ACTO := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_I_IMPUESTOS_ACTO_IU" ENABLE;

