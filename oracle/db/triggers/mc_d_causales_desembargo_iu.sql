
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_D_CAUSALES_DESEMBARGO_IU"
	for insert or update on mc_d_causales_desembargo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_csles_dsmbrgo is null then

				select nvl(max(id_csles_dsmbrgo)+1, 1) into d
				  from mc_d_causales_desembargo;
				:new.id_csles_dsmbrgo := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_D_CAUSALES_DESEMBARGO_IU" ENABLE;

