
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_D_TIPO_BASE_SANCION_IU"
	for insert or update on fi_d_tipo_base_sancion
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_tpo_bse_sncion is null then
				d := sq_fi_d_tipo_base_sancion.nextval();
				:new.id_tpo_bse_sncion := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_D_TIPO_BASE_SANCION_IU" ENABLE;

