
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_SANCIONES_CALCULO_VALOR_IU"
  for insert or update on gi_d_sanciones_calculo_valor
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_sncion_clclo_vlr := sq_gi_d_sanciones_calculo_valor.nextval;
		end if;
	end before each row;

end gi_d_sanciones_calculo_valor_iu;





/
ALTER TRIGGER "GI_D_SANCIONES_CALCULO_VALOR_IU" ENABLE;

