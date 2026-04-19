
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_D_ACTOS_TIPO_TAREA_IU"
	for insert or update on gn_d_actos_tipo_tarea
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_actos_tpo_trea is null then
				select nvl( max(id_actos_tpo_trea), 0 ) + 1  into d
				from gn_d_actos_tipo_tarea;
				:new.id_actos_tpo_trea := d;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GN_D_ACTOS_TIPO_TAREA_IU" ENABLE;

