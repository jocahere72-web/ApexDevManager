
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_G_PAQUETES_FNCNAL_TREA_IU"
	for insert or update on ti_g_paquetes_fncnal_trea
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_pqte_fncnal_trea is null then
				select nvl( max(id_pqte_fncnal_trea), 0 ) + 1  into :new.id_pqte_fncnal_trea
				from ti_g_paquetes_fncnal_trea;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "TI_G_PAQUETES_FNCNAL_TREA_IU" ENABLE;

