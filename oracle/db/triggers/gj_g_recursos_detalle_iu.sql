
  CREATE OR REPLACE EDITIONABLE TRIGGER "GJ_G_RECURSOS_DETALLE_IU"
  for insert or update on gj_g_recursos_detalle
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_rcrso_dtlle is null then
  			d := sq_gj_g_recursos_detalle.nextval();
  			:new.id_rcrso_dtlle := d;
  		end if;
  	end if;
  end before each row;
end gj_g_recursos_detalle_iu;


/
ALTER TRIGGER "GJ_G_RECURSOS_DETALLE_IU" ENABLE;

