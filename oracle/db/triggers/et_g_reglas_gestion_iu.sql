
  CREATE OR REPLACE EDITIONABLE TRIGGER "ET_G_REGLAS_GESTION_IU"
for insert or update on et_g_reglas_gestion compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_RGLA_GSTION is null then

				select nvl(max(ID_RGLA_GSTION)+1, 1) into d from et_g_reglas_gestion;
				:new.ID_RGLA_GSTION := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "ET_G_REGLAS_GESTION_IU" ENABLE;

