
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_G_CASO_PRUEBA_CONDICION_IU"
	for insert or update on ti_g_caso_prueba_condicion
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_cso_prba_cndcion is null then
				:new.id_cso_prba_cndcion := sq_ti_g_caso_prueba_condicion.nextval;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "TI_G_CASO_PRUEBA_CONDICION_IU" ENABLE;

