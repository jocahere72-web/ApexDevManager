
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_D_ENTIDADES_TIPO_EMBARGO_IU"
	for insert or update on mc_d_entidades_tipo_embargo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_entddes_tpo_embrgo is null then

				select nvl(max(id_entddes_tpo_embrgo)+1, 1) into d
				  from mc_d_entidades_tipo_embargo;
				:new.id_entddes_tpo_embrgo := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_D_ENTIDADES_TIPO_EMBARGO_IU" ENABLE;

