
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_RECAUDOS_FORMA_PAGO_IU"
	for insert on re_g_recaudos_forma_pago
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_rcdo_frma_pgo is null then
				d	:= sq_re_g_recaudos_forma_pago.nextval();
				:new.id_rcdo_frma_pgo := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "RE_G_RECAUDOS_FORMA_PAGO_IU" ENABLE;

