
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_D_REQUERIMIENTO_TIPO_IU"
	for insert or update on ti_d_requerimiento_tipo
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_rqrmnto_tpo is null then
				:new.id_rqrmnto_tpo := sq_ti_d_requerimiento_tipo.nextval;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "TI_D_REQUERIMIENTO_TIPO_IU" ENABLE;

