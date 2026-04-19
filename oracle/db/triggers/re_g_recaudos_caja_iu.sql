
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_RECAUDOS_CAJA_IU"
	for insert on re_g_recaudos_caja
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_rcdo_cja is null then
				d	:=	sq_re_g_recaudos_caja.nextval();
				:new.id_rcdo_cja := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "RE_G_RECAUDOS_CAJA_IU" ENABLE;

