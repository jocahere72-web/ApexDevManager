
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_G_PLAN_PRUEBA_ALCANCE_IU"
	for insert or update on ti_g_plan_prueba_alcance
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_plan_prba_alcnce is null then
				:new.id_plan_prba_alcnce := sq_ti_g_plan_prueba_alcance.nextval;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "TI_G_PLAN_PRUEBA_ALCANCE_IU" ENABLE;

