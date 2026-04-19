
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_DESEMBARGOS_OFICIO_IU"
	for insert or update on mc_g_desembargos_oficio
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dsmbrgo_ofcio is null then

				select nvl(max(id_dsmbrgo_ofcio)+1, 1) into d
				  from mc_g_desembargos_oficio;
				:new.id_dsmbrgo_ofcio := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_DESEMBARGOS_OFICIO_IU" ENABLE;

