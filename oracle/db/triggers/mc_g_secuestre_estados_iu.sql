
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_SECUESTRE_ESTADOS_IU"
	for insert or update on mc_g_secuestre_estados
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_scstre_estdo is null then

				select nvl(max(id_scstre_estdo)+1, 1) into d
				  from mc_g_secuestre_estados;
				:new.id_scstre_estdo := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_SECUESTRE_ESTADOS_IU" ENABLE;

