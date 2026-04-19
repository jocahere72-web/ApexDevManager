
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_TEMAS_IU"
	for insert or update on df_s_temas
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_tma is null then
				select nvl( max(id_tma), 0 ) + 1  into d
				from df_s_temas;
				:new.id_tma := d;
			end if;
		end if;
	end before each row;
end;






/
ALTER TRIGGER "DF_S_TEMAS_IU" ENABLE;

