
  CREATE OR REPLACE EDITIONABLE TRIGGER "ET_D_REGLAS_TRANSFORMACION_IU"
	for insert or update on et_d_reglas_transformacion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_rgla_trnsfrmcion is null then
				select nvl( max(id_rgla_trnsfrmcion), 0 ) + 1  into d
				from et_d_reglas_transformacion;
				:new.id_rgla_trnsfrmcion := d;
			end if;
		end if;
	end before each row;
end;









/
ALTER TRIGGER "ET_D_REGLAS_TRANSFORMACION_IU" ENABLE;

