
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_G_CASO_PRUEBA_EJECUCION_IU"
	for insert or update on ti_g_caso_prueba_ejecucion
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_cso_prba_ejccion is null then
				:new.id_cso_prba_ejccion := sq_ti_g_caso_prueba_ejecucion.nextval;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "TI_G_CASO_PRUEBA_EJECUCION_IU" ENABLE;

