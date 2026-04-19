
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_D_ATRIBUTOS_VALOR_IU"
	for insert or update on wf_d_atributos_valor
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_atrbto_vlor is null then
				select nvl( max(id_atrbto_vlor), 0 ) + 1  into d
				from wf_d_atributos_valor;
				:new.id_atrbto_vlor := d;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "WF_D_ATRIBUTOS_VALOR_IU" ENABLE;

