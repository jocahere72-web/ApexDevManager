
  CREATE OR REPLACE EDITIONABLE TRIGGER "CS_D_ENTIDADES_COLUMNA_IU"
	for insert or update on cs_d_entidades_columna
	compound trigger
	d number;
    data_type varchar2(128);

	before each row is
	begin
		if inserting then
			if :new.id_entdad_clmna is null then
				select nvl( max(id_entdad_clmna), 0 ) + 1  into d
				from cs_d_entidades_columna;
				:new.id_entdad_clmna := d;
			end if;
            if :new.tpo_clmna is null then
                --se busca el tipo de datos de la columna
                select upper(tc.data_type)
                  into data_type
                  from cs_d_entidades e
                  join user_tab_columns tc
                    on upper(tc.table_name) = upper(e.nmbre_entdad)
                 where upper(tc.column_name) = upper(:new.nmbre_clmna)
                   and e.id_entdad = :new.id_entdad ;

                :new.tpo_clmna := data_type;
            end if;
		end if;

	end before each row;
end cs_d_entidades_columna_iu;





/
ALTER TRIGGER "CS_D_ENTIDADES_COLUMNA_IU" ENABLE;

