
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_I_SUJETOS_SUCURSAL_IU"
	for insert or update on si_i_sujetos_sucursal
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_sjto_scrsal is null then
				:new.id_sjto_scrsal := sq_si_i_sujetos_sucursal.nextval;
			end if;
		end if;
	end before each row;
end;



/
ALTER TRIGGER "SI_I_SUJETOS_SUCURSAL_IU" ENABLE;

