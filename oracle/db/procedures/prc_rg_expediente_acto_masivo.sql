
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_RG_EXPEDIENTE_ACTO_MASIVO" (p_cdgo_clnte	        in  df_s_clientes.cdgo_clnte%type,
                                          p_id_usrio            in  sg_g_usuarios.id_usrio%type,
                                          p_id_fncnrio          in  number,
										  p_id_fsclzcion_lte	in  number,
                                          o_cdgo_rspsta         out number,
                                          o_mnsje_rspsta        out varchar2)
  as

    v_nl                number;
    v_id_prgrma         number;
    v_id_sbprgrma       number;
    v_result            number;
    v_id_sjto_impsto    number;
    v_vgncia            number;
    v_prdo              number;
    v_nmbre             varchar2(30);
    v_mnsje_log         varchar2(4000);
    v_nmbre_prgrma      varchar2(200);
    v_cdgo_fljo         varchar2(5);
    v_nmbre_rzon_scial  varchar2(300);
    v_array_candidato  json_array_t;
	p_candidato_vigencia  clob;
  begin

    o_cdgo_rspsta := 0;

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, 'pkg_fi_fiscalizacion.prc_rg_expediente_acto_masivo');

    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_fi_fiscalizacion.prc_rg_expediente_acto_masivo',  v_nl, 'Entrando:' || systimestamp, 6);

	-- Construir el JSON de Candidatos - Vigencias
	begin
		select
			json_arrayagg (
				json_object (
					key 'ID_CNDDTO' value a.id_cnddto,
					key 'VGNCIA' value json_arrayagg(
											json_object (
														key 'VGNCIA'   value e.vgncia,
														key 'ID_PRDO'  value e.id_prdo,
														key 'ID_SJTO_IMPSTO' value a.id_sjto_impsto,
														key 'ID_CNDDTO_VGNCIA' value e.id_cnddto_vgncia
														) returning clob
											)  returning clob
							)  returning clob
						  ) into p_candidato_vigencia
		from v_fi_g_candidatos           a
		join fi_g_candidatos_funcionario b     on a.id_cnddto      	= b.id_cnddto
		join v_si_i_sujetos_impuesto     d     on a.id_sjto_impsto 	= d.id_sjto_impsto
		join fi_g_candidatos_vigencia	 e	   on a.id_cnddto 		= e.id_cnddto
		left join fi_g_fiscalizacion_expdnte c on a.id_cnddto      	= c.id_cnddto
		where a.cdgo_clnte 		= 	p_cdgo_clnte
			and b.id_fncnrio 	= 	p_id_fncnrio
			and a.cdgo_cnddto_estdo = 'ACT' and a.cdgo_prgrma = 'OD'
			and a.id_fsclzcion_lte 	= p_id_fsclzcion_lte
			and c.id_expdnte is null
			and a.indcdor_asgndo = 'S'
		group by a.id_cnddto;


	exception
		when others then
			null;
	end;

	v_array_candidato  := new json_array_t(p_candidato_vigencia);

    begin
        for i in 0 .. (v_array_candidato.get_size - 1) loop
            declare
                v_json_candidato    json_object_t   := new json_object_t(v_array_candidato.get(i));
                json_candidato      clob            := v_json_candidato.to_clob;
                v_id_cnddto         varchar2(1000)  :=  v_json_candidato.get_String('ID_CNDDTO');
            begin
                --Se obtiene el código del flujo que se va a instanciar
                begin
                    select b.cdgo_fljo,
                           a.nmbre_prgrma,
                           a.id_prgrma
                    into v_cdgo_fljo,
                         v_nmbre_prgrma,
                         v_id_prgrma
                    from fi_d_programas a
                    join wf_d_flujos    b   on  a.id_fljo   =b.id_fljo
                    where a.id_prgrma = (select a.id_prgrma
                                         from fi_g_candidatos a
                                         where a.id_cnddto = v_id_cnddto);
                exception
                    when no_data_found then
                        o_cdgo_rspsta := 1;
                        o_mnsje_rspsta := 'No se encontro parametrizado el flujo del programa ' || v_nmbre_prgrma;
                        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_fi_fiscalizacion.prc_rg_expediente_acto_masivo',  v_nl, o_mnsje_rspsta||' , '||sqlerrm, 6);
                        return;
                    when others then
                        o_cdgo_rspsta := 2;
                        o_mnsje_rspsta := 'No se pudo obtener el flujo del programa ' || v_nmbre_prgrma ||' , '||sqlerrm;
                        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_fi_fiscalizacion.prc_rg_expediente',  v_nl, o_mnsje_rspsta||' , '||sqlerrm, 6);
                        return;
                end;

                --Se llama la up para registrar el expediente
                begin

                    prc_rg_expediente(p_cdgo_clnte   => p_cdgo_clnte,
                                      p_id_usrio     => p_id_usrio,
                                      p_id_fncnrio   => p_id_fncnrio,
                                      p_id_cnddto    => v_json_candidato.get_String('ID_CNDDTO'),
                                      p_cdgo_fljo    => v_cdgo_fljo,
                                      p_json         => v_json_candidato.to_Clob,
                                      o_cdgo_rspsta  => o_cdgo_rspsta,
                                      o_mnsje_rspsta => o_mnsje_rspsta);

                    if o_cdgo_rspsta  > 0 then
                        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_fi_fiscalizacion.prc_rg_expediente',  v_nl, o_mnsje_rspsta||' , '||sqlerrm, 6);
                        rollback;
                        return;
                    end if;

                exception
                    when others then
                        o_cdgo_rspsta := 3;
                        o_mnsje_rspsta := o_cdgo_rspsta||' - '||'Error al llamar el procedimiento que registra el expediente';
                        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_fi_fiscalizacion.prc_rg_expediente',  v_nl, o_mnsje_rspsta||' , '||sqlerrm, 6);
                        return;
                end;

            end;
        end loop;
    end;

   pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, 'pkg_fi_fiscalizacion.prc_rg_expediente_acto_masivo',  v_nl, 'Saliendo con Éxito:' || systimestamp, 1);

  end prc_rg_expediente_acto_masivo;
/

