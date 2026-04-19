
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_G_SOLICITUDES_OBSRVCION_IU"
	for insert or update on pq_g_solicitudes_obsrvcion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_slctd_obsrvcion is null then
				d := sq_pq_g_solicitudes_obsrvcion.nextval;
				:new.id_slctd_obsrvcion := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "PQ_G_SOLICITUDES_OBSRVCION_IU" ENABLE;

