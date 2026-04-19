
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_AJUSTE_USUARIO_IU"
	for insert or update on gf_d_ajuste_usuario
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_ajste_usrio is null then

				select nvl(max(id_ajste_usrio)+1, 1) into d
				  from gf_d_ajuste_usuario;
				:new.id_ajste_usrio := d;

			end if;
		end if;
	end before each row;
end;









/
ALTER TRIGGER "GF_D_AJUSTE_USUARIO_IU" ENABLE;

