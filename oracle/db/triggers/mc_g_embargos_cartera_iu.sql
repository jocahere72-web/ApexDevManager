
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_EMBARGOS_CARTERA_IU"
	for insert or update on mc_g_embargos_cartera
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_embrgos_crtra is null then

				select nvl(max(id_embrgos_crtra)+1, 1) into d
				  from mc_g_embargos_cartera;
				:new.id_embrgos_crtra := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_EMBARGOS_CARTERA_IU" ENABLE;

