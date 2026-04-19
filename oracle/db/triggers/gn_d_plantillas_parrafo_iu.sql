
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_D_PLANTILLAS_PARRAFO_IU"
	for insert or update on gn_d_plantillas_parrafo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_plntlla_prrfo is null then
				select nvl( max(id_plntlla_prrfo), 0 ) + 1  into d
				from gn_d_plantillas_parrafo;
				:new.id_plntlla_prrfo := d;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GN_D_PLANTILLAS_PARRAFO_IU" ENABLE;

