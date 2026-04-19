
  CREATE OR REPLACE EDITIONABLE TRIGGER "ET_G_PROCESOS_CARGA_ERROR_IU"
	for insert or update on et_g_procesos_carga_error
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prcso_crga_error is null then
				select nvl( max(id_prcso_crga_error), 0 ) + 1  into d
				from et_g_procesos_carga_error;
				:new.id_prcso_crga_error := d;
			end if;
		end if;
	end before each row;
end;










/
ALTER TRIGGER "ET_G_PROCESOS_CARGA_ERROR_IU" ENABLE;

