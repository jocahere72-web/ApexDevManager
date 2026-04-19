
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_SECUESTRE_FINALIZACION_IU"
	for insert or update on mc_g_secuestre_finalizacion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_scstre_fnlzcion is null then
				:new.id_scstre_fnlzcion := SQ_MC_G_SECUESTRE_FINALIZACION.NEXTVAL;
			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_SECUESTRE_FINALIZACION_IU" ENABLE;

