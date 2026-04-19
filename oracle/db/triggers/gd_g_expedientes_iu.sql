
  CREATE OR REPLACE EDITIONABLE TRIGGER "GD_G_EXPEDIENTES_IU"
	for insert or update on gd_g_expedientes
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.nmro_expdnte is null then
				:new.nmro_expdnte := pkg_gn_generalidades.fnc_cl_consecutivo(:new.cdgo_clnte, 'GDE');
			end if;
		end if;

	end before each row;
end gd_g_expedientes_iu;






/
ALTER TRIGGER "GD_G_EXPEDIENTES_IU" ENABLE;

