
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_G_PAQUETES_FUNCIONAL_IU"
	for insert or update on ti_g_paquetes_funcional
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_pqte_fncnal is null then
				select nvl( max(id_pqte_fncnal), 0 ) + 1  into :new.id_pqte_fncnal
				from ti_g_paquetes_funcional;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "TI_G_PAQUETES_FUNCIONAL_IU" ENABLE;

