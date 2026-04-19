
  CREATE OR REPLACE EDITIONABLE TRIGGER "GJ_D_RECURSOS_TIPO_ACCION_IU"
  for insert or update on gj_d_recursos_tipo_accion
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_rcrso_tpo_accion is null then
  			d := sq_gj_d_recursos_tipo_accion.nextval();
  			:new.id_rcrso_tpo_accion := d;
  		end if;
  	end if;
  end before each row;
end gj_d_recursos_tipo_accion_iu;


/
ALTER TRIGGER "GJ_D_RECURSOS_TIPO_ACCION_IU" ENABLE;

