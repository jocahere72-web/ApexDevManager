
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_D_EVENTOS_IU"
	for insert or update on gn_d_eventos
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_evnto is null then
				select nvl( max(id_evnto), 0 ) + 1  into d
				from gn_d_eventos;
				:new.id_evnto := d;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "GN_D_EVENTOS_IU" ENABLE;

