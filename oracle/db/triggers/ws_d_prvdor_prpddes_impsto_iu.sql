
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_D_PRVDOR_PRPDDES_IMPSTO_IU"
	for insert or update on ws_d_prvdor_prpddes_impsto
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prvdor_prpdde_impsto is null then

				select nvl(max(id_prvdor_prpdde_impsto)+1, 1) into d
				  from ws_d_prvdor_prpddes_impsto;
				:new.id_prvdor_prpdde_impsto := d;

			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "WS_D_PRVDOR_PRPDDES_IMPSTO_IU" ENABLE;

