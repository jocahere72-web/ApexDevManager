
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_FERIADOS_IU"
	for insert or update on df_c_feriados
	compound trigger
	d number;
    año number;
    mes number;

	before each row is
	begin
		if inserting then

            if :new.id_frdo is null then
				select nvl( max(id_frdo), 0 ) + 1  into d
				from df_c_feriados;
				:new.id_frdo := d;
			end if;

            :new.año :=  extract(YEAR from :new.fcha);
            :new.mes := extract(MONTH from :new.fcha);

		end if;
	end before each row;
end;









/
ALTER TRIGGER "DF_C_FERIADOS_IU" ENABLE;

