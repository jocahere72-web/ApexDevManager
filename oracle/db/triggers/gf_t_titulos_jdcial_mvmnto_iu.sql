
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_T_TITULOS_JDCIAL_MVMNTO_IU"
	for insert or update on GF_T_TITULOS_JDCIAL_MVMNTO
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_ttlo_jdcial_mvmnto is null then
				:new.id_ttlo_jdcial_mvmnto := sq_gf_t_titulos_jdcial_mvmnto.nextval;
			end if;
		end if;
	end before each row;
end;

/
ALTER TRIGGER "GF_T_TITULOS_JDCIAL_MVMNTO_IU" ENABLE;

