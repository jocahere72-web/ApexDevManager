
  CREATE OR REPLACE EDITIONABLE TRIGGER "ET_G_PROCESOS_CARGA_TRAZA_IU"
	for insert or update on et_g_procesos_carga_traza
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prcso_crga_trza is null then
				select nvl( max(id_prcso_crga_trza), 0 ) + 1  into d
				from et_g_procesos_carga_traza;
				:new.id_prcso_crga_trza := d;
			end if;
		end if;
	end before each row;
end;










/
ALTER TRIGGER "ET_G_PROCESOS_CARGA_TRAZA_IU" ENABLE;

