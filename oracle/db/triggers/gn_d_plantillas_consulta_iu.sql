
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_D_PLANTILLAS_CONSULTA_IU"
	for insert or update on gn_d_plantillas_consulta
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_plntlla_cnslta is null then
				select nvl( max(id_plntlla_cnslta), 0 ) + 1  into d
				from gn_d_plantillas_consulta;
				:new.id_plntlla_cnslta := d;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "GN_D_PLANTILLAS_CONSULTA_IU" ENABLE;

