
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_CONVENIOS_ESTADO_IU"
	for insert or update on gf_d_convenios_estado
	compound trigger
	d number;
	before each row is
	begin
        :new.cdgo_rpsta := case when :new.cdgo_cnvnio_estdo = 'RCH' then 'R' when :new.cdgo_cnvnio_estdo = 'APL' then 'A' end;
	end before each row;
end;





/
ALTER TRIGGER "GF_D_CONVENIOS_ESTADO_IU" ENABLE;

