
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_CONCEPTOS_CNCLCION_IU"
	for insert or update on df_i_conceptos_cnclcion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_cncpto_cnclcion is null then
				select nvl( max(id_cncpto_cnclcion), 0 ) + 1  into d
				from df_i_conceptos_cnclcion;
				:new.id_cncpto_cnclcion := d;
			end if;
		end if;
	end before each row;
end;



/
ALTER TRIGGER "DF_I_CONCEPTOS_CNCLCION_IU" ENABLE;

