
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_D_EVENTOS_PROPIEDAD_IU"
	for insert or update on gn_d_eventos_propiedad
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_evnto_prpdad is null then
				select nvl( max(id_evnto_prpdad), 0 ) + 1  into d
				from gn_d_eventos_propiedad;
				:new.id_evnto_prpdad := d;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "GN_D_EVENTOS_PROPIEDAD_IU" ENABLE;

