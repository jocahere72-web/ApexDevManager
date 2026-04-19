
  CREATE OR REPLACE EDITIONABLE TRIGGER "GJ_G_RCRSOS_ACCN_VGNC_CNCPT_IU"
  for insert or update on gj_g_rcrsos_accn_vgnc_cncpt
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_rcrso_accion_vgnc_cncpto is null then
  			d := sq_gj_g_rcrsos_accn_vgnc_cncpt.nextval();
  			:new.id_rcrso_accion_vgnc_cncpto := d;
  		end if;
  	end if;
  end before each row;
end gj_g_rcrsos_accn_vgnc_cncpt_iu;


/
ALTER TRIGGER "GJ_G_RCRSOS_ACCN_VGNC_CNCPT_IU" ENABLE;

