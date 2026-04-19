
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_G_CASOS_PRUEBA_IU"
	for insert or update on ti_g_casos_prueba
	compound trigger
	v_consecutivo	varchar2(20);


	before each row is
	begin
		if inserting then
			if :new.id_cso_prba is null then
				:new.id_cso_prba := sq_ti_g_casos_prueba.nextval;
			end if;
			if :new.cdgo_cso_prba is null then
				v_consecutivo := pkg_gn_generalidades.fnc_cl_defniciones_cliente (p_cdgo_clnte                    => 3,
																				  p_cdgo_dfncion_clnte_ctgria     => 'GTI',
																				  p_cdgo_dfncion_clnte            => 'CP');

				v_consecutivo := v_consecutivo || lpad(pkg_gn_generalidades.fnc_cl_consecutivo (p_cdgo_clnte => 3, p_cdgo_cnsctvo => 'CP'), 5,'0');
				:new.cdgo_cso_prba := v_consecutivo;
			end if;
		end if;
	end before each row;
end;






/
ALTER TRIGGER "TI_G_CASOS_PRUEBA_IU" ENABLE;

