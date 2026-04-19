
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_PROCESOS_TAREA_IU"
  for insert or update on df_c_procesos_tarea
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_proceso_tarea := sq_df_c_procesos_tarea.nextval;
		end if;
	end before each row;
end df_c_procesos_tarea_iu;






/
ALTER TRIGGER "DF_C_PROCESOS_TAREA_IU" ENABLE;

