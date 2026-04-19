
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_RECDOS_FRMA_PGO_DTLLE_IU"
	for insert on re_g_recdos_frma_pgo_dtlle
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_rcdo_frma_pgo_dtlle is null then
				d	:= sq_re_g_recdos_frma_pgo_dtlle.nextval();
				:new.id_rcdo_frma_pgo_dtlle := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "RE_G_RECDOS_FRMA_PGO_DTLLE_IU" ENABLE;

