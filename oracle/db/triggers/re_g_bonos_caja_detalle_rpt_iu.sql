
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_BONOS_CAJA_DETALLE_RPT_IU"
	for insert on re_g_bonos_caja_detalle_rpt
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_bno_cja_dtlle_rpt is null then
				d := sq_re_g_bonos_caja_detalle_rpt.nextval;
				:new.id_bno_cja_dtlle_rpt := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "RE_G_BONOS_CAJA_DETALLE_RPT_IU" ENABLE;

