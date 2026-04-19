
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_PROCESOS_IU"
	for insert or update on df_c_procesos
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prcso is null then
				select nvl( max(id_prcso), 0 ) + 1  into d
				from df_c_procesos;
				:new.id_prcso := d;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "DF_C_PROCESOS_IU" ENABLE;

