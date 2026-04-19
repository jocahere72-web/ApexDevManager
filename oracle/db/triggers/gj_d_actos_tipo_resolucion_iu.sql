
  CREATE OR REPLACE EDITIONABLE TRIGGER "GJ_D_ACTOS_TIPO_RESOLUCION_IU"
  for insert or update on gj_d_actos_tipo_resolucion
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_acto_tpo_rslcion is null then
  			d := sq_gj_d_actos_tipo_resolucion.nextval();
  			:new.id_acto_tpo_rslcion := d;
  		end if;
  	end if;
  end before each row;
end gj_d_actos_tipo_resolucion_iu;


/
ALTER TRIGGER "GJ_D_ACTOS_TIPO_RESOLUCION_IU" ENABLE;

