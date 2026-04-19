
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_FRMLRIOS_RGN_ATRBT_VLR_IU"
  for insert or update on gi_d_frmlrios_rgn_atrbt_vlr
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_frmlrios_rgn_atrbt_vlr := sq_gi_d_frmlrios_rgn_atrbt_vlr.nextval;
		end if;
	end before each row;
end gi_d_frmlrios_rgn_atrbt_vlr_iu;







/
ALTER TRIGGER "GI_D_FRMLRIOS_RGN_ATRBT_VLR_IU" ENABLE;

