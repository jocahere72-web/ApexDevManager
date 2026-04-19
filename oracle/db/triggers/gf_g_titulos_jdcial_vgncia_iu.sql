
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_TITULOS_JDCIAL_VGNCIA_IU"
	for insert or update on gf_g_titulos_jdcial_vgncia
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_ttlo_jdcial_vgncia is null then
				:new.id_ttlo_jdcial_vgncia := sq_gf_g_titulos_jdcial_vgncia.nextval;
			end if;
		end if;
	end before each row;
end;


/
ALTER TRIGGER "GF_G_TITULOS_JDCIAL_VGNCIA_IU" ENABLE;

