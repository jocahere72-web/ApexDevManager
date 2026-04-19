
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_G_NOVEDADES_PRDIO_ESTRTO_IU"
	for insert on si_g_novedades_prdio_estrto
	compound trigger
	d	number;
	before each row is
	begin
		if inserting then
			d := sq_si_g_novedades_prdio_estrto.nextval;
			:new.id_nvd_prd_est := d;
		end if;
	end before each row;

end;


/
ALTER TRIGGER "SI_G_NOVEDADES_PRDIO_ESTRTO_IU" ENABLE;

