
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_SECUESTRE_DILIGENCIA_IU"
	for insert or update on mc_g_secuestre_diligencia
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_scstre_dlgncia is null then
				:new.id_scstre_dlgncia := SQ_MC_G_SECUESTRE_DILIGENCIA.NEXTVAL;
			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_SECUESTRE_DILIGENCIA_IU" ENABLE;

