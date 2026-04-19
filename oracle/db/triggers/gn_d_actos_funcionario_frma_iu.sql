
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_D_ACTOS_FUNCIONARIO_FRMA_IU"
	for insert or update on gn_d_actos_funcionario_frma
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_acto_fncnrio_frma is null then
				select nvl( max(id_acto_fncnrio_frma), 0 ) + 1  into d
				from gn_d_actos_funcionario_frma;
				:new.id_acto_fncnrio_frma := d;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GN_D_ACTOS_FUNCIONARIO_FRMA_IU" ENABLE;

