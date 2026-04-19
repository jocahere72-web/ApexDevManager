
  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PKG_GN_ACCIONES_DINAMICAS" as

    procedure prc_rg_informacion_accion(p_cdgo_clnte                  in  number,
                                        p_cdgo_prcso                  in  varchar2,
                                        p_nmbre_tbla                  in  varchar2,
                                        p_nmbre_cmpo                  in  varchar2,
                                        p_id_impsto                   in  number,
                                        p_id_impsto_sbmpsto           in  number,
                                        p_orgen                       in  number,
                                        p_url_ntfccion                in  varchar2 default null,
                                        o_cdgo_rspsta                 out number,
                                        o_mnsje_rspsta                out varchar2) as

    v_nl                   number;
    v_nmbre_up             varchar2(70) := 'pkg_gn_acciones_dinamicas.prc_rg_informacion_accion';

    begin
        o_cdgo_rspsta := 0;
        o_mnsje_rspsta := 'Informacion Registrada Exitosamente.';

        -- Determinamos el nivel del Log de la UPv
        v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,  null, v_nmbre_up, v_nl,'Entrando ' || systimestamp,1);

        -- Se insertan los datos en la tabla de gestion, de donde los procesos tomaran la informacion para
        -- realizar la gestion puntual por accion
        begin
            insert into gn_g_acciones_dinamica
                                             (cdgo_clnte,
                                              cdgo_prcso,
                                              nmbre_tbla,
                                              nmbre_cmpo,
                                              id_impsto,
                                              id_impsto_sbmpsto,
                                              orgen,
                                              url_ntfccion)
                                    values   (p_cdgo_clnte,
                                              p_cdgo_prcso,
                                              p_nmbre_tbla,
                                              p_nmbre_cmpo,
                                              p_id_impsto,
                                              p_id_impsto_sbmpsto,
                                              p_orgen,
                                              p_url_ntfccion);
        exception
            when others then
                o_cdgo_rspsta  := 5;
                o_mnsje_rspsta := o_cdgo_rspsta || ' Error al insertar la accion. ' || sqlerrm;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,  null, v_nmbre_up, v_nl, o_mnsje_rspsta || systimestamp,1);
                rollback;
                return;
        end;

    end prc_rg_informacion_accion;

    --Up que consulta la accion a realizar
    procedure prc_co_accion(p_cdgo_clnte                  in  number,
                            p_id_impsto                   in  number,
                            p_id_impsto_sbmpsto           in  number,
                            p_cdgo_prcso                  in  varchar2,
                            --p_orgen                       in  number,
                            o_rt_df_c_procesos_accion     out df_c_procesos_accion%rowtype,
                            o_cdgo_rspsta                 out number,
                            o_mnsje_rspsta                out varchar2) as

    v_nl                    number;
    v_nmbre_up              varchar2(70) := 'pkg_gn_acciones_dinamicas.prc_co_accion';

    begin
        -- Determinamos el nivel del Log de la UPv
        v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,  null, v_nmbre_up, v_nl,'Entrando ' || systimestamp,1);

        o_cdgo_rspsta   := 0;
        o_mnsje_rspsta  := 'Consulta realizada exitosamente.';

        --Se busca en la tabla parametrica la accion segun los datos enviados
        begin
            select  *
            into o_rt_df_c_procesos_accion
            from df_c_procesos_accion
            where cdgo_clnte            = p_cdgo_clnte
                and id_impsto           = p_id_impsto
                and id_impsto_sbmpsto   = p_id_impsto_sbmpsto
                and cdgo_prcso          = p_cdgo_prcso
                and actvo               = 'S';
        exception
            when no_data_found then
                null;
            when others then
                o_cdgo_rspsta  := 5;
                o_mnsje_rspsta := o_cdgo_rspsta || ' Error al insertar la accion. ' || sqlerrm;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,  null, v_nmbre_up, v_nl, o_mnsje_rspsta || systimestamp,1);
                return;
        end;
    end prc_co_accion;

    --Up que genera la accion segun parametrizacion
    procedure prc_gn_accion(p_cdgo_clnte                  in  number,
                            p_id_impsto                   in  number,
                            p_id_impsto_sbmpsto           in  number,
                            p_cdgo_prcso                  in  varchar2, --'RE'
                            p_nmbre_tbla                  in  varchar2,
                            p_nmbre_cmpo                  in  varchar2,
                            p_orgen                       in  number,
                            o_cdgo_rspsta                 out number,
                            o_mnsje_rspsta                out varchar2) as

    v_nl                        number;
    v_nmbre_up                  varchar2(70) := 'pkg_gn_acciones_dinamicas.prc_gn_accion';
    o_rt_df_c_procesos_accion   df_c_procesos_accion%rowtype;
    v_bloque_pl                 varchar2(2000);
    v_exste                     number;

    begin
        -- Determinamos el nivel del Log de la UPv
        v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,  null, v_nmbre_up, v_nl,'Entrando ' || systimestamp,1);

        o_cdgo_rspsta   := 0;
        o_mnsje_rspsta  := 'Consulta realizada exitosamente exitosamente.';

        --Se valida que exista el origen en la tabla para realizar la accion
        -- y que tenga url para la notificacion
        begin
            select 1
            into v_exste
            from gn_g_acciones_dinamica
            where cdgo_prcso            = p_cdgo_prcso
                and id_impsto           = p_id_impsto
                and id_impsto_sbmpsto   = p_id_impsto_sbmpsto
                and nmbre_tbla          = p_nmbre_tbla
                and nmbre_cmpo          = p_nmbre_cmpo
                and orgen               = p_orgen
                and estdo_prcsdo        = 'PENDIENTE'
                and url_ntfccion  is not null;
        exception
            when others then
                o_cdgo_rspsta  := 1;
                o_mnsje_rspsta := o_cdgo_rspsta || ' Error al consultar la accion del origen. ' || sqlerrm;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,  null, v_nmbre_up, v_nl, o_mnsje_rspsta || systimestamp,1);
                return;
        end;

        --Se busca en la tabla parametrica la accion segun los datos enviados
        begin
            pkg_gn_acciones_dinamicas.prc_co_accion(p_cdgo_clnte                => p_cdgo_clnte,
                                                    p_id_impsto                 => p_id_impsto,
                                                    p_id_impsto_sbmpsto         => p_id_impsto_sbmpsto,
                                                    p_cdgo_prcso                => p_cdgo_prcso,
                                                    o_rt_df_c_procesos_accion   => o_rt_df_c_procesos_accion,
                                                    o_cdgo_rspsta               => o_cdgo_rspsta,
                                                    o_mnsje_rspsta              => o_mnsje_rspsta);
            if o_cdgo_rspsta != 0 then
                o_cdgo_rspsta  := 5;
                o_mnsje_rspsta := o_cdgo_rspsta || ' Error al consultar la accion. ' || o_mnsje_rspsta;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,  null, v_nmbre_up, v_nl, o_mnsje_rspsta || systimestamp,1);
                return;
            end if;
        exception
            when others then
                o_cdgo_rspsta  := 6;
                o_mnsje_rspsta := o_cdgo_rspsta || ' Error al insertar la accion. ' || sqlerrm;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,  null, v_nmbre_up, v_nl, o_mnsje_rspsta || systimestamp,1);
                return;
        end;
        --DBMS_OUTPUT.PUT_LINE('Se ejecuta la unidad de programa parametrizada ' );
        --Se ejecuta la unidad de programa parametrizada
        v_bloque_pl := ' begin PKG_GN_ACCIONES_DINAMICAS.' ||
                               o_rt_df_c_procesos_accion.undad_prgrma || '(
                                p_cdgo_clnte        => :p_cdgo_clnte,
                                p_id_impsto         => :p_id_impsto,
                                p_id_impsto_sbmpsto => :p_id_impsto_sbmpsto,
                                p_cdgo_prcso        => :p_cdgo_prcso,
                                p_orgen             => :p_orgen,
                                p_nmbre_tbla        => :p_nmbre_tbla,
                                p_nmbre_cmpo        => :p_nmbre_cmpo,
                                o_cdgo_rspsta	    => :o_cdgo_rspsta,
                                o_mnsje_rspsta      => :o_mnsje_rspsta
                                );
                        end;';
        --Ejecutamos la UP
        begin
            execute immediate v_bloque_pl
              using in p_cdgo_clnte, p_id_impsto, p_id_impsto_sbmpsto, p_cdgo_prcso, p_orgen , p_nmbre_tbla, p_nmbre_cmpo,
                out o_cdgo_rspsta, out o_mnsje_rspsta;

            --DBMS_OUTPUT.PUT_LINE('prc_gn_accion o_cdgo_rspsta '||o_cdgo_rspsta);

            if o_cdgo_rspsta != 0 then
                --o_cdgo_rspsta  := 10;
                o_mnsje_rspsta := o_cdgo_rspsta ||' '|| o_mnsje_rspsta ;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,  null, v_nmbre_up, v_nl, o_mnsje_rspsta || systimestamp,1);
                return;
            end if;

        exception
            when others then
                o_cdgo_rspsta  := 11;
                o_mnsje_rspsta := o_cdgo_rspsta || ' Problemas al ejecutar UP. ' || sqlerrm;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,  null, v_nmbre_up, v_nl, o_mnsje_rspsta || systimestamp,1);
                return;
        end;
    end prc_gn_accion;

    --Up que realiza la accion para los recaudos aplicados
    procedure prc_gn_aplica_recaudo_rentas( p_cdgo_clnte                  in  number,
                                            p_id_impsto                   in  number,
                                            p_id_impsto_sbmpsto           in  number,
                                            p_cdgo_prcso                  in  varchar2,
                                            p_nmbre_tbla                  in  varchar2,
                                            p_nmbre_cmpo                  in  varchar2,
                                            p_orgen                       in  number,
                                            o_cdgo_rspsta                 out number,
                                            o_mnsje_rspsta                out varchar2) as

    v_nl                        number;
    v_nmbre_up                  varchar2(200) := 'pkg_gn_acciones_dinamicas.prc_gn_aplica_recaudo_rentas';
    v_resp                      clob;
    v_error_ws                  varchar2(4000);
    v_token                     varchar2(4000);
    v_token_resp                varchar2(4000);
    v_exste                     number;
    v_nmro_dcmnto               re_g_documentos.nmro_dcmnto%type;

    v_cdgo_rcdo_orgn_tpo        re_g_recaudos.cdgo_rcdo_orgn_tpo%type;
    v_id_orgen                  re_g_recaudos.id_orgen%type;
    v_id_impsto                 df_c_impuestos.id_impsto%type;
    v_id_impsto_sbmpsto         df_i_impuestos_subimpuesto.id_impsto_sbmpsto%type;
    v_id_sjto_impsto            si_i_sujetos_impuesto.id_sjto_impsto%type;
    v_indcdor_dcmnto_pgdo       varchar2(1);
    v_vlor                      re_g_recaudos.vlor%type;
    v_fcha_rcdo                 re_g_recaudos.fcha_rcdo%type;
    v_nmbre_impsto              v_df_i_impuestos_subimpuesto.nmbre_impsto%type;
    v_nmbre_impsto_sbmpsto      v_df_i_impuestos_subimpuesto.nmbre_impsto_sbmpsto%type;
    v_idntfccion_sjto           v_si_i_sujetos_responsable.idntfccion_sjto%type;
    v_nmbre_rzon_scial          v_si_i_sujetos_responsable.nmbre_rzon_scial%type;
    v_json_infrmcion_pgo_dcmnto clob;
    v_url_ntfccion              gn_g_acciones_dinamica.url_ntfccion%type;
    v_cnctncion                  varchar2(1000);

    begin
        --DBMS_OUTPUT.PUT_LINE('Entro a prc_gn_aplica_recaudo_rentas');
        --DBMS_OUTPUT.PUT_LINE('p_id_impsto '||p_id_impsto);
        --DBMS_OUTPUT.PUT_LINE('p_id_impsto_sbmpsto '||p_id_impsto_sbmpsto);
        --DBMS_OUTPUT.PUT_LINE('p_cdgo_prcso '||p_cdgo_prcso);
        --DBMS_OUTPUT.PUT_LINE('p_orgen '||p_orgen);
        --DBMS_OUTPUT.PUT_LINE('p_nmbre_tbla '||p_nmbre_tbla);
        --DBMS_OUTPUT.PUT_LINE('p_nmbre_cmpo '||p_nmbre_cmpo);

        o_cdgo_rspsta := 0;
        o_mnsje_rspsta := 'Accion realizada correctamente';

        -- Determinamos el nivel del Log de la UPv
        v_nl := pkg_sg_log.fnc_ca_nivel_log( p_cdgo_clnte, null, v_nmbre_up);
        pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_nmbre_up,  v_nl, 'Entrando ' || systimestamp, 1);

        begin
            select url_ntfccion
            into v_url_ntfccion
            from gn_g_acciones_dinamica
            where cdgo_prcso            = p_cdgo_prcso
                and id_impsto           = p_id_impsto
                and id_impsto_sbmpsto   = p_id_impsto_sbmpsto
                and nmbre_tbla          = p_nmbre_tbla
                and nmbre_cmpo          = p_nmbre_cmpo
                and orgen               = p_orgen
                and estdo_prcsdo        = 'PENDIENTE'
                and url_ntfccion  is not null;
         exception
            when others then
                o_cdgo_rspsta  := 1;
                o_mnsje_rspsta := o_cdgo_rspsta || ' Error al consultar la accion. ' || sqlerrm;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,  null, v_nmbre_up, v_nl, o_mnsje_rspsta || systimestamp,1);
                return;
        end;

        --Se busca el numero del documento para consultar la informacion del pago
         begin
            select nmro_dcmnto
            into v_nmro_dcmnto
            from re_g_documentos
            where id_impsto             = p_id_impsto
                and id_impsto_sbmpsto   = p_id_impsto_sbmpsto
                and id_dcmnto           = p_orgen;
        exception
            when others then
                o_cdgo_rspsta  := 5;
                o_mnsje_rspsta := o_cdgo_rspsta || ' Error al consultar el número del documento. ' || sqlerrm;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,  null, v_nmbre_up, v_nl, o_mnsje_rspsta || systimestamp,1);
                return;
        end;

        begin
            --Se valida la informacion de pago del documento
            pkg_re_documentos.prc_vl_documento_pagado(  p_cdgo_clnte            	=> p_cdgo_clnte,
                                                        p_nmro_dcmnto           	=> v_nmro_dcmnto,
                                                        o_cdgo_rcdo_orgn_tpo    	=> v_cdgo_rcdo_orgn_tpo,
                                                        o_id_orgen              	=> v_id_orgen,
                                                        o_id_impsto             	=> v_id_impsto,
                                                        o_id_impsto_sbmpsto     	=> v_id_impsto_sbmpsto,
                                                        o_id_sjto_impsto        	=> v_id_sjto_impsto,
                                                        o_indcdor_dcmnto_pgdo   	=> v_indcdor_dcmnto_pgdo,
                                                        o_vlor                  	=> v_vlor,
                                                        o_fcha_rcdo             	=> v_fcha_rcdo,
                                                        o_cdgo_rspsta           	=> o_cdgo_rspsta,
                                                        o_mnsje_rspsta          	=> o_mnsje_rspsta
                                                        );

            if (o_cdgo_rspsta != 0) then
                    o_cdgo_rspsta  := 10;
                    o_mnsje_rspsta := o_cdgo_rspsta || ' Ocurrio un error al consultar el estado del documento. ' || o_mnsje_rspsta;
                    pkg_sg_log.prc_rg_log(p_cdgo_clnte,  null, v_nmbre_up, v_nl, o_mnsje_rspsta || systimestamp,1);
                    return;
            else
                if v_indcdor_dcmnto_pgdo = 'N' then
                    o_cdgo_rspsta  := 11;
                    o_mnsje_rspsta := o_cdgo_rspsta || '  ' || o_mnsje_rspsta;
                    pkg_sg_log.prc_rg_log(p_cdgo_clnte,  null, v_nmbre_up, v_nl, o_mnsje_rspsta || systimestamp,1);

                    update gn_g_acciones_dinamica
                    set    nmro_intntos = nmro_intntos + 1
                    where cdgo_prcso            = p_cdgo_prcso
                        and id_impsto           = p_id_impsto
                        and id_impsto_sbmpsto   = p_id_impsto_sbmpsto
                        and nmbre_tbla          = p_nmbre_tbla
                        and nmbre_cmpo          = p_nmbre_cmpo
                        and orgen               = p_orgen
                        and estdo_prcsdo        = 'PENDIENTE'
                        and url_ntfccion  is not null;
                    return;

                elsif v_indcdor_dcmnto_pgdo = 'S' then
                    update gn_g_acciones_dinamica
                    set     indcdor_lsto_prcsar = 'S'
                    where cdgo_prcso            = p_cdgo_prcso
                        and id_impsto           = p_id_impsto
                        and id_impsto_sbmpsto   = p_id_impsto_sbmpsto
                        and nmbre_tbla          = p_nmbre_tbla
                        and nmbre_cmpo          = p_nmbre_cmpo
                        and orgen               = p_orgen
                        and estdo_prcsdo        = 'PENDIENTE'
                        and url_ntfccion  is not null;
                end if;

                -- Se consulta el id_impsto y subimpuesto
                begin
                    select nmbre_impsto, nmbre_impsto_sbmpsto
                    into v_nmbre_impsto, v_nmbre_impsto_sbmpsto
                    from v_df_i_impuestos_subimpuesto
                    where id_impsto = v_id_impsto
                        and id_impsto_sbmpsto = v_id_impsto_sbmpsto;
                exception
                    when others then
                        o_cdgo_rspsta  := 15;
                        o_mnsje_rspsta := o_cdgo_rspsta || ' Ocurrio un error al consultar la información del Tributo - SubTributo. ' || sqlerrm;
                        pkg_sg_log.prc_rg_log(p_cdgo_clnte,  null, v_nmbre_up, v_nl, o_mnsje_rspsta || systimestamp,1);
                        return;
                end;

                begin
                    select idntfccion_sjto, nmbre_rzon_scial
                    into v_idntfccion_sjto, v_nmbre_rzon_scial
                    from v_si_i_sujetos_responsable
                    where id_sjto_impsto = v_id_sjto_impsto
                        and prncpal_s_n = 'S';
                exception
                    when others then
                        o_cdgo_rspsta  := 20;
                        o_mnsje_rspsta := o_cdgo_rspsta || ' Ocurrio un error al consultar la información del sujeto impuesto ' || sqlerrm;
                        pkg_sg_log.prc_rg_log(p_cdgo_clnte,  null, v_nmbre_up, v_nl, o_mnsje_rspsta || systimestamp,1);
                        return;
                end;

                -- Se concatenan los datos para armar el hash
                v_cnctncion := v_nmro_dcmnto||v_idntfccion_sjto||v_vlor;

                select json_object(
                                 'numero_documento'      value v_nmro_dcmnto,
                                 'impuesto'              value v_nmbre_impsto,
                                 'subimpuesto'           value v_nmbre_impsto_sbmpsto,
                                 'estado'                value
                                                                 case v_indcdor_dcmnto_pgdo
                                                                   when 'N' then 'NO PAGADO'
                                                                   when 'S' then 'PAGADO'
                                                                   else 'SIN DEFINIR'
                                                                 end,
                                 'valor'                 value v_vlor,
                                 'fecha_pago'            value
                                                                 case
                                                                   when v_fcha_rcdo is not null
                                                                   then to_char(v_fcha_rcdo,'YYYY-MM-DD')
                                                                 end,
                                 'identificacion'        value v_idntfccion_sjto,
                                 'nombre_razon_social'   value v_nmbre_rzon_scial,
                                 'hash'                  value standard_hash(v_cnctncion, 'SHA256')
                               )
                        into   v_json_infrmcion_pgo_dcmnto
                        from   dual;
             end if;
             --dbms_output.put_line('v_json_infrmcion_pgo_dcmnto '|| v_json_infrmcion_pgo_dcmnto);
        exception
            when others then
                o_cdgo_rspsta  := 25;
                o_mnsje_rspsta := o_cdgo_rspsta || ' Ocurrio un error al generar la información del pago del documento. ' || sqlerrm;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,  null, v_nmbre_up, v_nl, o_mnsje_rspsta || systimestamp,1);
                return;
        end;

        -- Limpiar cabeceras
        apex_web_service.g_request_headers.delete;
        apex_web_service.g_request_headers(1).name  := 'Content-Type';
        apex_web_service.g_request_headers(1).value := 'application/json';

        begin
            v_resp := null;
            v_resp := apex_web_service.make_rest_request(   p_url               => v_url_ntfccion,
                                                            p_http_method       => 'POST',
                                                            p_body              => v_json_infrmcion_pgo_dcmnto, --'{"numero_documento":"20250249443"}',
                                                            p_wallet_path       => l_wallet.wallet_path,
                                                            p_wallet_pwd        => l_wallet.wallet_pwd
                                                        );
            --DBMS_OUTPUT.PUT_LINE('v_resp '||v_resp);
            begin
                --Si responden ok, se actualizan datos de procesado
                if apex_web_service.g_status_code = 200 then
                   --DBMS_OUTPUT.PUT_LINE('Todo bien ');
                    update gn_g_acciones_dinamica
                    set     estdo_prcsdo        = 'PROCESADO',
                            nmro_intntos        = nmro_intntos + 1,
                            rspsta_rcbda        = 'G_STATUS_CODE : '|| apex_web_service.g_status_code || ' ' || v_resp
                    where cdgo_prcso            = p_cdgo_prcso
                        and id_impsto           = p_id_impsto
                        and id_impsto_sbmpsto   = p_id_impsto_sbmpsto
                        and nmbre_tbla          = p_nmbre_tbla
                        and nmbre_cmpo          = p_nmbre_cmpo
                        and orgen               = p_orgen
                        and estdo_prcsdo        = 'PENDIENTE';
                else
                    --Si no se logro notificar el pago, se marca el registro como listo para procesar
                    update gn_g_acciones_dinamica
                    set     indcdor_lsto_prcsar = 'S',
                            nmro_intntos        = nmro_intntos + 1,
                            rspsta_rcbda        = 'G_STATUS_CODE : '|| apex_web_service.g_status_code || ' ' || v_resp
                    where cdgo_prcso            = p_cdgo_prcso
                        and id_impsto           = p_id_impsto
                        and id_impsto_sbmpsto   = p_id_impsto_sbmpsto
                        and nmbre_tbla          = p_nmbre_tbla
                        and nmbre_cmpo          = p_nmbre_cmpo
                        and orgen               = p_orgen
                        and estdo_prcsdo        = 'PENDIENTE';
                    --DBMS_OUTPUT.PUT_LINE('Todo mal ');
                end if;

            exception
                when others then
                    o_cdgo_rspsta  := 25;
                    o_mnsje_rspsta := o_cdgo_rspsta || ' Ocurrio un error al generar la información del pago del documento. ' || sqlerrm;
                    pkg_sg_log.prc_rg_log(p_cdgo_clnte,  null, v_nmbre_up, v_nl, o_mnsje_rspsta || systimestamp,1);
                    return;
            end;

        exception
            when others then
                select  utl_http.get_detailed_sqlerrm
                into    v_error_ws from dual;
                o_cdgo_rspsta := 35;
                o_mnsje_rspsta := v_error_ws;
                --DBMS_OUTPUT.PUT_LINE('v_error_ws '||v_error_ws);
                pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_nmbre_up,  v_nl, 'Error en llamado al WS: '||o_cdgo_rspsta||' - '||o_mnsje_rspsta, 1);
                return;
        end;

    exception
        when others then
            o_cdgo_rspsta  := 99;
            o_mnsje_rspsta := o_cdgo_rspsta || ' Ocurrio un error general para la accion de recaudos de rentas. ' || sqlerrm;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,  null, v_nmbre_up, v_nl, o_mnsje_rspsta || systimestamp,1);
            return;
    end prc_gn_aplica_recaudo_rentas;


    procedure prc_co_transacciones as

    v_nl                    number;
    v_nmbre_up              varchar2(70) := 'pkg_gn_acciones_dinamicas.prc_co_transacciones';
    v_cdgo_clnte            df_s_clientes.cdgo_clnte%type;
    v_cdgo_rspsta           number;
    v_mnsje_rspsta          varchar2(1000);

    begin

        select cdgo_clnte into v_cdgo_clnte from df_s_clientes;

        -- Determinamos el nivel del Log de la UPv
        v_nl := pkg_sg_log.fnc_ca_nivel_log(v_cdgo_clnte, null, v_nmbre_up);
        pkg_sg_log.prc_rg_log(v_cdgo_clnte,  null, v_nmbre_up, v_nl,'Entrando ' || systimestamp,1);


        -- Se consultan los registros que no se han procesado
        begin

            for i in (select * --nmbre_tbla, nmbre_cmpo, orgen
                        from gn_g_acciones_dinamica a
                        where estdo_prcsdo = 'PENDIENTE'
                            and indcdor_lsto_prcsar = 'S'  --Se intento notificar cuando se aplico el pago, pero sucedio algo que no lo dejo procesar
                        ) loop
                        --DBMS_OUTPUT.PUT_LINE('---------------------------- EMPIEZA' );
                        --DBMS_OUTPUT.PUT_LINE('i.orgen = ' || i.orgen);
                        pkg_gn_acciones_dinamicas.prc_gn_accion(    p_cdgo_clnte 			=> i.cdgo_clnte,
                                                                    p_id_impsto 			=> i.id_impsto,
                                                                    p_id_impsto_sbmpsto 	=> i.id_impsto_sbmpsto,
                                                                    p_cdgo_prcso 			=> i.cdgo_prcso, -- ojooo
                                                                    p_nmbre_tbla 			=> i.nmbre_tbla,
                                                                    p_nmbre_cmpo 			=> i.nmbre_cmpo,
                                                                    p_orgen 				=> i.orgen,
                                                                    o_cdgo_rspsta 			=> v_cdgo_rspsta,
                                                                    o_mnsje_rspsta 			=> v_mnsje_rspsta
                                                                  );
                        if v_cdgo_rspsta = 0 then
                        --DBMS_OUTPUT.PUT_LINE('*************************************  commit = ' || v_cdgo_rspsta);
                        --DBMS_OUTPUT.PUT_LINE('v_cdgo_rspsta  commit= ' || v_cdgo_rspsta);
                        --DBMS_OUTPUT.PUT_LINE('v_mnsje_rspsta  commit= ' || v_mnsje_rspsta);
                            commit;
                        else
                            --DBMS_OUTPUT.PUT_LINE('*************************************  rollback= ' || v_cdgo_rspsta);
                            rollback;
                            continue;
                        end if;

                        --DBMS_OUTPUT.PUT_LINE('v_cdgo_rspsta = ' || v_cdgo_rspsta);
                        --DBMS_OUTPUT.PUT_LINE('v_mnsje_rspsta = ' || v_mnsje_rspsta);
            end loop;

            DBMS_OUTPUT.PUT_LINE(' Procesamiento exitoso ');


        exception
            when others then
                v_cdgo_rspsta  := 5;
                v_mnsje_rspsta := v_cdgo_rspsta || ' Error al insertar la accion. ' || sqlerrm;
                pkg_sg_log.prc_rg_log(v_cdgo_clnte,  null, v_nmbre_up, v_nl, v_mnsje_rspsta || systimestamp,1);
                rollback;
                return;
        end;

    end prc_co_transacciones;

end pkg_gn_acciones_dinamicas;
/

