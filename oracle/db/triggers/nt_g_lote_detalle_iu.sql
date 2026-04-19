
  CREATE OR REPLACE EDITIONABLE TRIGGER "NT_G_LOTE_DETALLE_IU"
  for insert or update on nt_d_lote_detalle
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_lte_dtlle is null then
  			select nvl( max(id_lte_dtlle), 0 ) + 1  into d
  			from nt_d_lote_detalle;
  			:new.id_lte_dtlle := d;
  		end if;
  	end if;
  end before each row;
end nt_g_lote_detalle_iu;







/
ALTER TRIGGER "NT_G_LOTE_DETALLE_IU" ENABLE;

