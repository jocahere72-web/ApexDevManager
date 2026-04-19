
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_G_RESOLUCION_REVRSA_TRZA_IU"
	for insert on si_g_resolucion_revrsa_trza
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_rsl_rvs_trz is null then
				d := sq_si_g_resolucion_revrsa_trza.nextval;
				:new.id_rsl_rvs_trz := d;
			end if;
		end if;
	end before each row;

end;


/
ALTER TRIGGER "SI_G_RESOLUCION_REVRSA_TRZA_IU" ENABLE;

