
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_D_ACTOS_TIPO_IU"
	for insert or update on gn_d_actos_tipo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_acto_tpo is null then
				select nvl( max(id_acto_tpo), 0 ) + 1  into d
				from gn_d_actos_tipo;
				:new.id_acto_tpo := d;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "GN_D_ACTOS_TIPO_IU" ENABLE;

