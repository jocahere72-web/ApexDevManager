
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_D_PRUEBA_TIPO_IU"
	for insert or update on ti_d_prueba_tipo
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_prba_tpo is null then
				:new.id_prba_tpo := sq_ti_d_prueba_tipo.nextval;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "TI_D_PRUEBA_TIPO_IU" ENABLE;

