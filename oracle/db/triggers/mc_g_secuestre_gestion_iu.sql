
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_SECUESTRE_GESTION_IU"
	for insert or update on mc_g_secuestre_gestion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_scstre_gstion is null then

				select nvl(max(id_scstre_gstion)+1, 1) into d
				  from mc_g_secuestre_gestion;
				:new.id_scstre_gstion := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_SECUESTRE_GESTION_IU" ENABLE;

