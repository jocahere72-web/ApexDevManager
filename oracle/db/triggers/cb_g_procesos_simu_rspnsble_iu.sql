
  CREATE OR REPLACE EDITIONABLE TRIGGER "CB_G_PROCESOS_SIMU_RSPNSBLE_IU"
	for insert or update on cb_g_procesos_simu_rspnsble
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prcsos_smu_rspnsble is null then
				:new.id_prcsos_smu_rspnsble := SQ_CB_G_PROCESOS_SIMU_RSPNSBLE.nextval;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "CB_G_PROCESOS_SIMU_RSPNSBLE_IU" ENABLE;

