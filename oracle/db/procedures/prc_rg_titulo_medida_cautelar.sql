
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_RG_TITULO_MEDIDA_CAUTELAR" (p_cdgo_clnte			in  number,
                                                          p_id_embrgo_rslcion	in	number,
                                                          p_id_ttlo_jdcial		in	number,
                                                          p_id_usrio			in 	number,
                                                          o_cdgo_rspsta         out number,
                                                          o_mnsje_rspsta        out varchar2
                                                          ) as

	-- PROCEDIMIENTO PARA ASOCIAR MEDIDA CAUTELAR A TÍTULO JUDICIAL --


	v_nl              		number;
	v_id_sjto_rspnsble		number;
	v_idntfccion_dmnddo		gf_g_titulos_judicial.idntfccion_dmnddo%type;
	v_id_instncia_fljo_hjo  number;
    v_id_fljo_trea_orgen    number;
    v_type_rspsta           varchar2(1);
    v_error_msg             number;
	v_id_ttlo_jdcial_impsto	number;
    v_error           		exception;

	begin

	o_cdgo_rspsta := 0;

	v_nl := pkg_sg_log.fnc_ca_nivel_log( p_cdgo_clnte, null, 'pkg_gf_titulos_judicial.prc_rg_titulo_medida_cautelar');
	pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_gf_titulos_judicial.prc_rg_titulo_medida_cautelar',  v_nl, 'Entrando:' || systimestamp, 1);

		--1. se valida la identificación del demandado
			begin
				select idntfccion_dmnddo
				  into v_idntfccion_dmnddo
				  from gf_g_titulos_judicial
				 where cdgo_clnte = p_cdgo_clnte
				   and id_ttlo_jdcial = p_id_ttlo_jdcial;
			exception
				when no_data_found then
					o_cdgo_rspsta := 1;
					o_mnsje_rspsta := 'Error No. '||o_cdgo_rspsta||' problemas consultar la identificación del demandado'||sqlerrm;
					pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_gf_titulos_judicial.prc_rg_titulo_medida_cautelar',  v_nl, o_mnsje_rspsta, 6);
					raise v_error;
			end;

		--2. se actualiza la medida cautelar generadora del título
			begin
				update gf_g_titulos_judicial
				   set id_embrgo_rslcion = p_id_embrgo_rslcion
				 where cdgo_clnte = p_cdgo_clnte
				   and id_ttlo_jdcial = p_id_ttlo_jdcial;
			exception
				when others then
				o_cdgo_rspsta := 2;
				o_mnsje_rspsta := 'Error No. '||o_cdgo_rspsta||' problemas al asociar la medida cautelar generadora del título '||sqlerrm;
				pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_gf_titulos_judicial.prc_rg_titulo_medida_cautelar',  v_nl, o_mnsje_rspsta, 6);
				raise v_error;
			end;

		--se recorre el detalle de la cartera de la medida cautelar
		for c_mdda_ctlar_impstos in (select distinct c.id_impsto,
											c.id_impsto_sbmpsto,
											b.id_sjto_impsto
									  from mc_g_embargos_resolucion         a
									  join mc_g_embargos_cartera_detalle    b on a.id_embrgos_crtra =  b.id_embrgos_crtra
									  join gf_g_movimientos_financiero      c on b.id_sjto_impsto   = c.id_sjto_impsto
																			  and b.vgncia = c.vgncia
																			  and b.id_prdo = c.id_prdo
									where a.id_embrgos_rslcion = p_id_embrgo_rslcion) loop

			--3. se consulta el sujeto responsable de la medida cautelar para guardarlo
			begin
				select id_sjto_rspnsble
				  into v_id_sjto_rspnsble
				  from si_i_sujetos_responsable
				 where id_sjto_impsto = c_mdda_ctlar_impstos.id_sjto_impsto
				   and trim(idntfccion) = v_idntfccion_dmnddo;

				   --4. se insertan los impuestos generadores de la medida cautelar
					begin
						insert into gf_g_titulos_jdcial_impsto(id_ttlo_jdcial,id_impsto,id_impsto_sbmpsto,id_sjto_impsto,id_sjto_rspnsble)
							  values(p_id_ttlo_jdcial,c_mdda_ctlar_impstos.id_impsto,c_mdda_ctlar_impstos.id_impsto_sbmpsto,c_mdda_ctlar_impstos.id_sjto_impsto,v_id_sjto_rspnsble) returning id_ttlo_jdcial_impsto into v_id_ttlo_jdcial_impsto;
					exception
						when others then
						o_cdgo_rspsta := 4;
						o_mnsje_rspsta := 'Error No. '||o_cdgo_rspsta||' problemas insertar impuesto de la medida cautelar generadora del título '||sqlerrm;
						pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_gf_titulos_judicial.prc_rg_titulo_medida_cautelar',  v_nl, o_mnsje_rspsta, 6);
						raise v_error;
					end;

			exception
				when no_data_found then
				o_cdgo_rspsta := 3;
				o_mnsje_rspsta := 'Error No. '||o_cdgo_rspsta||' problemas al encontrar el el sujeto responsable'||sqlerrm;
				pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_gf_titulos_judicial.prc_rg_titulo_medida_cautelar',  v_nl, o_mnsje_rspsta, 6);
				raise v_error;
			end;

			-- se recorre la cartera asociada a la medida cautelar
			for c_mdda_ctlar_crtra in (select distinct b.vgncia
											  ,b.id_prdo
											  ,b.id_cncpto
											  ,b.vlor_cptal
											  ,b.vlor_intres
										  from mc_g_embargos_resolucion         a
										  join mc_g_embargos_cartera_detalle    b on a.id_embrgos_crtra =  b.id_embrgos_crtra
										  join gf_g_movimientos_financiero      c on b.id_sjto_impsto   = c.id_sjto_impsto
										   and b.vgncia = c.vgncia
										   and b.id_prdo = c.id_prdo
										 where a.id_embrgos_rslcion = p_id_embrgo_rslcion
										   and c.id_sjto_impsto = c_mdda_ctlar_impstos.id_sjto_impsto
										   and c.id_impsto = c_mdda_ctlar_impstos.id_impsto
										   and c.id_impsto_sbmpsto = c_mdda_ctlar_impstos.id_impsto_sbmpsto
										) loop

					--5. se inserta la cartera asociada a la medida cautelar
					begin
						insert into gf_g_titulos_jdcial_vgncia(id_ttlo_jdcial_impsto, vgncia, id_prdo, id_cncpto)
							  values(v_id_ttlo_jdcial_impsto, c_mdda_ctlar_crtra.vgncia, c_mdda_ctlar_crtra.id_prdo, c_mdda_ctlar_crtra.id_cncpto);
					exception
						when others then
						o_cdgo_rspsta := 5;
						o_mnsje_rspsta := 'Error No. '||o_cdgo_rspsta||' problemas insertar la cartera asociada a la medida cautelar'||sqlerrm;
						pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_gf_titulos_judicial.prc_rg_titulo_medida_cautelar',  v_nl, o_mnsje_rspsta, 6);
						raise v_error;
					end;

			end loop;

		end loop;

        if o_cdgo_rspsta = 0 then
            o_mnsje_rspsta := '¡Medida Cautelar Asociada al Título Judicial Exitosamente!';
        end if;

		pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_gf_titulos_judicial.prc_rg_titulo_medida_cautelar',  v_nl, 'Saliendo: ' || systimestamp, 1);

	exception
		when v_error then
			raise_application_error(-20000, o_mnsje_rspsta);

	end prc_rg_titulo_medida_cautelar;
/

