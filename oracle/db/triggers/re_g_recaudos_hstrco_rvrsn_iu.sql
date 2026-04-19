
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_RECAUDOS_HSTRCO_RVRSN_IU"
	for insert on re_g_recaudos_hstrco_rvrsn
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_rcdo_htrco_rvrsion is null then
				d	:= sq_re_g_recaudos_hstrco_rvrsn.nextval();
				:new.id_rcdo_htrco_rvrsion := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "RE_G_RECAUDOS_HSTRCO_RVRSN_IU" ENABLE;

