
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_D_PROPIEDADES_BIEN_IU"
	for insert or update on mc_d_propiedades_bien
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prpddes_bien is null then

				select nvl(max(id_prpddes_bien)+1, 1) into d
				  from mc_d_propiedades_bien;
				:new.id_prpddes_bien := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_D_PROPIEDADES_BIEN_IU" ENABLE;

