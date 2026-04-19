
  CREATE OR REPLACE EDITIONABLE TRIGGER "ET_G_PROCESOS_INTERMEDIA_IU"
	for insert or update on et_g_procesos_intermedia
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prcso_intrmdia is null then
				select nvl( max(id_prcso_intrmdia), 0 ) + 1  into d
				from et_g_procesos_intermedia;
				:new.id_prcso_intrmdia := d;
			end if;
		end if;
	end before each row;
end;










/
ALTER TRIGGER "ET_G_PROCESOS_INTERMEDIA_IU" ENABLE;

