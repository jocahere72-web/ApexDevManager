
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_SLDOS_FVOR_SLCTUD_DTLL_IU"
	for insert or update on gf_g_sldos_fvor_slctud_dtll
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_sldo_fvor_slctud_dtlle is null then

				select nvl(max(id_sldo_fvor_slctud_dtlle)+1, 1) into d
				  from gf_g_sldos_fvor_slctud_dtll;
				:new.id_sldo_fvor_slctud_dtlle := d;

			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GF_G_SLDOS_FVOR_SLCTUD_DTLL_IU" ENABLE;

