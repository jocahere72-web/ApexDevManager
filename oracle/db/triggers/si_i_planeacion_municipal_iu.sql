
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_I_PLANEACION_MUNICIPAL_IU" for insert or update on si_i_planeacion_municipal compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.id_plnccion_mncpal is null then

				select nvl(max(id_plnccion_mncpal)+1, 1) into d from si_i_planeacion_municipal;
				:new.id_plnccion_mncpal := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "SI_I_PLANEACION_MUNICIPAL_IU" ENABLE;

