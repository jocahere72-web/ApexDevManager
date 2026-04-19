
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_DCLRCNES_ARCHVOS_TPO_IU"
  for insert or update on gi_d_dclrcnes_archvos_tpo
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_dclrcn_archvo_tpo := sq_gi_d_dclrcnes_archvos_tpo.nextval;
		end if;
	end before each row;
end gi_d_dclrcnes_archvos_tpo_iu;



/
ALTER TRIGGER "GI_D_DCLRCNES_ARCHVOS_TPO_IU" ENABLE;

