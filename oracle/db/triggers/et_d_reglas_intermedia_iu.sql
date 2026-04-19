
  CREATE OR REPLACE EDITIONABLE TRIGGER "ET_D_REGLAS_INTERMEDIA_IU"
	for insert or update on et_d_reglas_intermedia
	compound trigger
	d number;

	before each row is
	begin
		:new.pscion := replace( :new.nmbre_clmna, 'CLUMNA' );
		if inserting then
			if :new.id_rgla_intrmdia is null then
				select nvl( max(id_rgla_intrmdia), 0 ) + 1  into d
				from et_d_reglas_intermedia;
				:new.id_rgla_intrmdia := d;
			end if;
		end if;
	end before each row;
end;






/
ALTER TRIGGER "ET_D_REGLAS_INTERMEDIA_IU" ENABLE;

