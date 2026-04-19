
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_DEFINICIONES_IMPUESTO_IU" for insert or update on DF_I_DEFINICIONES_IMPUESTO compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_DFNCN_IMPSTO is null then

				select nvl(max(ID_DFNCN_IMPSTO)+1, 1) into d from DF_I_DEFINICIONES_IMPUESTO;
				:new.ID_DFNCN_IMPSTO := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_I_DEFINICIONES_IMPUESTO_IU" ENABLE;

