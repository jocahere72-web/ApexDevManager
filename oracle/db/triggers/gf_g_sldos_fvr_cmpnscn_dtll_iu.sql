
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_SLDOS_FVR_CMPNSCN_DTLL_IU"
	for insert or update on gf_g_sldos_fvr_cmpnscn_dtll
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_sldos_fvr_cmpnscn_dtll is null then

				select nvl(max(id_sldos_fvr_cmpnscn_dtll)+1, 1) into d
				  from gf_g_sldos_fvr_cmpnscn_dtll;
				:new.id_sldos_fvr_cmpnscn_dtll := d;

			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GF_G_SLDOS_FVR_CMPNSCN_DTLL_IU" ENABLE;

