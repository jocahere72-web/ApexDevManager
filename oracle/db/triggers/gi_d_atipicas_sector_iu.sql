
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_ATIPICAS_SECTOR_IU"
	for insert or update on gi_d_atipicas_sector

compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.id_atpca_sctor is null then

				select nvl(max(id_atpca_sctor)+1, 1)
				  into d
				  from gi_d_atipicas_sector;
				:new.id_atpca_sctor := d;

			end if;
		end if;
	end before each row;

end;








/
ALTER TRIGGER "GI_D_ATIPICAS_SECTOR_IU" ENABLE;

