
  CREATE OR REPLACE EDITIONABLE TRIGGER "ET_G_PROCESOS_CARGA_IU"
	for insert or update on genesys.et_g_procesos_carga
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prcso_crga is null then
				select nvl( max(id_prcso_crga), 0 ) + 1  into d
				from et_g_procesos_carga;
				:new.id_prcso_crga := d;

				--:new.file_name := :new.id_prcso_crga || '.dat';
			end if;
		end if;
	end before each row;

	after each row is
	begin
		if updating then
			if dbms_lob.getlength(:new.file_blob) > 0 then
				-- insert into gti_aux values (5000, dbms_lob.getlength(:new.file_blob));
			--	pk_etl.prc_carga_archivo_directorio(:new.file_blob, :new.file_name);
      null;
			end if;
		end if;
	end after each row;
end;








/
ALTER TRIGGER "ET_G_PROCESOS_CARGA_IU" ENABLE;

