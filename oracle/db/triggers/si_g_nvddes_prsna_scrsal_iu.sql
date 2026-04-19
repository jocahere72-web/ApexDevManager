
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_G_NVDDES_PRSNA_SCRSAL_IU"
	for insert or update on si_g_nvddes_prsna_scrsal
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_nvdad_prsna_scrsal is null then
				:new.id_nvdad_prsna_scrsal := sq_si_g_nvddes_prsna_scrsal.nextval;
			end if;
		end if;
	end before each row;
end;



/
ALTER TRIGGER "SI_G_NVDDES_PRSNA_SCRSAL_IU" ENABLE;

