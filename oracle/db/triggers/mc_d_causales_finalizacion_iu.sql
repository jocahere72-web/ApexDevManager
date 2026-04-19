
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_D_CAUSALES_FINALIZACION_IU"
	for insert or update on mc_d_causales_finalizacion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_csl_fnlzcion is null then

				select nvl(max(id_csl_fnlzcion)+1, 1) into d
				  from mc_d_causales_finalizacion;
				:new.id_csl_fnlzcion := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_D_CAUSALES_FINALIZACION_IU" ENABLE;

