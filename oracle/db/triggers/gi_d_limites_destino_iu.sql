
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_LIMITES_DESTINO_IU"
	for insert or update on gi_d_limites_destino
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_lmte_dstno is null then

				select nvl(max(id_lmte_dstno)+1, 1) into d
				  from gi_d_limites_destino;
				:new.id_lmte_dstno := d;

			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "GI_D_LIMITES_DESTINO_IU" ENABLE;

