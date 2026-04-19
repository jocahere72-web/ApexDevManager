
  CREATE OR REPLACE EDITIONABLE TRIGGER "GD_D_TRD_SERIE_DCMNTO_TPO_IU"
	for insert or update on gd_d_trd_serie_dcmnto_tpo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_trd_srie_dcmnto_tpo is null then
				select nvl( max(id_trd_srie_dcmnto_tpo), 0 ) + 1  into d
				from gd_d_trd_serie_dcmnto_tpo;
				:new.id_trd_srie_dcmnto_tpo := d;
			end if;
		end if;

	end before each row;
end gd_d_trd_serie_dcmnto_tpo_iu;







/
ALTER TRIGGER "GD_D_TRD_SERIE_DCMNTO_TPO_IU" ENABLE;

