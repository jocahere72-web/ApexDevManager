
  CREATE OR REPLACE EDITIONABLE TRIGGER "GE_P_ENTIDAD_IU"
	for insert or update on ge_p_entidad
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_entdad is null then
				select nvl( max(id_entdad), 0 ) + 1  into d
				from ge_p_entidad;
				:new.id_entdad := d;
			end if;
		end if;

	end before each row;
end ge_p_entidad_iu;









/
ALTER TRIGGER "GE_P_ENTIDAD_IU" ENABLE;

