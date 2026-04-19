
  CREATE OR REPLACE EDITIONABLE TRIGGER "GE_P_PROCESOS_SQL_IU"
	for insert or update on GE_P_PROCESOS_SQL
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prcso_sql is null then
				select nvl( max(id_prcso_sql), 0 ) + 1  into d
				from ge_p_procesos_sql;
				:new.id_prcso_sql := d;
			end if;
		end if;

	end before each row;
end GE_P_PROCESOS_SQL_IU;









/
ALTER TRIGGER "GE_P_PROCESOS_SQL_IU" ENABLE;

