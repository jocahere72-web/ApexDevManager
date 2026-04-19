
  CREATE OR REPLACE EDITIONABLE TRIGGER "SG_D_CONFIGURACIONES_LOG_IU"
	for insert on sg_d_configuraciones_log
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_cnfgrcion_log is null then
				d := sq_sg_d_configuraciones_log.nextval;
				:new.id_cnfgrcion_log := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "SG_D_CONFIGURACIONES_LOG_IU" ENABLE;

