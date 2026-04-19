
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_SOLICITUDES_Y_OFICIOS_IU"
	for insert or update on mc_g_solicitudes_y_oficios
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_slctd_ofcio is null then

				select nvl(max(id_slctd_ofcio)+1, 1) into d
				  from mc_g_solicitudes_y_oficios;
				:new.id_slctd_ofcio := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_SOLICITUDES_Y_OFICIOS_IU" ENABLE;

