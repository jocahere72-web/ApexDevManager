
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_D_IMPLEMENTACION_TIPO_IU"
	for insert or update on ti_d_implementacion_tipo
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_implmntcion_tpo is null then
				:new.id_implmntcion_tpo := sq_ti_d_implementacion_tipo.nextval;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "TI_D_IMPLEMENTACION_TIPO_IU" ENABLE;

