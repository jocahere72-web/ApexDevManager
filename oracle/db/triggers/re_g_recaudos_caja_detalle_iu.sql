
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_RECAUDOS_CAJA_DETALLE_IU"
	for insert on re_g_recaudos_caja_detalle
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_rcdo_cja_dtlle is null then
				d	:=	sq_re_g_recaudos_caja_detalle.nextval();
				:new.id_rcdo_cja_dtlle := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "RE_G_RECAUDOS_CAJA_DETALLE_IU" ENABLE;

