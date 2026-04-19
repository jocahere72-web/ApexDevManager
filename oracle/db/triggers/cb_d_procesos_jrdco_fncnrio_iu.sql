
  CREATE OR REPLACE EDITIONABLE TRIGGER "CB_D_PROCESOS_JRDCO_FNCNRIO_IU"
	for insert or update on cb_d_procesos_jrdco_fncnrio
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prcsos_jrdco_fncnrio is null then

				select nvl(max(id_prcsos_jrdco_fncnrio)+1, 1) into d
				  from cb_d_procesos_jrdco_fncnrio;
				:new.id_prcsos_jrdco_fncnrio := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "CB_D_PROCESOS_JRDCO_FNCNRIO_IU" ENABLE;

