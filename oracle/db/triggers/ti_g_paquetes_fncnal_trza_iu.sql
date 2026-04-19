
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_G_PAQUETES_FNCNAL_TRZA_IU"
	for insert or update on ti_g_paquetes_fncnal_trza
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_pqte_fncnal_trza is null then
				select nvl( max(id_pqte_fncnal_trza), 0 ) + 1  into :new.id_pqte_fncnal_trza
				from ti_g_paquetes_fncnal_trza;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "TI_G_PAQUETES_FNCNAL_TRZA_IU" ENABLE;

