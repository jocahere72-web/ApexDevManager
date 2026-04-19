
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_SCSTR_DLGNCIA_ARCHVS_IU"
	for insert or update on mc_g_scstr_dlgncia_archvs
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_scstr_dlgncia_archvs is null then
				:new.id_scstr_dlgncia_archvs := SQ_MC_G_SCSTR_DLGNCIA_ARCHVS.NEXTVAL;
			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_SCSTR_DLGNCIA_ARCHVS_IU" ENABLE;

