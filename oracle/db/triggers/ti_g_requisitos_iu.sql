
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_G_REQUISITOS_IU"
	for insert or update on ti_g_requisitos
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_rqsto is null then
				select nvl( max(id_rqsto), 0 ) + 1  into :new.id_rqsto
				from ti_g_requisitos;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "TI_G_REQUISITOS_IU" ENABLE;

