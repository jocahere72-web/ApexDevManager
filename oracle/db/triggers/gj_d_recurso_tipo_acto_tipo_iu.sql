
  CREATE OR REPLACE EDITIONABLE TRIGGER "GJ_D_RECURSO_TIPO_ACTO_TIPO_IU"
  for insert or update on gj_d_recurso_tipo_acto_tipo
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_rcrso_tpo_acto_tpo is null then
  			d := sq_gj_d_recurso_tipo_acto_tipo.nextval();
  			:new.id_rcrso_tpo_acto_tpo := d;
  		end if;
  	end if;
  end before each row;
end gj_d_recurso_tipo_acto_tipo_iu;


/
ALTER TRIGGER "GJ_D_RECURSO_TIPO_ACTO_TIPO_IU" ENABLE;

