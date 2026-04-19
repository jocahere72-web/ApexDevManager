
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_TITULOS_JDCIAL_IMPSTO_IU"
	for insert or update on gf_g_titulos_jdcial_impsto
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_ttlo_jdcial_impsto is null then
				:new.id_ttlo_jdcial_impsto := sq_gf_g_titulos_jdcial_impsto.nextval;
			end if;
		end if;
	end before each row;
end;


/
ALTER TRIGGER "GF_G_TITULOS_JDCIAL_IMPSTO_IU" ENABLE;

