
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_IMPUESTOS_SUBIMPUESTO_IU" for insert or update on DF_I_IMPUESTOS_SUBIMPUESTO compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_IMPSTO_SBMPSTO is null then

				select nvl(max(ID_IMPSTO_SBMPSTO)+1, 1) into d from DF_I_IMPUESTOS_SUBIMPUESTO;
				:new.ID_IMPSTO_SBMPSTO := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_I_IMPUESTOS_SUBIMPUESTO_IU" ENABLE;

