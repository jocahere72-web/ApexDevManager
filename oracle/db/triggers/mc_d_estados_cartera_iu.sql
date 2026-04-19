
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_D_ESTADOS_CARTERA_IU"
	for insert or update on mc_d_estados_cartera
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_estdos_crtra is null then

				select nvl(max(id_estdos_crtra)+1, 1) into d
				  from mc_d_estados_cartera;
				:new.id_estdos_crtra := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_D_ESTADOS_CARTERA_IU" ENABLE;

