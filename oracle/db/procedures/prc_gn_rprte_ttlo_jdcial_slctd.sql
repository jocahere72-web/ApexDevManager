
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_GN_RPRTE_TTLO_JDCIAL_SLCTD" (p_cdgo_clnte				in  number,
                                                         p_id_ttlo_jdcial_slctud	in  number,
                                                         p_id_plntlla				in  number,
                                                         p_id_acto					in  number,
                                                         o_cdgo_rspsta				out number,
                                                         o_mnsje_rspsta				out varchar2)as

	--------------------------------------------------------------
	--&Procedimiento para generar y actualizar el blob del acto&--
	--------------------------------------------------------------


	v_error			    exception;
	v_nl			    number;
	v_gn_d_reportes	    gn_d_reportes%rowtype;
    v_blob              blob;
    v_app_page_id	    number := v('APP_PAGE_ID');
	v_app_id		    number := v('APP_ID');
    v_json              clob;

	begin

		o_cdgo_rspsta := 0;
		v_nl := pkg_sg_log.fnc_ca_nivel_log( p_cdgo_clnte, null, 'pkg_gf_titulos_judicial.prc_ac_solicitud_dvlcion_ttlo');
		pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, 'pkg_gf_titulos_judicial.prc_gn_rprte_ttlo_jdcial_slctd',  v_nl, 'Entrando ' || systimestamp, 1);

		--1. Se consultan datos del reporte
		begin
			select b.*
			  into v_gn_d_reportes
			  from gn_d_plantillas a
			  join gn_d_reportes b on a.id_rprte = b.id_rprte
			 where a.cdgo_clnte = p_cdgo_clnte
			   and a.id_plntlla = p_id_plntlla;
		exception
			when no_data_found then
				o_cdgo_rspsta := 1;
				o_mnsje_rspsta := 'Error al encontrar datos del reporte asociado al acto de solicitud. Error No. '||o_cdgo_rspsta|| SQLCODE || ' - ' || SQLERRM;
				pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, 'pkg_gf_titulos_judicial.prc_gn_rprte_ttlo_jdcial_slctd',  v_nl, o_mnsje_rspsta, 1);
				raise v_error;
		end;

        --Si existe la Sesion
		apex_session.attach(p_app_id		=> 66000,
							p_page_id		=> 2,
							p_session_id	=> v('APP_SESSION'));

        --Se construye el JSON
        begin
            select json_object( key 'id_plntlla' is p_id_plntlla,
                                key 'id_ttlo_jdcial_slctud' is p_id_ttlo_jdcial_slctud
                                )
              into v_json
              from dual;
        end;

        --Seteamos en session los items necesarios para generar el archivo
		apex_util.set_session_state('P2_XML', v_json);
		apex_util.set_session_state('F_CDGO_CLNTE', p_cdgo_clnte);
        apex_util.set_session_state('P2_ID_RPRTE', v_gn_d_reportes.id_rprte);

		--2. construcción del blob del acto
		begin
			v_blob := apex_util.get_print_document( p_application_id		=> 66000,
													p_report_query_name		=> v_gn_d_reportes.nmbre_cnslta,
													p_report_layout_name	=> v_gn_d_reportes.nmbre_plntlla,
													p_report_layout_type	=> v_gn_d_reportes.cdgo_frmto_plntlla,
													p_document_format		=> v_gn_d_reportes.cdgo_frmto_tpo);
		exception
			when others then
				o_cdgo_rspsta := 2;
				o_mnsje_rspsta := 'Error al encontrar datos del reporte asociado al acto de solicitud. Error No. '||o_cdgo_rspsta|| SQLCODE || ' - ' || SQLERRM;
				pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, 'pkg_gf_titulos_judicial.prc_gn_rprte_ttlo_jdcial_slctd',  v_nl, o_mnsje_rspsta, 1);
				raise v_error;
		end;

		if v_blob is not null then

			--3. actualizacion del acto
			begin
				pkg_gn_generalidades.prc_ac_acto(p_file_blob		=>	v_blob,
												 p_id_acto 			=>	p_id_acto,
												 p_ntfccion_atmtca  =>	'N');
			exception
				when others then
					o_cdgo_rspsta := 3;
					o_mnsje_rspsta := 'Error al encontrar datos del reporte asociado al acto de solicitud. Error No. '||o_cdgo_rspsta|| SQLCODE || ' - ' || SQLERRM;
					pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, 'pkg_gf_titulos_judicial.prc_gn_rprte_ttlo_jdcial_slctd',  v_nl, o_mnsje_rspsta, 1);
					raise v_error;
			end;

		else
			o_mnsje_rspsta := 'Problemas al generar el blob';
		end if;

        -- retorna a la aplicación actual
        apex_session.attach(p_app_id		=>  v_app_id,
							p_page_id		=>  v_app_page_id,
							p_session_id	=>  v('APP_SESSION'));

	exception
		when v_error then
			raise_application_error(-20001, o_mnsje_rspsta);
	end prc_gn_rprte_ttlo_jdcial_slctd;
/

