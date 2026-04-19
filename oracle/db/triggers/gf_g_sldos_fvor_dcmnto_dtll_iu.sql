
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_SLDOS_FVOR_DCMNTO_DTLL_IU"
	for insert or update on gf_g_sldos_fvor_dcmnto_dtll
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_sldo_fvor_dcmnto_dtlle is null then

				select nvl(max(id_sldo_fvor_dcmnto_dtlle)+1, 1) into d
				  from gf_g_sldos_fvor_dcmnto_dtll;
				:new.id_sldo_fvor_dcmnto_dtlle := d;

			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GF_G_SLDOS_FVOR_DCMNTO_DTLL_IU" ENABLE;

