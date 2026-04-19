
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_C_TERCEROS_PORTAL_TRAZA_IU"
	for insert or update on si_c_terceros_portal_traza
	compound trigger
		before each row is
		begin
		if inserting then
			if :new.id_prcso_el_trza is null then
				:new.id_prcso_el_trza := sq_si_c_terceros_portal_traza.nextval();
			end if;
		end if;
	end before each row;
end;


/
ALTER TRIGGER "SI_C_TERCEROS_PORTAL_TRAZA_IU" ENABLE;

