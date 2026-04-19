
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_D_PROVEDORES_BANCO_IU"
	for insert on ws_d_provedores_banco
	compound trigger

	before each row is
		begin
			if inserting then
				if :new.id_prvdor_bnco is null then
					:new.id_prvdor_bnco := sq_ws_d_provedores_banco.nextval();
					:new.fcha_rgstro := systimestamp;
				end if;
			end if;
		end before each row;
	end;


/
ALTER TRIGGER "WS_D_PROVEDORES_BANCO_IU" ENABLE;

