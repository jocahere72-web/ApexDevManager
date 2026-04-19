
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_RCDOS_ARCHV_CNCLCN_ARC_IU"
	for insert or update on re_g_rcdos_archv_cnclcn_arc
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_archvo_cnclcn_arc is null then
				d := sq_re_g_rcdos_archv_cnclcn_arc.nextval;
				:new.id_archvo_cnclcn_arc := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "RE_G_RCDOS_ARCHV_CNCLCN_ARC_IU" ENABLE;

