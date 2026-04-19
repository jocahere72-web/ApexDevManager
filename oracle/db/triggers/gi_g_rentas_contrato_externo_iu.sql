
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_RENTAS_CONTRATO_EXTERNO_IU"
	for insert  on gi_g_rentas_contrato_externo
	compound  trigger

	before each row is
		begin
			if inserting then
				if :new.id_rnta_cntrto_extrno is null then
					:new.id_rnta_cntrto_extrno := sq_gi_g_rentas_contrato_externo.nextval;
				end if;
			end if;
		end before each row;
	end;


/
ALTER TRIGGER "GI_G_RENTAS_CONTRATO_EXTERNO_IU" ENABLE;

