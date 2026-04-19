
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_RECAUDOS_LTE_CNCLCION_IU"
	for insert or update on re_g_recaudos_lte_cnclcion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_rcdo_lte_cnclcion is null then
				d := sq_re_g_recaudos_lte_cnclcion.nextval;
				:new.id_rcdo_lte_cnclcion := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "RE_G_RECAUDOS_LTE_CNCLCION_IU" ENABLE;

