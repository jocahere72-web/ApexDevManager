
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_G_FSCLZCION_ACTO_VGNCIA_IU"
	for insert or update on fi_g_fsclzcion_acto_vgncia
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_fsclzcion_acto_vgnc is null then
				d := sq_fi_g_fsclzcion_acto_vgncia.nextval();
				:new.id_fsclzcion_acto_vgnc := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_G_FSCLZCION_ACTO_VGNCIA_IU" ENABLE;

