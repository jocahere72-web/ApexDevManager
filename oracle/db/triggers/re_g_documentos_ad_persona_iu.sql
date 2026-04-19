
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_DOCUMENTOS_AD_PERSONA_IU"
	for insert or update on re_g_documentos_ad_persona
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dcmnto_ad_prsna is null then
				:new.id_dcmnto_ad_prsna := sq_re_g_documentos_ad_persona.nextval;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "RE_G_DOCUMENTOS_AD_PERSONA_IU" ENABLE;

