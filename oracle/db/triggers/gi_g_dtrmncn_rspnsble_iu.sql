
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DTRMNCN_RSPNSBLE_IU"
	for insert or update on gi_g_dtrmncn_rspnsble
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dtrmncion_rspnsble is null then
				:new.id_dtrmncion_rspnsble := sq_gi_g_dtrmncn_rspnsble.nextval;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GI_G_DTRMNCN_RSPNSBLE_IU" ENABLE;

