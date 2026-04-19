
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_AJUSTE_MOTIVO_IU"
	for insert or update on gf_d_ajuste_motivo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_ajste_mtvo is null then

				select nvl(max(id_ajste_mtvo)+1, 1) into d
				  from gf_d_ajuste_motivo;
				:new.id_ajste_mtvo := d;

			end if;
		end if;
	end before each row;
end;









/
ALTER TRIGGER "GF_D_AJUSTE_MOTIVO_IU" ENABLE;

