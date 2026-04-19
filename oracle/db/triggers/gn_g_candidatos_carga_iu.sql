
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_G_CANDIDATOS_CARGA_IU"
	for insert on gn_g_candidatos_carga
		compound trigger
		d number;
		before each row is
		begin
		if inserting then
			if :new.id_cnddto_crga is null then
			d := sq_gn_g_candidatos_carga.nextval();
			:new.id_cnddto_crga := d;
			:new.fcha_rgstro := systimestamp;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "GN_G_CANDIDATOS_CARGA_IU" ENABLE;

