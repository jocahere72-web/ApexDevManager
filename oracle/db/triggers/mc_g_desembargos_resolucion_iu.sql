
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_DESEMBARGOS_RESOLUCION_IU"
	for insert or update on mc_g_desembargos_resolucion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dsmbrgos_rslcion is null then

				select nvl(max(id_dsmbrgos_rslcion)+1, 1) into d
				  from mc_g_desembargos_resolucion;
				:new.id_dsmbrgos_rslcion := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_DESEMBARGOS_RESOLUCION_IU" ENABLE;

