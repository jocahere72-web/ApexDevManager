
  CREATE OR REPLACE EDITIONABLE TRIGGER "GD_D_DCMNTOS_TPO_MTDTA_VLOR_IU"
	for insert or update on gd_d_dcmntos_tpo_mtdta_vlor
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dcmnto_tpo_mtdta_vlor is null then
				select nvl( max(id_dcmnto_tpo_mtdta_vlor), 0 ) + 1  into d
				from gd_d_dcmntos_tpo_mtdta_vlor;
				:new.id_dcmnto_tpo_mtdta_vlor := d;
			end if;
		end if;

	end before each row;
end gd_d_dcmntos_tpo_mtdta_vlor_iu;







/
ALTER TRIGGER "GD_D_DCMNTOS_TPO_MTDTA_VLOR_IU" ENABLE;

