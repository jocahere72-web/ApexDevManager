
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_EMBARGOS_RSPSTAS_OFCIO_IU"
	for insert or update on mc_g_embargos_rspstas_ofcio
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_embrgos_rspstas_ofcio is null then
				:new.id_embrgos_rspstas_ofcio := SQ_MC_G_EMBARGOS_RSPSTAS_OFCIO.NEXTVAL;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "MC_G_EMBARGOS_RSPSTAS_OFCIO_IU" ENABLE;

