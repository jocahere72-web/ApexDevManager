
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_G_SOLICITUDES_MOTIVO_IU"
	for insert or update on pq_g_solicitudes_motivo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_slctud_mtvo is null then
				d := sq_pq_g_solicitudes_motivo.nextval;
				:new.id_slctud_mtvo := d;
			end if;
		end if;
	end before each row;
end;



/
ALTER TRIGGER "PQ_G_SOLICITUDES_MOTIVO_IU" ENABLE;

