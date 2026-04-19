
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_PRSCRPCNES_VGNCIA_IU"
  for insert or update on gf_g_prscrpcnes_vgncia
	compound trigger
		v_id_impsto          number;
		v_id_impsto_sbmpsto  number;
		v_id_sjto_impsto     number;
	before each row is
		begin
			if inserting then
				:new.id_prscrpcion_vgncia := sq_gf_g_prscrpcnes_vgncia.nextval;
			end if;

			if inserting or updating then

				begin
				  select b.id_impsto
					   , b.id_impsto_sbmpsto
					   , b.id_sjto_impsto
					into v_id_impsto
					   , v_id_impsto_sbmpsto
					   , v_id_sjto_impsto
				  from gf_g_prscrpcnes_sjto_impsto b
				  where b.id_prscrpcion_sjto_impsto = :new.id_prscrpcion_sjto_impsto
				  fetch first row only;
				exception
					when others then
					v_id_impsto			:= null;
					v_id_impsto_sbmpsto	:= null;
					v_id_sjto_impsto	:= null;
				end;

				:new.indcdor_mnja_orgen := pkg_gf_prescripcion.fnc_vl_lqdcnes_vgncia_prdo(p_cdgo_clnte  	  => :new.cdgo_clnte
																						, p_id_impsto		  => v_id_impsto
																						, p_id_impsto_sbmpsto => v_id_impsto_sbmpsto
																						, p_id_sjto_impsto	  => v_id_sjto_impsto
																						, p_vgncia			  => :new.vgncia
																						, p_id_prdo		   	  => :new.id_prdo);
			end if;
		end
	before each row;
end gf_g_prscrpcnes_vgncia_iu;
/
ALTER TRIGGER "GF_G_PRSCRPCNES_VGNCIA_IU" ENABLE;

