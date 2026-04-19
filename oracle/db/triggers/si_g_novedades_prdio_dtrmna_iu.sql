
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_G_NOVEDADES_PRDIO_DTRMNA_IU"
	for insert on si_g_novedades_prdio_dtrmna
	compound trigger
	d	number;
	before each row is
	begin
		if inserting then
			d := sq_si_g_novedades_prdio_dtrmna.nextval;
			:new.id_nvd_prd_dtr := d;
		end if;
	end before each row;

end;


/
ALTER TRIGGER "SI_G_NOVEDADES_PRDIO_DTRMNA_IU" ENABLE;

