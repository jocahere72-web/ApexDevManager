
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_CINTA_IGAC_TPO_DOS_IU"
	for insert or update on gi_g_cinta_igac_tpo_dos

compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.id_cnta_igac_tpo_dos is null then

				select nvl(max(id_cnta_igac_tpo_dos)+1, 1)
				  into d
				  from gi_g_cinta_igac_tpo_dos;
				:new.id_cnta_igac_tpo_dos := d;

			end if;
		end if;
	end before each row;

end;










/
ALTER TRIGGER "GI_G_CINTA_IGAC_TPO_DOS_IU" ENABLE;

