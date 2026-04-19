
  CREATE OR REPLACE EDITIONABLE TRIGGER "GE_P_ENTIDAD_COLUMNAS_IU"
	for insert or update on ge_p_entidad_columnas
	compound trigger
	d number;
    data_type varchar2(128);

	before each row is
	begin
		if inserting then
			if :new.id_entdad_clmna is null then
				select nvl( max(id_entdad_clmna), 0 ) + 1  into d
				from ge_p_entidad_columnas;
				:new.id_entdad_clmna := d;
			end if;

            --SE BUSCA EL TIPO DE DATOS DE LA COLUMNA
            select upper(tc.data_type)
              into data_type
              from ge_p_entidad e
              join user_tab_columns tc
                on upper(tc.table_name) = upper(e.nmbre_entdad)
             where upper(tc.column_name) = upper(:new.nmbre_clmna)
               and e.id_entdad = :new.id_entdad ;

            :new.tpo_clmna := data_type;

		end if;

	end before each row;
end ge_p_entidad_columnas_iu;









/
ALTER TRIGGER "GE_P_ENTIDAD_COLUMNAS_IU" ENABLE;

