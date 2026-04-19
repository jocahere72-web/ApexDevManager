
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_G_SOLICITUDES_MTVO_ACTO_IU"
	for insert or update on pq_g_solicitudes_mtvo_acto
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_slctud_mtvo_acto is null then
				d := sq_pq_g_solicitudes_mtvo_acto.nextval;
				:new.id_slctud_mtvo_acto := d;
			end if;
		end if;
	end before each row;
end;



/
ALTER TRIGGER "PQ_G_SOLICITUDES_MTVO_ACTO_IU" ENABLE;

