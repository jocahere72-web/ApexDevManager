
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_METODOS_DISTRIBUCION_IU"
	for insert or update on df_s_metodos_distribucion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_mtdo_dstrbcion is null then
				select nvl( max(id_mtdo_dstrbcion), 0 ) + 1  into d
				from df_s_metodos_distribucion;
				:new.id_mtdo_dstrbcion := d;
			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "DF_S_METODOS_DISTRIBUCION_IU" ENABLE;

