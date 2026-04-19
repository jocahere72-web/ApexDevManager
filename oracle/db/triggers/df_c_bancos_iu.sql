
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_BANCOS_IU" for insert or update on DF_C_BANCOS compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_BNCO is null then

				select nvl(max(ID_BNCO)+1, 1) into d from DF_C_BANCOS;
				:new.ID_BNCO := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_C_BANCOS_IU" ENABLE;

