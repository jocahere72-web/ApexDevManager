
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_D_ENTIDADES_IU"
	for insert or update on mc_d_Entidades
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_entddes is null then

				select nvl(max(id_entddes)+1, 1) into d
				  from mc_d_Entidades;
				:new.id_entddes := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_D_ENTIDADES_IU" ENABLE;

