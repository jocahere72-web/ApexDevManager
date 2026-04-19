
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_SLDOS_FVOR_SLCTUD_AJST_IU"
	for insert or update on gf_g_sldos_fvor_slctud_ajst
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_sldo_fvor_slctud_ajst is null then

				select nvl(max(id_sldo_fvor_slctud_ajst)+1, 1) into d
				  from gf_g_sldos_fvor_slctud_ajst;
				:new.id_sldo_fvor_slctud_ajst := d;

			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GF_G_SLDOS_FVOR_SLCTUD_AJST_IU" ENABLE;

