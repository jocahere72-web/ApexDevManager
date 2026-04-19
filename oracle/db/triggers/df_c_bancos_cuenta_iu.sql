
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_BANCOS_CUENTA_IU" for insert or update on DF_C_BANCOS_CUENTA compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_BNCO_CNTA is null then

				select nvl(max(ID_BNCO_CNTA)+1, 1) into d from DF_C_BANCOS_CUENTA;
				:new.ID_BNCO_CNTA := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_C_BANCOS_CUENTA_IU" ENABLE;

