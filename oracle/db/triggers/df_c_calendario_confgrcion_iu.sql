
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_CALENDARIO_CONFGRCION_IU" for insert or update on df_c_calendario_configuracion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_clndrio is null then
				select nvl( max(id_clndrio), 0 ) + 1  into d
				from df_c_calendario_configuracion;
				:new.id_clndrio := d;
			end if;
		end if;
	end before each row;
end;









/
ALTER TRIGGER "DF_C_CALENDARIO_CONFGRCION_IU" ENABLE;

