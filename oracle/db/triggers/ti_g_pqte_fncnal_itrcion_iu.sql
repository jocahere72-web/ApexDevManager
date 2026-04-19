
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_G_PQTE_FNCNAL_ITRCION_IU"
	for insert or update on ti_g_pqte_fncnal_itrcion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_pqte_fncnal_itrcion is null then
				select nvl( max(id_pqte_fncnal_itrcion), 0 ) + 1  into :new.id_pqte_fncnal_itrcion
				from ti_g_pqte_fncnal_itrcion;
			end if;
		end if;
	end before each row;
end;






/
ALTER TRIGGER "TI_G_PQTE_FNCNAL_ITRCION_IU" ENABLE;

