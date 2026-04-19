
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_D_SOFTWARE_FASE_IU"
	for insert or update on ti_d_software_fase
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_sftwre_fse is null then
				select nvl( max(id_sftwre_fse), 0 ) + 1  into :new.id_sftwre_fse
				from ti_d_software_fase;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "TI_D_SOFTWARE_FASE_IU" ENABLE;

