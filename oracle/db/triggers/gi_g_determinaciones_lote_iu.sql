
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DETERMINACIONES_LOTE_IU"
	for insert or update on gi_g_determinaciones_lote
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dtrmncion_lte is null then
				:new.id_dtrmncion_lte := sq_gi_g_determinaciones_lote.nextval;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GI_G_DETERMINACIONES_LOTE_IU" ENABLE;

