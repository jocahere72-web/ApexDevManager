
  CREATE OR REPLACE EDITIONABLE TRIGGER "WF_D_ATRIBUTOS_IU"
	for insert or update on wf_d_atributos
	compound trigger
	d number;
    v_idntfccion number;

	before each row is
	begin
		if inserting then
			if :new.id_atrbto is null then
				select nvl( max(id_atrbto), 0 ) + 1  into d
				from wf_d_atributos;
				:new.id_atrbto := d;
			end if;
		end if;
	end before each row;
end;










/
ALTER TRIGGER "WF_D_ATRIBUTOS_IU" ENABLE;

