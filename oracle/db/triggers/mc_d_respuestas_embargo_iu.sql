
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_D_RESPUESTAS_EMBARGO_IU"
	for insert or update on mc_d_respuestas_embargo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_rspstas_embrgo is null then

				select nvl(max(id_rspstas_embrgo)+1, 1) into d
				  from mc_d_respuestas_embargo;
				:new.id_rspstas_embrgo := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_D_RESPUESTAS_EMBARGO_IU" ENABLE;

