
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_VEHICULOS_AVALUO_VARIA_IU" for insert or update on DF_C_VEHICULOS_AVALUO_VARIA compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_VHCLO_AVLUO_VRIA is null then

				select nvl(max(ID_VHCLO_AVLUO_VRIA)+1, 1) into d from DF_C_VEHICULOS_AVALUO_VARIA;
				:new.ID_VHCLO_AVLUO_VRIA := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_C_VEHICULOS_AVALUO_VARIA_IU" ENABLE;

