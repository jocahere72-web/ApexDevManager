
  CREATE OR REPLACE EDITIONABLE TRIGGER "CB_G_PROCESOS_SIMU_LOTE_IU"
	for insert or update on cb_g_procesos_simu_lote
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prcsos_smu_lte is null then
				:new.id_prcsos_smu_lte := SQ_CB_G_PROCESOS_SIMU_LOTE.nextval;
			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "CB_G_PROCESOS_SIMU_LOTE_IU" ENABLE;

