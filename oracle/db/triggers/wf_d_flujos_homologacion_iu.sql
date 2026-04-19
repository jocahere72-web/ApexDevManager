
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_D_FLUJOS_HOMOLOGACION_IU"
	for insert or update on wf_d_flujos_homologacion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_fljo_hmlgcion is null then
				select nvl( max(id_fljo_hmlgcion), 0 ) + 1  into d
				from wf_d_flujos_homologacion;
				:new.id_fljo_hmlgcion := d;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "WF_D_FLUJOS_HOMOLOGACION_IU" ENABLE;

