
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_CONVENIOS_MDFCCN_ESTDO_IU"
	for insert or update on gf_d_convenios_mdfccn_estdo
	compound trigger
	d number;
	before each row is
	begin
        :new.cdgo_rspsta := case when :new.cdgo_cnvnio_mdfccion_estdo = 'RCH' then 'R' when :new.cdgo_cnvnio_mdfccion_estdo = 'APL' then 'A' end;
	end before each row;
end;





/
ALTER TRIGGER "GF_D_CONVENIOS_MDFCCN_ESTDO_IU" ENABLE;

