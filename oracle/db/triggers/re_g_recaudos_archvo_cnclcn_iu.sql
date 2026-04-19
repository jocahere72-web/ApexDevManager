
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_RECAUDOS_ARCHVO_CNCLCN_IU"
	for insert or update on re_g_recaudos_archvo_cnclcn
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_rcdo_archvo_cnclcion is null then
				d := sq_re_g_recaudos_archvo_cnclcn.nextval;
				:new.id_rcdo_archvo_cnclcion := d;
			end if;
		end if;
	end before each row;
end;



/
ALTER TRIGGER "RE_G_RECAUDOS_ARCHVO_CNCLCN_IU" ENABLE;

