
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_G_TREA_FLJO_OBSRVCION_IU"
		for insert or update on pq_g_trea_fljo_obsrvcion
		compound trigger
			d number;

			before each row is
			begin
			if inserting then
				if :new.id_obsrvcion is null then
					:new.id_obsrvcion := sq_pq_g_trea_fljo_obsrvcion.nextval();
				end if;
			end if;
		end before each row;
	end;


/
ALTER TRIGGER "PQ_G_TREA_FLJO_OBSRVCION_IU" ENABLE;

