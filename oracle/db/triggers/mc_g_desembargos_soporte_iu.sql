
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_DESEMBARGOS_SOPORTE_IU"
	for insert or update on mc_g_desembargos_soporte
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dsmbrgo_sprte is null then
				:new.id_dsmbrgo_sprte := SQ_MC_G_DESEMBARGOS_SOPORTE.NEXTVAL;
			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_DESEMBARGOS_SOPORTE_IU" ENABLE;

