
  CREATE OR REPLACE EDITIONABLE TRIGGER "CS_D_PROCESOS_SQL_IU"
	for insert or update on cs_d_procesos_sql
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prcso_sql is null then
				select nvl( max(id_prcso_sql), 0 ) + 1  into d
				from cs_d_procesos_sql;
				:new.id_prcso_sql := d;
			end if;
		end if;

	end before each row;
end cs_d_procesos_sql_iu;







/
ALTER TRIGGER "CS_D_PROCESOS_SQL_IU" ENABLE;

