
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_G_EXPNDNTS_ANALISIS_OBSVCION_IU"
	for insert or update on fi_g_expndnts_analisis_obsvcion
	compound trigger
	d number;
	before each row is
	begin
	if inserting then
		if :new.id_expdnte_anlss_obsvcn is null then

			d := sq_fi_g_expndntes_anlss_obsvcn.nextval();
			:new.id_expdnte_anlss_obsvcn := d;
		end if;
	end if;

    if updating then
			:new.fcha_ultma_actlzcion := systimestamp;
		end if;
	end before each row;
	end;


/
ALTER TRIGGER "FI_G_EXPNDNTS_ANALISIS_OBSVCION_IU" ENABLE;

