
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_D_FLUJOS_HMLGCION_TREA_IU"
	for insert or update on wf_d_flujos_hmlgcion_trea
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_fljo_hmlgcion_trea is null then
				select nvl( max(id_fljo_hmlgcion_trea), 0 ) + 1  into d
				from wf_d_flujos_hmlgcion_trea;
				:new.id_fljo_hmlgcion_trea := d;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "WF_D_FLUJOS_HMLGCION_TREA_IU" ENABLE;

