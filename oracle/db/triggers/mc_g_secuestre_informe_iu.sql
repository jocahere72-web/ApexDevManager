
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_SECUESTRE_INFORME_IU"
	for insert or update on mc_g_secuestre_informe
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_scstre_infrme is null then
				:new.id_scstre_infrme := SQ_MC_G_SECUESTRE_INFORME.NEXTVAL;
			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_SECUESTRE_INFORME_IU" ENABLE;

