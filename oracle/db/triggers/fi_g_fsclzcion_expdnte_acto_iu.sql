
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_G_FSCLZCION_EXPDNTE_ACTO_IU"
	for insert or update on fi_g_fsclzcion_expdnte_acto
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_fsclzcion_expdnte_acto is null then
				d := sq_fi_g_fsclzcion_expdnte_acto.nextval();
				:new.id_fsclzcion_expdnte_acto := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_G_FSCLZCION_EXPDNTE_ACTO_IU" ENABLE;

