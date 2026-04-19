
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_D_PROPIEDADES_BIEN_ENTDD_IU"
	for insert or update on mc_d_propiedades_bien_entidad
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prpddes_bien_entdad is null then

				select nvl(max(id_prpddes_bien_entdad)+1, 1) into d
				  from mc_d_propiedades_bien_entidad;
				:new.id_prpddes_bien_entdad := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_D_PROPIEDADES_BIEN_ENTDD_IU" ENABLE;

