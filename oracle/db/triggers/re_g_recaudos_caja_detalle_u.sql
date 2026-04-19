
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_RECAUDOS_CAJA_DETALLE_U"
after update
   OF cdgo_rcdo_estdo
	on re_g_recaudos
   for each row
begin
   if :new.cdgo_rcdo_estdo = 'AP' then

	   update re_g_recaudos_caja_detalle
		  set cdgo_rcdo_estdo   = :new.cdgo_rcdo_estdo,
			  id_rcdo			= :old.id_rcdo
		where id_orgen 			= :old.id_orgen;

	end if;
end;




/
ALTER TRIGGER "RE_G_RECAUDOS_CAJA_DETALLE_U" ENABLE;

