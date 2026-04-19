
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_ORGANISMOS_TRANSITO_IU" for insert or update on DF_S_ORGANISMOS_TRANSITO compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_ORGNSMO_TRNSTO is null then

				select nvl(max(ID_ORGNSMO_TRNSTO)+1, 1) into d from DF_S_ORGANISMOS_TRANSITO;
				:new.ID_ORGNSMO_TRNSTO := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_S_ORGANISMOS_TRANSITO_IU" ENABLE;

