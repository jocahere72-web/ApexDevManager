
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_G_DOCUMENTOS_IU"
	for insert or update on genesys.pq_g_documentos
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dcmnto is null then
				d := sq_pq_g_documentos.nextval;
				:new.id_dcmnto := d;
			end if;
		end if;
	end before each row;
end;



/
ALTER TRIGGER "PQ_G_DOCUMENTOS_IU" ENABLE;

