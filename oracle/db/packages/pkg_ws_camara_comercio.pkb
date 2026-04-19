
  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PKG_WS_CAMARA_COMERCIO" as

  /*
      Obtiene la url y el manejador parametrizado dependiendo del codigo del api y el proveedor.
  */
  function fnc_ob_url_manejador(p_cdgo_api  in varchar2,
                                p_id_prvdor in number) return clob is
    v_url             varchar2(200);
    v_cdgo_mnjdor     varchar2(10);
    e_excption_intrna exception;
    v_resp            clob;

  begin

    begin
      select p.url, p.cdgo_mnjdor
        into v_url, v_cdgo_mnjdor
        from ws_d_provedores_api p
       where p.id_prvdor = p_id_prvdor
         and p.cdgo_api = p_cdgo_api;
    exception
      when others then
        raise e_excption_intrna;
    end;

    select json_object('url' value v_url, 'manejador' value v_cdgo_mnjdor)
      into v_resp
      from dual;

    return v_resp;

  end fnc_ob_url_manejador;

  function fnc_ob_propiedad_provedor(p_cdgo_clnte  in number,
                                     p_id_impsto   in number,
                                     p_id_prvdor   in number,
                                     p_cdgo_prpdad in varchar2)
    return varchar2 as
    v_vlor varchar2(4000);
  begin
    begin
      select v.vlor
        into v_vlor
        from ws_d_provedor_propiedades p
        join ws_d_prvdor_prpddes_impsto v
          on v.id_prvdor_prpdde = p.id_prvdor_prpdde
       where p.id_prvdor = p_id_prvdor
         and p.cdgo_prpdad = p_cdgo_prpdad
         and v.cdgo_clnte = p_cdgo_clnte
         and v.id_impsto = p_id_impsto;
    exception
      when others then
        v_vlor := null;
    end;

    return v_vlor;

  end fnc_ob_propiedad_provedor;

  procedure prc_co_consultarDatos(p_cdgo_clnte      in number,
                                  p_tpo_prcso_cnlta in varchar2,
                                  p_id_prvdor       in number,
                                  p_id_impsto       in number,
                                  p_fcha_incial     in timestamp,
                                  p_fcha_fnal       in timestamp,
                                  p_mtrcla          in varchar2 default null,
                                  p_tpo_rprte       in number default 1,
                                  p_id_usrio        number,
                                  p_tpo_accion      in varchar2,
                                  o_cdgo_rspsta     out number,
                                  o_mnsje_rspsta    out clob) as

    v_url_mnjdor clob;
    v_g          clob;
    v_nl         number;
    nmbre_up     varchar2(100) := 'pkg_ws_camara_comercio.prc_co_consultarDatos';
    v_pge_actal  number := 1;
    v_sgnte_pgna number;
    v_sgnte_url  clob;
    v_ultma_pgna number;
    v_client_id  ws_d_prvdor_prpddes_impsto.vlor%type;
    v_api_key    ws_d_prvdor_prpddes_impsto.vlor%type;
    v_accetp     ws_d_prvdor_prpddes_impsto.vlor%type;
    v_cntent_tpy ws_d_prvdor_prpddes_impsto.vlor%type;
    v_body       json_object_t := new json_object_t();
    v_rspsta     clob;

  begin

    begin

      o_cdgo_rspsta  := 0;
      o_mnsje_rspsta := 'OK';

      v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, nmbre_up);

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'Entrando:',
                            1);

      -- Valida tipo de ACCION
      if p_tpo_accion = 'DA' then

        v_body.put('url_accion',
                   json_value(fnc_ob_url_manejador('DRAF', p_id_prvdor),
                              '$.url'));

      elsif p_tpo_accion = 'RM' then

        --Obtener valor de propiedades.
        v_client_id := fnc_ob_propiedad_provedor(p_cdgo_clnte,
                                                 p_id_impsto,
                                                 p_id_prvdor,
                                                 'ID');

        v_api_key := fnc_ob_propiedad_provedor(p_cdgo_clnte,
                                               p_id_impsto,
                                               p_id_prvdor,
                                               'KEY');

        v_accetp := fnc_ob_propiedad_provedor(p_cdgo_clnte,
                                              p_id_impsto,
                                              p_id_prvdor,
                                              'ACC');

        v_cntent_tpy := fnc_ob_propiedad_provedor(p_cdgo_clnte,
                                                  p_id_impsto,
                                                  p_id_prvdor,
                                                  'CNT');

        /*elsif p_tpo_accion = 'CPE' then

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                    null,
                    nmbre_up,
                    v_nl,
                    'Entrando:',
                    1);

        prc_co_DatosPropietario(p_cdgo_clnte   => p_cdgo_clnte,
                    p_id_prvdor    => p_id_prvdor,
                    p_id_impsto    => p_id_impsto,
                    p_id_usrio     => p_id_usrio,
                    o_cdgo_rspsta  => o_cdgo_rspsta,
                    o_mnsje_rspsta => o_mnsje_rspsta);

        if o_cdgo_rspsta <> 0 then
          o_cdgo_rspsta  := 205;
          o_mnsje_rspsta := o_cdgo_rspsta || '-' || o_mnsje_rspsta;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                    null,
                    nmbre_up,
                    v_nl,
                    o_mnsje_rspsta || ' , ' || sqlerrm,
                    6);
          return;
        else
          o_cdgo_rspsta  := 0;
          o_mnsje_rspsta := 'Acción CPE procesada exitosamente.' || ' - ' ||
                  o_mnsje_rspsta;
          return;
        end if;*/

      end if; -- Valida tipo de ACCION

      -- Se consulta API para consultar expedientes al servicio de camara de comercio.
      v_url_mnjdor := fnc_ob_url_manejador('REC', p_id_prvdor);

      -- El servicio se maneja con paginador.
      -- Se realiza petición al servicio hasta que no hayan más numero de página por consultar.
      loop

        -- Agregar a v_body variables para cuerpo del JSON a enviar en la petición del servicio.
        v_body.put('page', v_pge_actal);
        v_body.put('start_date', to_char(p_fcha_incial, 'YYYY-MM-DD'));
        v_body.put('end_date', to_char(p_fcha_fnal, 'YYYY-MM-DD'));

        -- Asinga JSON que registrará en la tabla de confecamara campo request_json
        v_g := v_body.to_clob;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'Body Petición ' || v_g,
                              1);

        -- Limipar cabeceras
        APEX_WEB_SERVICE.g_request_headers.delete();

        -- Setear cabeceras de la peticion
        APEX_WEB_SERVICE.g_request_headers(1).name := 'Accept';
        APEX_WEB_SERVICE.g_request_headers(1).value := v_accetp;

        APEX_WEB_SERVICE.g_request_headers(2).name := 'Content-Type';
        APEX_WEB_SERVICE.g_request_headers(2).value := v_cntent_tpy;

        APEX_WEB_SERVICE.g_request_headers(3).name := 'X-Client-ID';
        APEX_WEB_SERVICE.g_request_headers(3).value := v_client_id;

        APEX_WEB_SERVICE.g_request_headers(4).name := 'X-API-Key';
        APEX_WEB_SERVICE.g_request_headers(4).value := v_api_key;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'v_accetp ' || v_accetp,
                              1);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'v_cntent_tpy ' || v_cntent_tpy,
                              1);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'v_client_id ' || v_client_id,
                              1);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'v_api_key ' || v_api_key,
                              1);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'v_body.to_clob ' || v_body.to_clob,
                              1);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'URL ' || json_value(v_url_mnjdor, '$.url'),
                              1);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'Manejador ' ||
                              json_value(v_url_mnjdor, '$.manejador'),
                              1);

        begin
          -- Se realiza la peticion al servicio
          v_rspsta := APEX_WEB_SERVICE.make_rest_request(p_url         => json_value(v_url_mnjdor,
                                                                                     '$.url'),
                                                         p_http_method => json_value(v_url_mnjdor,
                                                                                     '$.manejador'),
                                                         p_body        => v_body.to_clob);
        exception
          when others then
            o_cdgo_rspsta  := 10;
            o_mnsje_rspsta := 'La Solicitud del servicio falló ' || sqlerrm;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta,
                                  1);
            return;
        end;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              '---> Despues de petición al web services:',
                              1);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              '$$$---> Respuesta del WS' || v_rspsta,
                              1);

        -- Si se obtuvo respuesta exitosa del servicio
        if v_rspsta is not null then
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                'Dentro de respuesta not null.',
                                1);

          -- si mensaje de respuesta es Resultados encontrados
          if json_value(v_rspsta, '$.message') = 'Resultados encontrados' then
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  nmbre_up,
                                  v_nl,
                                  'Dentro de Resultados encontrados.',
                                  1);

            -- Se valida que la cantidad de expedinete sea > 0
            if json_value(v_rspsta, '$.data.per_page') > '0' then
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    nmbre_up,
                                    v_nl,
                                    'Dentro de numero de pagina > 0.',
                                    1);

              --Llamar a UP para realizar regstro de los datos.
              begin
                --Quitar comillas simples de la respuesta.
                v_rspsta := replace(v_rspsta, chr(39), null);
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      nmbre_up,
                                      v_nl,
                                      '$$$---> Respuesta del WS replace' ||
                                      v_rspsta,
                                      1);
                pkg_ws_camara_comercio.prc_rg_datos(p_cdgo_clnte   => p_cdgo_clnte,
                                                    p_json         => v_rspsta,
                                                    p_json_cnslta  => v_g,
                                                    p_id_usrio     => p_id_usrio,
                                                    p_tpo_rprte    => p_tpo_rprte,
                                                    p_id_impsto    => p_id_impsto,
                                                    p_fcha_incial  => p_fcha_incial,
                                                    p_fcha_fnal    => p_fcha_fnal,
                                                    o_cdgo_rspsta  => o_cdgo_rspsta,
                                                    o_mnsje_rspsta => o_mnsje_rspsta);

                if o_cdgo_rspsta <> 0 then
                  rollback;
                  o_cdgo_rspsta  := 20;
                  o_mnsje_rspsta := 'Error durante el registro de la novedad ' ||
                                    o_mnsje_rspsta;
                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        null,
                                        nmbre_up,
                                        v_nl,
                                        o_cdgo_rspsta || '.' ||
                                        o_mnsje_rspsta,
                                        1);
                  --continue;
                end if;

              exception
                when others then
                  rollback;
                  o_cdgo_rspsta  := 30;
                  o_mnsje_rspsta := 'Error al llamar UP prc_rg_novedades ' ||
                                    sqlerrm;
                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        null,
                                        nmbre_up,
                                        v_nl,
                                        o_cdgo_rspsta || '.' ||
                                        o_mnsje_rspsta,
                                        1);
                  --continue;
              end;

              /*Campos de paginación

                  o current_page: Pagina actual
                  o first_page_url: Url de la primera pagina
                  o From: Primer registro donde empieza
                  o Last_page: Ultima pagina
                  o Last_page_url: Url de la ultima pagina
                  o Next_page_url: Url de la siguiente pagina
                  o Path: Ruta a la cual fue realizada la petición
                  o Per_page: Cantidad de registros por pagina
                  o Prev_page_url: Pagina anterior
                  o To: Ultimo registro
                  o Total: Totalidad de registros consultados

              */
              --PAGINAS
              v_ultma_pgna := json_value(v_rspsta, '$.data.last_page');
              v_sgnte_url  := json_value(v_rspsta, '$.data.next_page_url');
              v_sgnte_pgna := to_number(substr(v_sgnte_url, -1));

            else

              o_cdgo_rspsta  := 40;
              o_mnsje_rspsta := 'La Solicitud del servicio devolvio 0 registros.';
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    nmbre_up,
                                    v_nl,
                                    'La Solicitud del servicio devolvio 0 registros' ||
                                    v_rspsta,
                                    1);
              return;

            end if; -- Fin -- Se valida que la cantidad de expedinete sea > 0

          else

            o_cdgo_rspsta  := 50;
            o_mnsje_rspsta := 'La Solicitud del servicio no encontró la página';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta || v_rspsta,
                                  1);
            return;

          end if; --Fin -- si mensaje de respuesta Resultados encontrados

        else
          o_cdgo_rspsta  := 60;
          o_mnsje_rspsta := 'No se pudo obtener respuesta del servicio.';
          return;

        end if; -- Fin -- Si se obtuvo respuesta exitosa del servicio

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              '---> v_pge_actal ANTES ' || v_pge_actal,
                              1);
        v_pge_actal := v_sgnte_pgna;

        --Se limpia el campo v_pge_actal en el  JSON
        v_body.remove('page');
        v_body.remove('start_date');
        v_body.remove('end_date');

        -- Condición de salida, si no hay más páginas por consultar.
        --exit when v_sgnte_url is null;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              '---> v_pge_actal DESPUES ' || v_pge_actal,
                              1);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              '---> v_sgnte_url ' || v_sgnte_url,
                              1);

        --Salir del loop si no existe página siguiente.
        exit when v_sgnte_url is null;

      end loop;

    exception
      when others then
        o_cdgo_rspsta  := 70;
        o_mnsje_rspsta := 'Error al intentar realizar la peticion al servicio de Confecamaras.' ||
                          sqlerrm || ' - ' || sqlcode;
        rollback;
        return;
    end;

    commit;

  end prc_co_consultarDatos;

  procedure prc_gn_novedades(p_cdgo_clnte        in number,
                             p_id_prvdor         in number,
                             p_id_impsto         in number,
                             p_id_impsto_sbmpsto in number,
                             p_id_usrio          in number,
                             p_tpo_prcso_cnlta   in varchar2,
                             p_fcha_incial       in timestamp,
                             p_fcha_fnal         in timestamp,
                             p_tpo_rprte         in number,
                             p_tpo_accion        in varchar2,
                             p_obsrvcion         in varchar2,
                             p_id_fljo           in number,
                             o_id_session        out number,
                             o_id_instncia_fljo  out number,
                             o_cdgo_rspsta       out number,
                             o_mnsje_rspsta      out varchar2) as

    v_dtos_prncples            json_object_t := new json_object_t();
    v_dtos_rspnsble            json_object_t := new json_object_t();
    v_dtos_rspnsbles           json_array_t := new json_array_t();
    keys                       json_key_list;
    v_si_c_sujetos             si_c_sujetos%rowtype;
    v_si_i_personas            si_i_personas%rowtype;
    v_si_i_sujetos_responsable si_i_sujetos_responsable%rowtype;
    v_id_sjto                  si_c_sujetos.id_sjto%type;
    v_id_sjto_impsto           si_i_sujetos_impuesto.id_sjto_impsto%type;
    v_id_impsto                si_i_sujetos_impuesto.id_impsto%type;
    v_tpo_prsna                si_i_personas.tpo_prsna%type;
    v_cdgo_idntfccion_tpo      si_i_personas.cdgo_idntfccion_tpo%type;
    v_idntfccion               si_c_sujetos.idntfccion%type;
    v_id_sjto_rspnsble         si_i_sujetos_responsable.id_sjto_rspnsble%type;
    v_prmer_nmbre              si_i_sujetos_responsable.prmer_nmbre%type;
    v_sgndo_nmbre              si_i_sujetos_responsable.sgndo_nmbre%type;
    v_prmer_aplldo             si_i_sujetos_responsable.prmer_aplldo%type;
    v_sgndo_aplldo             si_i_sujetos_responsable.sgndo_aplldo%type;
    v_nmbre_rzon_scial         si_i_personas.nmbre_rzon_scial%type;
    v_id_dprtmnto              si_c_sujetos.id_dprtmnto%type;
    v_id_mncpio                si_c_sujetos.id_mncpio%type;
    v_drccion                  si_c_sujetos.drccion%type;
    v_id_dprtmnto_ntfccion     si_i_sujetos_impuesto.id_dprtmnto_ntfccion%type;
    v_id_mncpio_ntfccion       si_i_sujetos_impuesto.id_mncpio_ntfccion%type;
    v_drccion_ntfccion         si_i_sujetos_impuesto.drccion_ntfccion%type;
    v_tlfno                    si_i_sujetos_impuesto.tlfno%type;
    v_email                    si_i_sujetos_impuesto.email%type;
    v_id_sjto_tpo              si_i_personas.id_sjto_tpo%type;
    v_nmro_rgstro_cmra_cmrcio  si_i_personas.nmro_rgstro_cmra_cmrcio%type;
    v_fcha_rgstro_cmra_cmrcio  si_i_personas.fcha_rgstro_cmra_cmrcio%type;
    v_fcha_incio_actvddes      si_i_personas.fcha_incio_actvddes%type;
    v_nmro_scrsles             si_i_personas.nmro_scrsles%type;
    v_drccion_cmra_cmrcio      si_i_personas.drccion_cmra_cmrcio%type;
    v_id_actvdad_ecnmca        si_i_personas.id_actvdad_ecnmca%type;
    v_json_rspsta              clob;
    v_json_sjto                clob;
    v_dtos                     clob;
    v_json                     clob;
    v_slct_sjto_impsto         clob;
    v_slct_rspnsble            clob;
    v_json_acto                clob;
    v_json_plntlla             clob;
    v_html                     clob;
    v_sql_rspnsbles            clob;
    v_json_rspnsbles           clob;
    v_blob                     blob;
    v_type_rspsta              varchar2(10);
    v_error                    varchar2(4000);
    v_prncpal                  varchar2(3);
    v_nmbre_cnslta             varchar2(50);
    v_nmbre_plntlla            varchar2(50);
    v_cdgo_frmto_plntlla       varchar2(6);
    v_cdgo_frmto_tpo           varchar2(3);
    v_tpo_idntfccion           varchar2(3);
    v_cdgo_mncpio              varchar2(10);
    v_tpo_nvdad                varchar2(10);
    v_idclase                  varchar2(5);
    v_numid                    varchar2(20);
    v_nit                      varchar2(20);
    nmbre_up                   varchar2(100) := 'pkg_ws_camara_comercio.prc_gn_novedades';
    v_obsrvcion                varchar2(4000);
    v_id_pais                  number;
    v_nl                       number;
    v_id_instncia_fljo         number;
    v_id_fljo_trea             number;
    v_id_sesion                number;
    v_id_sjto_estdo            number;
    v_trea                     number;
    v_id_fljo_trea_orgen       number;
    v_id_plntlla               number;
    v_seq_id                   number;
    v_id_acto_tpo              number;
    v_id_acto                  number;
    v_id_rprte                 number;
    v_id_cnfcmr_sjt_lt_error   number;
    o_sjto_impsto              number;
    o_id_nvdad_prsna           number;
    l_id                       number;
    v_json_parametros          clob;
    v_mdio_envio               varchar2(50);
    v_id_cnfcmra_lte           number;
    v_obsrvcion_error          clob;
    v_id_dclrcns_esqma_trfa    gi_d_dclrcns_esqma_trfa.id_dclrcns_esqma_trfa%type; --28/01/2026
  begin

    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'OK';

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'Entrando:',
                          1);

    begin
      -- Consulta de expedientes - CAMARA DE COMERCIO
      pkg_ws_camara_comercio.prc_co_consultarDatos(p_cdgo_clnte      => p_cdgo_clnte,
                                                   p_tpo_prcso_cnlta => p_tpo_prcso_cnlta,
                                                   p_id_prvdor       => p_id_prvdor,
                                                   p_id_impsto       => p_id_impsto,
                                                   p_fcha_incial     => p_fcha_incial,
                                                   p_fcha_fnal       => p_fcha_fnal,
                                                   p_tpo_rprte       => p_tpo_rprte,
                                                   p_id_usrio        => p_id_usrio,
                                                   p_tpo_accion      => p_tpo_accion,
                                                   o_cdgo_rspsta     => o_cdgo_rspsta,
                                                   o_mnsje_rspsta    => o_mnsje_rspsta);
    exception
      when others then
        o_mnsje_rspsta := 'Error al ejecutar prc_co_consultarDatos - ' ||
                          sqlerrm;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              1);
        return;
    end;

    o_cdgo_rspsta := 0;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'Respuesta del procedimiento prc_co_consultarDatos - ' ||
                          'o_mnsje_rspsta: ' || o_mnsje_rspsta,
                          1);

    -- Si al hacer la consulta genera error se detiene ya que sin respuesta del servicio no puede continuar.
    if o_cdgo_rspsta <> 0 then
      o_cdgo_rspsta  := 10;
      o_mnsje_rspsta := o_cdgo_rspsta || '-' || o_mnsje_rspsta;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta || ' , ' || sqlerrm,
                            1);
      return;
    end if;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'DESPUES DEL 1ER CONSUMO DEL WS:',
                          1);

    --Se crea la sesion
    apex_session.create_session(p_app_id   => 69000,
                                p_page_id  => 1,
                                p_username => '1111111112');

    v_id_sesion := v('APP_SESSION');

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'DESPUES apex_session.create_session:' ||
                          systimestamp,
                          1);

    begin
      apex_session.attach(p_app_id     => 69000,
                          p_page_id    => 28,
                          p_session_id => v_id_sesion);
    end;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'DESPUES apex_session.attach:',
                          1);

    -- Recorrido de expedientes devueltos por la consulta a Camara de Comercio
    for c_expdntes in (select a.id_cnfcmra_sjto_lte,
                              a.id_cnfcmra_lte,
                              a.mtrcla,
                              a.tpo_idntfccion,
                              a.idntfccion,
                              a.prmer_nmbre,
                              a.sgndo_nmbre,
                              a.prmer_aplldo,
                              a.sgndo_aplldo,
                              a.cllar,
                              a.mncpio,
                              a.mncpio_ntfccion,
                              a.drccion,
                              a.dirccn_ntfccion,
                              a.rzon_scial,
                              a.email,
                              a.email_ntfccion,
                              a.tlfno,
                              a.estado,
                              a.organizacion,
                              a.ctgria,
                              a.cdgo_ciiu_1,
                              a.cdgo_ciiu_2,
                              a.cdgo_ciiu_3,
                              a.cdgo_ciiu_4,
                              a.dscpcion_ciiu_1,
                              a.dscpcion_ciiu_2,
                              a.dscpcion_ciiu_3,
                              a.dscpcion_ciiu_4,
                              a.fcha_incio_actvddes,
                              a.rprsntnte_lgal,
                              a.prcsdo,
                              a.id_acto,
                              a.id_plntlla,
                              a.dcmnto,
                              a.id_sjto_impsto,
                              a.id_nvdad,
                              a.tpo_nvdad,
                              a.cdgo_estdo,
                              a.fcha_ntfccion,
                              a.fcha_inscrpcion,
                              a.fcha_lmte_inscrpcion,
                              a.prcsdo_extsmnte,
                              a.id_cnfcmr_sjt_lt_error,
                              a.ntfcdo_cnfcmra,
                              a.etsdo_ntfcdo_cnfcmra,
                              a.id_envio,
                              a.prptrios,
                              a.estblcmntos
                         from ws_g_confecamaras_sjto_lte a
                         join ws_g_confecamaras_lote b
                           on b.id_cnfcmra_lte = a.id_cnfcmra_lte
                        where a.prcsdo = 'N'
                             --and a.mtrcla = '207130'
                             --and a.id_cnfcmr_sjt_lt_error is null
                          and a.obsrvcion_error_prcso is null
                          and a.idntfccion is not null
                          and trunc(b.fcha_rgstro) = trunc(sysdate)
                          and a.orgen = 'CAM'
                        order by a.id_cnfcmra_sjto_lte) loop
      /*-----------------------------------*/
      apex_session.create_session(p_app_id   => 69000,
                                  p_page_id  => 1,
                                  p_username => '1111111112');

      v_id_sesion := v('APP_SESSION');

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'DESPUES apex_session.create_session:' ||
                            systimestamp,
                            1);

      begin
        apex_session.attach(p_app_id     => 69000,
                            p_page_id    => 28,
                            p_session_id => v_id_sesion);
      end;
      /*-----------------------------------*/

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'DATOS DEL CONTRIBUYENTE ->:c_expdntes.idntfccion' ||
                            c_expdntes.idntfccion || '-',
                            1);

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'DATOS DEL FLUJO ->p_id_fljo,p_id_usrio,p_id_prtcpte,p_obsrvcion' ||
                            p_id_fljo || '-' || p_id_usrio || '-' ||
                            p_id_usrio || '-' || p_obsrvcion || '*' ||
                            systimestamp,
                            1);

      pkg_pl_workflow_1_0.prc_rg_instancias_flujo(p_id_fljo          => 134,
                                                  p_id_usrio         => p_id_usrio,
                                                  p_id_prtcpte       => p_id_usrio,
                                                  p_obsrvcion        => p_obsrvcion,
                                                  o_id_instncia_fljo => v_id_instncia_fljo,
                                                  o_id_fljo_trea     => v_id_fljo_trea,
                                                  o_mnsje            => o_mnsje_rspsta);

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'DATOS despues prc_rg_instancias_flujo-o_mnsje_rspsta,v_id_instncia_fljo,v_id_fljo_trea' ||
                            o_mnsje_rspsta || '-' || v_id_instncia_fljo || '-' ||
                            v_id_fljo_trea || '*',
                            1);

      if v_id_instncia_fljo is null then
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'if v_id_instncia_fljo is null' ||
                              o_cdgo_rspsta,
                              1);

        o_cdgo_rspsta  := 20;
        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' || o_mnsje_rspsta;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              1);
        rollback;
        return;
      end if;

      o_id_session       := v_id_sesion;
      o_id_instncia_fljo := v_id_instncia_fljo;

      -- Ontener datos de la identificacion si existe
      begin
        select /*+ RESULT_CACHE */
         a.*
          into v_si_c_sujetos
          from si_c_sujetos a
          join si_i_sujetos_impuesto b
            on a.id_sjto = b.id_sjto
         where a.idntfccion = c_expdntes.idntfccion
           and b.id_impsto = p_id_impsto;
      exception
        when no_data_found then
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                'si_c_sujetos a no_data_found' || sqlerrm,
                                6);

          v_si_c_sujetos.idntfccion := null;

      end;
      --v_si_c_sujetos.idntfccion := null;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'salimos de Ontener datos de la identificacion si existe',
                            1);

      begin
        select id_sjto_impsto, id_sjto_estdo
          into v_id_sjto_impsto, v_id_sjto_estdo
          from v_si_i_sujetos_impuesto
         where cdgo_clnte = p_cdgo_clnte
           and id_impsto = p_id_impsto
           and idntfccion_sjto = c_expdntes.idntfccion;
      exception
        when no_data_found then

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                'v_si_i_sujetos_impuesto a c_expdntes.idntfccionno_data_found=>' ||
                                c_expdntes.idntfccion || sqlerrm,
                                1);

          v_id_sjto_impsto := null;
          v_id_sjto_estdo  := null;

      end;

      /*v_id_sjto_impsto := null;
      v_id_sjto_estdo  := null;*/

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'salimos del estado sujeto',
                            1);

      /*
          -- Camara de comercio no envía tipo de Identificación.
          -- Homologar el tipo de identificacion de acuerdo con lo conversado con el Ing Lujan.

          ORGANIZACIÓN = 01 -> CC
          ORGANIZACIÓN != 01 -> NIT

          01         Persona Natural
          02         Establecimiento de Comercio
          03         Sociedad Limitada
          04         Sociedad Anónima
          05         Sociedad Colectiva
          06         Sociedad Comandita Simple
          07         Sociedad Comandita por Acciones
          08         Sociedad Extranjera
          09         Empresa Asociativa de Trabajo
          10         Sociedad Civil
          11         Empresa Unipersonal
          12         Entidad Sin Animo de Lucro
          14         Entidad de Economía Solidaria
          15         Empresa Industrial y Comercial del Estado
          16         Sociedad por Acciones Simplificada
          17         Agrarias de transformación
          99         Otras (personas jurídicas)
      */

      if c_expdntes.organizacion = '01' then
        v_tpo_idntfccion := 'C';
      else
        v_tpo_idntfccion := 'N';
      end if;

      -- Consultamos el Municipio y Departamento
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'Antes de Consultamos el Municipio y Departamento',
                            1);

      begin
        select a.id_mncpio, b.id_dprtmnto, b.id_pais
          into v_id_mncpio, v_id_dprtmnto, v_id_pais
          from df_s_municipios a
          join df_s_departamentos b
            on a.id_dprtmnto = b.id_dprtmnto
         where a.cdgo_mncpio = c_expdntes.mncpio;
      exception
        when others then
          o_cdgo_rspsta  := 30;
          o_mnsje_rspsta := o_cdgo_rspsta || '-' ||
                            ' No se pudo obtener el municipio.';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                1);
          return;
      end;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'Despues de Consultamos el Municipio y Departamento',
                            1);

      /*
          ORGANIZACIÓN
          01         Persona Natural
          02         Establecimiento de Comercio
          03         Sociedad Limitada
          04         Sociedad Anónima
          05         Sociedad Colectiva
          06         Sociedad Comandita Simple
          07         Sociedad Comandita por Acciones
          08         Sociedad Extranjera
          09         Empresa Asociativa de Trabajo
          10         Sociedad Civil
          11         Empresa Unipersonal
          12         Entidad Sin Animo de Lucro
          14         Entidad de Economía Solidaria
          15         Empresa Industrial y Comercial del Estado
          16         Sociedad por Acciones Simplificada
          17         Agrarias de transformación
          99         Otras (personas jurídicas)
      */

      -- Verificar si es persona natural (N) o juridica (J)
      v_tpo_prsna := 'J';

      if c_expdntes.organizacion = '01' then
        v_tpo_prsna := 'N';
      end if;

      /*Estado.
          [Activa (MA),
          Inscripcion activa (IA),
          Cancelada (MC)].
      */

      -- Si no encuentra la identificacion y aparece en estado Matricula Activa
      -- (Procedemos a inscribir)
      if v_si_c_sujetos.idntfccion is null and
         c_expdntes.estado in ('MA', 'IA') then
        v_tpo_nvdad := 'INS';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'v_tpo_nvdad: INS',
                              1);

        -- Si existe la identificacion pero el estado es Matricula Cancelada
        -- Cancelar el contribuyente
      elsif v_si_c_sujetos.idntfccion is not null and
            c_expdntes.estado = 'MC' then
        v_tpo_nvdad := 'CNC';
        v_obsrvcion := 'No se proceso la matricula porque no hace parte del proceso de inscripcion sino del proceso de cancelacion';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'v_tpo_nvdad: CNC',
                              1);

        -- Si la identificacion existe y el estado es Matricula Activa
      elsif v_si_c_sujetos.idntfccion is not null and
            c_expdntes.estado in ('MA', 'IA') then
        -- Comparar la informacion del contribuyente y ver si se puede actualizar algunos datos
        if c_expdntes.idntfccion = v_si_c_sujetos.idntfccion then
          v_tpo_nvdad := 'ACT';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                'v_tpo_nvdad: ACT',
                                1);

          v_obsrvcion := 'No se proceso la matricula porque no hace parte del proceso de inscripcion sino del proceso de actualizacion';
        end if;
      end if;

      --Consultar id de actividad economica. -- 28/01/2026
      begin
        select id_dclrcns_esqma_trfa
          into v_id_dclrcns_esqma_trfa
          from gi_d_dclrcns_esqma_trfa c
         where c.cdgo_dclrcns_esqma_trfa = c_expdntes.cdgo_ciiu_1
           and extract(year from c.fcha_hsta) = extract(year from sysdate);
      exception
        when others then
          v_id_dclrcns_esqma_trfa := null;
      end;

      if v_tpo_nvdad is not null and v_tpo_nvdad = 'INS' then

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'APEX_UTIL.SET_SESSION_STATE',
                              1);

        APEX_UTIL.SET_SESSION_STATE(p_name  => 'P28_CDGO_NVDAD_TPO',
                                    p_value => v_tpo_nvdad);

        APEX_UTIL.SET_SESSION_STATE(p_name  => 'P28_RECHAZAR',
                                    p_value => 'N');

        -- Se consulta la informacion del flujo para hacer la transicion a la siguiente tarea.
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'Antes de Se consulta la informacion del flujo para hacer la transicion a la siguiente tarea.' ||
                              systimestamp,
                              1);

        begin
          select a.id_fljo_trea_orgen
            into v_id_fljo_trea_orgen
            from wf_g_instancias_transicion a
           where a.id_instncia_fljo = v_id_instncia_fljo
             and a.id_estdo_trnscion in (1, 2);

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                'Despues de Se consulta la informacion del flujo para hacer la transicion a la siguiente tarea. v_id_fljo_trea_orgen,v_id_instncia_fljo: ' ||
                                v_id_fljo_trea_orgen || '-' ||
                                v_id_instncia_fljo,
                                1);

          -- Se cambia la etapa de flujo
          pkg_pl_workflow_1_0.prc_rg_instancias_transicion(p_id_instncia_fljo => v_id_instncia_fljo,
                                                           p_id_fljo_trea     => v_id_fljo_trea_orgen,
                                                           p_json             => '[]',
                                                           o_type             => v_type_rspsta, -- 'S => Hubo algun error '
                                                           o_mnsje            => o_mnsje_rspsta,
                                                           o_id_fljo_trea     => v_id_fljo_trea,
                                                           o_error            => v_error);

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                'Despues de  o_mnsje_rspsta,o_id_fljo_trea,v_error=>' ||
                                o_mnsje_rspsta || '-' || v_id_fljo_trea || '-' ||
                                v_error,
                                1);

        exception
          when others then
            o_cdgo_rspsta  := 40;
            o_mnsje_rspsta := 'Error al consultar la tarea.' || sqlcode ||
                              ' -- ' || sqlerrm;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  'pkg_si_novedades_persona.prc_rg_novedad_persona',
                                  v_nl,
                                  'Cod Respuesta: ' || o_cdgo_rspsta || '. ' ||
                                  o_mnsje_rspsta,
                                  1);
            rollback;
            return;
        end; -- FIN Se consulta la informacion del flujo para hacer la transicion a la siguiente tarea.

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'ANTES DE  v_dtos_prncples',
                              1);

        v_dtos_prncples.put('cdgo_clnte', p_cdgo_clnte);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE cdgo_clnte',
                              1);

        v_dtos_prncples.put('id_sesion', v_id_sesion);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE id_sesion',
                              1);

        v_dtos_prncples.put('id_impsto', p_id_impsto);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE id_impsto',
                              1);

        v_dtos_prncples.put('id_impsto_sbmpsto', p_id_impsto_sbmpsto);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE id_impsto_sbmpsto' ||
                              systimestamp,
                              1);

        v_dtos_prncples.put('id_cnfcmra_sjto_lte',
                            c_expdntes.id_cnfcmra_sjto_lte);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE id_cnfcmra_sjto_lte ' ||
                              systimestamp,
                              1);

        v_dtos_prncples.put('id_sjto_impsto', v_id_sjto_impsto); --revisar que se va a enviar
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE id_sjto_impsto',
                              1);

        v_dtos_prncples.put('mtrcla', c_expdntes.mtrcla);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE mtrcla',
                              1);

        v_dtos_prncples.put('id_instncia_fljo', v_id_instncia_fljo);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE id_instncia_fljo',
                              1);

        v_dtos_prncples.put('cdgo_nvdad', v_tpo_nvdad);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE cdgo_nvdad',
                              1);

        v_dtos_prncples.put('obsrvcion', p_obsrvcion);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE obsrvcion',
                              1);

        v_dtos_prncples.put('id_usrio', p_id_usrio);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE id_usrio',
                              1);

        v_dtos_prncples.put('tpo_prsna', v_tpo_prsna);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE tpo_prsna',
                              1);

        v_dtos_prncples.put('cdgo_idntfccion_tpo', v_tpo_idntfccion);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE cdgo_idntfccion_tpo' ||
                              systimestamp,
                              1);

        v_dtos_prncples.put('idntfccion', c_expdntes.idntfccion);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE idntfccion',
                              1);

        v_dtos_prncples.put('prmer_nmbre', c_expdntes.prmer_nmbre);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE prmer_nmbre',
                              1);

        v_dtos_prncples.put('sgndo_nmbre', c_expdntes.sgndo_nmbre);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE sgndo_nmbre',
                              1);

        v_dtos_prncples.put('prmer_aplldo', c_expdntes.prmer_aplldo);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE prmer_aplldo',
                              1);

        v_dtos_prncples.put('sgndo_aplldo', c_expdntes.sgndo_aplldo);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE sgndo_aplldo',
                              1);

        v_dtos_prncples.put('nmbre_rzon_scial', c_expdntes.rzon_scial);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE nmbre_rzon_scial',
                              1);

        v_dtos_prncples.put('drccion', c_expdntes.drccion);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE drccion',
                              1);

        v_dtos_prncples.put('id_pais', v_id_pais);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE id_pais',
                              1);

        v_dtos_prncples.put('id_dprtmnto', v_id_dprtmnto);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE id_dprtmnto',
                              1);

        v_dtos_prncples.put('id_mncpio', v_id_mncpio);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE id_mncpio',
                              1);

        v_dtos_prncples.put('drccion_ntfccion', c_expdntes.drccion);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE drccion_ntfccion',
                              1);

        v_dtos_prncples.put('id_pais_ntfccion', v_id_pais);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE id_pais_ntfccion',
                              1);

        v_dtos_prncples.put('id_dprtmnto_ntfccion', v_id_dprtmnto);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE id_dprtmnto_ntfccion' ||
                              systimestamp,
                              1);

        v_dtos_prncples.put('id_mncpio_ntfccion', v_id_mncpio);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE id_mncpio_ntfccion' ||
                              systimestamp,
                              1);

        v_dtos_prncples.put('email', c_expdntes.email);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE email',
                              1);

        v_dtos_prncples.put('tlfno', c_expdntes.tlfno);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE tlfno',
                              1);

        v_dtos_prncples.put('cllar', c_expdntes.cllar);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE cllar',
                              1);

        v_dtos_prncples.put('fcha_incio_actvddes',
                            to_char(c_expdntes.fcha_incio_actvddes,
                                    'dd/mm/yyyy'));
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE fcha_incio_actvddes' ||
                              systimestamp,
                              1);

        v_dtos_prncples.put_null('nmro_scrsles');
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE nmro_scrsles',
                              1);

        v_dtos_prncples.put_null('drccion_cmra_cmrcio');
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE drccion_cmra_cmrcio' ||
                              systimestamp,
                              1);

        --v_dtos_prncples.put_null('id_actvdad_ecnmca');
        -- MOD 28/01/2026, no se registraba al sujeto la actividad economica.
        v_dtos_prncples.put('id_actvdad_ecnmca', v_id_dclrcns_esqma_trfa);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE id_actvdad_ecnmca' ||
                              systimestamp,
                              1);

        v_dtos_prncples.put_null('id_sjto_tpo');
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE id_sjto_tpo',
                              1);

        v_dtos_prncples.put_null('nmro_rgstro_cmra_cmrcio');
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE nmro_rgstro_cmra_cmrcio' ||
                              systimestamp,
                              1);

        v_dtos_prncples.put('fcha_rgstro_cmra_cmrcio',
                            to_char(c_expdntes.fcha_inscrpcion,
                                    'dd/mm/yyyy'));
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE fcha_rgstro_cmra_cmrcio' ||
                              systimestamp,
                              1);

        v_json := v_dtos_prncples.to_clob;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE v_json',
                              1);

        if v_tpo_prsna = 'J' then
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                'DENTRO DEL IF v_tpo_prsna =J' ||
                                systimestamp,
                                1);

          if (not
              apex_collection.collection_exists(p_collection_name => 'RESPONSABLES')) then
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  nmbre_up,
                                  v_nl,
                                  'DENTRO DEL IF not apex_collection.' ||
                                  systimestamp,
                                  1);

            apex_collection.create_collection(p_collection_name => 'RESPONSABLES');
          end if;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                'DESPUES DE IF not apex_collection.' ||
                                systimestamp,
                                1);
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                '------>>>>> ' || v_json,
                                1);
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                '------>>>>> c_expdntes.rprsntnte_lgal' ||
                                c_expdntes.rprsntnte_lgal,
                                1);

          -- Armar select de responsables.
          --Si el sujeto es Natural, se toma el mismo responsable como representante legal.
          if v_tpo_prsna = 'N' then

            v_sql_rspnsbles := 'select json_arrayagg( json_object( ''cdgo_clnte''           value cdgo_clnte,
																						''id_sjto_impsto''       value id_sjto_impsto,
																						''tpo_idntfccion''       value tpo_idntfccion,
																						''idntfccion''           value idntfccion,
																						''prmer_nmbre''          value prmer_nmbre,
																						''sgndo_nmbre''          value sgndo_nmbre,
																						''prmer_aplldo''         value prmer_aplldo,
																						''sgndo_aplldo''         value sgndo_aplldo,
																						''cdgo_tpo_rspnsble''    value cdgo_tpo_rspnsble,
																						''id_pais_ntfccion''     value id_pais_ntfccion,
																						''id_dprtmnto_ntfccion'' value id_dprtmnto_ntfccion,
																						''id_mncpio_ntfccion''   value id_mncpio_ntfccion,
																						''drccion_ntfccion''     value drccion_ntfccion,
																						''email''                value email,
																						''tlfno''                value tlfno,
																						''cllar''                value cllar,
																						''activo''               value activo,
																						''id_sjto_rspnsble''     value id_sjto_rspnsble) returning clob )
													  from (select e.cdgo_clnte
																 , e.id_sjto_impsto
																 , e.cdgo_idntfccion_tpo as tpo_idntfccion
																 , e.idntfccion as idntfccion
																 , e.nmbre_rzon_scial as prmer_nmbre
																 , null as sgndo_nmbre
																 , ''.'' as prmer_aplldo
																 , null as sgndo_aplldo
																 , ''L'' as cdgo_tpo_rspnsble
																 , e.id_pais_ntfccion
																 , e.id_dprtmnto_ntfccion
																 , e.id_mncpio_ntfccion
																 , e.drccion_ntfccion
																 , e.email
																 , e.tlfno
																 , e.cllar
																 , null as activo
																 , null as id_sjto_rspnsble
															from json_table(''' || v_json ||
                               ''', ''$'' columns( cdgo_clnte              varchar2(20)        path ''$.cdgo_clnte'',
																									 cdgo_idntfccion_tpo     varchar2(2)         path ''$.cdgo_idntfccion_tpo'',
																									 idntfccion              varchar2(20)        path ''$.idntfccion'',
																									 id_sjto_impsto          varchar2(20)        path ''$.id_sjto_impsto'',
																									 prmer_nmbre             varchar2(200)       path ''$.prmer_nmbre'',
																									 sgndo_nmbre             varchar2(200)       path ''$.sgndo_nmbre'',
																									 prmer_aplldo            varchar2(200)       path ''$.prmer_aplldo'',
																									 sgndo_aplldo            varchar2(200)       path ''$.sgndo_aplldo'',
																									 nmbre_rzon_scial        varchar2(200)       path ''$.nmbre_rzon_scial'',
																									 drccion                 varchar2(200)       path ''$.drccion'',
																									 id_pais                 varchar2(20)        path ''$.drccion'',
																									 id_dprtmnto             varchar2(20)        path ''$.id_dprtmnto'',
																									 id_mncpio               varchar2(20)        path ''$.id_mncpio'',
																									 drccion_ntfccion        varchar2(200)       path ''$.drccion_ntfccion'',
																									 id_pais_ntfccion        varchar2(20)        path ''$.id_pais_ntfccion'',
																									 id_dprtmnto_ntfccion    varchar2(20)        path ''$.id_dprtmnto_ntfccion'',
																									 id_mncpio_ntfccion      varchar2(20)        path ''$.id_mncpio_ntfccion'',
																									 email                   varchar2(200)       path ''$.email'',
																									 tlfno                   varchar2(50)        path ''$.tlfno'',
																									 cllar                   varchar2(50)        path ''$.cllar'',
																									 nmro_rgstro_cmra_cmrcio varchar2(200)       path ''$.nmro_rgstro_cmra_cmrcio'',
																									 fcha_rgstro_cmra_cmrcio varchar2(200)       path ''$.fcha_rgstro_cmra_cmrcio'',
																									 fcha_incio_actvddes     date                path ''$.fcha_incio_actvddes'',
																									 nmro_scrsles            varchar2(200)       path ''$.nmro_scrsles'',
																									 drccion_cmra_cmrcio     varchar2(200)       path ''$.drccion_cmra_cmrcio'',
																									 id_actvdad_ecnmca       varchar2(200)       path ''$.id_actvdad_ecnmca'',
																									 id_sjto_tpo             varchar2(200)       path ''$.id_sjto_tpo'')) e)';

          else
            -- Si es juridico, se toma del array REPRESENTANTE LEGAL.

            v_sql_rspnsbles := 'select json_arrayagg( json_object( ''cdgo_clnte''           value cdgo_clnte,
																						''id_sjto_impsto''       value id_sjto_impsto,
																						''tpo_idntfccion''       value tpo_idntfccion,
																						''idntfccion''           value idntfccion,
																						''prmer_nmbre''          value prmer_nmbre,
																						''sgndo_nmbre''          value sgndo_nmbre,
																						''prmer_aplldo''         value prmer_aplldo,
																						''sgndo_aplldo''         value sgndo_aplldo,
																						''cdgo_tpo_rspnsble''    value cdgo_tpo_rspnsble,
																						''id_pais_ntfccion''     value id_pais_ntfccion,
																						''id_dprtmnto_ntfccion'' value id_dprtmnto_ntfccion,
																						''id_mncpio_ntfccion''   value id_mncpio_ntfccion,
																						''drccion_ntfccion''     value drccion_ntfccion,
																						''email''                value email,
																						''tlfno''                value tlfno,
																						''cllar''                value cllar,
																						''activo''               value activo,
																						''id_sjto_rspnsble''     value id_sjto_rspnsble) returning clob )
													  from (select e.cdgo_clnte
																 , e.id_sjto_impsto
																 , ''C'' tpo_idntfccion
																 , r.numidreplegal as idntfccion
																 , r.nombrereplegal as prmer_nmbre
																 , null as sgndo_nmbre
																 , ''.'' as prmer_aplldo
																 , null as sgndo_aplldo
																 , ''L'' as cdgo_tpo_rspnsble
																 , e.id_pais_ntfccion
																 , e.id_dprtmnto_ntfccion
																 , e.id_mncpio_ntfccion
																 , e.drccion_ntfccion
																 , e.email
																 , e.tlfno
																 , e.cllar
																 , null as activo
																 , null as id_sjto_rspnsble
															from json_table(''' ||
                               c_expdntes.rprsntnte_lgal ||
                               ''',''$[*]''
																	columns(
																		numidreplegal   varchar2(20)    path ''$.IDENTIFICACION'',
																		nombrereplegal  varchar2(200)   path ''$.NOM_REP_LEGAL''
																	)
																) r, json_table(''' || v_json ||
                               ''', ''$'' columns( cdgo_clnte              varchar2(20)        path ''$.cdgo_clnte'',
																									 cdgo_idntfccion_tpo     varchar2(2)         path ''$.cdgo_idntfccion_tpo'',
																									 idntfccion              varchar2(20)        path ''$.idntfccion'',
																									 id_sjto_impsto          varchar2(20)        path ''$.id_sjto_impsto'',
																									 prmer_nmbre             varchar2(200)       path ''$.prmer_nmbre'',
																									 sgndo_nmbre             varchar2(200)       path ''$.sgndo_nmbre'',
																									 prmer_aplldo            varchar2(200)       path ''$.prmer_aplldo'',
																									 sgndo_aplldo            varchar2(200)       path ''$.sgndo_aplldo'',
																									 nmbre_rzon_scial        varchar2(200)       path ''$.nmbre_rzon_scial'',
																									 drccion                 varchar2(200)       path ''$.drccion'',
																									 id_pais                 varchar2(20)        path ''$.drccion'',
																									 id_dprtmnto             varchar2(20)        path ''$.id_dprtmnto'',
																									 id_mncpio               varchar2(20)        path ''$.id_mncpio'',
																									 drccion_ntfccion        varchar2(200)       path ''$.drccion_ntfccion'',
																									 id_pais_ntfccion        varchar2(20)        path ''$.id_pais_ntfccion'',
																									 id_dprtmnto_ntfccion    varchar2(20)        path ''$.id_dprtmnto_ntfccion'',
																									 id_mncpio_ntfccion      varchar2(20)        path ''$.id_mncpio_ntfccion'',
																									 email                   varchar2(200)       path ''$.email'',
																									 tlfno                   varchar2(50)        path ''$.tlfno'',
																									 cllar                   varchar2(50)        path ''$.cllar'',
																									 nmro_rgstro_cmra_cmrcio varchar2(200)       path ''$.nmro_rgstro_cmra_cmrcio'',
																									 fcha_rgstro_cmra_cmrcio varchar2(200)       path ''$.fcha_rgstro_cmra_cmrcio'',
																									 fcha_incio_actvddes     date                path ''$.fcha_incio_actvddes'',
																									 nmro_scrsles            varchar2(200)       path ''$.nmro_scrsles'',
																									 drccion_cmra_cmrcio     varchar2(200)       path ''$.drccion_cmra_cmrcio'',
																									 id_actvdad_ecnmca       varchar2(200)       path ''$.id_actvdad_ecnmca'',
																									 id_sjto_tpo             varchar2(200)       path ''$.id_sjto_tpo'')) e)';

          end if; -- Fin Si el sujeto es Natural, se toma el mism responsable como representante legal.

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                'DESPUES DE IF SQL_RESPONSABLES then' ||
                                systimestamp,
                                1);

          /*delete from muerto where v_001 = 'v_sql_rspnsbles';
          commit;
          insert into muerto
            (v_001, c_001, t_001)
          values
            ('v_sql_rspnsbles', v_sql_rspnsbles, systimestamp);
          commit;*/

          execute immediate v_sql_rspnsbles
            into v_json_rspnsbles;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                'DESPUES DE  EXECUTE INMEDIATTE ' ||
                                systimestamp,
                                1);

          v_dtos_prncples.put('RESPONSABLES',
                              json_array_t(v_json_rspnsbles));
          v_json := v_dtos_prncples.to_clob;

          /*delete from muerto where v_001 = 'v_json'; commit;
          insert into muerto (v_001, c_001) values ('v_json', v_json);*/

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                'ANTES DE  for c_rpsntntes',
                                1);

          -- Recorrer arreglo de representantes legales obtenido en el cursor c_expdntes
          for c_rpsntntes in (select a.cdgo_clnte,
                                     a.id_sjto_impsto,
                                     a.tpo_idntfccion,
                                     a.idntfccion,
                                     a.prmer_nmbre,
                                     a.sgndo_nmbre,
                                     a.prmer_aplldo,
                                     a.sgndo_aplldo,
                                     a.cdgo_tpo_rspnsble,
                                     a.id_pais_ntfccion,
                                     a.id_dprtmnto_ntfccion,
                                     a.id_mncpio_ntfccion,
                                     a.drccion_ntfccion,
                                     a.email,
                                     a.tlfno,
                                     a.cllar,
                                     a.activo,
                                     a.id_sjto_rspnsble
                                from json_table(v_json,
                                                '$.RESPONSABLES[*]'
                                                columns(cdgo_clnte
                                                        varchar2(10) path
                                                        '$.cdgo_clnte',
                                                        id_sjto_impsto
                                                        varchar2(50) path
                                                        '$.id_sjto_impsto',
                                                        tpo_idntfccion
                                                        varchar2(2) path
                                                        '$.tpo_idntfccion',
                                                        idntfccion
                                                        varchar2(20) path
                                                        '$.idntfccion',
                                                        prmer_nmbre
                                                        varchar2(200) path
                                                        '$.prmer_nmbre',
                                                        sgndo_nmbre
                                                        varchar2(200) path
                                                        '$.sgndo_nmbre',
                                                        prmer_aplldo
                                                        varchar2(200) path
                                                        '$.prmer_aplldo',
                                                        sgndo_aplldo
                                                        varchar2(200) path
                                                        '$.sgndo_aplldo',
                                                        cdgo_tpo_rspnsble
                                                        varchar2(20) path
                                                        '$.cdgo_tpo_rspnsble',
                                                        id_pais_ntfccion
                                                        varchar2(45) path
                                                        '$.id_pais_ntfccion',
                                                        id_dprtmnto_ntfccion
                                                        varchar2(50) path
                                                        '$.id_dprtmnto_ntfccion',
                                                        id_mncpio_ntfccion
                                                        varchar2(50) path
                                                        '$.id_mncpio_ntfccion',
                                                        drccion_ntfccion
                                                        varchar2(50) path
                                                        '$.drccion_ntfccion',
                                                        email varchar2(60) path
                                                        '$.email',
                                                        tlfno varchar2(20) path
                                                        '$.tlfno',
                                                        cllar varchar2(20) path
                                                        '$.cllar',
                                                        activo varchar2(20) path
                                                        '$.activo',
                                                        id_sjto_rspnsble
                                                        varchar2(2) path
                                                        '$.id_sjto_rspnsble')) a) loop

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  nmbre_up,
                                  v_nl,
                                  'DENTRO LOOP C_REPRESENTANTES' ||
                                  systimestamp,
                                  1);

            -- No envían identificación, todos los responsables con identificación CC
            -- Identificación del responsable. C
            v_tpo_idntfccion := 'C';

            for c_rspnsble in (select *
                                 from si_i_sujetos_responsable a
                                where id_sjto_impsto =
                                      c_rpsntntes.id_sjto_impsto
                                  and idntfccion not in
                                      (select c004
                                         from apex_collections m
                                        where collection_name =
                                              'RESPONSABLES'
                                          and m.n001 = v_id_instncia_fljo)) loop

              apex_collection.add_member(p_collection_name => 'RESPONSABLES',
                                         p_n001            => v_id_instncia_fljo,
                                         p_c001            => c_rspnsble.ID_SJTO_RSPNSBLE,
                                         p_c002            => c_rspnsble.ID_SJTO_IMPSTO,
                                         p_c003            => c_rspnsble.CDGO_IDNTFCCION_TPO,
                                         p_c004            => c_rspnsble.IDNTFCCION,
                                         p_c005            => c_rspnsble.PRMER_NMBRE,
                                         p_c006            => c_rspnsble.SGNDO_NMBRE,
                                         p_c007            => c_rspnsble.PRMER_APLLDO,
                                         p_c008            => c_rspnsble.SGNDO_APLLDO,
                                         p_c009            => c_rspnsble.PRNCPAL_S_N,
                                         p_c010            => c_rspnsble.CDGO_TPO_RSPNSBLE,
                                         p_c011            => c_rspnsble.PRCNTJE_PRTCPCION,
                                         p_c012            => c_rspnsble.ORGEN_DCMNTO,
                                         p_c013            => c_rspnsble.ID_PAIS_NTFCCION,
                                         p_c014            => c_rspnsble.ID_DPRTMNTO_NTFCCION,
                                         p_c015            => c_rspnsble.ID_MNCPIO_NTFCCION,
                                         p_c016            => c_rspnsble.DRCCION_NTFCCION,
                                         p_c017            => c_rspnsble.EMAIL,
                                         p_c018            => c_rspnsble.TLFNO,
                                         p_c019            => c_rspnsble.CLLAR,
                                         p_c020            => c_rspnsble.ACTVO,
                                         p_c021            => c_rspnsble.ID_TRCRO,
                                         p_c022            => 'EXISTENTE');
            end loop;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  nmbre_up,
                                  v_nl,
                                  'DESPUES DE  C_RSPNSBLE',
                                  1);

            -- Obtener datos del sujeto responsable  si existe
            begin
              select /*+ RESULT_CACHE */
               a.*
                into v_si_i_sujetos_responsable
                from si_i_sujetos_responsable a
               where a.idntfccion = c_rpsntntes.idntfccion
                 and a.id_sjto_impsto = v_id_sjto_impsto;
            exception
              when no_data_found then
                v_si_i_sujetos_responsable.id_sjto_rspnsble := null;
            end;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  nmbre_up,
                                  v_nl,
                                  'DESPUES DE  select /*+ RESULT_CACHE */a.*' ||
                                  systimestamp,
                                  1);

            begin
              select seq_id
                into v_seq_id
                from apex_collections a
               where collection_name = 'RESPONSABLES'
                 and a.n001 = v_id_instncia_fljo
                 and a.c004 = c_rpsntntes.idntfccion;
            exception
              when no_data_found then
                v_seq_id := null;

            end;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  nmbre_up,
                                  v_nl,
                                  'DESPUES DE  select seq_id' ||
                                  systimestamp,
                                  1);

            if v_si_i_sujetos_responsable.id_sjto_rspnsble is not null then
              if v_si_i_sujetos_responsable.prncpal_s_n = 'S' then
                v_prncpal := 'N';
              else
                v_prncpal := 'S';
              end if;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    nmbre_up,
                                    v_nl,
                                    'DESPUES DE   if v_si_i_sujetos_responsable.id_sjto_rspnsble' ||
                                    systimestamp,
                                    1);

              if v_seq_id is null then
                begin
                  apex_collection.add_member(p_collection_name => 'RESPONSABLES',
                                             p_n001            => v_id_instncia_fljo,
                                             p_c003            => v_tpo_idntfccion,
                                             p_c004            => c_rpsntntes.idntfccion,
                                             p_c005            => c_rpsntntes.prmer_nmbre,
                                             p_c006            => c_rpsntntes.sgndo_nmbre,
                                             p_c007            => c_rpsntntes.prmer_aplldo,
                                             p_c008            => c_rpsntntes.sgndo_aplldo,
                                             p_c009            => v_prncpal,
                                             p_c010            => c_rpsntntes.cdgo_tpo_rspnsble,
                                             p_c013            => c_rpsntntes.id_pais_ntfccion,
                                             p_c014            => c_rpsntntes.id_dprtmnto_ntfccion,
                                             p_c015            => c_rpsntntes.id_mncpio_ntfccion,
                                             p_c016            => c_rpsntntes.drccion_ntfccion,
                                             p_c017            => c_rpsntntes.email,
                                             p_c018            => c_rpsntntes.tlfno,
                                             p_c019            => c_rpsntntes.cllar,
                                             p_c020            => 'S',
                                             p_c022            => 'NUEVO');

                exception
                  when others then
                    o_cdgo_rspsta  := 60;
                    o_mnsje_rspsta := 'Error al agregar reponsable a coleccion RESPONSABLES';
                    return;
                end;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      nmbre_up,
                                      v_nl,
                                      'DESPUES DE   if v_seq_id is null' ||
                                      systimestamp,
                                      1);
              else
                begin
                  apex_collection.update_member(p_collection_name => 'RESPONSABLES',
                                                p_seq             => v_seq_id,
                                                p_n001            => v_id_instncia_fljo,
                                                p_c003            => v_tpo_idntfccion,
                                                p_c004            => c_rpsntntes.idntfccion,
                                                p_c005            => c_rpsntntes.prmer_nmbre,
                                                p_c006            => c_rpsntntes.sgndo_nmbre,
                                                p_c007            => c_rpsntntes.prmer_aplldo,
                                                p_c008            => c_rpsntntes.sgndo_aplldo,
                                                p_c009            => v_prncpal,
                                                p_c010            => c_rpsntntes.cdgo_tpo_rspnsble,
                                                p_c013            => c_rpsntntes.id_pais_ntfccion,
                                                p_c014            => c_rpsntntes.id_dprtmnto_ntfccion,
                                                p_c015            => c_rpsntntes.id_mncpio_ntfccion,
                                                p_c016            => c_rpsntntes.drccion_ntfccion,
                                                p_c017            => c_rpsntntes.email,
                                                p_c018            => c_rpsntntes.tlfno,
                                                p_c019            => c_rpsntntes.cllar,
                                                p_c020            => 'S',
                                                p_c022            => 'ACTUALIZADO');

                exception
                  when others then
                    o_cdgo_rspsta  := 70;
                    o_mnsje_rspsta := 'Error al actualizar coleccion RESPONSABLES';
                    return;
                end;
              end if;

            else
              v_prncpal := 'S';
              begin
                apex_collection.add_member(p_collection_name => 'RESPONSABLES',
                                           p_n001            => v_id_instncia_fljo,
                                           p_c003            => v_tpo_idntfccion,
                                           p_c004            => c_rpsntntes.idntfccion,
                                           p_c005            => c_rpsntntes.prmer_nmbre,
                                           p_c006            => c_rpsntntes.sgndo_nmbre,
                                           p_c007            => c_rpsntntes.prmer_aplldo,
                                           p_c008            => c_rpsntntes.sgndo_aplldo,
                                           p_c009            => v_prncpal,
                                           p_c010            => c_rpsntntes.cdgo_tpo_rspnsble,
                                           p_c013            => c_rpsntntes.id_pais_ntfccion,
                                           p_c014            => c_rpsntntes.id_dprtmnto_ntfccion,
                                           p_c015            => c_rpsntntes.id_mncpio_ntfccion,
                                           p_c016            => c_rpsntntes.drccion_ntfccion,
                                           p_c017            => c_rpsntntes.email,
                                           p_c018            => c_rpsntntes.tlfno,
                                           p_c019            => c_rpsntntes.cllar,
                                           p_c020            => 'S',
                                           p_c022            => 'NUEVO');

              exception
                when others then
                  o_cdgo_rspsta  := 80;
                  o_mnsje_rspsta := 'Error al agregar reponsable a coleccion RESPONSABLES';
                  return;
              end;
            end if;

          end loop; -- Finaliza recorrido de representantes legales

        end if;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE   if ',
                              1);

        v_dtos_rspnsbles.append(v_dtos_rspnsble);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE   v_dtos_rspnsbles.append' ||
                              systimestamp,
                              1);

        v_dtos_prncples.put('rspnsble', v_dtos_rspnsbles);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE   v_dtos_prncples.put' ||
                              systimestamp,
                              1);

        v_json := v_dtos_prncples.to_clob;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              '------>>>>>>>> v_json: ' || v_json,
                              1);

        v_trea := 1;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE   v_json y v_trea' ||
                              systimestamp,
                              1);

        while v_trea <= 2 loop
          -- Se consulta la informacion del flujo para hacer la transicion a la siguiente tarea.
          begin
            select a.id_fljo_trea_orgen
              into v_id_fljo_trea_orgen
              from wf_g_instancias_transicion a
             where a.id_instncia_fljo = v_id_instncia_fljo
               and a.id_estdo_trnscion in (1, 2);

            -- Se cambia la etapa de flujo
            pkg_pl_workflow_1_0.prc_rg_instancias_transicion(p_id_instncia_fljo => v_id_instncia_fljo,
                                                             p_id_fljo_trea     => v_id_fljo_trea_orgen,
                                                             p_json             => '[]',
                                                             o_type             => v_type_rspsta, -- 'S => Hubo algun error '
                                                             o_mnsje            => o_mnsje_rspsta,
                                                             o_id_fljo_trea     => v_id_fljo_trea,
                                                             o_error            => v_error);
          exception
            when others then
              o_cdgo_rspsta  := 90;
              o_mnsje_rspsta := 'Error al consultar la tarea.' || sqlcode ||
                                ' -- ' || sqlerrm;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    'pkg_si_novedades_persona.prc_rg_novedad_persona',
                                    v_nl,
                                    'Cod Respuesta: ' || o_cdgo_rspsta || '. ' ||
                                    o_mnsje_rspsta,
                                    1);
              rollback;
              return;
          end; -- FIN Se consulta la informacion del flujo para hacer la transicion a la siguiente tarea.
          v_trea := v_trea + 1;
        end loop;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE   while v_trea',
                              1);

        -- Registrar la Novedad
        begin
          pkg_ws_camara_comercio.prc_rg_novedades(p_json           => v_json,
                                                  o_id_nvdad_prsna => o_id_nvdad_prsna,
                                                  o_cdgo_rspsta    => o_cdgo_rspsta,
                                                  o_mnsje_rspsta   => o_mnsje_rspsta);

          if o_cdgo_rspsta <> 0 then
            o_cdgo_rspsta  := 45;
            o_mnsje_rspsta := 'Error durante el registro de la novedad ' ||
                              o_mnsje_rspsta;
          end if;

        exception
          when others then
            o_cdgo_rspsta  := 50;
            o_mnsje_rspsta := 'Error al llamar UP prc_rg_novedades ' ||
                              sqlerrm;
        end;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'Antes de Insertar Sucursal: ' ||
                              c_expdntes.idntfccion,
                              1);

        --Registrar sucursales. si existe.
        if dbms_lob.getlength(c_expdntes.estblcmntos) > 2 then
          begin
            pkg_ws_camara_comercio.prc_rg_sucursales(p_idntfccion   => c_expdntes.idntfccion,
                                                     o_cdgo_rspsta  => o_cdgo_rspsta,
                                                     o_mnsje_rspsta => o_mnsje_rspsta);

            if o_cdgo_rspsta <> 0 then
              o_cdgo_rspsta  := 45;
              o_mnsje_rspsta := 'Error durante el registro de sucursales ' ||
                                o_mnsje_rspsta;

            else
              -- Se actualiza estado del sujeto Lote

              update ws_g_confecamaras_sjto_lte d
                 set d.prcsdo = 'S', prcsdo_extsmnte = 'S'
               where d.id_cnfcmra_sjto_lte in
                     c_expdntes.id_cnfcmra_sjto_lte
                 and d.prcsdo in ('N');

              commit;
            end if;

          exception
            when others then
              o_cdgo_rspsta  := 50;
              o_mnsje_rspsta := 'Error al llamar UP prc_rg_sucursales ' ||
                                sqlerrm;
          end;
        end if;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DESPUES DE   prc_rg_novedades cdgo: ' ||
                              o_cdgo_rspsta || ' mnsje: ' || o_mnsje_rspsta,
                              1);

        -- Validar si existen errores
        if o_cdgo_rspsta <> 0 then

          -- Registrar error presentado
          begin
            v_obsrvcion_error := (o_cdgo_rspsta || ' - ' || o_mnsje_rspsta);

            pkg_ws_camara_comercio.prc_rg_trza_error(p_id_cnfcmra_lte      => c_expdntes.id_cnfcmra_lte,
                                                     p_id_cnfcmra_sjto_lte => c_expdntes.id_cnfcmra_sjto_lte,
                                                     p_obsrvcion           => v_obsrvcion_error,
                                                     o_cdgo_rspsta         => o_cdgo_rspsta,
                                                     o_mnsje_rspsta        => o_mnsje_rspsta);

            if o_cdgo_rspsta <> 0 then
              o_cdgo_rspsta  := 45;
              o_mnsje_rspsta := 'Error durante el registro de la traza ' ||
                                o_mnsje_rspsta;
              rollback;
              continue;
            end if;

          exception
            when others then
              o_cdgo_rspsta  := 50;
              o_mnsje_rspsta := 'Error al llamar UP prc_rg_trza_error ' ||
                                sqlerrm;
              continue;
          end;

        else
          -- Si no hay error, se actualiza lote a procesado.

          begin
            update ws_g_confecamaras_sjto_lte s
               set s.prcsdo_extsmnte = 'S'
             where s.id_cnfcmra_sjto_lte = c_expdntes.id_cnfcmra_sjto_lte;
          exception
            when others then
              o_cdgo_rspsta  := 95;
              o_mnsje_rspsta := 'No se pudo actualizar el sujeto confecamara lote estado procesado = S: ' ||
                                c_expdntes.id_cnfcmra_sjto_lte ||
                                ', Error: ' || sqlerrm;
              rollback;
              continue;
          end;

        end if; --FIn -- Validar si existen errores

        begin
          apex_session.attach(p_app_id     => 69000,
                              p_page_id    => 28,
                              p_session_id => v_id_sesion);
        end;

        begin
          update ws_g_confecamaras_sjto_lte
             set prcsdo = 'S'
           where id_cnfcmra_sjto_lte = c_expdntes.id_cnfcmra_sjto_lte;
          commit;
        exception
          when others then
            o_cdgo_rspsta  := 100;
            o_mnsje_rspsta := 'No se pudo actualizar el sujeto confecamara lote estado procesado = S: ' ||
                              c_expdntes.id_cnfcmra_sjto_lte || ', Error: ' ||
                              sqlerrm;
            rollback;
            continue;
        end;

      else
        begin
          update ws_g_confecamaras_sjto_lte
             set obsrvcion_error_prcso = v_obsrvcion
           where id_cnfcmra_sjto_lte = c_expdntes.id_cnfcmra_sjto_lte;
        exception
          when others then
            o_cdgo_rspsta  := 110;
            o_mnsje_rspsta := 'No se pudo actualizar el sujeto confecamara lote obsrvcion: ' ||
                              c_expdntes.id_cnfcmra_sjto_lte || ', Error: ' ||
                              sqlerrm;
            rollback;
            continue;
        end;
      end if;

      begin
        update ws_g_confecamaras_sjto_lte
           set prcsdo = 'S'
         where id_cnfcmra_sjto_lte = c_expdntes.id_cnfcmra_sjto_lte;
        commit;
      exception
        when others then
          o_cdgo_rspsta  := 100;
          o_mnsje_rspsta := 'No se pudo actualizar el sujeto confecamara lote estado procesado = S: ' ||
                            c_expdntes.id_cnfcmra_sjto_lte || ', Error: ' ||
                            sqlerrm;
          rollback;
          continue;
      end;

      -- Notificar actos
      prc_nt_actos(p_cdgo_clnte     => p_cdgo_clnte,
                   p_id_cnfcmra_lte => c_expdntes.id_cnfcmra_lte);

      v_id_cnfcmra_lte := c_expdntes.id_cnfcmra_lte;
    end loop; -- Finaliza recorrido de expedientes

    commit;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'Antes de Notificar Actos.',
                          1);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'Saliendo',
                          1);

  exception
    when others then
      o_cdgo_rspsta  := 200;
      o_mnsje_rspsta := 'Error :' || sqlerrm;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'ERROR CURSOR ' || '-' || sqlerrm ||
                            systimestamp,
                            1);
      rollback;

  end prc_gn_novedades;

  procedure prc_gn_actos_inscrpcion(p_cdgo_clnte          in number,
                                    p_id_impsto_sbmpsto   in number,
                                    p_idntfccion          in varchar2,
                                    p_id_nvdad_prsna      in number,
                                    p_id_cnfcmra_sjto_lte in number,
                                    p_id_usrio            in number,
                                    p_id_session          in number,
                                    o_cdgo_rspsta         out number,
                                    o_mnsje_rspsta        out varchar2) as

    v_slct_sjto_impsto       clob;
    v_slct_rspnsble          clob;
    v_id_plntlla             number;
    v_json_acto              clob;
    v_id_acto_tpo            number;
    v_id_acto                number;
    v_json_plntlla           clob;
    v_html                   clob;
    v_blob                   blob;
    v_nmbre_cnslta           varchar2(50);
    v_nmbre_plntlla          varchar2(50);
    v_cdgo_frmto_plntlla     varchar2(6);
    v_cdgo_frmto_tpo         varchar2(3);
    v_id_rprte               number;
    t_si_g_novedades_persona si_g_novedades_persona%rowtype;
    v_tpo_prsna              si_g_novedades_persona_sjto.tpo_prsna%type;
    v_cntdad_rspnsbles       number := 0;

  begin

    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'OK';

    begin
      select *
        into t_si_g_novedades_persona
        from si_g_novedades_persona
       where id_nvdad_prsna = p_id_nvdad_prsna;
    exception
      when no_data_found then
        o_cdgo_rspsta  := 1;
        o_mnsje_rspsta := 'N?: ' || o_cdgo_rspsta ||
                          ' No se encontro informacion de la novedad';
        return;
      when others then
        o_cdgo_rspsta  := 2;
        o_mnsje_rspsta := 'N?: ' || o_cdgo_rspsta ||
                          ' Error al consultar la informacion de la novedad. ' ||
                          sqlerrm;
        return;
    end;

    if (t_si_g_novedades_persona.cdgo_nvdad_tpo = 'INS' and
       t_si_g_novedades_persona.cdgo_nvdad_prsna_estdo = 'APL') or
       (t_si_g_novedades_persona.cdgo_nvdad_tpo != 'INS') then
      -- Select para obtener el sub-tributo y sujeto impuesto
      v_slct_sjto_impsto := 'select id_impsto_sbmpsto,
                                       id_sjto_impsto
                                  from si_g_novedades_persona
                                 where id_nvdad_prsna = ' ||
                            p_id_nvdad_prsna;

    else
      v_slct_sjto_impsto := null;
    end if;

    -- Select para obtener los responsables de un acto
    if (t_si_g_novedades_persona.cdgo_nvdad_tpo = 'INS' and
       t_si_g_novedades_persona.cdgo_nvdad_prsna_estdo = 'APL') then
      begin
        select tpo_prsna
          into v_tpo_prsna
          from si_g_novedades_persona_sjto
         where id_nvdad_prsna = p_id_nvdad_prsna;
      exception
        when no_data_found then
          o_cdgo_rspsta  := 3;
          o_mnsje_rspsta := 'N?: ' || o_cdgo_rspsta ||
                            ' No se encontro informacion de la novedad sujeto';
          return;
        when others then
          o_cdgo_rspsta  := 4;
          o_mnsje_rspsta := 'N?: ' || o_cdgo_rspsta ||
                            ' Error al consultar la informacion de la novedad sujeto. ' ||
                            sqlerrm;
          return;
      end;

      if v_tpo_prsna = 'N' then

        begin
          select count(1)
            into v_cntdad_rspnsbles
            from si_g_novedades_persona_sjto a
           where id_nvdad_prsna = p_id_nvdad_prsna;

        exception
          when others then
            v_cntdad_rspnsbles := 0;
        end; -- Fin Generacion del json para el Acto

        if v_cntdad_rspnsbles > 0 then

          v_slct_rspnsble := 'select a.cdgo_idntfccion_tpo,
                                                 a.idntfccion,
                                                 a.prmer_nmbre,
                                                 a.sgndo_nmbre,
                                                 a.prmer_aplldo,
                                                 a.sgndo_aplldo,
                                                 a.drccion_ntfccion,
                                                 a.id_pais_ntfccion,
                                                 a.id_dprtmnto_ntfccion,
                                                 a.id_mncpio_ntfccion,
                                                 a.email,
                                                 a.tlfno
                                            from si_g_novedades_persona_sjto a
                                           where id_nvdad_prsna = ' ||
                             p_id_nvdad_prsna;
        end if;
      else
        begin
          select count(1)
            into v_cntdad_rspnsbles
            from si_g_novddes_prsna_rspnsble a
           where id_nvdad_prsna = p_id_nvdad_prsna;

        exception
          when others then
            v_cntdad_rspnsbles := 0;
        end; -- Fin Generacion del json para el Acto

        if v_cntdad_rspnsbles > 0 then

          v_slct_rspnsble := 'select a.cdgo_idntfccion_tpo,
                                             a.idntfccion,
                                             a.prmer_nmbre,
                                             a.sgndo_nmbre,
                                             a.prmer_aplldo,
                                             a.sgndo_aplldo,
                                             a.drccion_ntfccion,
                                             a.id_pais_ntfccion,
                                             a.id_dprtmnto_ntfccion,
                                             a.id_mncpio_ntfccion,
                                             a.email,
                                             a.tlfno
                                        from si_g_novddes_prsna_rspnsble a
                                       where id_nvdad_prsna = ' ||
                             p_id_nvdad_prsna;
        end if;
      end if;
    else
      v_slct_rspnsble := null;
    end if;

    if (t_si_g_novedades_persona.cdgo_nvdad_tpo != 'INS') then
      begin
        select count(1)
          into v_cntdad_rspnsbles
          from si_i_sujetos_responsable a
          join si_i_sujetos_impuesto b
            on a.id_sjto_impsto = b.id_sjto_impsto
         where a.id_sjto_impsto = t_si_g_novedades_persona.id_sjto_impsto;
      end;

      if v_cntdad_rspnsbles > 0 then
        v_slct_rspnsble := 'select a.cdgo_idntfccion_tpo,
                       a.idntfccion,
                       a.prmer_nmbre,
                       a.sgndo_nmbre,
                       a.prmer_aplldo,
                       a.sgndo_aplldo,
                       nvl(a.drccion_ntfccion, b.drccion_ntfccion) drccion_ntfccion,
                       a.id_pais_ntfccion,
                       a.id_dprtmnto_ntfccion,
                       a.id_mncpio_ntfccion,
                       a.email,
                       a.tlfno
                    from si_i_sujetos_responsable   a
                    join si_i_sujetos_impuesto    b on a.id_sjto_impsto = b.id_sjto_impsto
                     where a.id_sjto_impsto = ' ||
                           t_si_g_novedades_persona.id_sjto_impsto;

      end if;
    end if;

    -- Buscar el id del tipo de acto a generar y plantilla
    begin
      select a.id_acto_tpo,
             b.id_plntlla,
             c.nmbre_plntlla,
             c.nmbre_cnslta,
             c.cdgo_frmto_plntlla,
             c.cdgo_frmto_tpo,
             c.id_rprte
        into v_id_acto_tpo,
             v_id_plntlla,
             v_nmbre_plntlla,
             v_nmbre_cnslta,
             v_cdgo_frmto_plntlla,
             v_cdgo_frmto_tpo,
             v_id_rprte
        from gn_d_actos_tipo a
        join gn_d_plantillas b
          on b.id_acto_tpo = a.id_acto_tpo
        join gn_d_reportes c
          on b.id_rprte = c.id_rprte
       where a.cdgo_clnte = p_cdgo_clnte
         and a.cdgo_acto_tpo = 'WIC';
    exception
      when others then
        o_cdgo_rspsta  := 5;
        o_mnsje_rspsta := 'Error al intentar obtener el ID del tipo de acto.';
        return;
    end;

    -- Se genera el json para la creacion del acto
    begin
      v_json_acto := pkg_gn_generalidades.fnc_cl_json_acto(p_cdgo_clnte          => p_cdgo_clnte,
                                                           p_cdgo_acto_orgen     => 'CSL',
                                                           p_id_orgen            => p_id_cnfcmra_sjto_lte,
                                                           p_id_undad_prdctra    => p_id_cnfcmra_sjto_lte,
                                                           p_id_acto_tpo         => v_id_acto_tpo,
                                                           p_acto_vlor_ttal      => 0,
                                                           p_cdgo_cnsctvo        => 'WIC',
                                                           p_id_acto_rqrdo_hjo   => null,
                                                           p_id_acto_rqrdo_pdre  => null,
                                                           p_fcha_incio_ntfccion => sysdate,
                                                           p_id_usrio            => p_id_usrio,
                                                           p_slct_sjto_impsto    => v_slct_sjto_impsto
                                                           --,p_slct_vgncias       => null;
                                                          ,
                                                           p_slct_rspnsble => v_slct_rspnsble);
    end;

    if v_json_acto is not null then
      -- Generacion del acto
      pkg_gn_generalidades.prc_rg_acto(p_cdgo_clnte   => p_cdgo_clnte,
                                       p_json_acto    => v_json_acto,
                                       o_cdgo_rspsta  => o_cdgo_rspsta,
                                       o_mnsje_rspsta => o_mnsje_rspsta,
                                       o_id_acto      => v_id_acto);

      DBMS_OUTPUT.PUT_LINE('v_id_acto: ' || v_id_acto);
      if o_cdgo_rspsta <> 0 then
        o_cdgo_rspsta  := 10;
        o_mnsje_rspsta := 'Error al registrar acto. ' || o_mnsje_rspsta;
        return;
      end if;
    else
      o_cdgo_rspsta  := 15;
      o_mnsje_rspsta := 'Error al obtener los datos del acto a generar.';
      rollback;
      return;
    end if;

    begin
      select json_object('id_cnfcmra_sjto_lte' value p_id_cnfcmra_sjto_lte,
                         'id_nvdad_prsna' value p_id_nvdad_prsna,
                         'id_acto_tpo' value v_id_acto_tpo)
        into v_json_plntlla
        from dual;
    end;

    begin
      v_html := pkg_gn_generalidades.fnc_ge_dcmnto(p_xml        => v_json_plntlla -- json o xml que contiene los parametros que necesitan las consultas de la plantilla dinamica para ejecutarse
                                                  ,
                                                   p_id_plntlla => v_id_plntlla -- id de la plantilla a generar
                                                   );
    end;

    update ws_g_confecamaras_sjto_lte
       set id_acto = v_id_acto, id_plntlla = v_id_plntlla, dcmnto = v_html
     where id_cnfcmra_sjto_lte = p_id_cnfcmra_sjto_lte;

    begin
      apex_session.attach(p_app_id     => 66000,
                          p_page_id    => 37,
                          p_session_id => p_id_session);
    end;

    --Seteamos en session los items necesarios para generar el archivo
    begin
      apex_util.set_session_state('P37_JSON', v_json_plntlla);
      apex_util.set_session_state('F_CDGO_CLNTE', p_cdgo_clnte);
      apex_util.set_session_state('P37_ID_RPRTE', v_id_rprte);
    exception
      when others then
        o_cdgo_rspsta  := 20;
        o_mnsje_rspsta := 'Problemas al setear items en session sesi?n' ||
                          ', por favor, solicitar apoyo t?cnico con este mensaje.';
        return;
    end;

    --GENERAMOS EL DOCUMENTO
    begin
      v_blob := apex_util.get_print_document(p_application_id     => 66000,
                                             p_report_query_name  => v_nmbre_cnslta,
                                             p_report_layout_name => v_nmbre_plntlla,
                                             p_report_layout_type => v_cdgo_frmto_plntlla,
                                             p_document_format    => v_cdgo_frmto_tpo);
    exception
      when others then
        o_cdgo_rspsta  := 25;
        o_mnsje_rspsta := 'Problemas al generar el documento' ||
                          ', por favor, solicitar apoyo t?cnico con este mensaje.';
        return;
    end;

    if v_blob is not null then
      begin
        --Se actualiza el Blob en Acto
        pkg_gn_generalidades.prc_ac_acto(p_file_blob       => v_blob,
                                         p_id_acto         => v_id_acto,
                                         p_ntfccion_atmtca => 'N');
      exception
        when others then
          o_cdgo_rspsta  := 30;
          o_mnsje_rspsta := 'Problemas al ejecutar proceso que actualiza el acto no.' ||
                            v_id_acto || ' con el documento gestionado, ' ||
                            'por favor, solicitar apoyo t?cnico con este mensaje. ';
          return;
      end;
    else
      o_cdgo_rspsta  := 35;
      o_mnsje_rspsta := 'Problemas generando el blob del acto no.' ||
                        v_id_acto ||
                        ', por favor, solicitar apoyo t?cnico con este mensaje.';
      return;
    end if;

  end prc_gn_actos_inscrpcion;

  procedure prc_rg_novedades(p_json           in clob,
                             o_id_nvdad_prsna out number,
                             o_cdgo_rspsta    out number,
                             o_mnsje_rspsta   out varchar2) as

    v_json json_object_t := new json_object_t(p_json);

    v_nl                 number;
    v_nmro_sjto_rspnsble number;
    v_cdgo_tpo_rspnsble  varchar2(5);
    v_prncpal            varchar2(1);
    v_mnsje_log          varchar2(4000);

    nmbre_up                   varchar2(100) := 'pkg_ws_camara_comercio.prc_rg_novedades';
    v_tpo_prsna                varchar2(5) := v_json.get_String('tpo_prsna');
    v_cdgo_clnte               number := v_json.get_Number('cdgo_clnte');
    v_sjto_impsto              number := v_json.get_Number('id_sjto_impsto');
    v_mtrcla                   varchar2(100) := v_json.get_String('mtrcla');
    v_id_cnfcmra_sjto_lte      number := v_json.get_Number('id_cnfcmra_sjto_lte');
    v_cdgo_nvdad               varchar2(10) := v_json.get_String('cdgo_nvdad');
    v_idntfccion               si_c_terceros.idntfccion%type := v_json.get_String('idntfccion');
    v_cdgo_idntfccion_tpo      varchar2(10) := v_json.get_String('cdgo_idntfccion_tpo');
    v_prmer_nmbre              varchar2(250) := v_json.get_String('prmer_nmbre');
    v_sgndo_nmbre              varchar2(250) := v_json.get_String('sgndo_nmbre');
    v_prmer_aplldo             varchar2(250) := v_json.get_String('prmer_aplldo');
    v_sgndo_aplldo             varchar2(250) := v_json.get_String('sgndo_aplldo');
    v_nmbre_rzon_scial         varchar2(250) := v_json.get_String('nmbre_rzon_scial');
    v_drccion                  varchar2(250) := v_json.get_String('drccion');
    v_nmro_scrsles             number := v_json.get_Number('nmro_scrsles');
    v_id_pais                  number := v_json.get_Number('id_pais');
    v_id_dprtmnto              number := v_json.get_Number('id_dprtmnto');
    v_id_mncpio                number := v_json.get_Number('id_mncpio');
    v_drccion_ntfccion         varchar2(250) := v_json.get_String('drccion_ntfccion');
    v_id_pais_ntfccion         number := v_json.get_Number('id_pais_ntfccion');
    v_id_dprtmnto_ntfccion     number := v_json.get_Number('id_dprtmnto_ntfccion');
    v_id_mncpio_ntfccion       number := v_json.get_Number('id_mncpio_ntfccion');
    v_email                    varchar2(250) := v_json.get_String('email');
    v_tlfno                    varchar2(250) := v_json.get_String('tlfno');
    v_cllar                    varchar2(30) := v_json.get_String('cllar');
    v_nmro_rgstro_cmra_cmrcio  varchar2(250) := v_json.get_String('nmro_rgstro_cmra_cmrcio');
    v_fcha_rgstro_cmra_cmrcio  varchar2(20) := v_json.get_String('fcha_rgstro_cmra_cmrcio');
    v_fcha_incio_actvddes      varchar2(20) := v_json.get_String('fcha_incio_actvddes');
    v_drccion_cmra_cmrcio      varchar2(250) := v_json.get_String('drccion_cmra_cmrcio');
    v_id_sjto_tpo              number := v_json.get_Number('id_sjto_tpo'); --jga
    v_id_actvdad_ecnmca        number := v_json.get_Number('id_actvdad_ecnmca');
    v_id_trcro                 si_c_terceros.id_trcro%type;
    v_id_sesion                number := v_json.get_Number('id_sesion');
    v_id_instncia_fljo         number := v_json.get_Number('id_instncia_fljo');
    v_id_fljo_trea             number := v_json.get_Number('id_fljo_trea');
    v_id_usrio                 number := v_json.get_Number('id_usrio');
    v_id_impsto                number := v_json.get_Number('id_impsto');
    v_id_impsto_sbmpsto        number := v_json.get_Number('id_impsto_sbmpsto');
    v_obsrvcion                varchar2(4000) := v_json.get_String('obsrvcion');
    v_dscrpcion_idntfccion_tpo varchar2(150);

  begin

    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'OK';

    v_nl := pkg_sg_log.fnc_ca_nivel_log(v_cdgo_clnte, null, nmbre_up);

    pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'Entrando:',
                          1);

    pkg_si_novedades_persona.prc_rg_novedad_persona(p_cdgo_clnte        => v_cdgo_clnte,
                                                    p_ssion             => v_id_sesion,
                                                    p_id_impsto         => v_id_impsto,
                                                    p_id_impsto_sbmpsto => v_id_impsto_sbmpsto,
                                                    p_id_sjto_impsto    => v_sjto_impsto,
                                                    p_id_instncia_fljo  => v_id_instncia_fljo,
                                                    p_cdgo_nvdad_tpo    => v_cdgo_nvdad,
                                                    p_obsrvcion         => v_obsrvcion,
                                                    p_id_usrio_rgstro   => v_id_usrio,
                                                    -- Datos de Inscripcion --
                                                    p_tpo_prsna               => v_tpo_prsna,
                                                    p_cdgo_idntfccion_tpo     => v_cdgo_idntfccion_tpo,
                                                    p_idntfccion              => v_idntfccion,
                                                    p_prmer_nmbre             => v_prmer_nmbre,
                                                    p_sgndo_nmbre             => v_sgndo_nmbre,
                                                    p_prmer_aplldo            => v_prmer_aplldo,
                                                    p_sgndo_aplldo            => v_sgndo_aplldo,
                                                    p_nmbre_rzon_scial        => v_nmbre_rzon_scial,
                                                    p_drccion                 => v_drccion,
                                                    p_id_pais                 => v_id_pais,
                                                    p_id_dprtmnto             => v_id_dprtmnto,
                                                    p_id_mncpio               => v_id_mncpio,
                                                    p_drccion_ntfccion        => v_drccion_ntfccion,
                                                    p_id_pais_ntfccion        => v_id_pais_ntfccion,
                                                    p_id_dprtmnto_ntfccion    => v_id_dprtmnto_ntfccion,
                                                    p_id_mncpio_ntfccion      => v_id_mncpio_ntfccion,
                                                    p_email                   => v_email,
                                                    p_tlfno                   => v_tlfno,
                                                    p_cllar                   => v_cllar,
                                                    p_nmro_rgstro_cmra_cmrcio => v_mtrcla, --v_nmro_rgstro_cmra_cmrcio,
                                                    p_fcha_rgstro_cmra_cmrcio => to_date(v_fcha_rgstro_cmra_cmrcio,
                                                                                         'dd/mm/yyyy'),
                                                    p_fcha_incio_actvddes     => to_date(v_fcha_incio_actvddes,
                                                                                         'dd/mm/yyyy'),
                                                    p_nmro_scrsles            => v_nmro_scrsles,
                                                    p_drccion_cmra_cmrcio     => v_drccion_ntfccion,
                                                    /*p_id_actvdad_ecnmca       => replace(v_id_actvdad_ecnmca,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     0,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     null),*/
                                                    p_id_actvdad_ecnmca => v_id_actvdad_ecnmca, --29/01/2026
                                                    p_id_sjto_tpo       => v_id_sjto_tpo,
                                                    -- Fin Datos de Inscripcion --
                                                    o_id_nvdad_prsna => o_id_nvdad_prsna,
                                                    o_cdgo_rspsta    => o_cdgo_rspsta,
                                                    o_mnsje_rspsta   => o_mnsje_rspsta);

    pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'DESPUES DE: prc_rg_novedad_persona  cdgo: ' ||
                          o_cdgo_rspsta || ' mnsje: ' || o_mnsje_rspsta,
                          1);

    if o_cdgo_rspsta <> 0 then
      rollback;
      return;
    end if;

    pkg_si_novedades_persona.prc_ap_novedad_persona(p_cdgo_clnte     => v_cdgo_clnte,
                                                    p_id_nvdad_prsna => o_id_nvdad_prsna,
                                                    p_id_usrio       => v_id_usrio,
                                                    --p_tpo_nvdad        => 'CFC',
                                                    o_cdgo_rspsta  => o_cdgo_rspsta,
                                                    o_mnsje_rspsta => o_mnsje_rspsta);

    pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'DESPUES DE: prc_ap_novedad_persona  cdgo: ' ||
                          o_cdgo_rspsta || ' mnsje: ' || o_mnsje_rspsta,
                          1);
    if o_cdgo_rspsta <> 0 then
      rollback;
      return;
    end if;

    if v_cdgo_nvdad = 'INS' then
      --Generacion de Actos
      prc_gn_actos_inscrpcion(p_cdgo_clnte          => v_cdgo_clnte,
                              p_id_impsto_sbmpsto   => v_id_impsto_sbmpsto,
                              p_idntfccion          => v_idntfccion,
                              p_id_nvdad_prsna      => o_id_nvdad_prsna,
                              p_id_cnfcmra_sjto_lte => v_id_cnfcmra_sjto_lte,
                              p_id_usrio            => v_id_usrio,
                              p_id_session          => v_id_sesion,
                              o_cdgo_rspsta         => o_cdgo_rspsta,
                              o_mnsje_rspsta        => o_mnsje_rspsta);

      if o_cdgo_rspsta <> 0 then
        rollback;
        return;
      end if;

      begin
        select id_sjto_impsto
          into v_sjto_impsto
          from si_g_novedades_persona
         where id_nvdad_prsna = o_id_nvdad_prsna;
      exception
        when others then
          o_cdgo_rspsta  := 5;
          o_mnsje_rspsta := 'No se pudo validar el sujeto impuesto, o_id_nvdad_prsna: ' ||
                            o_id_nvdad_prsna || ', Error: ' || sqlerrm;
          rollback;
          return;
      end;
    end if;

    begin
      update ws_g_confecamaras_sjto_lte
         set id_nvdad  = o_id_nvdad_prsna,
             tpo_nvdad = v_cdgo_nvdad,
             --cdgo_estdo           = 'NTF',
             --fcha_ntfccion        = systimestamp,
             fcha_lmte_inscrpcion = systimestamp + 60,
             id_sjto_impsto       = v_sjto_impsto
       where id_cnfcmra_sjto_lte = v_id_cnfcmra_sjto_lte;
    exception
      when others then
        o_cdgo_rspsta  := 10;
        o_mnsje_rspsta := 'No se pudo actualizar el sujeto confecamara lote: ' ||
                          v_id_cnfcmra_sjto_lte || ', Error: ' || sqlerrm;
        rollback;
        return;
    end;

    begin
      select a.dscrpcion_idntfccion_tpo
        into v_dscrpcion_idntfccion_tpo
        from df_s_identificaciones_tipo a
       where a.cdgo_idntfccion_tpo = v_cdgo_idntfccion_tpo;

    end;

    if o_cdgo_rspsta <> 0 then
      rollback;
      return;
    end if;

  end prc_rg_novedades;

  procedure prc_co_identificacion(p_cdgo_clnte   number,
                                  p_id_impsto    number,
                                  p_id_prvdor    number,
                                  p_idntfccion   varchar2,
                                  p_cdgo_rspsta  out number,
                                  p_mnsje_rspsta out varchar2) is
    v_nl                number;
    nmbre_up            varchar2(100) := 'pkg_ws_camara_comercio.prc_co_identificacion';
    v_url_mnjdor        clob;
    v_tkn               clob; -- Token
    v_cdgo_empresa      number;
    v_clavews           varchar2(30);
    v_usuariows         varchar2(12);
    v_body_lgin         clob;
    v_body              clob;
    v_rspsta            clob;
    v_expiracion        DATE; -- Expiración del token
    v_token_valid       boolean := false;
    v_token_exp_seconds number := 15 * 60; -- Segundos de validez del token
  begin
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'Entrando al procedimiento.',
                          1);

    -- Verificar si la colección existe y contiene un token válido
    if apex_collection.collection_exists('CONFECAMARAS_TOKEN') then
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'Dentro del IF CONFECAMARAS_TOKEN',
                            1);
      begin

        select c001, TO_DATE(c002, 'YYYY-MM-DD HH24:MI:SS')
          into v_tkn, v_expiracion
          from apex_collections a
         where a.collection_name = 'CONFECAMARAS_TOKEN'
         order by c005 desc
         fetch first 1 row only;

        -- Validar si el token no ha expirado
        if v_expiracion > SYSDATE then
          v_token_valid := true;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                'Token válido encontrado: ' ||
                                TO_char(v_expiracion,
                                        'YYYY-MM-DD HH24:MI:SS'),
                                1);
        else
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                'Token encontrado pero expirado.',
                                1);
        end if;
      exception
        when no_data_found then
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                'No se encontró un token en la colección.',
                                1);
      end;
    else
      -- Crear la colección si no existe
      apex_collection.create_collection('CONFECAMARAS_TOKEN');
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'Colección creada para almacenar el token.',
                            1);
    end if;

    begin
      v_cdgo_empresa := fnc_ob_propiedad_provedor(p_cdgo_clnte,
                                                  p_id_impsto,
                                                  p_id_prvdor,
                                                  'CEM');
      v_usuariows    := fnc_ob_propiedad_provedor(p_cdgo_clnte,
                                                  p_id_impsto,
                                                  p_id_prvdor,
                                                  'USR');
    exception
      when others then
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'Error al consultar propiedades: ' || SQLERRM,
                              1);
    end;
    -- Si no hay un token válido, solicitar uno nuevo
    if not v_token_valid then

      v_clavews := fnc_ob_propiedad_provedor(p_cdgo_clnte,
                                             p_id_impsto,
                                             p_id_prvdor,
                                             'PWD');

      v_url_mnjdor := fnc_ob_url_manejador('LGIN', p_id_prvdor);

      SELECT json_object('clavews' value v_clavews,
                         'codigoempresa' value v_cdgo_empresa,
                         'usuariows' value v_usuariows)
        INTO v_body_lgin
        FROM dual;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'Json solicitar Token:' || v_body_lgin,
                            1);

      v_rspsta := APEX_WEB_SERVICE.make_rest_request(p_url         => json_value(v_url_mnjdor,
                                                                                 '$.url'),
                                                     p_http_method => json_value(v_url_mnjdor,
                                                                                 '$.manejador'),
                                                     p_body        => v_body_lgin);

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'Json Respuesta solicitar Token:' || v_rspsta,
                            1);

      if json_value(v_rspsta, '$.codigoerror') = '0000' then
        v_tkn        := json_value(v_rspsta, '$.token');
        v_expiracion := SYSDATE + (v_token_exp_seconds / (24 * 60 * 60)); -- Convertir segundos a días

        -- Almacenar el token en la colección
        apex_collection.truncate_collection('CONFECAMARAS_TOKEN');
        apex_collection.add_member(p_collection_name => 'CONFECAMARAS_TOKEN',
                                   p_c001            => v_tkn,
                                   p_c002            => TO_CHAR(v_expiracion,
                                                                'YYYY-MM-DD HH24:MI:SS'));

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'Nuevo token almacenado.',
                              1);
      else
        p_cdgo_rspsta  := 1;
        p_mnsje_rspsta := 'Error consultando el token: ' ||
                          json_value(v_rspsta, '$.mensajeerror');
        RETURN;
      end if;
    end if;

    /*if json_value(v_rspsta, '$.codigoerror') = '0000' then
    v_tkn := JSON_VALUE(v_rspsta, '$.token');*/

    select json_object('codigoempresa' value v_cdgo_empresa,
                       'usuariows' value v_usuariows,
                       'token' value v_tkn,
                       'usuarioconsulta' value v_usuariows,
                       'tipoidentificacion' value 'N',
                       'identificacion' value p_idntfccion)
      into v_body
      from dual;

    v_url_mnjdor := fnc_ob_url_manejador('CRPI', p_id_prvdor);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, nmbre_up, v_nl, v_body, 1);

    v_rspsta := APEX_WEB_SERVICE.make_rest_request(p_url         => json_value(v_url_mnjdor,
                                                                               '$.url'),
                                                   p_http_method => json_value(v_url_mnjdor,
                                                                               '$.manejador'),
                                                   p_body        => v_body);

    v_rspsta := TRIM(REPLACE(v_rspsta, '¿', ''));

    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, nmbre_up, v_nl, v_rspsta, 1);

    if JSON_EXISTS(v_rspsta, '$.codigoerror') THEN
      if JSON_VALUE(v_rspsta, '$.codigoerror') = '0000' then
        if JSON_VALUE(v_rspsta, '$.respuesta.codigoError') is null then
          if JSON_VALUE(v_rspsta, '$.respuesta.error.code') is null then
            --Se crea la coleccion
            apex_collection.create_or_truncate_collection(p_collection_name => 'REGISTROS');
            apex_collection.create_or_truncate_collection(p_collection_name => 'VINCULOS');
            apex_collection.create_or_truncate_collection(p_collection_name => 'ESTABLECIMIENTOS');
            for r1 in (select *
                         from json_table(v_rspsta,
                                         '$.respuesta.registros[*]'
                                         columns(camara varchar2(50) path
                                                 '$.camara',
                                                 matricula varchar2(50) path
                                                 '$.matricula',
                                                 razon_social varchar2(150) path
                                                 '$.razon_social',
                                                 estado_matricula varchar2(50) path
                                                 '$.estado_matricula',
                                                 tipo_sociedad varchar2(50) path
                                                 '$.tipo_sociedad',
                                                 ultimo_ano_renovado
                                                 varchar2(50) path
                                                 '$.ultimo_ano_renovado',
                                                 organizacion_juridica
                                                 varchar2(150) path
                                                 '$.organizacion_juridica',
                                                 categoria_matricula
                                                 varchar2(50) path
                                                 '$.categoria_matricula',
                                                 fecha_matricula varchar2(50) path
                                                 '$.fecha_matricula',
                                                 fecha_renovacion varchar2(50) path
                                                 '$.fecha_renovacion',
                                                 direccion_comercial
                                                 varchar2(50) path
                                                 '$.direccion_comercial',
                                                 municipio_comercial
                                                 varchar2(50) path
                                                 '$.municipio_comercial',
                                                 dpto_comercial varchar2(50) path
                                                 '$.dpto_comercial',
                                                 telefono_comercial_1
                                                 varchar2(50) path
                                                 '$.telefono_comercial_1',
                                                 correo_electronico_comercial
                                                 varchar2(50) path
                                                 '$.correo_electronico_comercial',
                                                 direccion_fiscal
                                                 varchar2(100) path
                                                 '$.direccion_fiscal',
                                                 municipio_fiscal varchar2(50) path
                                                 '$.municipio_fiscal',
                                                 dpto_fiscal varchar2(50) path
                                                 '$.dpto_fiscal',
                                                 telefono_fiscal_1
                                                 varchar2(50) path
                                                 '$.telefono_fiscal_1',
                                                 correo_electronico_fiscal
                                                 varchar2(50) path
                                                 '$.correo_electronico_fiscal',
                                                 cod_ciiu_act_econ_pri
                                                 varchar2(100) path
                                                 '$.cod_ciiu_act_econ_pri',
                                                 desc_ciiu_act_econ_pri
                                                 varchar2(500) path
                                                 '$.desc_ciiu_act_econ_pri',

                                                 codigo_tipo_identificacion
                                                 number path
                                                 '$.codigo_tipo_identificacion',

                                                 primer_nombre varchar2(500) path
                                                 '$.primer_nombre',

                                                 segundo_nombre varchar2(500) path
                                                 '$.segundo_nombre',

                                                 primer_apellido varchar2(500) path
                                                 '$.primer_apellido',

                                                 segundo_apellido
                                                 varchar2(500) path
                                                 '$.segundo_apellido',

                                                 codigo_organizacion_juridica
                                                 varchar2(500) path
                                                 '$.codigo_organizacion_juridica',

                                                 codigo_municipio_comercial
                                                 varchar2(500) path
                                                 '$.codigo_municipio_comercial',

                                                 codigo_municipio_fiscal
                                                 varchar2(500) path
                                                 '$.codigo_municipio_fiscal',

                                                 vinculos clob format json path
                                                 '$.vinculos',
                                                 establecimientos clob format json path
                                                 '$.establecimientos'))) loop

              --            if r1.estado_matricula = 'ACTIVA' then
              APEX_COLLECTION.ADD_MEMBER(p_collection_name => 'REGISTROS',
                                         p_c001            => p_idntfccion,
                                         p_c002            => r1.camara,
                                         p_c003            => r1.matricula,
                                         p_c004            => r1.razon_social,
                                         p_c005            => r1.ultimo_ano_renovado,
                                         p_c006            => r1.estado_matricula,
                                         p_c007            => r1.tipo_sociedad,
                                         p_c008            => r1.organizacion_juridica,
                                         p_c009            => r1.categoria_matricula,
                                         p_c010            => r1.fecha_matricula,
                                         p_c011            => r1.fecha_renovacion,
                                         p_c012            => r1.direccion_comercial,
                                         p_c013            => r1.municipio_comercial,
                                         p_c014            => r1.dpto_comercial,
                                         p_c015            => r1.telefono_comercial_1,
                                         p_c016            => r1.correo_electronico_comercial,
                                         p_c017            => r1.direccion_fiscal,
                                         p_c018            => r1.municipio_fiscal,
                                         p_c019            => r1.dpto_fiscal,
                                         p_c020            => r1.telefono_fiscal_1,
                                         p_c021            => r1.correo_electronico_fiscal,
                                         p_c022            => r1.cod_ciiu_act_econ_pri,
                                         p_c023            => r1.desc_ciiu_act_econ_pri,
                                         p_c024            => r1.codigo_tipo_identificacion,
                                         p_c025            => r1.primer_nombre,
                                         p_c026            => r1.segundo_nombre,
                                         p_c027            => r1.primer_apellido,
                                         p_c028            => r1.segundo_apellido,
                                         p_c029            => r1.codigo_organizacion_juridica,
                                         p_c030            => r1.codigo_municipio_comercial,
                                         p_c031            => r1.codigo_municipio_fiscal

                                         );

              if r1.vinculos is not null then
                for r2 in (select *
                             from json_table(r1.vinculos,
                                             '$[*]'
                                             columns(codigo_clase_identificacion
                                                     varchar2(50) path
                                                     '$.codigo_clase_identificacion',
                                                     clase_identificacion
                                                     varchar2(50) path
                                                     '$.clase_identificacion',
                                                     numero_identificacion
                                                     varchar2(50) path
                                                     '$.numero_identificacion',
                                                     nombre varchar2(100) path
                                                     '$.nombre',
                                                     tipo_vinculo varchar2(50) path
                                                     '$.tipo_vinculo',
                                                     codigo_tipo_vinculo
                                                     varchar2(50) path
                                                     '$.codigo_tipo_vinculo'))) loop
                  APEX_COLLECTION.ADD_MEMBER(p_collection_name => 'VINCULOS',
                                             p_c001            => p_idntfccion,
                                             p_c002            => r2.codigo_clase_identificacion,
                                             p_c003            => r2.clase_identificacion,
                                             p_c004            => r2.numero_identificacion,
                                             p_c005            => r2.nombre,
                                             p_c006            => r2.tipo_vinculo,
                                             p_c007            => r2.codigo_tipo_vinculo,
                                             p_c008            => r1.matricula);

                end loop;
              end if;

              if r1.establecimientos is not null then
                for r3 in (select *
                             from json_table(r1.establecimientos,
                                             '$[*]'
                                             columns(codigo_camara
                                                     varchar2(50) path
                                                     '$.codigo_camara',
                                                     matricula varchar2(50) path
                                                     '$.matricula',
                                                     razon_social varchar2(50) path
                                                     '$.razon_social',
                                                     codigo_estado_matricula
                                                     varchar2(100) path
                                                     '$.codigo_estado_matricula',
                                                     fecha_matricula
                                                     varchar2(50) path
                                                     '$.fecha_matricula',
                                                     fecha_renovacion
                                                     varchar2(50) path
                                                     '$.fecha_renovacion',
                                                     municipio_comercial
                                                     varchar2(50) path
                                                     '$.municipio_comercial',
                                                     direccion_comercial
                                                     varchar2(50) path
                                                     '$.direccion_comercial',
                                                     telefono_comercial_1
                                                     varchar2(50) path
                                                     '$.telefono_comercial_1',
                                                     correo_electronico_comercial
                                                     varchar2(50) path
                                                     '$.correo_electronico_comercial',
                                                     direccion_fiscal
                                                     varchar2(50) path
                                                     '$.direccion_fiscal',
                                                     municipio_fiscal
                                                     varchar2(50) path
                                                     '$.municipio_fiscal',
                                                     correo_electronico_fiscal
                                                     varchar2(50) path
                                                     '$.correo_electronico_fiscal',
                                                     ciiu1 varchar2(50) path
                                                     '$.ciiu1',
                                                     desc_ciiu1 varchar2(500) path
                                                     '$.desc_ciiu1'))) loop
                  if r3.codigo_camara = '22' and
                     (r3.municipio_fiscal = '23001' or
                     r3.municipio_comercial = '23001') then

                    APEX_COLLECTION.ADD_MEMBER(p_collection_name => 'ESTABLECIMIENTOS',
                                               p_c001            => p_idntfccion,
                                               p_c002            => r3.codigo_camara,
                                               p_c003            => r3.matricula,
                                               p_c004            => r3.razon_social,
                                               p_c005            => r3.codigo_estado_matricula,
                                               p_c006            => r3.fecha_renovacion,
                                               p_c007            => r3.municipio_comercial,
                                               p_c008            => r3.direccion_comercial,
                                               p_c009            => r3.telefono_comercial_1,
                                               p_c010            => r3.correo_electronico_comercial,
                                               p_c011            => r3.direccion_fiscal,
                                               p_c012            => r3.municipio_fiscal,
                                               p_c013            => r3.correo_electronico_fiscal,
                                               p_c014            => r3.ciiu1,
                                               p_c015            => r3.desc_ciiu1,
                                               p_c016            => r3.fecha_matricula,
                                               p_c017            => r1.matricula);
                  end if;
                end loop;
              end if;
              --end if;
            end loop;

          else
            p_cdgo_rspsta  := 5;
            p_mnsje_rspsta := 'Error consultando la identificacion ' ||
                              JSON_VALUE(v_rspsta, '$.respuesta.error.code') ||
                              ' - ' ||
                              JSON_VALUE(v_rspsta,
                                         '$.respuesta.error.message');
          end if;

        else
          p_cdgo_rspsta  := 4;
          p_mnsje_rspsta := 'Error consultando la identificacion ' ||
                            JSON_VALUE(v_rspsta, '$.respuesta.codigoError') || '-' ||
                            JSON_VALUE(v_rspsta, '$.respuesta.msgError');
        end if;

      else
        p_cdgo_rspsta  := 3;
        p_mnsje_rspsta := 'Error consultando la identificacion ' ||
                          JSON_VALUE(v_rspsta, '$.codigoerror') || '-' ||
                          JSON_VALUE(v_rspsta, '$.mensajeerror');
      end if;

    else
      p_cdgo_rspsta  := 2;
      p_mnsje_rspsta := 'Error estructura de la respuesta de confecamaras';
    end if;
    /*
    else
      p_cdgo_rspsta  := 1;
      p_mnsje_rspsta := 'Error consultando el token ' ||
                        json_value(v_rspsta, '$.mensajeerror');
    end if;*/
  exception
    when others then
      p_cdgo_rspsta := 99;
      --      p_mnsje_rspsta := SQLCODE || ' ' || DBMS_UTILITY.FORMAT_ERROR_STACK || '@' || DBMS_UTILITY.FORMAT_CALL_STACK;
      p_mnsje_rspsta := SQLERRM;

  end prc_co_identificacion;

  /*
    Autor : Jorge Badran
    Creado : 21/02/2025
    Descripción: procedimiento encargado consultar los propietarios de los establecimiento.
  */
  procedure prc_co_DatosPropietario(p_cdgo_clnte   in number,
                                    p_id_prvdor    in number,
                                    p_id_impsto    in number,
                                    p_id_usrio     in number,
                                    o_cdgo_rspsta  out number,
                                    o_mnsje_rspsta out clob) as

    v_nl                  number;
    nmbre_up              varchar2(100) := 'pkg_ws_camara_comercio.prc_co_DatosPropietario';
    v_id_cnfcmra_sjto_lte number;
    v_id_sesion           number;
    v_cdgo_rspsta         number;
    v_mnsje_rspsta        varchar2(200);
  begin

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'prc_co_DatosPropietario: ',
                          1);
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'Antes del for c_expdntes. ',
                          1);

    for c_expdntes in (select c.idntfccion_prptrio, b.id_cnfcmra_lte
                         from ws_g_confecamaras_sjto_lte a
                        inner join ws_g_confecamaras_lote b
                           on b.id_cnfcmra_lte = a.id_cnfcmra_lte
                         join json_table(a.prptrios, '$[*]' columns(camara path '$.camara', matricula path '$.matricula', idclase path '$.idclase', idntfccion_prptrio path '$.numid', nit path '$.nit', razonsocial path '$.razonsocial', dircom path '$.dircom', telcom1 path '$.telcom1', telcom2 path '$.telcom2', telcom3 path '$.telcom3', emailcom path '$.emailcom', muncom path '$.muncom', dirnot path '$.dirnot', telnot1 path '$.telnot1', telnot2 path '$.telnot2', telnot3 path '$.telnot3', emailnot path '$.emailnot', munnot path '$.munnot', idclasereplegal path '$.idclasereplegal', numidreplegal path '$.numidreplegal', nombrereplegal path '$.nombrereplegal')) c
                           on 1 = 1
                        where not exists
                        (select 1
                                 from si_c_sujetos s
                                where s.idntfccion = c.idntfccion_prptrio)
                          and a.ctgria = '0'
                          and a.organizacion <> '01'
                          and a.estado in ('MA', 'IA')
                          and b.cdgo_clnte = p_cdgo_clnte
                          and a.prcsdo = 'N'
                          and trunc(b.fcha_rgstro) = trunc(sysdate)) loop
      begin
        apex_session.create_session(p_app_id   => 69000,
                                    p_page_id  => 9998,
                                    p_username => '1111111112');

        v_id_sesion := v('APP_SESSION');

        if APEX_COLLECTION.COLLECTION_EXISTS(p_collection_name => 'REGISTROS') then
          APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => 'REGISTROS');
        end if;
        if APEX_COLLECTION.COLLECTION_EXISTS(p_collection_name => 'VINCULOS') then
          APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => 'VINCULOS');
        end if;
        if APEX_COLLECTION.COLLECTION_EXISTS(p_collection_name => 'ESTABLECIMIENTOS') then
          APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => 'ESTABLECIMIENTOS');
        end if;

        pkg_ws_camara_comercio.prc_co_identificacion(p_cdgo_clnte   => p_cdgo_clnte,
                                                     p_id_impsto    => p_id_impsto,
                                                     p_id_prvdor    => p_id_prvdor,
                                                     p_idntfccion   => c_expdntes.idntfccion_prptrio,
                                                     p_cdgo_rspsta  => v_cdgo_rspsta,
                                                     p_mnsje_rspsta => v_mnsje_rspsta);

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'Respuesta del procedimiento prc_co_identificacion: ' ||
                              'v_cdgo_rspsta - ' || v_cdgo_rspsta ||
                              ' v_mnsje_rspsta - ' || v_mnsje_rspsta,
                              1);

        begin
          insert into ws_g_confecamaras_sjto_lte
            (id_cnfcmra_lte,
             mtrcla,
             tpo_idntfccion,
             idntfccion,
             prmer_nmbre,
             sgndo_nmbre,
             prmer_aplldo,
             sgndo_aplldo,
             cllar,
             mncpio,
             mncpio_ntfccion,
             drccion,
             dirccn_ntfccion,
             rzon_scial,
             email,
             email_ntfccion,
             tlfno,
             estado,
             organizacion,
             fcha_incio_actvddes,
             fcha_inscrpcion,
             prcsdo,
             cdgo_ciiu_1,
             dscpcion_ciiu_1,
             ctgria)
          -- Datos del propietario del establecimiento. (Matriculas)
            select c_expdntes.id_cnfcmra_lte,
                   a.c003 matricula,
                   a.c024 tpo_identificacion,
                   c_expdntes.idntfccion_prptrio idntfccion,
                   a.c025 prmer_nmbre,
                   a.c026 sgndo_nmbre,
                   a.c027 prmer_aplldo,
                   a.c028 sgndo_aplldo,
                   a.c015 cllar,
                   a.c030 mncpio,
                   a.c031 mncpio_ntfccion,
                   a.c012 drccion,
                   a.c012 dirccn_ntfccion,
                   a.c004 rzon_scial,
                   a.c016 email,
                   a.c016 email_ntfccion,
                   a.c015 tlfno,
                   case
                     when a.c006 = 'ACTIVA' then
                      'MA'
                   end estado,
                   a.c029 organizacion,
                   to_date(a.c011, 'yyyymmdd') fcha_incio_actvddes,
                   to_date(a.c010, 'yyyymmdd') fecmatricula,
                   'N',
                   a.c022 cdgo_ciiu_1,
                   a.c023 dscrpcion_ciiu_1,
                   a.c029 categoria
              from apex_collections a
             where a.collection_name = 'REGISTROS'
               and a.c006 = 'ACTIVA';

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                'Despues del Insert: ' ||
                                c_expdntes.idntfccion_prptrio,
                                1);

          APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => 'REGISTROS');
          APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => 'VINCULOS');
          APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => 'ESTABLECIMIENTOS');
        exception
          when no_data_found then
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  nmbre_up,
                                  v_nl,
                                  'No se encontraron registros con la identificación idntfccion_prptrio idntfccion: ' ||
                                  c_expdntes.idntfccion_prptrio || ' - ' ||
                                  sqlerrm,
                                  1);
          when others then
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  nmbre_up,
                                  v_nl,
                                  'Error idntfccion_prptrio idntfccion: ' ||
                                  c_expdntes.idntfccion_prptrio || ' - ' ||
                                  sqlerrm,
                                  1);
        end;
      exception
        when others then
          o_cdgo_rspsta  := 210;
          o_mnsje_rspsta := 'Error en el blucle' || sqlerrm;
          rollback;
          return;
      end;
    end loop;
    -- Finaliza recorrido de expedientes
    commit;
    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'Consulta Exitosa';
    return;
  exception
    when others then
      o_cdgo_rspsta  := 220;
      o_mnsje_rspsta := 'Error: ' || sqlerrm;
      rollback;
      return;
  end prc_co_DatosPropietario;

  procedure prc_nt_actos(p_cdgo_clnte     in number,
                         p_id_cnfcmra_lte in number) as

    v_json_parametros clob;

  begin
    for actos in (select b.id_acto, a.id_sjto_impsto
                    from ws_g_confecamaras_sjto_lte a
                    join gn_g_actos b
                      on b.id_acto = a.id_acto
                    join gd_g_documentos c
                      on c.id_dcmnto = b.id_dcmnto
                   where c.file_blob is not null
                     and a.id_cnfcmra_lte = p_id_cnfcmra_lte
                     and not exists
                   (select 1
                            from ma_g_envios d
                           where d.id_acto = b.id_acto)
                   order by a.id_cnfcmra_sjto_lte desc) loop

      select json_object(key 'p_id_acto_nvdad' is actos.id_acto)
        into v_json_parametros
        from dual;

      pkg_ma_envios.prc_co_envio_programado(p_cdgo_clnte     => p_cdgo_clnte,
                                            p_idntfcdor      => 'ConfecamarasRegistro',
                                            p_json_prmtros   => v_json_parametros,
                                            p_id_sjto_impsto => actos.id_sjto_impsto,
                                            p_id_acto        => actos.id_acto);
    end loop;

  end prc_nt_actos;

  procedure prc_rg_sucursales(p_idntfccion   in si_c_sujetos.idntfccion%type,
                              o_cdgo_rspsta  out number,
                              o_mnsje_rspsta out varchar2) as

  begin

    --Loop de sucursales (Estableciminetos)
    for c_sucur in (select d.id_sjto_impsto,
                           c.id_sjto,
                           row_number() over (partition by d.id_sjto_impsto order by b.matricula desc) cdgo_scrsal,
                           b.razon_social nmbre,
                           b.direccion drccion,
                           c.id_dprtmnto,
                           c.id_mncpio,
                           b.telefono tlfno,
                           0 cllar,
                           b.email,
                           decode(b.est_matricula, 'MC', 'N', 'S') actvo,
                           b.matricula mtrcla,
                           Sysdate fcha_rgstro
                      from ws_g_confecamaras_sjto_lte a
                      left join json_table(a.estblcmntos, '$[*]' columns(matricula path '$.MATRICULA', est_matricula path '$.EST_MATRICULA', razon_social path '$.RAZON_SOCIAL', direccion path '$.DIRECCION', email path '$.EMAIL', telefono path '$.TELEFONO', fec_matricula path '$.FEC_MATRICULA', fec_cancelacion path '$.FEC_CANCELACION')) b
                        on 1 = 1
                      join si_c_sujetos c
                        on c.idntfccion = a.idntfccion
                      join si_i_sujetos_impuesto d
                        on c.id_sjto = d.id_sjto
                     where (a.prcsdo in ('N'))
                       and a.idntfccion = p_idntfccion)

     loop

      --Insertar sucursales.
      begin
        insert into si_i_sujetos_sucursal
          (id_sjto_impsto,
           id_sjto,
           cdgo_scrsal,
           nmbre,
           drccion,
           id_dprtmnto_ntfccion,
           id_mncpio_ntfccion,
           tlfno,
           cllar,
           email,
           actvo,
           fcha_rgstro)
        values
          (c_sucur.id_sjto_impsto,
           c_sucur.id_sjto,
           c_sucur.cdgo_scrsal,
           c_sucur.nmbre,
           c_sucur.drccion,
           c_sucur.id_dprtmnto,
           c_sucur.id_mncpio,
           c_sucur.tlfno,
           c_sucur.cllar,
           c_sucur.email,
           c_sucur.actvo,
           c_sucur.fcha_rgstro);

      exception
        when others then
          o_cdgo_rspsta  := 10;
          o_mnsje_rspsta := 'Error al actualizar la sucursal';
          return;
      end;

    end loop;

    o_cdgo_rspsta := 0;

  end prc_rg_sucursales;

  procedure prc_rg_trza_error(p_id_cnfcmra_lte      in ws_g_confecamaras_sjto_lte.id_cnfcmra_lte%type,
                              p_id_cnfcmra_sjto_lte in ws_g_confecamaras_sjto_lte.id_cnfcmra_sjto_lte%type,
                              p_obsrvcion           in clob,
                              o_cdgo_rspsta         out number,
                              o_mnsje_rspsta        out varchar2) as

    v_id_cnfcmr_sjt_lt_error number;
  begin

    begin
      insert into ws_d_confecmrs_sjt_lt_error
        (id_cnfcmra_lte,
         id_envio,
         observacion,
         indcdor_prcso,
         cdgo_rspsta_cnfcmra,
         msje_rspsta_cnfcmra,
         id_cnfcmra_sjto_lte)
      values
        (p_id_cnfcmra_lte,
         null,
         p_obsrvcion,
         'P',
         null,
         null,
         p_id_cnfcmra_sjto_lte)
      returning id_cnfcmr_sjt_lt_error into v_id_cnfcmr_sjt_lt_error;
    exception
      when others then
        o_cdgo_rspsta  := 99;
        o_mnsje_rspsta := 'Error al insertar detallado de errores lote en ws_d_confecmrs_sjt_lt_error.' ||
                          sqlerrm || ' - ' || sqlcode;

        rollback;
    end;

    begin
      update ws_g_confecamaras_sjto_lte s
         set s.id_cnfcmr_sjt_lt_error = v_id_cnfcmr_sjt_lt_error
       where s.id_cnfcmra_sjto_lte = p_id_cnfcmra_sjto_lte;

    exception
      when others then
        o_cdgo_rspsta  := 93;
        o_mnsje_rspsta := 'No se pudo actualizar id confecamara sujeto error del sujeto confecamara lote : ' ||
                          p_id_cnfcmra_sjto_lte || ', Error: ' || sqlerrm;
        rollback;
    end;

  end prc_rg_trza_error;

  procedure prc_rg_datos(p_cdgo_clnte   in number,
                         p_json         in clob,
                         p_json_cnslta  in clob,
                         p_id_usrio     in number,
                         p_tpo_rprte    in number,
                         p_id_impsto    in si_i_sujetos_impuesto.id_impsto%type,
                         p_fcha_incial  in timestamp,
                         p_fcha_fnal    in timestamp,
                         o_cdgo_rspsta  out number,
                         o_mnsje_rspsta out varchar2) as

    v_url_mnjdor             clob;
    v_url_mnjdor_tkn         clob; --jga
    v_tkn                    clob; --jga
    v_cdgo_empresa           number;
    v_usuariows              varchar2(12);
    v_fcha_incial            varchar2(10);
    v_fcha_fnal              varchar2(10);
    v_hra_incial             varchar2(10);
    v_hra_fnal               varchar2(10);
    v_mncpio                 varchar2(10);
    v_stma_dstno             varchar2(20);
    v_tpo_envio              varchar2(1);
    v_body_lgin              clob;
    v_rspsta                 clob;
    v_body                   json_object_t := new json_object_t();
    v_array_prptrio          json_array_t;
    v_array_rspnsble         json_array_t;
    v_cdgo_api               varchar2(10);
    v_clavews                varchar2(30);
    v_obsrvcion              varchar2(4000);
    v_mtrclas_actvas         number;
    v_mtrclas_cncldas        number;
    v_adcnal                 varchar2(50);
    v_url_accion             varchar2(500);
    v_estdo                  varchar2(20);
    v_id_cnfcmr_sjt_lt_error number;
    v_g                      clob;
    v_idclase                varchar2(5);
    v_numid                  varchar2(20);
    v_nit                    varchar2(20);

    v_nl                  number;
    nmbre_up              varchar2(100) := 'pkg_ws_camara_comercio.prc_rg_datos';
    v_id_cnfcmra_lte      number;
    v_pge_actal           number := 1;
    v_id_usrio            number := p_id_usrio;
    v_ip_address          varchar2(20);
    v_trmnal              varchar2(100);
    v_idntfccion          varchar2(20);
    v_id_cnfcmra_sjto_lte number;
    v_prcsdo_extsmnte     varchar2(1);
    v_idntfccion_exste    si_c_sujetos.idntfccion%type;
    v_orgen_expdnte       ws_g_confecamaras_sjto_lte.orgen%type;
    v_cntdad_expdntes     number := 0;
    v_tpo_idntfccion      ws_g_confecamaras_sjto_lte.tpo_idntfccion%type;

  begin

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'Entrando:',
                          1);

    o_cdgo_rspsta     := 0;
    o_mnsje_rspsta    := 'OK';
    v_mtrclas_actvas  := 0;
    v_mtrclas_cncldas := 0;

    --pkg_sg_log.prc_rg_log(p_cdgo_clnte,null,nmbre_up,v_nl,'$$$$$ Inicia con v_mtrclas_actvas: :' || v_mtrclas_actvas,1);

    -- Insertar Lote ws_g_confecamaras_lote
    for c_lte in (select p_fcha_incial as fcha_incial,
                         p_fcha_fnal   as fcha_fnal,
                         e.cantidad    as ttal_rgstros
                    from json_table(p_json,
                                    '$' columns(cantidad varchar2(10) path
                                            '$.data.per_page')) e) loop
      begin
        insert into ws_g_confecamaras_lote
          (cdgo_clnte,
           fcha_incial,
           fcha_fnal,
           cntdad_expdntes,
           fcha_rgstro,
           id_usrio_rgstro,
           ip,
           work_station,
           rspsta_json,
           request_json,
           orgen)
        values
          (p_cdgo_clnte,
           c_lte.fcha_incial,
           c_lte.fcha_fnal,
           c_lte.ttal_rgstros,
           systimestamp,
           v_id_usrio,
           v_ip_address,
           v_trmnal,
           p_json,
           p_json_cnslta,
           'CAM')
        returning id_cnfcmra_lte into v_id_cnfcmra_lte;
      exception
        when others then
          o_cdgo_rspsta  := 10;
          o_mnsje_rspsta := 'Error al insertar encabezado del lote en ws_g_confecamaras_lote.' ||
                            sqlerrm || ' - ' || sqlcode;
          rollback;
          return;
      end;
    end loop; -- Fin -- Insertar Lote ws_g_confecamaras_lote

    --- Loop para registrar los expedientes.
    for c_expdntes_lte in (select null         id_envio,
                                  null         tpo_idntfccion,
                                  e.idntfccion,
                                  /*regexp_replace(e.nit,
                                  '^(.{9})',
                                  '\1-') as nit,*/
                                  substr(e.nit, 1, length(e.nit) - 1) nit,
                                  substr(e.rzon_scial, 1, 600) prmer_nmbre, -- Maximo 600 caracteres permitidos
                                  null sgndo_nmbre,
                                  '.' prmer_aplldo,
                                  null sgndo_aplldo,
                                  null cllar,
                                  substr(nvl(e.mncpio, e.mncpio_ntfccion),
                                         1,
                                         5) as mncpio,
                                  substr(nvl(e.mncpio_ntfccion, e.mncpio),
                                         1,
                                         5) as mncpio_ntfccion,
                                  nvl(e.drccion, e.dirccn_ntfccion) as drccion,
                                  nvl(e.dirccn_ntfccion, e.drccion) as dirccn_ntfccion,
                                  e.rzon_scial,
                                  nvl(e.email, e.email_ntfccion) as email,
                                  nvl(e.email_ntfccion, e.email) as email_ntfccion,
                                  e.tlfno,
                                  null tiporeporte,
                                  e.matricula,
                                  e.estado,
                                  e.organizacion,
                                  null categoria,
                                  substr(e.cdgo_ciiu_1, 2, 4) cdgo_ciiu_1,
                                  substr(e.cdgo_ciiu_2, 2, 4) cdgo_ciiu_2,
                                  substr(e.cdgo_ciiu_3, 2, 4) cdgo_ciiu_3,
                                  substr(e.cdgo_ciiu_4, 2, 4) cdgo_ciiu_4,
                                  null dscrpcion_ciiu_1,
                                  null dscrpcion_ciiu_2,
                                  null dscrpcion_ciiu_3,
                                  null dscrpcion_ciiu_4,
                                  to_date(e.fecmatricula, 'yyyy-mm-dd') as fcha_incio_actvddes,
                                  to_date(e.fecmatricula, 'yyyy-mm-dd') as fecmatricula,
                                  null propietarios,
                                  '[' || e.representantelegal || ']' representantelegal,
                                  e.estblcmntos
                             from json_table(p_json,
                                             '$.data.data[*]'
                                             columns(idntfccion varchar2(20) path
                                                     '$.IDENTIFICACION',
                                                     nit varchar2(20) path
                                                     '$.NIT',
                                                     mncpio varchar2(200) path
                                                     '$.MUN_COMERCIAL',
                                                     mncpio_ntfccion
                                                     varchar2(200) path
                                                     '$.MUN_NOTIFICACION',
                                                     drccion varchar2(200) path
                                                     '$.DIR_COMERCIAL',
                                                     dirccn_ntfccion
                                                     varchar2(200) path
                                                     '$.DIR_NOTIFICACION',
                                                     rzon_scial varchar2(200) path
                                                     '$.RAZON_SOCIAL',
                                                     email varchar2(200) path
                                                     '$.EMAIL_COMERCIAL',
                                                     email_ntfccion
                                                     varchar2(200) path
                                                     '$.EMAIL_NOTIFICACION',
                                                     tlfno varchar2(20) path
                                                     '$.TEL_NOTF_1', --TEL_COM_1
                                                     matricula varchar2(20) path
                                                     '$.MATRICULA',
                                                     estado varchar2(3) path
                                                     '$.EST_MATRICULA',
                                                     organizacion varchar2(3) path
                                                     '$.ORGANIZACION',
                                                     cdgo_ciiu_1 varchar2(50) path
                                                     '$.CIIU_1',
                                                     cdgo_ciiu_2 varchar2(50) path
                                                     '$.CIIU_2',
                                                     cdgo_ciiu_3 varchar2(50) path
                                                     '$.CIIU_3',
                                                     cdgo_ciiu_4 varchar2(50) path
                                                     '$.CIIU_4',
                                                     fecmatricula varchar2(10) path
                                                     '$.FEC_MATRICULA',
                                                     representantelegal clob
                                                     format json path
                                                     '$.REP_LEGAL_1',
                                                     estblcmntos clob format json path
                                                     '$.ESTABLECIMIENTOS')) e
                           /*where e.tiporeporte = '2' -- Matriculas y constituciones
                           and e.estado      = 'MA' -- Matricula Activa*/
                           ) loop

      v_cntdad_expdntes := v_cntdad_expdntes + 1;
      v_obsrvcion       := null;

      -- 01 Persona Natural
      if c_expdntes_lte.organizacion = '01' then
        v_idntfccion     := c_expdntes_lte.idntfccion;
        v_tpo_idntfccion := 1; -- CC
      else
        v_idntfccion     := c_expdntes_lte.nit;
        v_tpo_idntfccion := 2; -- NIT
      end if;

      begin
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'insert into ws_g_confecamaras_sjto_lte:' ||
                              systimestamp,
                              1);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'Datos:=>' || 'c_expdntes_lte.matricula=>' ||
                              c_expdntes_lte.matricula ||
                              '-c_expdntes_lte.tpo_idntfccion=>' ||
                              c_expdntes_lte.tpo_idntfccion ||
                              '-c_expdntes_lte.propietarios=>' ||
                              c_expdntes_lte.propietarios || '-' ||
                              systimestamp,
                              1);

        insert into ws_g_confecamaras_sjto_lte
          (id_cnfcmra_lte,
           mtrcla,
           tpo_idntfccion,
           idntfccion,
           prmer_nmbre,
           sgndo_nmbre,
           prmer_aplldo,
           sgndo_aplldo,
           cllar,
           mncpio,
           mncpio_ntfccion,
           drccion,
           dirccn_ntfccion,
           rzon_scial,
           email,
           email_ntfccion,
           tlfno,
           estado,
           organizacion,
           fcha_incio_actvddes,
           fcha_inscrpcion,
           rprsntnte_lgal,
           prcsdo,
           cdgo_ciiu_1,
           cdgo_ciiu_2,
           cdgo_ciiu_3,
           cdgo_ciiu_4,
           dscpcion_ciiu_1,
           dscpcion_ciiu_2,
           dscpcion_ciiu_3,
           dscpcion_ciiu_4,
           --id_envio,
           prptrios,
           ctgria,
           estblcmntos,
           orgen)
        values
          (v_id_cnfcmra_lte,
           c_expdntes_lte.matricula,
           v_tpo_idntfccion,
           v_idntfccion,
           c_expdntes_lte.prmer_nmbre,
           c_expdntes_lte.sgndo_nmbre,
           c_expdntes_lte.prmer_aplldo,
           c_expdntes_lte.sgndo_aplldo,
           c_expdntes_lte.cllar,
           c_expdntes_lte.mncpio,
           c_expdntes_lte.mncpio_ntfccion,
           c_expdntes_lte.drccion,
           c_expdntes_lte.dirccn_ntfccion,
           c_expdntes_lte.rzon_scial,
           c_expdntes_lte.email,
           c_expdntes_lte.email_ntfccion,
           c_expdntes_lte.tlfno,
           c_expdntes_lte.estado,
           c_expdntes_lte.organizacion,
           c_expdntes_lte.fcha_incio_actvddes,
           c_expdntes_lte.fecmatricula,
           c_expdntes_lte.representantelegal,
           'N',
           c_expdntes_lte.cdgo_ciiu_1,
           c_expdntes_lte.cdgo_ciiu_2,
           c_expdntes_lte.cdgo_ciiu_3,
           c_expdntes_lte.cdgo_ciiu_4,
           c_expdntes_lte.dscrpcion_ciiu_1,
           c_expdntes_lte.dscrpcion_ciiu_2,
           c_expdntes_lte.dscrpcion_ciiu_3,
           c_expdntes_lte.dscrpcion_ciiu_4,
           --c_expdntes_lte.id_envio,
           c_expdntes_lte.propietarios,
           c_expdntes_lte.categoria,
           c_expdntes_lte.estblcmntos,
           'CAM')
        returning id_cnfcmra_sjto_lte into v_id_cnfcmra_sjto_lte;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'despues insert into ws_g_confecamaras_sjto_lte:' ||
                              v_id_cnfcmra_sjto_lte || '-' || systimestamp,
                              1);

      exception
        when others then
          o_cdgo_rspsta  := 20;
          o_mnsje_rspsta := 'Error al insertar detallado del lote en ws_g_confecamaras_sjto_lte.' ||
                            sqlerrm || ' - ' || sqlcode;
          continue;
      end;
    end loop; -- fin --- Loop para registrar los expedientes.

    --Se actualiza cantidad de expediente por lote
    begin
      update ws_g_confecamaras_lote
         set cntdad_expdntes = v_cntdad_expdntes
       where id_cnfcmra_lte = v_id_cnfcmra_lte;
    exception
      when others then
        o_mnsje_rspsta := 'No se pudo actulizar cantidad de expediente por lote. Error: ' ||
                          sqlerrm || ' - ' || sqlcode;
    end;

    commit;

    begin
      /*Validación de datos,
      Agrega obervaciones que contralan si el expediente tiene todos los datos requeridos para inscribir en el sistema*/
      pkg_ws_camara_comercio.prc_vl_dprar_dtos(p_cdgo_clnte     => p_cdgo_clnte,
                                               P_id_cnfcmra_lte => v_id_cnfcmra_lte,
                                               p_id_impsto      => p_id_impsto,
                                               o_cdgo_rspsta    => o_cdgo_rspsta,
                                               o_mnsje_rspsta   => o_mnsje_rspsta);
    exception
      when others then
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'Error presentado al ejecutar prc_vl_dprar_dtos :' ||
                              sqlerrm,
                              1);
        return;
    end;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'Saliendo:',
                          1);

  exception
    when others then
      o_cdgo_rspsta  := 100;
      o_mnsje_rspsta := 'Exception no controlada ' || ', error: ' ||
                        sqlerrm;
      rollback;
      return;
  end prc_rg_datos;

  /*Validación que cada expediente cumpla para poder realizar la novedad en el sistema.
    si el expediente no cumple en su totalidad, se registra obervación en la tabla ws_d_confecmrs_sjt_lt_error
  */
  procedure prc_vl_dprar_dtos(p_cdgo_clnte     in number,
                              P_id_cnfcmra_lte in number,
                              p_id_impsto      in number,
                              o_cdgo_rspsta    out number,
                              o_mnsje_rspsta   out varchar2) as

    v_tpo_envio              varchar2(1);
    v_body                   json_object_t := new json_object_t();
    v_array_prptrio          json_array_t;
    v_array_rspnsble         json_array_t;
    v_obsrvcion              varchar2(4000);
    v_mtrclas_actvas         number;
    v_mtrclas_cncldas        number;
    v_adcnal                 varchar2(50);
    v_estdo                  varchar2(20);
    v_id_cnfcmr_sjt_lt_error number;
    v_g                      clob;
    --v_idclase                varchar2(5);
    v_numid               varchar2(20);
    v_nit                 varchar2(20);
    v_nl                  number;
    nmbre_up              varchar2(100) := 'pkg_ws_camara_comercio.prc_vl_dprar_dtos';
    v_id_cnfcmra_lte      number;
    v_idntfccion          varchar2(20);
    v_id_cnfcmra_sjto_lte number;

    v_prcsdo_extsmnte  varchar2(1);
    v_idntfccion_exste si_c_sujetos.idntfccion%type;
    v_orgen_expdnte    ws_g_confecamaras_sjto_lte.orgen%type;
    v_cntdad_expdntes  number := 0;

  begin

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, nmbre_up);
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'Entrando:',
                          1);

    o_cdgo_rspsta     := 0;
    o_mnsje_rspsta    := 'OK';
    v_mtrclas_actvas  := 0;
    v_mtrclas_cncldas := 0;

    -- Loop de c_cjtos_lte
    for c_cjtos_lte in (select a.id_cnfcmra_sjto_lte,
                               a.id_cnfcmra_lte,
                               a.mtrcla,
                               a.tpo_idntfccion,
                               a.idntfccion,
                               a.prmer_nmbre,
                               a.sgndo_nmbre,
                               a.prmer_aplldo,
                               a.sgndo_aplldo,
                               a.cllar,
                               a.mncpio,
                               a.mncpio_ntfccion,
                               a.drccion,
                               a.dirccn_ntfccion,
                               a.rzon_scial,
                               a.email,
                               a.email_ntfccion,
                               a.tlfno,
                               a.estado,
                               a.organizacion,
                               a.ctgria,
                               a.cdgo_ciiu_1,
                               a.cdgo_ciiu_2,
                               a.cdgo_ciiu_3,
                               a.cdgo_ciiu_4,
                               a.dscpcion_ciiu_1,
                               a.dscpcion_ciiu_2,
                               a.dscpcion_ciiu_3,
                               a.dscpcion_ciiu_4,
                               a.fcha_incio_actvddes,
                               a.prptrios,
                               a.rprsntnte_lgal,
                               a.prcsdo,
                               a.id_acto,
                               a.id_plntlla,
                               a.dcmnto,
                               a.id_sjto_impsto,
                               a.id_nvdad,
                               a.tpo_nvdad,
                               a.cdgo_estdo,
                               a.fcha_ntfccion,
                               a.fcha_inscrpcion,
                               a.fcha_lmte_inscrpcion,
                               a.prcsdo_extsmnte,
                               a.id_cnfcmr_sjt_lt_error,
                               a.ntfcdo_cnfcmra,
                               a.etsdo_ntfcdo_cnfcmra,
                               a.id_envio
                          from ws_g_confecamaras_sjto_lte a
                          join ws_g_confecamaras_lote b
                            on b.id_cnfcmra_lte = a.id_cnfcmra_lte
                         where trunc(b.fcha_rgstro) = trunc(sysdate)
                           and a.prcsdo = 'N'
                           and a.orgen = 'CAM'
                           and b.id_cnfcmra_lte = P_id_cnfcmra_lte) loop

      v_id_cnfcmr_sjt_lt_error := null;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'c_cjtos_lte.a.prptrios:=>' ||
                            c_cjtos_lte.prptrios || '-' || systimestamp,
                            1);

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'DENTRO DEL CURSOR c_cjtos_lte :' ||
                            systimestamp,
                            1);

      v_obsrvcion := null;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'DESPUES DE  D v_obsrvcion      := null;' ||
                            systimestamp,
                            1);

      if c_cjtos_lte.prptrios is null then
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'c_cjtos_lte.prptrios is null' ||
                              systimestamp,
                              1);
      else
        v_array_prptrio := json_array_t.parse(c_cjtos_lte.prptrios);
      end if;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'DESPUES DE  v_array_prptrio ;' || systimestamp,
                            1);

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            '--> c_cjtos_lte.rprsntnte_lgal ' ||
                            c_cjtos_lte.rprsntnte_lgal,
                            1);

      v_array_rspnsble := json_array_t.parse(c_cjtos_lte.rprsntnte_lgal);

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'DESPUES v_array_rspnsble' || systimestamp,
                            1);

      -- Validar estado de matriculas
      /*Estado.
          [Activa (MA),
          Inscripcion activa (IA),
          Cancelada (MC)].
      */
      if c_cjtos_lte.estado in ('MA', 'IA') then

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              '$$$$$ ANTES DE, van con v_mtrclas_actvas: ' ||
                              v_mtrclas_actvas,
                              1);

        v_mtrclas_actvas := v_mtrclas_actvas + 1;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'DENTRO DEL IF c_cjtos_lte.estado = MA' ||
                              systimestamp,
                              1);

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              '$$$$$ DESPUES DE, van con v_mtrclas_actvas: ' ||
                              v_mtrclas_actvas,
                              1);

      elsif c_cjtos_lte.estado = 'MC' then

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'elsif c_cjtos_lte.estado = MC' ||
                              systimestamp,
                              1);

        v_mtrclas_cncldas := v_mtrclas_cncldas + 1;

      end if; -- FIn -- Validar estado de matriculas

      /*Estado.
          [Activa (MA),
          Inscripcion activa (IA),
          Cancelada (MC)].
      */
      -- Si el estado es Activa (MA),
      if c_cjtos_lte.estado in ('MA', 'IA') then
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'Dentro if c_cjtos_lte.estado = MA' ||
                              systimestamp,
                              1);

        -- '01' Persona Natural
        --if c_cjtos_lte.organizacion = '01' then

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'if c_cjtos_lte.organizacion = 01' ||
                              systimestamp,
                              1);

        --Validar que la identificación no sea nulo
        if c_cjtos_lte.idntfccion is null then
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                'c_cjtos_lte.organizacion = 01 c_cjtos_lte.idntfccion is null then' ||
                                systimestamp,
                                1);

          v_obsrvcion := 'La identificacion';
          v_adcnal    := ' provino';
        end if;

        /*else -- SI no es persona Natural

        if c_cjtos_lte.idntfccion is null and
          c_cjtos_lte.ctgria not in ('0', '2', '3') then
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,null,nmbre_up,v_nl,
                      'if c_cjtos_lte.idntfccion is null and c_cjtos_lte.ctgria not in (0, 2, 3)' ||systimestamp,1);

          v_obsrvcion := 'El nit';
          v_adcnal    := ' provino';
        end if;*/

        --end if; -- Fin c_cjtos_lte.organizacion = '01'

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'despues if 1',
                              1);

        -- Validar que los sujetos juridcos tengan responsable de represente legal.
        if c_cjtos_lte.organizacion <> '01' then
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                ' if c_cjtos_lte.organizacion <> 01' ||
                                systimestamp,
                                1);

          if dbms_lob.getlength(c_cjtos_lte.rprsntnte_lgal) > 2
          --and c_cjtos_lte.prptrios is not null
           then
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  nmbre_up,
                                  v_nl,
                                  ' if dbms_lob.getlength(c_cjtos_lte.rprsntnte_lgal) > 2 then' ||
                                  systimestamp,
                                  1);

            begin

              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    nmbre_up,
                                    v_nl,
                                    ' Antes del select a.idclase' ||
                                    systimestamp,
                                    1);

              select a.numid
                into v_numid
                from json_table(c_cjtos_lte.rprsntnte_lgal,
                                '$[*]' columns(numid varchar2(50) path
                                        '$.IDENTIFICACION')) a
               fetch first 1 rows only;
            exception
              when others then
                v_numid := null;
            end;

            if v_numid is null then
              v_obsrvcion := v_obsrvcion ||
                             ' El array de propietario trajo datos pero no tiene la identificación del representante legal';
              v_adcnal    := ' provino';
            end if; -- fin v_numid is null

          else
            --No hay array de represneta legal.
            v_obsrvcion := v_obsrvcion ||
                           ' Persona Juridica no tiene represente legal.';
            v_adcnal    := ' provino';
          end if; -- fin dbms_lob.getlength(c_cjtos_lte.rprsntnte_lgal) > 2

        end if; -- fin c_cjtos_lte.organizacion <> '01' then

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'despues if 2',
                              1);

        -- Validación que el correo no sea nulo.
        if v_obsrvcion is null and c_cjtos_lte.email is null then
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                ' if v_obsrvcion is null and c_cjtos_lte.email is null' ||
                                systimestamp,
                                1);

          v_obsrvcion := 'La direccion de correo electronico';
          v_adcnal    := ' provino';
        elsif v_obsrvcion is not null and c_cjtos_lte.email is null then
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                ' elsif v_obsrvcion is not null and c_cjtos_lte.email is null then' ||
                                systimestamp,
                                1);

          v_obsrvcion := v_obsrvcion || ', direccion de correo electronico';
        end if; -- Validación que el correo no sea nulo.

        -- Validar que el correo sea valido.
        if v_obsrvcion is null and c_cjtos_lte.email is not null then
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                ' if v_obsrvcion is null and c_cjtos_lte.email is not null' ||
                                systimestamp,
                                1);

          if (regexp_like(c_cjtos_lte.email,
                          '^[A-Za-z0-9._%+-/}{~^]+@[a-zA-Z0-9]+((\-|\.)?[a-zA-Z0-9])*\.[a-zA-Z0-9]{2,3}$') =
             false) then
            v_obsrvcion := 'La direccion de correo electronico no es valido';
            v_adcnal    := ' provino';
          end if;

        elsif v_obsrvcion is not null and c_cjtos_lte.email is not null then

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                ' if v_obsrvcion is null and c_cjtos_lte.email is not null' ||
                                systimestamp,
                                1);

          if (regexp_like(c_cjtos_lte.email,
                          '^[A-Za-z0-9._%+-/}{~^]+@[a-zA-Z0-9]+((\-|\.)?[a-zA-Z0-9])*\.[a-zA-Z0-9]{2,3}$') =
             false) then
            v_obsrvcion := v_obsrvcion ||
                           ', direccion de correo electronico no es valida';
          end if;

        end if;
        --Fin -- Validar que el correo sea valido.

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'despues if 6',
                              1);

        /*
          Valores de organizacion
          01 Persona Natural
        */
        -- Si es persona natural -- Validación que venga nombre en el expediente
        if c_cjtos_lte.organizacion = '01' then
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                '  if c_cjtos_lte.organizacion = 01 then' ||
                                systimestamp,
                                1);

          if v_obsrvcion is null and (c_cjtos_lte.prmer_nmbre is null or
             c_cjtos_lte.prmer_aplldo is null) then
            v_obsrvcion := 'El primer nombre o el primer apellido';
            v_adcnal    := ' provino';
          elsif v_obsrvcion is not null and
                (c_cjtos_lte.prmer_nmbre is null or
                c_cjtos_lte.prmer_aplldo is null) then
            v_obsrvcion := v_obsrvcion ||
                           ', primer nombre o primer apellido';
          end if;

        else
          -- Persona Juridica

          if v_obsrvcion is null and c_cjtos_lte.rzon_scial is null then
            v_obsrvcion := 'La razon social';
            v_adcnal    := ' provino';
          elsif v_obsrvcion is not null and c_cjtos_lte.rzon_scial is null then
            v_obsrvcion := v_obsrvcion || ', razon social';
          end if;

        end if; --Fin -- Si es persona natural -- Validación que venga nombre en el expediente

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              '---> p_id_impsto ' || p_id_impsto,
                              1);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              '---> c_cjtos_lte.idntfccion ' ||
                              c_cjtos_lte.idntfccion,
                              1);

        --Se consulta si el sujeto por crear existe en el sistema.
        begin
          select a.idntfccion, nvl(c.prcsdo_extsmnte, 'N'), c.orgen
            into v_idntfccion_exste, v_prcsdo_extsmnte, v_orgen_expdnte
            from si_c_sujetos a
            join si_i_sujetos_impuesto b
              on a.id_sjto = b.id_sjto
            left join ws_g_confecamaras_sjto_lte c
              on trim(a.idntfccion) = trim(c.idntfccion)
             and c.prcsdo_extsmnte = 'S'
           where b.id_impsto = p_id_impsto
             and trim(a.idntfccion) = trim(c_cjtos_lte.idntfccion);
        exception
          when no_data_found then
            null; -- No hacer nada, el sujeto es valido para crear.

          when others then
            o_cdgo_rspsta  := 10;
            o_mnsje_rspsta := 'Error al consultar sujeto en el sistema' ||
                              sqlerrm || ' - ' || sqlcode;
            v_obsrvcion    := 'No se puedo validar si el sujeto ya estaba inscrito en el sistema. Error: ' ||
                              sqlerrm || ' - ' || sqlcode;
            v_adcnal       := 'Provino';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  nmbre_up,
                                  v_nl,
                                  o_cdgo_rspsta || '.' || o_mnsje_rspsta,
                                  1);

        end;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              '---> v_idntfccion_exste: ' ||
                              v_idntfccion_exste,
                              1);

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'despues if 7',
                              1);

        -- Concatenar observaciones
        if v_obsrvcion is not null then

          if v_adcnal is null then
            v_adcnal := ' provinieron ';
          end if;

          v_obsrvcion := v_obsrvcion || v_adcnal ||
                         ' vacio(s) en la respuesta del servicio, por favor verificar';
        end if;

        --Se valida que el expediente no esté creado en el sistema
        if v_idntfccion_exste is not null then

          --Se conulta si el sujeto fue inscrito por CONFECAMARA
          if v_prcsdo_extsmnte = 'S' and v_orgen_expdnte = 'COM' then
            v_obsrvcion := 'El sujeto fue inscrito previamente mediante CONFECAMARA.';
            v_adcnal    := ' provino';
          elsif v_prcsdo_extsmnte = 'S' and v_orgen_expdnte = 'CAM' then
            v_obsrvcion := 'El sujeto fue inscrito previamente mediante CAMARA DE COMERCIO.';
            v_adcnal    := ' provino';
          else
            v_obsrvcion := 'El sujeto se encuentra inscrito en el sistema';
            v_adcnal    := ' provino';
          end if;

        end if;

        -- Si la observación es null, no se presentaron errores durante la validación de los datos.
        if v_obsrvcion is null then
          v_estdo := 'OK';
        else
          -- Si la obervación no es nula, se presentó incidencia en a revisión de los datos, se registra novedad en tabla de traza.
          v_estdo := 'ER';
          begin
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  nmbre_up,
                                  v_nl,
                                  ' ANTES insert into ws_d_confecmrs_sjt_lt_error' ||
                                  systimestamp,
                                  1);

            -- Se inserta observación de error en tabla traza
            insert into ws_d_confecmrs_sjt_lt_error
              (id_cnfcmra_lte,
               id_envio,
               observacion,
               indcdor_prcso,
               cdgo_rspsta_cnfcmra,
               msje_rspsta_cnfcmra,
               id_cnfcmra_sjto_lte)
            values
              (P_id_cnfcmra_lte,
               c_cjtos_lte.id_envio,
               v_obsrvcion,
               'W',
               null,
               null,
               c_cjtos_lte.id_cnfcmra_sjto_lte)
            returning id_cnfcmr_sjt_lt_error into v_id_cnfcmr_sjt_lt_error;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  nmbre_up,
                                  v_nl,
                                  'DESPUES insert into ws_d_confecmrs_sjt_lt_error:' || '-' ||
                                  v_id_cnfcmr_sjt_lt_error || '-' ||
                                  systimestamp,
                                  1);

          exception
            when others then
              o_cdgo_rspsta  := 20;
              o_mnsje_rspsta := 'Error al insertar detallado de errores lote en ws_d_confecmrs_sjt_lt_error.' ||
                                sqlerrm || ' - ' || sqlcode;
              continue;
          end;

          -- Actualizar id de error en tabla ws_g_confecamaras_sjto_lte
          begin
            update ws_g_confecamaras_sjto_lte a
               set a.id_cnfcmr_sjt_lt_error = v_id_cnfcmr_sjt_lt_error
             where a.id_cnfcmra_sjto_lte = c_cjtos_lte.id_cnfcmra_sjto_lte;
          exception
            when others then
              o_cdgo_rspsta  := 30;
              o_mnsje_rspsta := 'Error al actualizar detallado de sujeto lote en ws_g_confecamaras_sjto_lte.' ||
                                sqlerrm || ' - ' || sqlcode;
              continue;
          end;

        end if; -- fin -- Si la observación es null, no se presentaron error durante la validación de los datos.

      end if; --Fin -- Si el estado es Activa (MA),

    /*DESCOMENTAR SI HAY QUE NOTIFICAR A CAMARA DE COMERCIO CREACION DE SUJETOS*/
    /*v_body.put('idenvio', c_cjtos_lte.id_envio);
                                                    v_body.put('estado', v_estdo);
                                                    v_body.put('numeroasignado', c_cjtos_lte.id_cnfcmra_sjto_lte);
                                                    v_body.put('observaciones', v_obsrvcion);

                                                    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                                              null,
                                                              nmbre_up,
                                                              v_nl,
                                                              'Antes del sgdo web services' ||
                                                              systimestamp,
                                                              1);

                                                    -- Se realiza la peticion

                                                    v_g := v_body.to_clob;

                                                    -- ****** se confirma a confecamara las Matriculas registradas.
                                                    v_url_mnjdor := fnc_ob_url_manejador('CRME', p_id_prvdor);

                                                    -- 1 Confirmar a confecamara la inscripción de matriculas.
                                                    if v_tpo_envio = 1 then

                                                    v_rspsta := APEX_WEB_SERVICE.make_rest_request(p_url         => json_value(v_url_mnjdor,
                                                                                           '$.url'),
                                                                             p_http_method => json_value(v_url_mnjdor,
                                                                                           '$.manejador'),
                                                                             p_body        => v_body.to_clob);
                                                    end if;

                                                    update ws_g_confecamaras_sjto_lte a
                                                     set a.request_cnfrma = v_g
                                                     where a.id_cnfcmra_sjto_lte =
                                                       c_cjtos_lte.id_cnfcmra_sjto_lte;

                                                    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                                              null,
                                                              nmbre_up,
                                                              v_nl,
                                                              'despues del sgdo web services' ||
                                                              systimestamp,
                                                              1);*/

    --if v_rspsta is not null then

    /*begin
                                                      update ws_g_confecamaras_sjto_lte a
                                                       set a.ntfcdo_cnfcmra       = v_estdo,
                                                         a.etsdo_ntfcdo_cnfcmra = 'S'
                                                       where a.id_cnfcmra_sjto_lte =
                                                         c_cjtos_lte.id_cnfcmra_sjto_lte;
                                                    exception
                                                      when others then
                                                      o_cdgo_rspsta  := 33;
                                                      o_mnsje_rspsta := 'Error al actualizar detallado de sujeto lote en ws_g_confecamaras_sjto_lte.' ||
                                                                sqlerrm || ' - ' || sqlcode;
                                                      continue;
                                                    end;*/

    /*begin
                                                    update ws_d_confecmrs_sjt_lt_error
                                                     set cdgo_rspsta_cnfcmra = json_value(v_rspsta,
                                                                        '$.codigoerror'),
                                                       msje_rspsta_cnfcmra = json_value(v_rspsta,
                                                                        '$.mensajeerror')
                                                     where id_cnfcmr_sjt_lt_error = v_id_cnfcmr_sjt_lt_error;

                                                  exception
                                                    when others then
                                                    o_cdgo_rspsta  := 35;
                                                    o_mnsje_rspsta := 'Error al actualizar detallado de errores lote en ws_d_confecmrs_sjt_lt_error.' ||
                                                              sqlerrm || ' - ' || sqlcode;
                                                    continue;
                                                  end;*/

    /*begin
                                                    update ws_g_confecamaras_sjto_lte a
                                                     set cdgo_rspsta_cnfcmra  = json_value(v_rspsta,
                                                                         '$.codigoerror'),
                                                       mnsje_rspsta_cnfcmra = json_value(v_rspsta,
                                                                         '$.mensajeerror')
                                                     where a.id_cnfcmra_sjto_lte =
                                                       c_cjtos_lte.id_cnfcmra_sjto_lte;
                                                  exception
                                                    when others then
                                                    o_cdgo_rspsta  := 36;
                                                    o_mnsje_rspsta := 'Error al actualizar detallado de sujeto lote en ws_g_confecamaras_sjto_lte.' ||
                                                              sqlerrm || ' - ' || sqlcode;
                                                    continue;
                                                  end;*/

    --end if;
    /* FIN DESCOMENTAR SI HAY QUE NOTIFICAR A CAMARA DE COMERCIO CREACION DE SUJETOS*/

    end loop; -- Fin -- Loop de c_cjtos_lte

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          '$$$$$ Finaliza con v_mtrclas_actvas: :' ||
                          v_mtrclas_actvas,
                          1);

    -- Actualizar cantidad de matriculas activas y canceladas en por lote.
    begin

      update ws_g_confecamaras_lote
         set mtrclas_actvas  = v_mtrclas_actvas,
             mtrclas_cncldas = v_mtrclas_cncldas
       where id_cnfcmra_lte = P_id_cnfcmra_lte;

    exception
      when others then
        o_cdgo_rspsta  := 40;
        o_mnsje_rspsta := 'No se pudo actualizar la tabla ws_g_confecamaras_lote, id_cnfcmra_lte: ' ||
                          P_id_cnfcmra_lte || ', error: ' || sqlerrm;
        rollback;
        return;
    end;

    commit;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'Saliendo - ' || systimestamp,
                          1);

  exception
    when others then
      o_cdgo_rspsta  := 100;
      o_mnsje_rspsta := 'Exception no controlada ' || ', error: ' ||
                        sqlerrm;
      rollback;
      return;
  end prc_vl_dprar_dtos;

end pkg_ws_camara_comercio;
/

