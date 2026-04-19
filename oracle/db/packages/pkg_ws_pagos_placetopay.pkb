
  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PKG_WS_PAGOS_PLACETOPAY" as

  function fnc_co_ip_publica(p_url    in varchar2,
                             p_hndler in varchar2 default 'GET')
    return varchar2 as
    v_resp clob;
    v_ip   varchar2(100);
  begin
    /*v_resp := apex_web_service.make_rest_request(p_url         => p_url,
                                                 p_http_method => p_hndler,
                                                 p_wallet_path => l_wallet.wallet_path,
                                                 p_wallet_pwd  => l_wallet.wallet_pwd);

    v_ip := json_value(v_resp, '$.ip');

    return v_ip;*/

    return '191.95.17.147';

  end fnc_co_ip_publica;

  function fnc_ob_propiedad_provedor(p_cdgo_clnte        in number,
                                     p_id_impsto         in number,
                                     p_id_impsto_sbmpsto in number default null,
                                     p_id_prvdor         in number,
                                     /* INICIO 20/06/2024 BVM */
                                     p_cdgo_frmlrio in varchar2 default null,
                                     /* FIN 20/06/2024 BVM */
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
         and v.id_impsto = p_id_impsto
            -- and (v.id_impsto_sbmpsto = p_id_impsto_sbmpsto or p_id_impsto_sbmpsto is null);
         and (v.id_impsto_sbmpsto = p_id_impsto_sbmpsto or
             p_id_impsto_sbmpsto is null or v.id_impsto_sbmpsto is null)
         and ((p_cdgo_frmlrio is not null and v.cdgo_pse = p_cdgo_frmlrio) or
             (p_cdgo_frmlrio is null and v.cdgo_pse is null));
    exception
      when others then
        v_vlor := '#';
    end;

    return v_vlor;

  end fnc_ob_propiedad_provedor;

  procedure prc_ws_ejecutar_transaccion(p_cdgo_clnte        in number,
                                        p_id_impsto         in number,
                                        p_id_impsto_sbmpsto in number,
                                        p_id_orgen          in number,
                                        p_cdgo_orgn_tpo     in varchar2,
                                        p_id_trcro          in number,
                                        p_id_prvdor         in number,
                                        p_cdgo_api          in varchar2,
                                        p_cdgo_bnco         in varchar2 default null, --Req0026255
                                        p_tpo_prsna         in varchar2 default null, --Req0026255
                                        p_nvgdor            in varchar2 default null, --Req0026255
                                        o_respuesta         out varchar2,
                                        o_request_id        out varchar2,
                                        o_cdgo_rspsta       out number,
                                        o_mnsje_rspsta      out varchar2) as

    v_id_prvdor_api              number;
    v_valorneto                  number := 0;
    v_tlfno                      number;
    v_cllar                      number;
    v_nmro_dcmnto                number;
    v_vlor_ttal_dcmnto           number;
    v_cdgo_rspsta_http           number;
    v_email                      varchar2(1000);
    v_cdgo_idntfccion_tpo        varchar2(3);
    v_cdgo_idntfccion_tpo_hmlgdo varchar2(3);
    v_idntfccion                 varchar2(100);
    v_prmer_nmbre                varchar2(100);
    v_sgndo_nmbre                varchar2(100);
    v_prmer_aplldo               varchar2(100);
    v_sgndo_aplldo               varchar2(100);
    v_drccion_ntfccion           varchar2(100);
    v_location                   varchar2(1000);
    v_incomeLocation             varchar2(10);
    v_mnsje_rspsta_http          varchar2(300);
    v_info_pago                  varchar2(4000);
    v_ip                         varchar2(100);
    v_clob_header                clob;
    v_var                        clob;
    v_json_ip                    clob;

    v_cdgo_mnjdor ws_d_provedores_api.cdgo_mnjdor%type;
    v_url         ws_d_provedores_api.url%type;
    v_id_pgdor    re_g_pagadores.id_pgdor%type;
    v_contrato    ws_d_provedores_header.clave%type;

    v_json_body                 clob;
    v_request_id                varchar2(100);
    v_nonce                     varchar2(100) := DBMS_RANDOM.STRING('u', 10);
    v_trankey                   varchar2(1000);
    v_seed                      varchar2(100);
    v_expiration                varchar2(100);
    v_cdgo_impsto_sbmpsto       varchar2(3);
    v_cdgo_api                  ws_d_provedores_api.cdgo_api%type;
    v_id_sjto_impsto            number;
    v_idntfccion_sjto           v_si_i_sujetos_impuesto.idntfccion_sjto%type;
    v_ws_d_provedores_cnfgrcion ws_d_provedores_cnfgrcion%rowtype;
    v_incomeType                varchar2(30);
    v_nmbre_rzon_scial          si_i_personas.nmbre_rzon_scial%type;
    v_tlfno_sjto                v_si_i_sujetos_impuesto.tlfno%type;
    v_drccion_sjto              v_si_i_sujetos_impuesto.drccion%type;
    v_nmbre_pais                v_si_i_sujetos_impuesto.nmbre_pais%type;
    v_nmbre_dprtmnto            v_si_i_sujetos_impuesto.nmbre_dprtmnto%type;
    v_nmbre_mncpio              v_si_i_sujetos_impuesto.nmbre_mncpio%type;
    v_id_frmlrio                number;
    v_bidders                   clob;
    v_nl                        number;

    v_indcdor_mltrcrdto ws_d_provedores_cliente.cdgo_tpo_oprcion%type; --Req0026255
    v_json_transactions clob; --Req0026255

  begin
    if v_ip is null then
      v_ip := '191.95.17.147';
    end if;

    -- Identificar el codigo del sub_impuesto
    begin
      select cdgo_impsto_sbmpsto
        into v_cdgo_impsto_sbmpsto
        from df_i_impuestos_subimpuesto
       where id_impsto = p_id_impsto
         and id_impsto_sbmpsto = p_id_impsto_sbmpsto;
    exception
      when others then
        o_cdgo_rspsta  := 1;
        o_mnsje_rspsta := 'No se pudo identificar codigo del impuesto.';
        return;
    end;

    --Req0026255
    --Validar si el impuesto y subimpuesto son de operacion Monocredito o Multicredito
    begin
      select cdgo_tpo_oprcion
        into v_indcdor_mltrcrdto
        from ws_d_provedores_cliente a
       where a.cdgo_clnte = p_cdgo_clnte
         and a.id_impsto = p_id_impsto
         and a.id_impsto_sbmpsto = p_id_impsto_sbmpsto
         and a.id_prvdor = p_id_prvdor;
    exception
      when no_data_found then
        o_cdgo_rspsta  := 5;
        o_mnsje_rspsta := 'No. ' || o_cdgo_rspsta ||
                          ' - No se encontró datos de tipo de operación. Impuesto: ' ||
                          p_id_impsto || '- subimpuesto:' ||
                          p_id_impsto_sbmpsto;
        return;
      when others then
        o_cdgo_rspsta  := 6;
        o_mnsje_rspsta := 'No. ' || o_cdgo_rspsta ||
                          ' - No se pudo verificar el tipo de operación del impuesto.';
        return;
    end;

    v_cdgo_api := 'STRT';

    -- Si el impuesto es ICA, entonces...
    if (v_cdgo_impsto_sbmpsto = 'ICA' or v_cdgo_impsto_sbmpsto = 'RTI' or
       v_cdgo_impsto_sbmpsto = 'SBT') and p_cdgo_orgn_tpo = 'DL' then
      v_cdgo_api := 'DICA';
      --Req0026255
    elsif (v_indcdor_mltrcrdto = 'MLTCDT' and p_cdgo_orgn_tpo = 'DC') then
      v_cdgo_api := 'STRTA';
    elsif (v_cdgo_impsto_sbmpsto = 'ICA' or v_cdgo_impsto_sbmpsto = 'RTI' or
          v_cdgo_impsto_sbmpsto = 'PEV' or v_cdgo_impsto_sbmpsto = 'JAZ' or
          v_cdgo_impsto_sbmpsto = 'PUB' or v_cdgo_impsto_sbmpsto = 'DSA' or
          v_cdgo_impsto_sbmpsto = 'DSH' or v_cdgo_impsto_sbmpsto = 'SSP' or
          v_cdgo_impsto_sbmpsto = 'TDT' or v_cdgo_impsto_sbmpsto = 'DSE') and
          p_cdgo_orgn_tpo = 'DC' then
      -- Req0025813
      -- Si se va a pagar ICA con un DC, debe irse por el proveedor GOU
      v_cdgo_api := 'STRTG';
    end if;

    begin
      select a.id_prvdor_api, a.url, a.cdgo_mnjdor
        into v_id_prvdor_api, v_url, v_cdgo_mnjdor
        from ws_d_provedores_api a
       where a.id_prvdor = p_id_prvdor
         and a.cdgo_api = v_cdgo_api;
    exception
      when others then
        o_cdgo_rspsta  := 2;
        o_mnsje_rspsta := 'No se pudo obtener los datos de la peticion[PDCL]';
        return;
    end;

    insert into sg_g_log_placetopay
      (v_001, v_002, c_001)
    values
      ('prc_ws_ejecutar_transaccion', 'v_cdgo_api ', v_cdgo_api);
    insert into sg_g_log_placetopay
      (v_001, v_002, c_001)
    values
      ('prc_ws_ejecutar_transaccion', 'v_cdgo_mnjdor ', v_cdgo_mnjdor);
    COMMIT;

    /* ---------------------------------------------------------------------
                         CONSTRUCCION DEL HEADER
    ----------------------------------------------------------------------*/
    begin
      select json_arrayagg(json_object('clave' value a.nmbre_prpdad,
                                       'valor' value d.vlor))
        into v_clob_header
        from ws_d_provedor_propiedades a
        join ws_d_provedores_prpddes_api b
          on a.id_prvdor_prpdde = b.id_prvdor_prpdde
        join ws_d_provedores_api c
          on b.id_prvdor_api = c.id_prvdor_api
        join ws_d_prvdor_prpddes_impsto d
          on a.id_prvdor_prpdde = d.id_prvdor_prpdde
       where d.cdgo_clnte = p_cdgo_clnte
         and d.id_impsto = p_id_impsto
            --and d.id_impsto_sbmpsto    = p_id_impsto_sbmpsto
         and c.cdgo_api = v_cdgo_api
            -- revisar si los header llegan hasta el subimpuesto ojo
         and a.cdgo_prpdad = 'TPE';
    exception
      when others then
        o_cdgo_rspsta  := 3;
        o_mnsje_rspsta := 'No se pudieron setear los headers de la peticion.';
        return;
    end;
    insert into sg_g_log_placetopay
      (v_001, v_002, c_001)
    values
      ('prc_ws_ejecutar_transaccion', 'v_clob_header ', v_clob_header);
    COMMIT;

    /* ---------------------------------------------------------------------
                           FIN CONSTRUCCION DEL HEADER
    ----------------------------------------------------------------------*/

    --Se valida si el codigo origen tipo es de tipo documento
    if p_cdgo_orgn_tpo = 'DC' then

      -- Busqueda del numero de documento de pago.
      begin
        select a.nmro_dcmnto, a.vlor_ttal_dcmnto, a.id_sjto_impsto
          into v_nmro_dcmnto, v_vlor_ttal_dcmnto, v_id_sjto_impsto
          from re_g_documentos a
         where a.cdgo_clnte = p_cdgo_clnte
           and a.id_dcmnto = p_id_orgen;
      exception
        when others then
          o_cdgo_rspsta  := 4;
          o_mnsje_rspsta := 'No se pudo obtener los datos del documento';
          return;
      end;

      --Declaracion
    elsif p_cdgo_orgn_tpo = 'DL' then

      -- Busqueda del numero de la declaracion.
      begin

        select a.nmro_cnsctvo,
               a.vlor_pago,
               a.id_sjto_impsto,
               (select b.id_frmlrio
                  from gi_d_dclrcnes_vgncias_frmlr b
                 where b.id_dclrcion_vgncia_frmlrio =
                       a.id_dclrcion_vgncia_frmlrio)
          into v_nmro_dcmnto,
               v_vlor_ttal_dcmnto,
               v_id_sjto_impsto,
               v_id_frmlrio
          from gi_g_declaraciones a
         where a.cdgo_clnte = p_cdgo_clnte
           and a.id_dclrcion = p_id_orgen;

      exception
        when others then
          o_cdgo_rspsta  := 5;
          o_mnsje_rspsta := 'No se pudo obtener los datos de la declaracion';
          return;
      end;

    end if;

    -- Si el metodo a invocar es StartTransaction
    if v_cdgo_api in ('STRT', 'STRTG', 'STRTA') or v_cdgo_api = 'DICA' then
      --Req0026255
      --Req0025813

      -- Se obtienen datos del responsable del pago.
      begin
        select a.email,
               a.cdgo_idntfccion_tpo,
               a.idntfccion,
               a.prmer_nmbre,
               a.sgndo_nmbre,
               a.prmer_aplldo,
               a.sgndo_aplldo,
               a.tlfno,
               a.cllar,
               a.drccion_ntfccion
          into v_email,
               v_cdgo_idntfccion_tpo,
               v_idntfccion,
               v_prmer_nmbre,
               v_sgndo_nmbre,
               v_prmer_aplldo,
               v_sgndo_aplldo,
               v_tlfno,
               v_cllar,
               v_drccion_ntfccion
          from si_c_terceros a
         where id_trcro = p_id_trcro;

        --Homologacion del tipo de identificacion
        case v_cdgo_idntfccion_tpo
          when 'C' then
            v_cdgo_idntfccion_tpo_hmlgdo := 'CC';
          when 'N' then
            v_cdgo_idntfccion_tpo_hmlgdo := 'NIT';
          when 'E' then
            v_cdgo_idntfccion_tpo_hmlgdo := 'CE';
          when 'T' then
            v_cdgo_idntfccion_tpo_hmlgdo := 'TI';
          when 'P' then
            v_cdgo_idntfccion_tpo_hmlgdo := 'PPN';
          when 'M' then
            v_cdgo_idntfccion_tpo_hmlgdo := 'NIT';
          else
            v_cdgo_idntfccion_tpo_hmlgdo := 'CC';
        end case;

      exception
        when others then
          o_cdgo_rspsta  := 6;
          o_mnsje_rspsta := 'No se pudo obtener los datos del responsable. ' ||
                            sqlerrm;
          return;
      end;

      /* ---------------------------------------------------------------------
                               CONSTRUCCION DEL BODY
      ----------------------------------------------------------------------*/

      -- Si el impuesto es INDUSTRIA Y COMERCIO se arma el body de acuerdo a la
      -- Documentacion del boton AIO.
      if v_cdgo_api = 'DICA' then

        -- Buscar ID de la empresa
        begin
          select a.idntfccion_sjto,
                 b.nmbre_rzon_scial,
                 a.tlfno,
                 a.drccion,
                 a.nmbre_pais,
                 a.nmbre_dprtmnto,
                 a.nmbre_mncpio
            into v_idntfccion_sjto,
                 v_nmbre_rzon_scial,
                 v_tlfno_sjto,
                 v_drccion_sjto,
                 v_nmbre_pais,
                 v_nmbre_dprtmnto,
                 v_nmbre_mncpio
            from v_si_i_sujetos_impuesto a
            join si_i_personas b
              on a.id_sjto_impsto = b.id_sjto_impsto
           where a.id_sjto_impsto = v_id_sjto_impsto;
        exception
          when others then
            o_cdgo_rspsta  := 7;
            o_mnsje_rspsta := 'No se puede identifcar el Numero de identificacion del establecimiento.';
            return;
        end;

        /*se agrega el if para validar que el v_id_frmlrio no venga vacio ya que esta variable solo se llena en caso de ser una
        declaracion, se desplaza este bloque de codigo de la linea 420 a la 436, para enviar la variable v_incometype (Jean Adies) */
        if (v_id_frmlrio is not null) then

          --incometype
          begin
            select t.cdgo_pse
              into v_incomeType
              from ws_d_provedores_declrcn t
             where t.id_prvdor = p_id_prvdor
               and t.id_frmlrio = v_id_frmlrio;
          exception
            when others then
              o_cdgo_rspsta  := 10;
              o_mnsje_rspsta := 'No se indentifico el incomeType';
              return;
          end;

        end if;

        -- Buscar las propiedades que se necesitan
        v_login := fnc_ob_propiedad_provedor(p_cdgo_clnte        => p_cdgo_clnte,
                                             p_id_impsto         => p_id_impsto,
                                             p_id_impsto_sbmpsto => p_id_impsto_sbmpsto,
                                             p_id_prvdor         => p_id_prvdor,
                                             /* INICIO 30/08/2024 JCAV */
                                             p_cdgo_frmlrio => v_incomeType, --se agrega esta parametro de consulta para identificar los registro cdgo api DICA
                                             /* FIN 30/08/2024 JCAV */
                                             p_cdgo_prpdad => 'USR');

        v_secretkey := fnc_ob_propiedad_provedor(p_cdgo_clnte        => p_cdgo_clnte,
                                                 p_id_impsto         => p_id_impsto,
                                                 p_id_impsto_sbmpsto => p_id_impsto_sbmpsto,
                                                 p_id_prvdor         => p_id_prvdor,
                                                 /* INICIO 30/08/2024 JCAV */
                                                 p_cdgo_frmlrio => v_incomeType, --se agrega esta parametro de consulta para identificar los registro cdgo api DICA
                                                 /* FIN 30/08/2024 JCAV */
                                                 p_cdgo_prpdad => 'SKY');

        /*
          v_incomeType := fnc_ob_propiedad_provedor(p_cdgo_clnte        => p_cdgo_clnte,
                                                    p_id_impsto         => p_id_impsto,
                                                    p_id_impsto_sbmpsto => p_id_impsto_sbmpsto,
                                                    p_id_prvdor         => p_id_prvdor,
                                                    p_cdgo_prpdad       => 'ITY');
        */
        v_locale := fnc_ob_propiedad_provedor(p_cdgo_clnte        => p_cdgo_clnte,
                                              p_id_impsto         => p_id_impsto,
                                              p_id_impsto_sbmpsto => p_id_impsto_sbmpsto,
                                              p_id_prvdor         => p_id_prvdor,
                                              /* INICIO 30/08/2024 JCAV */
                                              p_cdgo_frmlrio => v_incomeType, --se agrega esta parametro de consulta para identificar los registro cdgo api DICA
                                              /* FIN 30/08/2024 JCAV */
                                              p_cdgo_prpdad => 'LCL');

        v_incomeLocation := fnc_ob_propiedad_provedor(p_cdgo_clnte        => p_cdgo_clnte,
                                                      p_id_impsto         => p_id_impsto,
                                                      p_id_impsto_sbmpsto => p_id_impsto_sbmpsto,
                                                      p_id_prvdor         => p_id_prvdor,
                                                      p_cdgo_frmlrio      => v_incomeType,
                                                      p_cdgo_prpdad       => 'ILO');

        v_url_rtrno := fnc_ob_propiedad_provedor(p_cdgo_clnte        => p_cdgo_clnte,
                                                 p_id_impsto         => p_id_impsto,
                                                 p_id_impsto_sbmpsto => p_id_impsto_sbmpsto,
                                                 p_id_prvdor         => p_id_prvdor,
                                                 /* INICIO 20/06/2024 BVM */
                                                 p_cdgo_frmlrio => v_incomeType, --se agrega esta parametro de consulta para identificar los registro cdgo api DICA
                                                 /* FIN 20/06/2024 BVM */
                                                 p_cdgo_prpdad => 'URT');

        v_url_rtrno := replace(v_url_rtrno, '[SESSION]', v('APP_SESSION'));
        v_url_rtrno := replace(v_url_rtrno, '[ID_IMPSTO]', p_id_impsto);
        v_url_rtrno := replace(v_url_rtrno,
                               '[ID_IMPSTO_SBMPSTO]',
                               p_id_impsto_sbmpsto);
        v_url_rtrno := replace(v_url_rtrno, '[ID_ORGEN]', p_id_orgen);
        v_url_rtrno := replace(v_url_rtrno, '[ID_PGDOR]', p_id_trcro);
        v_url_rtrno := replace(v_url_rtrno, '[INCOME_TYPE]', v_incomeType);
        v_url_rtrno := replace(v_url_rtrno, '_', '-');
        v_url_rtrno := lower(v_url_rtrno);

        if v_cdgo_impsto_sbmpsto = 'ICA' then

          select json_object('authorization' value
                             json_object('username' value v_login,
                                         'secret' value v_secretkey),
                             'locale' value v_locale,
                             'incomeType' value v_incomeType,
                             'company' value
                             fnc_ob_items_declaracion(p_id_prvdor   => p_id_prvdor,
                                                      p_id_frmlrio  => v_id_frmlrio,
                                                      p_seccion     => 'DP',
                                                      p_id_dclrcion => p_id_orgen)
                             format json,
                             'bidders' value
                             fnc_ob_items_declaracion(p_id_prvdor   => p_id_prvdor,
                                                      p_id_frmlrio  => v_id_frmlrio,
                                                      p_seccion     => 'FS',
                                                      p_id_dclrcion => p_id_orgen)
                             format json,
                             'additionalData' value
                             json_object('valueStrings' value
                                         fnc_ob_items_declaracion(p_id_prvdor   => p_id_prvdor,
                                                                  p_id_frmlrio  => v_id_frmlrio,
                                                                  p_seccion     => 'IT',
                                                                  p_id_dclrcion => p_id_orgen)
                                         format json,
                                         'valueArrays' value
                                         fnc_ob_items_declaracion(p_id_prvdor   => p_id_prvdor,
                                                                  p_id_frmlrio  => v_id_frmlrio,
                                                                  p_seccion     => 'AC',
                                                                  p_id_dclrcion => p_id_orgen)
                                         format json),
                             'payment' value
                             json_object('amount' value v_vlor_ttal_dcmnto),
                             'returnUrl' value v_url_rtrno)
            into v_json_body
            from dual;

        elsif v_cdgo_impsto_sbmpsto = 'SBT' then

          select json_object('authorization' value
                             json_object('username' value v_login,
                                         'secret' value v_secretkey),
                             'locale' value v_locale,
                             'incomeType' value v_incomeType,
                             'incomeLocation' value v_incomeLocation,
                             'company' value
                             fnc_ob_items_declaracion(p_id_prvdor   => p_id_prvdor,
                                                      p_id_frmlrio  => v_id_frmlrio,
                                                      p_seccion     => 'DP',
                                                      p_id_dclrcion => p_id_orgen)
                             format json,
                             'bidders' value
                             fnc_ob_items_declaracion(p_id_prvdor   => p_id_prvdor,
                                                      p_id_frmlrio  => v_id_frmlrio,
                                                      p_seccion     => 'FS',
                                                      p_id_dclrcion => p_id_orgen)
                             format json,
                             'additionalData' value
                             json_object('valueStrings' value
                                         fnc_ob_items_declaracion(p_id_prvdor   => p_id_prvdor,
                                                                  p_id_frmlrio  => v_id_frmlrio,
                                                                  p_seccion     => 'IT',
                                                                  p_id_dclrcion => p_id_orgen)
                                         format json,
                                         'valueArrays' value
                                         fnc_ob_items_declaracion(p_id_prvdor   => p_id_prvdor,
                                                                  p_id_frmlrio  => v_id_frmlrio,
                                                                  p_seccion     => 'AC',
                                                                  p_id_dclrcion => p_id_orgen)
                                         format json),
                             'payment' value
                             json_object('amount' value v_vlor_ttal_dcmnto),
                             'returnUrl' value v_url_rtrno)
            into v_json_body
            from dual;

        elsif v_cdgo_impsto_sbmpsto = 'RTI' then
          -- Si es Autorretencion
          if v_incomeType = 'SELF_RETENTIONS' THEN
            select json_object('authorization' value
                               json_object('username' value v_login,
                                           'secret' value v_secretkey),
                               'locale' value v_locale,
                               'incomeType' value v_incomeType,
                               'company' value
                               fnc_ob_items_declaracion(p_id_prvdor   => p_id_prvdor,
                                                        p_id_frmlrio  => v_id_frmlrio,
                                                        p_seccion     => 'DP',
                                                        p_id_dclrcion => p_id_orgen)
                               format json,
                               'bidders' value
                               fnc_ob_items_declaracion(p_id_prvdor   => p_id_prvdor,
                                                        p_id_frmlrio  => v_id_frmlrio,
                                                        p_seccion     => 'FS',
                                                        p_id_dclrcion => p_id_orgen)
                               format json,
                               'additionalData' value
                               json_object('valueStrings' value
                                           fnc_ob_items_declaracion(p_id_prvdor   => p_id_prvdor,
                                                                    p_id_frmlrio  => v_id_frmlrio,
                                                                    p_seccion     => 'IT',
                                                                    p_id_dclrcion => p_id_orgen)
                                           format json,
                                           'valueArrays' value
                                           fnc_ob_items_declaracion(p_id_prvdor   => p_id_prvdor,
                                                                    p_id_frmlrio  => v_id_frmlrio,
                                                                    p_seccion     => 'AC',
                                                                    p_id_dclrcion => p_id_orgen)
                                           format json),
                               'payment' value
                               json_object('amount' value v_vlor_ttal_dcmnto),
                               'returnUrl' value v_url_rtrno)
              into v_json_body
              from dual;
          END IF;
          IF v_incomeType = 'RETEICA' THEN
            select json_object('authorization' value
                               json_object('username' value v_login,
                                           'secret' value v_secretkey),
                               'locale' value v_locale,
                               'incomeType' value v_incomeType,
                               'company' value
                               fnc_ob_items_declaracion(p_id_prvdor   => p_id_prvdor,
                                                        p_id_frmlrio  => v_id_frmlrio,
                                                        p_seccion     => 'DP',
                                                        p_id_dclrcion => p_id_orgen)
                               format json,
                               'bidders' value
                               fnc_ob_items_declaracion(p_id_prvdor   => p_id_prvdor,
                                                        p_id_frmlrio  => v_id_frmlrio,
                                                        p_seccion     => 'FS',
                                                        p_id_dclrcion => p_id_orgen)
                               format json,
                               'additionalData' value
                               json_object('valueStrings' value
                                           fnc_ob_items_declaracion(p_id_prvdor   => p_id_prvdor,
                                                                    p_id_frmlrio  => v_id_frmlrio,
                                                                    p_seccion     => 'IT',
                                                                    p_id_dclrcion => p_id_orgen)
                                           format json),
                               'payment' value
                               json_object('amount' value v_vlor_ttal_dcmnto),
                               'returnUrl' value v_url_rtrno)
              into v_json_body
              from dual;
          END IF;
        end if; --v_cdgo_impsto_sbmpsto = 'ICA'

      elsif v_cdgo_api in ('STRT', 'STRTG', 'STRTA') then
        --Req0026255
        --Req0025813

        -- Propiedades necesarias para armar la trama de envio
        v_login := fnc_ob_propiedad_provedor(p_cdgo_clnte        => p_cdgo_clnte,
                                             p_id_impsto         => p_id_impsto,
                                             p_id_impsto_sbmpsto => p_id_impsto_sbmpsto,
                                             p_id_prvdor         => p_id_prvdor,
                                             p_cdgo_prpdad       => case
                                                                      when v_cdgo_api = 'STRT' then
                                                                       'USR'
                                                                      when v_cdgo_api = 'STRTA' then --Req0026255
                                                                       'USRA'
                                                                      else
                                                                       'USRG'
                                                                    end);

        v_secretkey := fnc_ob_propiedad_provedor(p_cdgo_clnte        => p_cdgo_clnte,
                                                 p_id_impsto         => p_id_impsto,
                                                 p_id_impsto_sbmpsto => p_id_impsto_sbmpsto,
                                                 p_id_prvdor         => p_id_prvdor,
                                                 p_cdgo_prpdad       => case
                                                                          when v_cdgo_api = 'STRT' then
                                                                           'SKY'
                                                                          when v_cdgo_api = 'STRTA' then --Req0026255
                                                                           'SKYA'
                                                                          else
                                                                           'SKYG'
                                                                        end);

        v_url_rtrno := fnc_ob_propiedad_provedor(p_cdgo_clnte        => p_cdgo_clnte,
                                                 p_id_impsto         => p_id_impsto,
                                                 p_id_impsto_sbmpsto => p_id_impsto_sbmpsto,
                                                 p_id_prvdor         => p_id_prvdor,
                                                 p_cdgo_prpdad       => case
                                                                          when v_cdgo_api in ('STRT', 'STRTA') then --Req0026255
                                                                           'URT'
                                                                          else
                                                                           'URTG'
                                                                        end);

        insert into sg_g_log_placetopay
          (v_001, v_002, c_001)
        values
          ('prc_ws_ejecutar_transaccion',
           'v_login ',
           v_cdgo_api || ' ' || v_login);
        insert into sg_g_log_placetopay
          (v_001, v_002, c_001)
        values
          ('prc_ws_ejecutar_transaccion',
           'v_secretkey ',
           v_cdgo_api || ' ' || v_secretkey);
        insert into sg_g_log_placetopay
          (v_001, v_002, c_001)
        values
          ('prc_ws_ejecutar_transaccion',
           'v_url_rtrno ',
           v_cdgo_api || ' ' || v_url_rtrno);
        COMMIT;

        v_url_rtrno := replace(v_url_rtrno, '[SESSION]', v('APP_SESSION'));
        v_url_rtrno := replace(v_url_rtrno, '[ID_IMPSTO]', p_id_impsto);
        v_url_rtrno := replace(v_url_rtrno,
                               '[ID_IMPSTO_SBMPSTO]',
                               p_id_impsto_sbmpsto);
        v_url_rtrno := replace(v_url_rtrno, '[ID_ORGEN]', p_id_orgen);
        v_url_rtrno := replace(v_url_rtrno, '[ID_PGDOR]', p_id_trcro);

        v_seed := to_char(systimestamp, 'YYYY-MM-DD') || 'T' ||
                  to_char(systimestamp, 'HH24:MI:SSTZH:TZM');

        v_trankey := pkg_gn_generalidades.fnc_ge_to_base64(UTL_RAW.CAST_TO_VARCHAR2(STANDARD_HASH_OUTPUT(str => v_nonce ||
                                                                                                                v_seed ||
                                                                                                                v_secretkey)));

        v_expiration := to_char(sysdate + INTERVAL '15' MINUTE,
                                'YYYY-MM-DD') || 'T' ||
                        to_char(sysdate + INTERVAL '15' MINUTE,
                                'HH24:MI:SS') || '-05:00';

        --Req0026255
        if v_indcdor_mltrcrdto = 'MLTCDT' and p_cdgo_orgn_tpo = 'DC' then

          v_entityCode := fnc_ob_propiedad_provedor(p_cdgo_clnte        => p_cdgo_clnte,
                                                    p_id_impsto         => p_id_impsto,
                                                    p_id_impsto_sbmpsto => p_id_impsto_sbmpsto,
                                                    p_id_prvdor         => p_id_prvdor,
                                                    p_cdgo_prpdad       => 'ECD');

          v_notificationURL := fnc_ob_propiedad_provedor(p_cdgo_clnte        => p_cdgo_clnte,
                                                         p_id_impsto         => p_id_impsto,
                                                         p_id_impsto_sbmpsto => p_id_impsto_sbmpsto,
                                                         p_id_prvdor         => p_id_prvdor,
                                                         p_cdgo_prpdad       => 'WBH');

          select json_arrayagg(json_object('serviceCode' value
                                           y.cdgo_srvcio, --???
                                           'entityCode' value v_entityCode,
                                           'amountValue' value vlor,
                                           'taxValue' value 0,
                                           'description' value dscrpcion))
            into v_json_transactions
            from (select a.cdgo_srvcio cdgo_srvcio,
                         a.idntfccion_ascda,
                         sum(nvl(x.total, 0)) vlor,
                         d.dscrpcion
                    from ws_d_codigos_servicio a
                    left join (select id_cncpto, -- se aciciona left join para que traiga todos codigos de servicio incluso si no están en el recibo
                                     ((sum(nvl(vlor_cptal, 0)) +
                                     sum(nvl(vlor_intres, 0))) -
                                     sum(nvl(vlor_dscnto, 0))) total
                                from (select a.id_dcmnto,
                                             a.id_mvmnto_dtlle,
                                             case cdgo_cncpto_tpo
                                               when 'C' then
                                                a.id_cncpto
                                               else
                                                (select id_cncpto
                                                   from re_g_documentos_detalle m
                                                  where m.id_dcmnto =
                                                        a.id_dcmnto
                                                    and m.id_mvmnto_dtlle =
                                                        a.id_mvmnto_dtlle
                                                    and m.cdgo_cncpto_tpo = 'C')
                                             end as id_cncpto,
                                             case
                                               when a.cdgo_cncpto_tpo = 'D' then
                                                sum(a.vlor_hber)
                                               else
                                                sum(a.vlor_dbe - a.vlor_hber)
                                             end as vlor,
                                             a.cdgo_cncpto_tpo
                                        from re_g_documentos_detalle a
                                       where a.id_dcmnto = p_id_orgen
                                       group by a.id_dcmnto,
                                                a.id_mvmnto_dtlle,
                                                a.id_cncpto,
                                                a.cdgo_cncpto_tpo) a
                              pivot(sum(vlor)
                                 for cdgo_cncpto_tpo in('C' vlor_cptal,
                                                       'I' vlor_intres,
                                                       'D' vlor_dscnto))
                               group by id_cncpto) x
                      on x.id_cncpto = a.id_cncpto
                    join df_i_conceptos d
                      on d.id_cncpto = a.id_cncpto
                   where a.id_impsto = p_id_impsto
                     and a.id_impsto_sbmpsto = p_id_impsto_sbmpsto
                     and a.id_prvdor = p_id_prvdor
                  --and a.indcdor_cdgo_prncpal  = 'N'  --ojoo
                   group by a.cdgo_srvcio, a.idntfccion_ascda, d.dscrpcion) y;

          if v_json_transactions is json then

            v_trankey := pkg_gn_generalidades.fnc_ge_to_base64(UTL_RAW.CAST_TO_VARCHAR2(STANDARD_HASH_OUTPUT(str    => v_nonce ||
                                                                                                                       v_seed ||
                                                                                                                       v_secretkey,
                                                                                                             method => 'SHA256')));

            /*select utl_raw.cast_to_varchar2(
               utl_encode.base64_encode(
                   dbms_crypto.hash(
                       utl_raw.cast_to_raw(v_nonce || v_seed || v_secretkey),
                       dbms_crypto.hash_sh256
                   )
               )
                   )
            into  v_trankey
            from dual; */

            select json_object('auth' value
                               json_object('login' value v_login,
                                           'tranKey' value v_trankey,
                                           'nonce' value
                                           pkg_gn_generalidades.fnc_ge_to_base64(v_nonce),
                                           'seed' value v_seed),
                               'buyer' value
                               json_object('name' value rtrim(v_prmer_nmbre || ' ' ||
                                                 v_sgndo_nmbre),
                                           'surname' value
                                           rtrim(v_prmer_aplldo || ' ' ||
                                                 v_sgndo_aplldo),
                                           'email' value lower(v_email),
                                           'document' value v_idntfccion,
                                           'documentType' value
                                           v_cdgo_idntfccion_tpo_hmlgdo,
                                           'mobile' value v_tlfno --v_cllar
                                           ),
                               'payer' value
                               json_object('name' value rtrim(v_prmer_nmbre || ' ' ||
                                                 v_sgndo_nmbre),
                                           'surname' value
                                           rtrim(v_prmer_aplldo || ' ' ||
                                                 v_sgndo_aplldo),
                                           'email' value lower(v_email),
                                           'document' value v_idntfccion,
                                           'documentType' value
                                           v_cdgo_idntfccion_tpo_hmlgdo,
                                           'mobile' value v_tlfno --v_cllar
                                           ),
                               'payment' value
                               json_object('reference' value
                                           to_char(v_nmro_dcmnto),
                                           'description' value 'Pago por PSE documento No. ' ||
                                           v_nmro_dcmnto,
                                           'amount' value
                                           json_object('currency' value 'COP',
                                                       'total' value
                                                       v_vlor_ttal_dcmnto,
                                                       'taxValue' value 0)),
                               'notificationURL' value v_notificationURL,
                               'instrument' value
                               json_object('redirection' value
                                           json_object('paymentMethod' value
                                                       '_PSE_',
                                                       'returnURL' value
                                                       v_url_rtrno,
                                                       'additional' value
                                                       json_object('userType'
                                                                   value case
                                                                     when p_tpo_prsna = 'P' then
                                                                      'person'
                                                                     when p_tpo_prsna = 'E' then
                                                                      'company'
                                                                   end,
                                                                   'bankCode'
                                                                   value
                                                                   p_cdgo_bnco,
                                                                   'dispersion'
                                                                   value
                                                                   v_json_transactions
                                                                   format json))), --Req0026255

                               'locale' value 'es_CO',
                               'ipAddress' value v_ip,
                               'userAgent' value
                               nvl(p_nvgdor, 'Google Chrome'))
              into v_json_body
              from dual;

          else
            o_cdgo_rspsta  := 7;
            o_mnsje_rspsta := 'Error al generar el json de los codigos de servicios.';
            return;
          end if;
        else
          select json_object('auth' value
                             json_object('login' value v_login,
                                         'tranKey' value v_trankey,
                                         'nonce' value
                                         pkg_gn_generalidades.fnc_ge_to_base64(v_nonce),
                                         'seed' value v_seed),
                             'loale' value 'en_CO',
                             'buyer' value
                             json_object('name' value rtrim(v_prmer_nmbre || ' ' ||
                                               v_sgndo_nmbre),
                                         'surname' value
                                         rtrim(v_prmer_aplldo || ' ' ||
                                               v_sgndo_aplldo),
                                         'email' value lower(v_email),
                                         'document' value v_idntfccion,
                                         'documentType' value
                                         v_cdgo_idntfccion_tpo_hmlgdo,
                                         'mobile' value v_tlfno --v_cllar
                                         ),
                             'payment' value
                             json_object('reference' value
                                         to_char(v_nmro_dcmnto),
                                         'description' value 'Pago por PSE documento No. ' ||
                                         v_nmro_dcmnto,
                                         'amount' value
                                         json_object('currency' value 'COP',
                                                     'total' value
                                                     v_vlor_ttal_dcmnto),
                                         'allowPartial' value 'false' FORMAT JSON),
                             'expiration' value v_expiration,
                             'returnUrl' value v_url_rtrno, --v_url_rtrno||v_nmro_dcmnto,
                             'ipAddress' value v_ip,
                             'userAgent' value
                             rtrim(v_prmer_nmbre || ' ' || v_sgndo_nmbre || ' ' ||
                                   v_prmer_aplldo || ' ' || v_sgndo_aplldo))
            into v_json_body
            from dual;
        end if;
      else
        o_cdgo_rspsta  := 7;
        o_mnsje_rspsta := 'El codigo del API no esta parametrizado.';
        return;
      end if;
      /* ---------------------------------------------------------------------
                           FIN CONSTRUCCION DEL BODY
      --------------------------------------------------------------------- */

      insert into sg_g_log_placetopay
        (v_001, v_002, c_001)
      values
        ('prc_ws_ejecutar_transaccion', 'v_json_body  ', v_json_body);
      COMMIT;
      --Se consulta si el tercero se encuentra registrado en la tabla de pagadores
      begin
        select id_pgdor
          into v_id_pgdor
          from re_g_pagadores
         where cdgo_clnte = p_cdgo_clnte
           and idntfccion = v_idntfccion;
      exception
        when no_data_found then

          --Se registra el tercero en la tabla de pagadores
          begin
            prc_rg_pagador(p_cdgo_clnte          => p_cdgo_clnte,
                           p_id_trcro            => p_id_trcro,
                           p_cdgo_idntfccion_tpo => v_cdgo_idntfccion_tpo,
                           p_idntfccion          => v_idntfccion,
                           p_prmer_nmbre         => v_prmer_nmbre,
                           p_sgndo_nmbre         => v_sgndo_nmbre,
                           p_prmer_aplldo        => v_prmer_aplldo,
                           p_sgndo_aplldo        => v_sgndo_aplldo,
                           p_tlfno_1             => v_tlfno,
                           p_drccion_1           => v_drccion_ntfccion,
                           p_email               => v_email,
                           o_id_pgdor            => v_id_pgdor,
                           o_cdgo_rspsta         => o_cdgo_rspsta,
                           o_mnsje_rspsta        => o_mnsje_rspsta);

            if o_cdgo_rspsta > 0 then
              return;
            end if;

          exception
            when others then
              o_cdgo_rspsta  := 8;
              o_mnsje_rspsta := 'Problema al llamar la up que registra el pagador';
              return;
          end;
      end;

      -- Consumir API de PlaceToPay
      prc_ws_iniciar_transaccion(p_url          => v_url,
                                 p_cdgo_mnjdor  => v_cdgo_mnjdor,
                                 p_header       => v_clob_header,
                                 p_body         => v_json_body,
                                 p_cdgo_api     => v_cdgo_api,
                                 o_location     => v_location,
                                 o_request_id   => v_request_id,
                                 o_cdgo_rspsta  => v_cdgo_rspsta_http,
                                 o_mnsje_rspsta => v_mnsje_rspsta_http);

      if v_cdgo_rspsta_http = 0 then
        o_respuesta    := v_location;
        o_request_id   := v_request_id;
        o_cdgo_rspsta  := v_cdgo_rspsta_http;
        o_mnsje_rspsta := v_mnsje_rspsta_http;
        --return;
      else
        o_cdgo_rspsta  := v_cdgo_rspsta_http;
        o_mnsje_rspsta := v_mnsje_rspsta_http;
        return;
      end if;

      prc_rg_documento_pagador(p_cdgo_clnte        => p_cdgo_clnte,
                               p_id_impsto         => p_id_impsto,
                               p_id_impsto_sbmpsto => p_id_impsto_sbmpsto,
                               p_id_orgen          => p_id_orgen,
                               p_cdgo_orgn_tpo     => p_cdgo_orgn_tpo,
                               p_id_pgdor          => v_id_pgdor,
                               p_id_prvdor         => p_id_prvdor,
                               p_request_id        => v_request_id,
                               p_cdgo_frmlrio      => v_incomeType,
                               p_cdgo_bnco         => p_cdgo_bnco, --Req0026255
                               o_cdgo_rspsta       => o_cdgo_rspsta,
                               o_mnsje_rspsta      => o_mnsje_rspsta);
      if o_cdgo_rspsta = 0 then
        commit;
      end if;
      o_respuesta := v_location;

    end if; -- v_cdgo_api = 'STRT' or v_cdgo_api = 'DICA' or v_cdgo_api = 'STRTG'

  exception
    when others then
      o_cdgo_rspsta  := 99;
      o_mnsje_rspsta := 'Error al intentar iniciar la transaccion. ' ||
                        sqlerrm;
  end prc_ws_ejecutar_transaccion;

  /*
      Autor: JAGUAS
      Fecha de modificacion: 04/09/2020
      Descripcion: Procedimiento que inicia una transaccion de pago en linea mediante
                   comunicacion  con  la  pasarela  de  pagos  de  PlaceToPay  (Metodo
                   START_TRANSACTION).
  */
  procedure prc_ws_iniciar_transaccion(p_url          in varchar2,
                                       p_cdgo_mnjdor  in varchar2,
                                       p_header       in clob,
                                       p_body         in clob,
                                       p_cdgo_api     in varchar2,
                                       o_location     out varchar2,
                                       o_request_id   out varchar2,
                                       o_cdgo_rspsta  out number,
                                       o_mnsje_rspsta out varchar2) is
    v_resp            clob;
    excpcion_prsnlzda exception;
    v_count           number := 0;

  begin

    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'OK';

    -- Limpiar cabeceras
    APEX_WEB_SERVICE.g_request_headers.delete();

    -- Setear las cabeceras que se envian a PlaceToPay
    for h in (select clave, valor
                from json_table(p_header,
                                '$[*]' columns(clave varchar2 path '$.clave',
                                        valor varchar2 path '$.valor'))) loop

      v_count := v_count + 1;

      APEX_WEB_SERVICE.g_request_headers(v_count).name := h.clave;
      APEX_WEB_SERVICE.g_request_headers(v_count).value := h.valor;

    end loop;

    insert into sg_g_log_placetopay
      (v_001, v_002, c_001)
    values
      ('prc_ws_iniciar_transaccion', 'p_url  ', p_url || ' ' || v_resp);
    insert into sg_g_log_placetopay
      (v_001, v_002, c_001)
    values
      ('prc_ws_iniciar_transaccion', 'p_body ', p_body || ' ' || v_resp);
    COMMIT;

    -- Llamado al webservice de PlaceToPay
    v_resp := APEX_WEB_SERVICE.make_rest_request(p_url         => p_url,
                                                 p_http_method => p_cdgo_mnjdor,
                                                 p_body        => p_body,
                                                 p_wallet_path => l_wallet.wallet_path,
                                                 p_wallet_pwd  => l_wallet.wallet_pwd);

    insert into sg_g_log_placetopay
      (v_001, v_002, c_001)
    values
      ('prc_ws_iniciar_transaccion',
       'p_cdgo_api v_resp ',
       p_cdgo_api || ' ' || v_resp);
    COMMIT;

    -- Datos de respuesta
    -- Si el tipo de peticion es para iniciar una transaccion PSE
    if p_cdgo_api in ('STRT', 'STRTG', 'STRTA') then
      --Req0026255
      --Req0025813
      if json_value(v_resp, '$.status.status') in ('FAILED', 'REJECTED') then
        o_cdgo_rspsta  := 5;
        o_mnsje_rspsta := json_value(v_resp, '$.status.message');
        return;
      else
        if p_cdgo_api = 'STRTA' then
          --Req0026255
          o_location := json_value(v_resp, '$.processorFields.paymentURL');
        else
          o_location := json_value(v_resp, '$.processUrl');
        end if;
      end if;
    elsif p_cdgo_api = 'DICA' then
      if json_value(v_resp, '$.status') = 'FAILED' then
        o_cdgo_rspsta  := 5;
        o_mnsje_rspsta := JSON_QUERY(v_resp, '$.message' RETURNING VARCHAR2);
        return;
      else
        o_location := json_value(v_resp, '$.redirectTo');
      end if;
    else
      o_cdgo_rspsta  := 5;
      o_mnsje_rspsta := 'No pudo obtener URL de redireccionamiento.';
      return;
    end if;

    insert into sg_g_log_placetopay
      (v_001, v_002, c_001)
    values
      ('prc_ws_iniciar_transaccion', 'o_location ', o_location);
    COMMIT;

    o_request_id := json_value(v_resp, '$.requestId');

    if p_cdgo_api = 'STRTA' then
      --Req0026255
      o_request_id := json_value(v_resp, '$.internalReference');
    end if;
    --if o_location is null then
    --    raise excpcion_prsnlzda;
    --end if;

  exception
    when excpcion_prsnlzda then
      o_cdgo_rspsta  := 80;
      o_mnsje_rspsta := 'No se pudo encontrar el atributo location en la respuesta.';
    when others then
      o_cdgo_rspsta  := 90;
      o_mnsje_rspsta := 'Error del servidor. ' || sqlerrm; --utl_http.get_detailed_sqlerrm;

  end prc_ws_iniciar_transaccion;

  /*
    Autor: JAGUAS
    Unidad de programa: "PRC_CO_ESTADO_TRANSACCION"
    Fecha de modificacion: 04/09/2020
    Descripcion: Procedimiento encargado de consumir servicio de PlaceToPay que devuelve el estado
                 de la transaccion.
  */
  procedure prc_co_estado_transaccion(p_url           in varchar2,
                                      p_cdgo_mnjdor   in varchar2,
                                      p_request_id    in varchar2,
                                      p_refrncia_pgo  in number,
                                      p_header        in clob,
                                      p_body          in clob,
                                      o_rspsta_ptcion out clob,
                                      o_cdgo_rspsta   out number,
                                      o_mnsje_rspsta  out varchar2) as
    v_resp  clob;
    v_url   varchar2(300);
    v_count number := 0;
  begin

    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'OK';

    -- Limpiar cabeceras
    APEX_WEB_SERVICE.g_request_headers.delete();

    -- Setear las cabeceras que se envian a PlaceToPay
    for h in (select clave, valor
                from json_table(p_header,
                                '$[*]' columns(clave varchar2 path '$.clave',
                                        valor varchar2 path '$.valor'))) loop

      v_count := v_count + 1;

      APEX_WEB_SERVICE.g_request_headers(v_count).name := h.clave;
      APEX_WEB_SERVICE.g_request_headers(v_count).value := h.valor;

    end loop;

    -- Construimos URL del WebService a consumir
    v_url := replace(p_url, 'REQUEST_ID', p_request_id);

    insert into sg_g_log_placetopay
      (v_001, v_002, c_001)
    values
      ('prc_co_estado_transaccion', 'v_url ', v_url);

    -- Llamado al webservice de PlaceToPay
    o_rspsta_ptcion := APEX_WEB_SERVICE.make_rest_request(p_url         => v_url,
                                                          p_http_method => p_cdgo_mnjdor,
                                                          p_body        => p_body,
                                                          p_wallet_path => l_wallet.wallet_path,
                                                          p_wallet_pwd  => l_wallet.wallet_pwd);

  exception
    when others then
      o_cdgo_rspsta  := 10;
      o_mnsje_rspsta := 'Error al intentar consumir el servicio para conocer estado de la transaccion. ' ||
                        sqlerrm;

  end prc_co_estado_transaccion;

  /*
    Autor: JAGUAS
    Unidad de programa: "PRC_RG_DOCUMENTO_PAGADOR"
    Fecha de modificacion: 05/09/2020
    Descripcion: Procedimiento encargado registrar las transacciones iniciadas con PlaceToPay
                 en la tabla re_g_pagadores_documento.
  */
  procedure prc_rg_documento_pagador(p_cdgo_clnte        in number,
                                     p_id_impsto         in number,
                                     p_id_impsto_sbmpsto in number,
                                     p_id_orgen          in number,
                                     p_cdgo_orgn_tpo     in varchar2,
                                     p_id_pgdor          in number,
                                     p_id_prvdor         in number,
                                     p_request_id        in varchar2,
                                     p_cdgo_frmlrio      in varchar2 default null,
                                     p_cdgo_bnco         in varchar2 default null, --Req0026255
                                     o_cdgo_rspsta       out number,
                                     o_mnsje_rspsta      out varchar2) is
    v_id_pgdor_dcmnto   number;
    e_excpcion_prsnlzda exception;
  begin

    o_cdgo_rspsta := 0;

    --Se registra el documento o declaracion
    begin
      insert into re_g_pagadores_documento
        (id_orgen,
         cdgo_clnte,
         id_impsto,
         id_impsto_sbmpsto,
         id_pgdor,
         indcdor_estdo_trnsccion,
         fcha_rgstro,
         cdgo_orgn_tpo,
         id_prvdor,
         request_id,
         cdgo_frmlrio,
         cdgo_bnco)
      values
        (p_id_orgen,
         p_cdgo_clnte,
         p_id_impsto,
         p_id_impsto_sbmpsto,
         p_id_pgdor,
         'IN',
         sysdate,
         p_cdgo_orgn_tpo,
         p_id_prvdor,
         p_request_id,
         p_cdgo_frmlrio,
         p_cdgo_bnco);
    exception
      when others then
        raise e_excpcion_prsnlzda;
    end;

  exception
    when e_excpcion_prsnlzda then
      o_cdgo_rspsta  := 1;
      o_mnsje_rspsta := 'Error al registrar documento pagado. ' || sqlerrm;
      return;

  end prc_rg_documento_pagador;

  /*
    Autor: JAGUAS
    Unidad de programa: "PRC_AC_ESTADO_TRANSACCION"
    fecha modificacion: 04/09/2020
    Descripcion: Procedimiento encargado de actualizar el estado de la transaccion en
                 la tabla "re_g_pagadores_documento".
  */
  procedure prc_ac_estado_transaccion(p_id_pgdor_dcmnto         in number,
                                      p_indcdor_estdo_trnsccion in varchar2,
                                      o_cdgo_rspsta             out number,
                                      o_mnsje_rspsta            out varchar2) as
  begin

    o_cdgo_rspsta := 0;

    update re_g_pagadores_documento
       set indcdor_estdo_trnsccion = p_indcdor_estdo_trnsccion,
           fcha_mdfccion           = systimestamp
     where id_pgdor_dcmnto = p_id_pgdor_dcmnto;

    commit;
  exception
    when others then
      o_cdgo_rspsta  := 10;
      o_mnsje_rspsta := 'Error al intentar actualizar el estado de la transaccion';
  end;

  /*
      Autor: JAGUAS
      Unidad de programa: "PRC_CO_TRANSACCIONES"
      Fecha modificacion: 05/09/2020
      Descripcion: Procedimiento encargado de consultar las transacciones  que son procesadas mediante
                   la  pasarela  PlaceToPay  que se encuentren en estado PENDIENTE, tambien se encarga de
                   consultar  el  estado  de  la  transanccion  y  actualizar dicho estado en la tabla
                   "re_g_pagadores_documento".  Esta  UP  es  creada  con  la finalidad de ser llamada
                   mediante un JOB.
  */
  procedure prc_co_transacciones(p_id_prvdor    in number,
                                 p_id_dcmnto    in number DEFAULT NULL,
                                 o_cdgo_rspsta  out number,
                                 o_mnsje_rspsta out varchar2) as

    v_id_prvdor_api     number;
    o_rcdo_cntrol       number;
    o_id_rcdo           number;
    v_nmro_dcmnto       number;
    v_vlor_ttal_dcmnto  number;
    v_id_sjto_impsto    number;
    v_id_bnco           number;
    v_id_bnco_cnta      number;
    v_estdo_trnsccion   varchar2(10);
    v_url               varchar2(4000);
    v_estado            varchar2(50);
    v_rspsta_trzbldad   clob;
    v_clob_header       clob;
    v_clob_body         clob;
    e_excpcion_prsnlzda exception;
    e_expcion_intrna    exception;

    v_request_id varchar2(10); --ws_d_provedores_header.valor%type;

    j                      apex_json.t_values;
    v_rspsta               clob;
    v_trankey              varchar2(100);
    v_nonce                varchar2(100) := DBMS_RANDOM.STRING('u', 10);
    v_cdgo_api             ws_d_provedores_api.cdgo_api%type;
    v_id_usrio_aplca_rcdos number;
    v_reason               varchar2(100);
    v_exste_rcdo           number;

  begin

    o_cdgo_rspsta := 0;

    insert into sg_g_log_placetopay
      (v_001, v_002)
    values
      ('prc_co_transacciones', 'Entrando ');
    COMMIT;

    --Recorrido de las transacciones en estado PENDIENTE (PE)
    for c_trnsccion in (select td.id_pgdor_dcmnto,
                               td.cdgo_clnte,
                               td.id_impsto,
                               b.cdgo_impsto,
                               td.cdgo_impsto_sbmpsto,
                               td.id_impsto_sbmpsto,
                               td.id_orgen,
                               td.cdgo_orgn_tpo,
                               td.indcdor_estdo_trnsccion,
                               td.dscrpcion_estdo_trnsccion,
                               td.id_prvdor,
                               td.request_id,
                               td.tlfno_1,
                               td.fcha_rgstro,
                               td.cdgo_frmlrio,
                               ( --Req0026255
                                select cdgo_tpo_oprcion
                                  from ws_d_provedores_cliente a
                                 where a.cdgo_clnte = td.cdgo_clnte
                                   and a.id_impsto = td.id_impsto
                                   and a.id_impsto_sbmpsto =
                                       td.id_impsto_sbmpsto
                                   and a.id_prvdor = td.id_prvdor) indcdor_mltrcrdto
                          from v_re_g_pagadores_documento td
                          join df_c_impuestos b
                            on td.id_impsto = b.id_impsto
                         where td.indcdor_estdo_trnsccion in ('IN', 'PE')
                              /*  and (trunc(td.fcha_rgstro) >= trunc(sysdate - 2) or
                              p_id_dcmnto is not null)*/
                           and td.request_id is not null
                           and td.id_prvdor = p_id_prvdor
                           and (td.id_orgen = p_id_dcmnto or
                               p_id_dcmnto is null)
                        /* and td.id_pgdor_dcmnto =
                        (select max(c.id_pgdor_dcmnto)
                           from re_g_pagadores_documento c
                          where c.id_orgen = td.id_orgen
                            and c.cdgo_orgn_tpo = td.cdgo_orgn_tpo)*/
                         order by td.id_pgdor_dcmnto) loop

      begin
        select count(1)
          into v_exste_rcdo
          from re_g_recaudos
         where id_orgen = c_trnsccion.id_orgen
           and cdgo_rcdo_orgn_tpo = c_trnsccion.cdgo_orgn_tpo;
      exception
        when no_data_found then
          v_exste_rcdo := 0;
        when others then
          v_exste_rcdo := 1;
      end;

      v_cdgo_api := 'RCT';

      if (c_trnsccion.cdgo_impsto = 'ICA' or
         c_trnsccion.cdgo_impsto = 'SBT') and
         c_trnsccion.cdgo_orgn_tpo = 'DL' then
        v_cdgo_api := 'IDL';
      elsif (c_trnsccion.cdgo_impsto = 'ICA' --and
            or c_trnsccion.cdgo_impsto_sbmpsto = 'PEV' or
            c_trnsccion.cdgo_impsto_sbmpsto = 'JAZ' or
            c_trnsccion.cdgo_impsto_sbmpsto = 'PUB' or
            c_trnsccion.cdgo_impsto_sbmpsto = 'DSA' or
            c_trnsccion.cdgo_impsto_sbmpsto = 'DSH' or
            c_trnsccion.cdgo_impsto_sbmpsto = 'SSP' or
            c_trnsccion.cdgo_impsto_sbmpsto = 'TDT' or
            c_trnsccion.cdgo_impsto_sbmpsto = 'DSE') and
            c_trnsccion.cdgo_orgn_tpo = 'DC' then
        -- Si va a pagar rentas menores por DC, debe irse por el proveedor GOU -RCTG
        --Req0025813
        -- Si se va a pagar ICA con un DC, debe irse por el proveedor GOU
        v_cdgo_api := 'RCTG';
      elsif (c_trnsccion.indcdor_mltrcrdto = 'MLTCDT' and
            c_trnsccion.cdgo_orgn_tpo = 'DC') then
        --Req0026255
        v_cdgo_api := 'RCTA';
      end if;

      --Se obtiene la peticion
      begin
        select a.id_prvdor_api, a.url
          into v_id_prvdor_api, v_url
          from ws_d_provedores_api a
         where a.id_prvdor = c_trnsccion.id_prvdor
           and a.cdgo_api = v_cdgo_api; -- RCT: Api parametrizada para la consulta de estado
      exception
        when others then
          o_cdgo_rspsta  := 2;
          o_mnsje_rspsta := 'No se pudo obtener los datos de la peticion';
          return;
      end;

      --Se construyen las cabecera para consultar el estado de la transaccion
      begin
        select json_arrayagg(json_object('clave' value a.nmbre_prpdad,
                                         'valor' value d.vlor))
          into v_clob_header
          from ws_d_provedor_propiedades a
          join ws_d_provedores_prpddes_api b
            on a.id_prvdor_prpdde = b.id_prvdor_prpdde
          join ws_d_provedores_api c
            on b.id_prvdor_api = c.id_prvdor_api
          join ws_d_prvdor_prpddes_impsto d
            on a.id_prvdor_prpdde = d.id_prvdor_prpdde
         where d.cdgo_clnte = c_trnsccion.cdgo_clnte
           and d.id_impsto = c_trnsccion.id_impsto
           and d.id_impsto_sbmpsto = c_trnsccion.id_impsto_sbmpsto
           and c.cdgo_api = v_cdgo_api
           and a.cdgo_prpdad = 'TPE';

      exception
        when others then
          o_cdgo_rspsta  := 3;
          o_mnsje_rspsta := 'No se pudo construir las cabeceras de la peticion.';
          return;
      end;

      insert into sg_g_log_placetopay
        (v_001, v_002, c_001)
      values
        ('prc_co_transacciones', 'v_cdgo_api ', v_cdgo_api);
      insert into sg_g_log_placetopay
        (v_001, v_002, c_001)
      values
        ('prc_co_transacciones', 'v_url ', v_url);
      insert into sg_g_log_placetopay
        (v_001, v_002, c_001)
      values
        ('prc_co_transacciones', 'v_clob_header ', v_clob_header);
      COMMIT;

      begin

        v_estado := c_trnsccion.indcdor_estdo_trnsccion;

        --Se valida si el codigo origen tipo es de tipo documento
        if c_trnsccion.cdgo_orgn_tpo = 'DC' then

          -- Busqueda del numero de documento de pago.
          begin
            select a.nmro_dcmnto, a.vlor_ttal_dcmnto, a.id_sjto_impsto
              into v_nmro_dcmnto, v_vlor_ttal_dcmnto, v_id_sjto_impsto
              from re_g_documentos a
             where a.cdgo_clnte = c_trnsccion.cdgo_clnte
               and a.id_dcmnto = c_trnsccion.id_orgen;
          exception
            when others then
              o_cdgo_rspsta  := 3;
              o_mnsje_rspsta := 'No se pudo obtener los datos del documento';
              return;
          end;

          --Declaracion
        elsif c_trnsccion.cdgo_orgn_tpo = 'DL' then

          -- Busqueda del numero de la declaracion.
          begin
            select a.nmro_cnsctvo, a.vlor_pago, a.id_sjto_impsto
              into v_nmro_dcmnto, v_vlor_ttal_dcmnto, v_id_sjto_impsto
              from gi_g_declaraciones a
             where a.cdgo_clnte = c_trnsccion.cdgo_clnte
               and a.id_dclrcion = c_trnsccion.id_orgen;
          exception
            when others then
              o_cdgo_rspsta  := 4;
              o_mnsje_rspsta := 'No se pudo obtener los datos de la declaracion';
              return;
          end;

        end if;

        --Req0025813
        -- Si es ICA y es un DC, debe irse por GOU
        -- Construccion del Body para consultar estado de la transaccion
        v_login := fnc_ob_propiedad_provedor(p_cdgo_clnte        => c_trnsccion.cdgo_clnte,
                                             p_id_impsto         => c_trnsccion.id_impsto,
                                             p_id_impsto_sbmpsto => c_trnsccion.id_impsto_sbmpsto,
                                             p_id_prvdor         => p_id_prvdor,
                                             p_cdgo_frmlrio      => c_trnsccion.cdgo_frmlrio,
                                             p_cdgo_prpdad       => case
                                                                      when (c_trnsccion.cdgo_impsto = 'ICA' --and
                                                                           or c_trnsccion.cdgo_impsto_sbmpsto = 'PEV' or
                                                                           c_trnsccion.cdgo_impsto_sbmpsto = 'JAZ' or
                                                                           c_trnsccion.cdgo_impsto_sbmpsto = 'PUB' or
                                                                           c_trnsccion.cdgo_impsto_sbmpsto = 'DSA' or
                                                                           c_trnsccion.cdgo_impsto_sbmpsto = 'DSH' or
                                                                           c_trnsccion.cdgo_impsto_sbmpsto = 'SSP' or
                                                                           c_trnsccion.cdgo_impsto_sbmpsto = 'TDT' or
                                                                           c_trnsccion.cdgo_impsto_sbmpsto = 'DSE') and
                                                                           c_trnsccion.cdgo_orgn_tpo = 'DC' then
                                                                       'USRG'
                                                                      when (c_trnsccion.indcdor_mltrcrdto = 'MLTCDT' and
                                                                           c_trnsccion.cdgo_orgn_tpo = 'DC') then --Req0026255
                                                                       'USRA'
                                                                      else
                                                                       'USR'
                                                                    end);

        v_secretkey := fnc_ob_propiedad_provedor(p_cdgo_clnte        => c_trnsccion.cdgo_clnte,
                                                 p_id_impsto         => c_trnsccion.id_impsto,
                                                 p_id_impsto_sbmpsto => c_trnsccion.id_impsto_sbmpsto,
                                                 p_id_prvdor         => p_id_prvdor,
                                                 p_cdgo_frmlrio      => c_trnsccion.cdgo_frmlrio,
                                                 p_cdgo_prpdad       => case
                                                                          when (c_trnsccion.cdgo_impsto = 'ICA' --and
                                                                               or c_trnsccion.cdgo_impsto_sbmpsto = 'PEV' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'JAZ' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'PUB' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'DSA' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'DSH' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'SSP' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'TDT' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'DSE') and
                                                                               c_trnsccion.cdgo_orgn_tpo = 'DC' then
                                                                           'SKYG'
                                                                          when (c_trnsccion.indcdor_mltrcrdto = 'MLTCDT' and
                                                                               c_trnsccion.cdgo_orgn_tpo = 'DC') then --Req0026255
                                                                           'SKYA'
                                                                          else
                                                                           'SKY'
                                                                        end);

        v_url_rtrno := fnc_ob_propiedad_provedor(p_cdgo_clnte        => c_trnsccion.cdgo_clnte,
                                                 p_id_impsto         => c_trnsccion.id_impsto,
                                                 p_id_impsto_sbmpsto => c_trnsccion.id_impsto_sbmpsto,
                                                 p_id_prvdor         => p_id_prvdor,
                                                 p_cdgo_frmlrio      => c_trnsccion.cdgo_frmlrio,
                                                 p_cdgo_prpdad       => case
                                                                          when (c_trnsccion.cdgo_impsto = 'ICA' --and
                                                                               or c_trnsccion.cdgo_impsto_sbmpsto = 'PEV' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'JAZ' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'PUB' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'DSA' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'DSH' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'SSP' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'TDT' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'DSE') and
                                                                               c_trnsccion.cdgo_orgn_tpo = 'DC' then
                                                                           'URTG'
                                                                          else
                                                                           'URT'
                                                                        end);

        -- Si el impuesto es ICA y el tipo de origen es Declaracion (DL)
        if (c_trnsccion.cdgo_impsto = 'ICA' or
           c_trnsccion.cdgo_impsto = 'SBT') and
           c_trnsccion.cdgo_orgn_tpo = 'DL' then

          select json_object('authorization' value
                             json_object('username' value v_login,
                                         'secret' value v_secretkey),
                             'requestId' value c_trnsccion.request_id,
                             'locale' value 'es')
            into v_clob_body
            from dual;

        else

          v_seed := to_char(systimestamp, 'YYYY-MM-DD') || 'T' ||
                    to_char(systimestamp, 'HH24:MI:SSTZH:TZM');

          v_trankey := pkg_gn_generalidades.fnc_ge_to_base64(UTL_RAW.CAST_TO_VARCHAR2(STANDARD_HASH_OUTPUT(str => v_nonce ||
                                                                                                                  v_seed ||
                                                                                                                  v_secretkey)));

          if (c_trnsccion.indcdor_mltrcrdto = 'MLTCDT' and
             c_trnsccion.cdgo_orgn_tpo = 'DC') then
            --Req0026255

            v_trankey := pkg_gn_generalidades.fnc_ge_to_base64(UTL_RAW.CAST_TO_VARCHAR2(STANDARD_HASH_OUTPUT(str    => v_nonce ||
                                                                                                                       v_seed ||
                                                                                                                       v_secretkey,
                                                                                                             method => 'SHA256')));

            /*select utl_raw.cast_to_varchar2(
                           utl_encode.base64_encode(
                               dbms_crypto.hash(
                                   utl_raw.cast_to_raw(v_nonce || v_seed || v_secretkey),
                                   dbms_crypto.hash_sh256
                               )
                           )
                               )
            into  v_trankey
            from dual;*/

            select json_object('auth' value
                               json_object('login' value v_login,
                                           'tranKey' value v_trankey,
                                           'nonce' value
                                           pkg_gn_generalidades.fnc_ge_to_base64(v_nonce),
                                           'seed' value v_seed),
                               'internalReference' value
                               c_trnsccion.request_id)
              into v_clob_body
              from dual;
          else
            select json_object('auth' value
                               json_object('login' value v_login,
                                           'tranKey' value v_trankey,
                                           'nonce' value
                                           pkg_gn_generalidades.fnc_ge_to_base64(v_nonce),
                                           'seed' value v_seed))
              into v_clob_body
              from dual;
          end if;
        end if;

        -- Si la sesion no se registro continue con las demas transacciones.
        if nvl(c_trnsccion.request_id, '0') = '0' then
          continue;
        end if;

        insert into sg_g_log_placetopay
          (v_001, c_001, d_001)
        values
          ('prc_co_transacciones REQUEST HEADER', v_clob_header, sysdate);
        insert into sg_g_log_placetopay
          (N_001, v_001, c_001, d_001)
        values
          (c_trnsccion.id_pgdor_dcmnto,
           'prc_co_transacciones REQUEST BODY',
           v_clob_body,
           sysdate);
        COMMIT;

        -- Consumir el servicio para consultar el estado actual de la transaccion
        prc_co_estado_transaccion(p_url           => v_url,
                                  p_cdgo_mnjdor   => 'POST',
                                  p_request_id    => nvl(c_trnsccion.request_id,
                                                         '0'),
                                  p_refrncia_pgo  => v_nmro_dcmnto,
                                  p_header        => v_clob_header,
                                  p_body          => v_clob_body,
                                  o_rspsta_ptcion => v_rspsta,
                                  o_cdgo_rspsta   => o_cdgo_rspsta,
                                  o_mnsje_rspsta  => o_mnsje_rspsta);

        insert into sg_g_log_placetopay
          (N_001, v_001, c_001, d_001)
        values
          (c_trnsccion.id_pgdor_dcmnto,
           'prc_co_transacciones v_rspsta',
           v_rspsta,
           sysdate);
        COMMIT;

        if o_cdgo_rspsta <> 0 then
          continue;
        end if;

        -- La variable v_rspsta_trzbldad se usa para obtener la respuesta
        -- original de PlaceToPay.
        v_rspsta_trzbldad := v_rspsta;

        -- Registrar la respuesta para la trazabilidad de la transaccion
        prc_rg_respuesta_pago(p_id_pgdor_dcmnto => c_trnsccion.id_pgdor_dcmnto,
                              p_rspsta          => v_rspsta_trzbldad,
                              o_cdgo_rspsta     => o_cdgo_rspsta,
                              o_mnsje_rspsta    => o_mnsje_rspsta);

        if o_cdgo_rspsta <> 0 then
          -- Sino se Pudo Registrar la Respuesta --> generamos Exception
          raise e_expcion_intrna;
        end if;

        if o_cdgo_rspsta = 0 then
          -- Si NO Existe error alguno --> se hace Analisis de la respuesta

          pkg_ws_pagos_placetopay.prc_ho_estado_transaccion(p_id_prvdor       => p_id_prvdor,
                                                            p_rspsta_trzbldad => v_rspsta_trzbldad,
                                                            p_cdgo_impsto     => c_trnsccion.cdgo_impsto,
                                                            p_cdgo_orgn_tpo   => c_trnsccion.cdgo_orgn_tpo,
                                                            o_estdo_trnsccion => v_estdo_trnsccion,
                                                            o_cdgo_rspsta     => o_cdgo_rspsta,
                                                            o_mnsje_rspsta    => o_mnsje_rspsta);

          -- Si cambia a alguno de los estados finales de la transaccion.
          if v_estdo_trnsccion in ('FA', 'RE', 'PE', 'RE_CU', 'RE_EX') then

            -- Actualiza el estado de la transaccion
            prc_ac_estado_transaccion(p_id_pgdor_dcmnto         => c_trnsccion.id_pgdor_dcmnto,
                                      p_indcdor_estdo_trnsccion => v_estdo_trnsccion,
                                      o_cdgo_rspsta             => o_cdgo_rspsta,
                                      o_mnsje_rspsta            => o_mnsje_rspsta);

            if o_cdgo_rspsta <> 0 then
              raise e_expcion_intrna;
            end if;

          end if;

          -- Si el estado de la transaccion es APROBADA
          if v_estdo_trnsccion = 'AP' and v_exste_rcdo = 0 then

            --Se obtiene el banco recaudador y su cuenta
            begin
              select a.id_bnco, a.id_bnco_cnta, a.id_usrio_aplca_rcdos
                into v_id_bnco, v_id_bnco_cnta, v_id_usrio_aplca_rcdos
                from ws_d_provedores_cliente a
               where cdgo_clnte = c_trnsccion.cdgo_clnte
                 and id_impsto = c_trnsccion.id_impsto
                 and id_impsto_sbmpsto = c_trnsccion.id_impsto_sbmpsto
                 and id_prvdor = c_trnsccion.id_prvdor;
            exception
              when others then
                o_cdgo_rspsta  := 5;
                o_mnsje_rspsta := 'No se pudo obtener el banco y la cuenta';
                return;
            end;

            -- Registrar el control
            pkg_re_recaudos.prc_rg_recaudo_control(p_cdgo_clnte        => c_trnsccion.cdgo_clnte,
                                                   p_id_impsto         => c_trnsccion.id_impsto,
                                                   p_id_impsto_sbmpsto => c_trnsccion.id_impsto_sbmpsto,
                                                   p_id_bnco           => v_id_bnco,
                                                   p_id_bnco_cnta      => v_id_bnco_cnta,
                                                   p_fcha_cntrol       => c_trnsccion.fcha_rgstro,
                                                   p_obsrvcion         => 'Control de pago PSE. PlaceToPay',
                                                   p_cdgo_rcdo_orgen   => 'WS',
                                                   p_id_usrio          => v_id_usrio_aplca_rcdos,
                                                   o_id_rcdo_cntrol    => o_rcdo_cntrol,
                                                   o_cdgo_rspsta       => o_cdgo_rspsta,
                                                   o_mnsje_rspsta      => o_mnsje_rspsta);

            if o_cdgo_rspsta <> 0 then
              raise e_expcion_intrna;
            end if;

            -- Registrar el recaudo
            pkg_re_recaudos.prc_rg_recaudo(p_cdgo_clnte         => c_trnsccion.cdgo_clnte,
                                           p_id_rcdo_cntrol     => o_rcdo_cntrol,
                                           p_id_sjto_impsto     => v_id_sjto_impsto,
                                           p_cdgo_rcdo_orgn_tpo => c_trnsccion.cdgo_orgn_tpo,
                                           p_id_orgen           => c_trnsccion.id_orgen,
                                           p_vlor               => v_vlor_ttal_dcmnto,
                                           p_obsrvcion          => 'Recaudo en linea PlaceToPay.',
                                           p_cdgo_frma_pgo      => 'TR', -- Transferencia
                                           p_cdgo_rcdo_estdo    => 'RG', -- Se coloca RG para que se pueda aplicar.
                                           o_id_rcdo            => o_id_rcdo,
                                           o_cdgo_rspsta        => o_cdgo_rspsta,
                                           o_mnsje_rspsta       => o_mnsje_rspsta);

            if o_cdgo_rspsta <> 0 then
              raise e_expcion_intrna;
            end if;

            if c_trnsccion.cdgo_orgn_tpo = 'DL' then

              --Up Para Actualizar el Estado de la Declaracion - Presentada
              pkg_gi_declaraciones.prc_ac_declaracion_estado(p_cdgo_clnte          => c_trnsccion.cdgo_clnte,
                                                             p_id_dclrcion         => c_trnsccion.id_orgen,
                                                             p_cdgo_dclrcion_estdo => 'PRS',
                                                             p_id_rcdo             => o_id_rcdo,
                                                             p_fcha                => systimestamp,
                                                             o_cdgo_rspsta         => o_cdgo_rspsta,
                                                             o_mnsje_rspsta        => o_mnsje_rspsta);

              if o_cdgo_rspsta <> 0 then
                raise e_expcion_intrna;
              end if;

            end if;

            -- Aplicar el pago
            pkg_re_recaudos.prc_ap_recaudo(p_id_usrio     => v_id_usrio_aplca_rcdos,
                                           p_cdgo_clnte   => c_trnsccion.cdgo_clnte,
                                           p_id_rcdo      => o_id_rcdo,
                                           o_cdgo_rspsta  => o_cdgo_rspsta,
                                           o_mnsje_rspsta => o_mnsje_rspsta);

            if o_cdgo_rspsta <> 0 then
              raise e_expcion_intrna;
            else
              if length(c_trnsccion.tlfno_1) = 10 and
                 c_trnsccion.tlfno_1 like '3%' then
                temp_enviar_sms(p_tlfno     => c_trnsccion.tlfno_1,
                                p_mnsje     => 'Sr. Contribuyente su pago por valor de ' ||
                                               ltrim(to_char(v_vlor_ttal_dcmnto,
                                                             '999,999,999')) ||
                                               ' fue recibido satisfactoriamente. Alcaldia de Monteria',
                                p_tpo_mnsje => 'PAGO PSE');
              end if;
            end if;

            -- Actualiza el estado de la transaccion
            prc_ac_estado_transaccion(p_id_pgdor_dcmnto         => c_trnsccion.id_pgdor_dcmnto,
                                      p_indcdor_estdo_trnsccion => v_estdo_trnsccion,
                                      o_cdgo_rspsta             => o_cdgo_rspsta,
                                      o_mnsje_rspsta            => o_mnsje_rspsta);

            if o_cdgo_rspsta <> 0 then
              raise e_expcion_intrna;
            end if;

          end if; --if v_estdo_trnsccion = 'AP' then

        end if;

        -- Hacemos commit por cada Iteracion:  por cada Transaccion
        commit;

      exception
        -- Excepcion interna que se produce dentro del loop
        -- De modo que no pare la ejecucion del loop y continue con las
        -- demas transacciones.
        when e_expcion_intrna then
          -- Registrar la respuesta para la trazabilidad de la transaccion
          prc_rg_respuesta_pago(p_id_pgdor_dcmnto => c_trnsccion.id_pgdor_dcmnto,
                                p_rspsta          => o_mnsje_rspsta,
                                o_cdgo_rspsta     => o_cdgo_rspsta,
                                o_mnsje_rspsta    => o_mnsje_rspsta);

          o_cdgo_rspsta  := o_cdgo_rspsta;
          o_mnsje_rspsta := o_mnsje_rspsta;

          -- Deshacemos en presencia de una Exception solo para la Iteracion actual
          rollback;
      end;

    end loop;

  exception
    when e_excpcion_prsnlzda then
      o_cdgo_rspsta  := o_cdgo_rspsta;
      o_mnsje_rspsta := o_mnsje_rspsta;
  end prc_co_transacciones;

  procedure prc_co_transaccion(p_id_prvdor    in number,
                               p_id_dcmnto    in number,
                               o_cdgo_rspsta  out number,
                               o_mnsje_rspsta out varchar2) as
    v_id_prvdor_api     number;
    o_rcdo_cntrol       number;
    o_id_rcdo           number;
    v_nmro_dcmnto       number;
    v_vlor_ttal_dcmnto  number;
    v_id_sjto_impsto    number;
    v_id_bnco           number;
    v_id_bnco_cnta      number;
    v_estdo_trnsccion   varchar2(10);
    v_url               varchar2(4000);
    v_estado            varchar2(50);
    v_rspsta_trzbldad   clob;
    v_clob_header       clob;
    v_clob_body         clob;
    e_excpcion_prsnlzda exception;
    e_expcion_intrna    exception;

    v_request_id varchar2(10); --ws_d_provedores_header.valor%type;

    j         apex_json.t_values;
    v_rspsta  clob;
    v_trankey varchar2(100);
    v_nonce   varchar2(100) := DBMS_RANDOM.STRING('u', 10);

    v_cdgo_api   ws_d_provedores_api.cdgo_api%type;
    v_reason     varchar2(100);
    v_exste_rcdo number;

  begin

    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'Proceso ok';

    --Recorrido de las transacciones en estado PENDIENTE (PE)
    for c_trnsccion in (select td.id_pgdor_dcmnto,
                               td.cdgo_clnte,
                               td.cdgo_impsto,
                               td.id_impsto,
                               td.cdgo_impsto_sbmpsto,
                               td.id_impsto_sbmpsto,
                               td.id_orgen,
                               td.cdgo_orgn_tpo,
                               td.indcdor_estdo_trnsccion,
                               td.dscrpcion_estdo_trnsccion,
                               td.id_prvdor,
                               td.request_id,
                               td.tlfno_1,
                               ( --Req0026255
                                select cdgo_tpo_oprcion
                                  from ws_d_provedores_cliente a
                                 where a.cdgo_clnte = td.cdgo_clnte
                                   and a.id_impsto = td.id_impsto
                                   and a.id_impsto_sbmpsto =
                                       td.id_impsto_sbmpsto
                                   and a.id_prvdor = td.id_prvdor) indcdor_mltrcrdto
                          from v_re_g_pagadores_documento td
                         where td.id_orgen = p_id_dcmnto
                           and td.indcdor_estdo_trnsccion in ('IN', 'PE')
                           and td.id_pgdor_dcmnto =
                               (select max(c.id_pgdor_dcmnto)
                                  from re_g_pagadores_documento c
                                 where c.id_orgen = td.id_orgen
                                   and c.cdgo_orgn_tpo = td.cdgo_orgn_tpo)
                         order by td.id_pgdor_dcmnto) loop

      begin
        select count(1)
          into v_exste_rcdo
          from re_g_recaudos
         where id_orgen = c_trnsccion.id_orgen
           and cdgo_rcdo_orgn_tpo = c_trnsccion.cdgo_orgn_tpo;
      exception
        when no_data_found then
          v_exste_rcdo := 0;
        when others then
          v_exste_rcdo := 1;
      end;

      --Se obtiene la peticion
      v_cdgo_api := 'RCT';

      --Req0025813
      if (c_trnsccion.cdgo_impsto_sbmpsto = 'ICA' or
         c_trnsccion.cdgo_impsto_sbmpsto = 'RTI' or
         c_trnsccion.cdgo_impsto_sbmpsto = 'PEV' or
         c_trnsccion.cdgo_impsto_sbmpsto = 'JAZ' or
         c_trnsccion.cdgo_impsto_sbmpsto = 'PUB' or
         c_trnsccion.cdgo_impsto_sbmpsto = 'DSA' or
         c_trnsccion.cdgo_impsto_sbmpsto = 'DSH' or
         c_trnsccion.cdgo_impsto_sbmpsto = 'SSP' or
         c_trnsccion.cdgo_impsto_sbmpsto = 'TDT' or
         c_trnsccion.cdgo_impsto_sbmpsto = 'DSE') and
         c_trnsccion.cdgo_orgn_tpo = 'DC' then
        -- Si se va a pagar ICA con un DC, debe irse por el proveedor GOU
        v_cdgo_api := 'RCTG';
      elsif (c_trnsccion.indcdor_mltrcrdto = 'MLTCDT' and
            c_trnsccion.cdgo_orgn_tpo = 'DC') then
        --Req0026255
        v_cdgo_api := 'RCTA';
      end if;

      begin
        select a.id_prvdor_api, a.url
          into v_id_prvdor_api, v_url
          from ws_d_provedores_api a
         where a.id_prvdor = c_trnsccion.id_prvdor
           and a.cdgo_api = v_cdgo_api; -- RCT: Api parametrizada para la consulta de estado
      exception
        when others then
          o_cdgo_rspsta  := 2;
          o_mnsje_rspsta := 'No se pudo obtener los datos de la peticion';
          return;
      end;

      --Se construyen las cabecera para consultar el estado de la transaccion
      begin
        select json_arrayagg(json_object('clave' value a.nmbre_prpdad,
                                         'valor' value d.vlor))
          into v_clob_header
          from ws_d_provedor_propiedades a
          join ws_d_provedores_prpddes_api b
            on a.id_prvdor_prpdde = b.id_prvdor_prpdde
          join ws_d_provedores_api c
            on b.id_prvdor_api = c.id_prvdor_api
          join ws_d_prvdor_prpddes_impsto d
            on a.id_prvdor_prpdde = d.id_prvdor_prpdde
         where d.cdgo_clnte = c_trnsccion.cdgo_clnte
           and d.id_impsto = c_trnsccion.id_impsto
           and c.cdgo_api = v_cdgo_api
           and a.cdgo_prpdad = 'TPE';
      exception
        when others then
          o_cdgo_rspsta  := 3;
          o_mnsje_rspsta := 'No se pudo construir las cabeceras de la peticion.';
          return;
      end;

      begin

        v_estado := c_trnsccion.indcdor_estdo_trnsccion;

        --Se valida si el codigo origen tipo es de tipo documento
        if c_trnsccion.cdgo_orgn_tpo = 'DC' then

          -- Busqueda del numero de documento de pago.
          begin
            select a.nmro_dcmnto, a.vlor_ttal_dcmnto, a.id_sjto_impsto
              into v_nmro_dcmnto, v_vlor_ttal_dcmnto, v_id_sjto_impsto
              from re_g_documentos a
             where a.cdgo_clnte = c_trnsccion.cdgo_clnte
               and a.id_dcmnto = c_trnsccion.id_orgen;
          exception
            when others then
              o_cdgo_rspsta  := 3;
              o_mnsje_rspsta := 'No se pudo obtener los datos del documento';
              return;
          end;

          --Declaracion
        elsif c_trnsccion.cdgo_orgn_tpo = 'DL' then

          -- Busqueda del numero de la declaracion.
          begin
            select a.nmro_cnsctvo, a.vlor_pago, a.id_sjto_impsto
              into v_nmro_dcmnto, v_vlor_ttal_dcmnto, v_id_sjto_impsto
              from gi_g_declaraciones a
             where a.cdgo_clnte = c_trnsccion.cdgo_clnte
               and a.id_dclrcion = c_trnsccion.id_orgen;
          exception
            when others then
              o_cdgo_rspsta  := 4;
              o_mnsje_rspsta := 'No se pudo obtener los datos de la declaracion';
              return;
          end;

        end if;

        --Req0025813
        -- Si es ICA y es un DC, debe irse por GOU
        -- Construccion del Body para consultar estado de la transaccion
        -- Si es multicredito y es un DC, debe irse por AvalPay --Req0026255
        v_login := fnc_ob_propiedad_provedor(p_cdgo_clnte        => c_trnsccion.cdgo_clnte,
                                             p_id_impsto         => c_trnsccion.id_impsto,
                                             p_id_impsto_sbmpsto => c_trnsccion.id_impsto_sbmpsto,
                                             p_id_prvdor         => p_id_prvdor,
                                             p_cdgo_prpdad       => case
                                                                      when (c_trnsccion.cdgo_impsto = 'ICA' --and
                                                                           or c_trnsccion.cdgo_impsto_sbmpsto = 'PEV' or
                                                                           c_trnsccion.cdgo_impsto_sbmpsto = 'JAZ' or
                                                                           c_trnsccion.cdgo_impsto_sbmpsto = 'PUB' or
                                                                           c_trnsccion.cdgo_impsto_sbmpsto = 'DSA' or
                                                                           c_trnsccion.cdgo_impsto_sbmpsto = 'DSH' or
                                                                           c_trnsccion.cdgo_impsto_sbmpsto = 'SSP' or
                                                                           c_trnsccion.cdgo_impsto_sbmpsto = 'TDT' or
                                                                           c_trnsccion.cdgo_impsto_sbmpsto = 'DSE') and
                                                                           c_trnsccion.cdgo_orgn_tpo = 'DC' then
                                                                       'USRG'
                                                                      when (c_trnsccion.indcdor_mltrcrdto = 'MLTCDT' and
                                                                           c_trnsccion.cdgo_orgn_tpo = 'DC') then --Req0026255
                                                                       'USRA'
                                                                      else
                                                                       'USR'
                                                                    end);

        v_secretkey := fnc_ob_propiedad_provedor(p_cdgo_clnte        => c_trnsccion.cdgo_clnte,
                                                 p_id_impsto         => c_trnsccion.id_impsto,
                                                 p_id_impsto_sbmpsto => c_trnsccion.id_impsto_sbmpsto,
                                                 p_id_prvdor         => p_id_prvdor,
                                                 p_cdgo_prpdad       => case
                                                                          when (c_trnsccion.cdgo_impsto = 'ICA' --and
                                                                               or c_trnsccion.cdgo_impsto_sbmpsto = 'PEV' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'JAZ' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'PUB' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'DSA' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'DSH' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'SSP' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'TDT' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'DSE') and
                                                                               c_trnsccion.cdgo_orgn_tpo = 'DC' then
                                                                           'SKYG'
                                                                          when (c_trnsccion.indcdor_mltrcrdto = 'MLTCDT' and
                                                                               c_trnsccion.cdgo_orgn_tpo = 'DC') then --Req0026255
                                                                           'SKYA'
                                                                          else
                                                                           'SKY'
                                                                        end);

        v_url_rtrno := fnc_ob_propiedad_provedor(p_cdgo_clnte        => c_trnsccion.cdgo_clnte,
                                                 p_id_impsto         => c_trnsccion.id_impsto,
                                                 p_id_impsto_sbmpsto => c_trnsccion.id_impsto_sbmpsto,
                                                 p_id_prvdor         => p_id_prvdor,
                                                 p_cdgo_prpdad       => case
                                                                          when (c_trnsccion.cdgo_impsto = 'ICA' --and
                                                                               or c_trnsccion.cdgo_impsto_sbmpsto = 'PEV' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'JAZ' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'PUB' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'DSA' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'DSH' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'SSP' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'TDT' or
                                                                               c_trnsccion.cdgo_impsto_sbmpsto = 'DSE') and
                                                                               c_trnsccion.cdgo_orgn_tpo = 'DC' then
                                                                           'URTG'
                                                                          else
                                                                           'URT'
                                                                        end);

        v_seed := to_char(systimestamp, 'YYYY-MM-DD') || 'T' ||
                  to_char(systimestamp, 'HH24:MI:SSTZH:TZM');

        v_trankey := pkg_gn_generalidades.fnc_ge_to_base64(UTL_RAW.CAST_TO_VARCHAR2(STANDARD_HASH_OUTPUT(str => v_nonce ||
                                                                                                                v_seed ||
                                                                                                                v_secretkey)));

        if (c_trnsccion.indcdor_mltrcrdto = 'MLTCDT' and
           c_trnsccion.cdgo_orgn_tpo = 'DC') then
          --Req0026255

          v_trankey := pkg_gn_generalidades.fnc_ge_to_base64(UTL_RAW.CAST_TO_VARCHAR2(STANDARD_HASH_OUTPUT(str    => v_nonce ||
                                                                                                                     v_seed ||
                                                                                                                     v_secretkey,
                                                                                                           method => 'SHA256')));

          /*select utl_raw.cast_to_varchar2(
                         utl_encode.base64_encode(
                             dbms_crypto.hash(
                                 utl_raw.cast_to_raw(v_nonce || v_seed || v_secretkey),
                                 dbms_crypto.hash_sh256
                             )
                         )
                             )
          into  v_trankey
          from dual;*/

          select json_object('auth' value
                             json_object('login' value v_login,
                                         'tranKey' value v_trankey,
                                         'nonce' value
                                         pkg_gn_generalidades.fnc_ge_to_base64(v_nonce),
                                         'seed' value v_seed),
                             'internalReference' value
                             c_trnsccion.request_id)
            into v_clob_body
            from dual;

        else
          select json_object('auth' value
                             json_object('login' value v_login,
                                         'tranKey' value v_trankey,
                                         'nonce' value
                                         pkg_gn_generalidades.fnc_ge_to_base64(v_nonce),
                                         'seed' value v_seed))
            into v_clob_body
            from dual;
        end if;

        -- Si la sesion no se registro continue con las demas transacciones.
        if c_trnsccion.request_id is null then
          continue;
        end if;

        insert into sg_g_log_placetopay
          (v_001, c_001, d_001)
        values
          ('REQUEST HEADER', v_clob_header, sysdate);
        insert into sg_g_log_placetopay
          (N_001, v_001, c_001, d_001)
        values
          (c_trnsccion.request_id, 'REQUEST BODY', v_clob_body, sysdate);
        COMMIT;

        -- Consumir el servicio para consultar el estado actual de la transaccion
        prc_co_estado_transaccion(p_url           => v_url,
                                  p_cdgo_mnjdor   => 'POST',
                                  p_request_id    => nvl(c_trnsccion.request_id,
                                                         0),
                                  p_refrncia_pgo  => v_nmro_dcmnto,
                                  p_header        => v_clob_header,
                                  p_body          => v_clob_body,
                                  o_rspsta_ptcion => v_rspsta,
                                  o_cdgo_rspsta   => o_cdgo_rspsta,
                                  o_mnsje_rspsta  => o_mnsje_rspsta);

        if o_cdgo_rspsta <> 0 then
          -- Generamos la Exception
          raise e_expcion_intrna;
        end if;

        -- La variable v_rspsta_trzbldad se usa para obtener la respuesta
        -- original de PlaceToPay.
        v_rspsta_trzbldad := v_rspsta;

        -- Registrar la respuesta para la trazabilidad de la transaccion
        prc_rg_respuesta_pago(p_id_pgdor_dcmnto => c_trnsccion.id_pgdor_dcmnto,
                              p_rspsta          => v_rspsta_trzbldad,
                              o_cdgo_rspsta     => o_cdgo_rspsta,
                              o_mnsje_rspsta    => o_mnsje_rspsta);

        if o_cdgo_rspsta <> 0 then
          -- Sino se Pudo Registrar la Respuesta --> generamos Exception
          raise e_expcion_intrna;
        end if;

        if o_cdgo_rspsta = 0 then
          -- Si NO Existe error alguno --> se hace Analisis de la respuesta
          if v_rspsta_trzbldad is not null then

            v_rspsta_trzbldad := translate(v_rspsta_trzbldad,
                                           'aeiouAEIOU',
                                           'aeiouAEIOU');

            -- Si obtenemos un JSON de respuesta
            if v_rspsta_trzbldad is json then

              -- Se parsea el JSON
              --apex_json.parse(v_rspsta_trzbldad);

              -- Se extrae el estado del pago del Json
              select upper(estado), upper(reason)
                into v_estado, v_reason
                from json_table(v_rspsta_trzbldad,
                                '$.status'
                                columns(estado varchar2(20) path '$.status',
                                        reason varchar2(20) path '$.reason'));

              insert into sg_g_log_placetopay
                (v_001, v_002, c_001, d_001)
              values
                ('prc_co_transaccion ', v_estado, v_estado, sysdate);
              insert into sg_g_log_placetopay
                (v_001, v_002, c_001, d_001)
              values
                ('prc_co_transaccion ', v_reason, v_reason, sysdate);
              COMMIT;

              --v_estado := apex_json.get_varchar2('paymentStatus');

            else
              -- Si NO obtenemos un JSON de respuesta.  El mensaje es DESCONOCIDO
              -- Seteamos estado a desconocido dado que no hace parte de la Especificacion
              v_estado := 'DESCONOCIDO';
            end if;

          end if;

          -- En caso de obtener una respuesta valida por parte de PlaceToPay
          -- =====> Se hace la homologacion para guardar el campo indcdor_estdo_trnsccion
          --        de la tabla RE_T_PAGADORES_DOCUMENTO.
          -- SINO:
          -- ======> Se mantiene la transaccion con el estado INICIADA ???...???
          if v_estado = 'APPROVED' then
            v_estdo_trnsccion := 'AP';
          elsif v_estado = 'FAILED' then
            v_estdo_trnsccion := 'FA';

          elsif v_estado = 'REJECTED' and v_reason = '?C' then
            v_estdo_trnsccion := 'RE_CU';
          elsif v_estado = 'REJECTED' and v_reason = 'EX' then
            v_estdo_trnsccion := 'RE_EX';
          elsif v_estado = 'REJECTED' then
            v_estdo_trnsccion := 'RE';

          elsif v_estado = 'PENDING' then
            v_estdo_trnsccion := 'PE';
          elsif v_estado = 'INICIADA' then
            v_estdo_trnsccion := 'IN';
          elsif v_estado = 'DESCONOCIDO' then
            -- Este estado (DESCONOCIDO) no es de la Especificacion FCATURE, este es para manejo interno
            v_estdo_trnsccion := 'FA';
          end if;

          -- Si cambia a alguno de los estados finales de la transaccion.
          if v_estdo_trnsccion in ('FA', 'RE', 'PE', 'RE_CU', 'RE_EX') then
            -- Actualiza el estado de la transaccion
            prc_ac_estado_transaccion(p_id_pgdor_dcmnto         => c_trnsccion.id_pgdor_dcmnto,
                                      p_indcdor_estdo_trnsccion => v_estdo_trnsccion,
                                      o_cdgo_rspsta             => o_cdgo_rspsta,
                                      o_mnsje_rspsta            => o_mnsje_rspsta);

            if o_cdgo_rspsta <> 0 then
              ---- OJJJOOOO
              raise e_expcion_intrna;
            end if;

          end if;

          -- Si el estado de la transaccion es APROBADA
          if v_estdo_trnsccion = 'AP' and v_exste_rcdo = 0 then

            --Se obtiene el banco recaudador y su cuenta
            begin
              select a.id_bnco, a.id_bnco_cnta
                into v_id_bnco, v_id_bnco_cnta
                from ws_d_provedores_cliente a
               where cdgo_clnte = c_trnsccion.cdgo_clnte
                 and id_impsto = c_trnsccion.id_impsto
                 and id_prvdor = c_trnsccion.id_prvdor;
            exception
              when others then
                o_cdgo_rspsta  := 4;
                o_mnsje_rspsta := 'No se pudo obtener el banco y la cuenta';
                return;
            end;

            -- Registrar el control
            pkg_re_recaudos.prc_rg_recaudo_control(p_cdgo_clnte        => c_trnsccion.cdgo_clnte,
                                                   p_id_impsto         => c_trnsccion.id_impsto,
                                                   p_id_impsto_sbmpsto => c_trnsccion.id_impsto_sbmpsto,
                                                   p_id_bnco           => v_id_bnco,
                                                   p_id_bnco_cnta      => v_id_bnco_cnta,
                                                   p_fcha_cntrol       => systimestamp,
                                                   p_obsrvcion         => 'Control de pago en linea PlaceToPay',
                                                   p_cdgo_rcdo_orgen   => 'WS',
                                                   p_id_usrio          => 1 -- ?...?
                                                  ,
                                                   o_id_rcdo_cntrol    => o_rcdo_cntrol,
                                                   o_cdgo_rspsta       => o_cdgo_rspsta,
                                                   o_mnsje_rspsta      => o_mnsje_rspsta);

            if o_cdgo_rspsta <> 0 then
              raise e_expcion_intrna;
            end if;

            -- Registrar el recaudo
            pkg_re_recaudos.prc_rg_recaudo(p_cdgo_clnte         => c_trnsccion.cdgo_clnte,
                                           p_id_rcdo_cntrol     => o_rcdo_cntrol,
                                           p_id_sjto_impsto     => v_id_sjto_impsto,
                                           p_cdgo_rcdo_orgn_tpo => c_trnsccion.cdgo_orgn_tpo,
                                           p_id_orgen           => c_trnsccion.id_orgen,
                                           p_vlor               => v_vlor_ttal_dcmnto,
                                           p_obsrvcion          => 'Recaudo en linea PlaceToPay',
                                           p_cdgo_frma_pgo      => 'TR' -- Transferencia
                                          ,
                                           p_cdgo_rcdo_estdo    => 'RG' -- Se coloca RG para que se pueda aplicar.
                                          ,
                                           o_id_rcdo            => o_id_rcdo,
                                           o_cdgo_rspsta        => o_cdgo_rspsta,
                                           o_mnsje_rspsta       => o_mnsje_rspsta);

            if o_cdgo_rspsta <> 0 then
              raise e_expcion_intrna;
            end if;

            if c_trnsccion.cdgo_orgn_tpo = 'DL' then

              --Up Para Actualizar el Estado de la Declaracion - Presentada
              pkg_gi_declaraciones.prc_ac_declaracion_estado(p_cdgo_clnte          => c_trnsccion.cdgo_clnte,
                                                             p_id_dclrcion         => c_trnsccion.id_orgen,
                                                             p_cdgo_dclrcion_estdo => 'PRS',
                                                             p_id_rcdo             => o_id_rcdo,
                                                             p_fcha                => systimestamp,
                                                             o_cdgo_rspsta         => o_cdgo_rspsta,
                                                             o_mnsje_rspsta        => o_mnsje_rspsta);
            end if;

            -- Aplicar el pago
            pkg_re_recaudos.prc_ap_recaudo(p_id_usrio     => 1,
                                           p_cdgo_clnte   => c_trnsccion.cdgo_clnte,
                                           p_id_rcdo      => o_id_rcdo,
                                           o_cdgo_rspsta  => o_cdgo_rspsta,
                                           o_mnsje_rspsta => o_mnsje_rspsta);

            if o_cdgo_rspsta <> 0 then
              raise e_expcion_intrna;
            else
              if length(c_trnsccion.tlfno_1) = 10 and
                 c_trnsccion.tlfno_1 like '3%' then
                temp_enviar_sms(p_tlfno     => c_trnsccion.tlfno_1,
                                p_mnsje     => 'Sr. Contribuyente su pago por valor de ' ||
                                               ltrim(to_char(v_vlor_ttal_dcmnto,
                                                             '999,999,999')) ||
                                               ' fue recibido satisfactoriamente. Alcaldia de Monteria',
                                p_tpo_mnsje => 'PAGO PSE');
              end if;
            end if;

            -- Actualiza el estado de la transaccion
            prc_ac_estado_transaccion(p_id_pgdor_dcmnto         => c_trnsccion.id_pgdor_dcmnto,
                                      p_indcdor_estdo_trnsccion => v_estdo_trnsccion,
                                      o_cdgo_rspsta             => o_cdgo_rspsta,
                                      o_mnsje_rspsta            => o_mnsje_rspsta);

            if o_cdgo_rspsta <> 0 then
              ---- OJJJOOOO
              raise e_expcion_intrna;
            end if;
          end if;

        end if;

        -- Hacemos commit por cada Iteracion:  por cada Transaccion
        commit;

      exception
        -- Excepcion interna que se produce dentro del loop
        -- De modo que no pare la ejecucion del loop y continue con las
        -- demas transacciones.
        when e_expcion_intrna then
          -- Registrar la respuesta para la trazabilidad de la transaccion
          prc_rg_respuesta_pago(p_id_pgdor_dcmnto => c_trnsccion.id_pgdor_dcmnto,
                                p_rspsta          => o_mnsje_rspsta,
                                o_cdgo_rspsta     => o_cdgo_rspsta,
                                o_mnsje_rspsta    => o_mnsje_rspsta);

          o_cdgo_rspsta  := o_cdgo_rspsta;
          o_mnsje_rspsta := o_mnsje_rspsta;

          -- Deshacemos en presencia de una Exception solo para la Iteracion actual
          rollback;
      end;

    end loop;

  exception
    when e_excpcion_prsnlzda then
      o_cdgo_rspsta  := o_cdgo_rspsta;
      o_mnsje_rspsta := o_mnsje_rspsta;
  end prc_co_transaccion;

  /*
      Autor: JAGUAS
      Unidad de programa: "PRC_AC_DATOS_PAGADOR"
      Fecha modificacion: 21/09/2020
      Descripcion: Procedimiento encargado de actualizar informacion del pagador.
  */
  procedure prc_ac_datos_pagador(p_cdgo_clnte   in number,
                                 p_id_trcro     in number,
                                 p_prmer_nmbre  in varchar2,
                                 p_sgndo_nmbre  in varchar2,
                                 p_prmer_aplldo in varchar2,
                                 p_sgndo_aplldo in varchar2,
                                 p_tlfno_1      in varchar2,
                                 p_drccion_1    in varchar2,
                                 p_email        in varchar2,
                                 o_cdgo_rspsta  out number,
                                 o_mnsje_rspsta out varchar2) is
    e_excpcion_prsnlzda exception;
  begin

    /*sitpr001('p_cdgo_clnte: ' || p_cdgo_clnte || ' p_id_trcro: ' ||
    p_id_trcro || ' p_prmer_nmbre: ' || p_prmer_nmbre ||
    ' p_sgndo_nmbre: ' || p_sgndo_nmbre || ' p_prmer_aplldo: ' ||
    p_prmer_aplldo || ' p_tlfno_1: ' || p_tlfno_1 ||
    ' p_drccion_1: ' || p_drccion_1 || ' p_email: ' || p_email,
    'prc_ac_datos_pagador.txt');*/

    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'OK';

    begin
      update re_g_pagadores
         set prmer_nmbre  = p_prmer_nmbre,
             sgndo_nmbre  = p_sgndo_nmbre,
             prmer_aplldo = p_prmer_aplldo,
             sgndo_aplldo = p_sgndo_aplldo,
             tlfno_1      = p_tlfno_1,
             drccion_1    = p_drccion_1,
             email        = p_email
       where id_trcro = p_id_trcro
         and cdgo_clnte = p_cdgo_clnte;

      update si_c_terceros
         set prmer_nmbre      = p_prmer_nmbre,
             sgndo_nmbre      = p_sgndo_nmbre,
             prmer_aplldo     = p_prmer_aplldo,
             sgndo_aplldo     = p_sgndo_aplldo,
             tlfno            = p_tlfno_1,
             drccion          = p_drccion_1,
             drccion_ntfccion = p_drccion_1,
             email            = p_email
       where id_trcro = p_id_trcro
         and cdgo_clnte = p_cdgo_clnte;

    exception
      when others then
        /*sitpr001('Error: ' || sqlerrm, 'prc_ac_datos_pagador.txt');*/
        raise e_excpcion_prsnlzda;
    end;

    commit;

  exception
    when e_excpcion_prsnlzda then
      o_cdgo_rspsta  := 10;
      o_mnsje_rspsta := 'Ha ocurrido un error al intentar actualizar los datos del pagador';
  end prc_ac_datos_pagador;

  /*
      Autor: JAGUAS
      Unidad de programa: "PRC_RG_RESPUESTA_PAGO"
      Fecha modificacion: 24/09/2020
      Descripcion: Procedimiento encargado de registrar la respuesta del estado de
                   la transaccion devuelta por PlaceToPay.
  */
  procedure prc_rg_respuesta_pago(p_id_pgdor_dcmnto in number,
                                  p_rspsta          in clob,
                                  o_cdgo_rspsta     out number,
                                  o_mnsje_rspsta    out varchar2) is
    PRAGMA autonomous_transaction;

    e_excpcion_prsnlzda exception;
  begin

    o_cdgo_rspsta := 0;

    begin
      insert into re_g_pagadres_dcmnto_rspsta
        (id_pgdor_dcmnto, rspsta, fcha_rspsta)
      values
        (p_id_pgdor_dcmnto, p_rspsta, systimestamp);
      commit;
    exception
      when others then
        raise e_excpcion_prsnlzda;
    end;

  exception
    when e_excpcion_prsnlzda then
      o_cdgo_rspsta  := 1;
      o_mnsje_rspsta := 'Error al intentar registrar respuesta de la transaccion. ' ||
                        sqlerrm;
  end prc_rg_respuesta_pago;

  procedure prc_rg_pagador(p_cdgo_clnte          in number,
                           p_id_trcro            in number,
                           p_cdgo_idntfccion_tpo in varchar2,
                           p_idntfccion          in number,
                           p_prmer_nmbre         in varchar2,
                           p_sgndo_nmbre         in varchar2,
                           p_prmer_aplldo        in varchar2,
                           p_sgndo_aplldo        in varchar2,
                           p_tlfno_1             in varchar2,
                           p_drccion_1           in varchar2,
                           p_email               in varchar2,
                           o_id_pgdor            out number,
                           o_cdgo_rspsta         out number,
                           o_mnsje_rspsta        out varchar2) as

  begin

    o_cdgo_rspsta := 0;

    begin
      insert into re_g_pagadores
        (cdgo_idntfccion_tpo,
         cdgo_clnte,
         idntfccion,
         prmer_nmbre,
         sgndo_nmbre,
         prmer_aplldo,
         sgndo_aplldo,
         tlfno_1,
         drccion_1,
         email,
         id_trcro)
      values
        (p_cdgo_idntfccion_tpo,
         p_cdgo_clnte,
         p_idntfccion,
         p_prmer_nmbre,
         p_sgndo_nmbre,
         p_prmer_aplldo,
         p_sgndo_aplldo,
         p_tlfno_1,
         p_drccion_1,
         p_email,
         p_id_trcro)
      returning id_pgdor into o_id_pgdor;

    exception
      when others then
        o_cdgo_rspsta  := 1;
        o_mnsje_rspsta := 'No se pudo registrar el pagador' || sqlerrm;
        /*sitpr001('Error creando el pagador: ' || p_idntfccion ||
        ' error: ' || o_mnsje_rspsta,
        'LOG_PAGOS_PSE_' || TO_CHAR(SYSDATE, 'YYYYMMDD') || '.TXT');*/
    end;

  end prc_rg_pagador;

  function fnc_ob_items_declaracion(p_id_prvdor   in number,
                                    p_id_frmlrio  in number,
                                    p_seccion     in varchar2,
                                    p_id_dclrcion in number) return clob as
    v_json_items          clob;
    v_json_items_1        json_object_t := new json_object_t();
    v_json_items_2        json_object_t := new json_object_t();
    v_json_items_3        json_object_t := new json_object_t();
    json_array1           json_array_t := new json_array_t();
    json_array3           json_array_t;
    v_sql                 WS_D_PRVDOR_CNSLTA_DCLRCION.cnslta_sql%type;
    v_vlor                varchar2(500);
    v_cntdad_actvddes     number;
    v_n_actvddes          number;
    v_cmpos_rqrdos        number;
    v_cdgo_impsto_sbmpsto df_i_impuestos_subimpuesto.cdgo_impsto_sbmpsto%type;
  begin

    if p_seccion = 'IT' then
      for c_items in (select a.cdgo_item_prvdor,
                             c.cnslta_sql,
                             a.indcdor_tpo_dto
                        from ws_d_provedores_dclrcn_itm a
                        join ws_d_prvdors_dclrcn_hmlgcn b
                          on b.id_prvdor_dclrcion_itm =
                             a.id_prvdor_dclrcion_itm
                        join WS_D_PRVDOR_CNSLTA_DCLRCION c
                          on b.id_cnslta_dclrcion = c.id_cnslta_dclrcion
                        join ws_d_provedores_declrcn d
                          on d.id_prvdor_dclrcion = a.id_prvdor_dclrcion
                       where d.id_prvdor = p_id_prvdor
                         and d.id_frmlrio = p_id_frmlrio
                         and a.orgn_extrccion = 'SQL'
                         and a.cdgo_sccion = 'IT') loop

        v_sql := c_items.cnslta_sql;
        execute immediate v_sql
          into v_vlor
          using p_id_dclrcion;

        v_json_items_1.put('keyword', c_items.cdgo_item_prvdor);

        if c_items.indcdor_tpo_dto = 'T' then
          v_json_items_1.put('value', v_vlor);
        elsif c_items.indcdor_tpo_dto = 'N' then
          v_json_items_1.put('value', to_number(v_vlor));
        end if;

        json_array1.append(v_json_items_1);

      end loop;

      for c_items in (select e.cdgo_item_prvdor,
                             case
                               when e.vlor_extrccion = 'VL' then
                                a.vlor
                               when e.vlor_extrccion = 'VF' and
                                    f.vlor_fjo is not null then
                                to_clob(f.vlor_fjo)
                               else
                                a.vlor_dsplay
                             end as vlor,
                             e.indcdor_tpo_dto
                        from gi_g_declaraciones_detalle a
                        join gi_g_declaraciones b
                          on a.id_dclrcion = b.id_dclrcion
                        join gi_d_dclrcnes_vgncias_frmlr c
                          on b.id_dclrcion_vgncia_frmlrio =
                             c.id_dclrcion_vgncia_frmlrio
                        join ws_d_provedores_declrcn d
                          on c.id_frmlrio = d.id_frmlrio
                        join ws_d_provedores_dclrcn_itm e
                          on d.id_prvdor_dclrcion = e.id_prvdor_dclrcion
                         and e.orgn_extrccion = 'COL'
                         and e.cdgo_sccion = 'IT'
                        join ws_d_prvdors_dclrcn_hmlgcn f
                          on e.id_prvdor_dclrcion_itm =
                             f.id_prvdor_dclrcion_itm
                         and a.id_frmlrio_rgion_atrbto =
                             f.id_frmlrio_rgion_atrbto
                       where d.id_prvdor = p_id_prvdor
                         and a.id_dclrcion = p_id_dclrcion
                         and d.id_frmlrio = p_id_frmlrio) loop

        v_json_items_2.put('keyword', c_items.cdgo_item_prvdor);

        if c_items.indcdor_tpo_dto = 'T' then
          v_json_items_2.put('value', c_items.vlor);
        elsif c_items.indcdor_tpo_dto = 'N' then
          v_json_items_2.put('value', to_number(c_items.vlor));
        end if;
        json_array1.append(v_json_items_2);
      end loop;

      for c_items_fijos in (select e.cdgo_item_prvdor,
                                   f.vlor_fjo vlor,
                                   e.indcdor_tpo_dto
                              from ws_d_provedores_declrcn d
                              join ws_d_provedores_dclrcn_itm e
                                on d.id_prvdor_dclrcion =
                                   e.id_prvdor_dclrcion
                               and e.orgn_extrccion = 'COL'
                               and e.cdgo_sccion = 'IT'
                               and e.vlor_extrccion = 'VF'
                              join ws_d_prvdors_dclrcn_hmlgcn f
                                on e.id_prvdor_dclrcion_itm =
                                   f.id_prvdor_dclrcion_itm
                               and f.vlor_fjo is not null
                             where d.id_prvdor = p_id_prvdor
                               and d.id_frmlrio = p_id_frmlrio) loop

        v_json_items_3.put('keyword', c_items_fijos.cdgo_item_prvdor);

        if c_items_fijos.indcdor_tpo_dto = 'T' then
          v_json_items_3.put('value', c_items_fijos.vlor);
        elsif c_items_fijos.indcdor_tpo_dto = 'N' then
          v_json_items_3.put('value', to_number(c_items_fijos.vlor));
        end if;
        json_array1.append(v_json_items_3);

      end loop;

      return json_array1.to_clob();

    elsif p_seccion = 'AC' then

      select max(a.fla), max(g.cdgo_impsto_sbmpsto)
        into v_n_actvddes, v_cdgo_impsto_sbmpsto
        from gi_g_declaraciones_detalle a
        join gi_g_declaraciones b
          on a.id_dclrcion = b.id_dclrcion
        join gi_d_dclrcnes_vgncias_frmlr c
          on b.id_dclrcion_vgncia_frmlrio = c.id_dclrcion_vgncia_frmlrio
        join ws_d_provedores_declrcn d
          on c.id_frmlrio = d.id_frmlrio
        join ws_d_provedores_dclrcn_itm e
          on d.id_prvdor_dclrcion = e.id_prvdor_dclrcion
         and e.orgn_extrccion = 'COL'
         and e.cdgo_sccion = 'AC'
        join ws_d_prvdors_dclrcn_hmlgcn f
          on e.id_prvdor_dclrcion_itm = f.id_prvdor_dclrcion_itm
         and f.id_frmlrio_rgion_atrbto = a.id_frmlrio_rgion_atrbto
        join df_i_impuestos_subimpuesto g
          on g.id_impsto_sbmpsto = b.id_impsto_sbmpsto
       where d.id_prvdor = p_id_prvdor
         and a.id_dclrcion = p_id_dclrcion
         and d.id_frmlrio = p_id_frmlrio;

      /* INICIO 19/06/2024 BVM */
      if v_n_actvddes is not null then
        /* FIN 19/06/2024 BVM */

        for i in 1 .. v_n_actvddes loop

          json_array3 := new json_array_t();

          for c_items in (select e.cdgo_item_prvdor,
                                 a.vlor,
                                 e.indcdor_tpo_dto,
                                 f.indcdor_frmlrio_atrbto_hmlga,
                                 f.fncion_frmlrio_atrbto_hmlga
                            from gi_g_declaraciones_detalle a
                            join gi_g_declaraciones b
                              on a.id_dclrcion = b.id_dclrcion
                            join gi_d_dclrcnes_vgncias_frmlr c
                              on b.id_dclrcion_vgncia_frmlrio =
                                 c.id_dclrcion_vgncia_frmlrio

                            join ws_d_provedores_declrcn d
                              on c.id_frmlrio = d.id_frmlrio
                            join ws_d_provedores_dclrcn_itm e
                              on d.id_prvdor_dclrcion = e.id_prvdor_dclrcion
                             and e.orgn_extrccion = 'COL'
                             and e.cdgo_sccion = 'AC'
                            join ws_d_prvdors_dclrcn_hmlgcn f
                              on e.id_prvdor_dclrcion_itm =
                                 f.id_prvdor_dclrcion_itm
                             and f.id_frmlrio_rgion_atrbto =
                                 a.id_frmlrio_rgion_atrbto
                           where d.id_prvdor = p_id_prvdor
                             and a.id_dclrcion = p_id_dclrcion
                             and d.id_frmlrio = p_id_frmlrio
                             and a.fla = i) loop
            v_json_items_1.put('keyword', c_items.cdgo_item_prvdor);

            v_vlor := c_items.vlor;

            if c_items.cdgo_item_prvdor = 'code' then

              select cdgo_dclrcns_esqma_trfa || ' - ' || dscrpcion
                into v_vlor
                from gi_d_dclrcns_esqma_trfa
               where id_dclrcns_esqma_trfa = to_number(c_items.vlor);

            end if;

            if c_items.indcdor_frmlrio_atrbto_hmlga = 'S' then

              if c_items.fncion_frmlrio_atrbto_hmlga = 'fnc_co_actvdad_tpo' then
                v_vlor := pkg_ws_pagos_placetopay.fnc_co_actvdad_tpo(p_id_prvdor   => p_id_prvdor,
                                                                     p_actvdad_tpo => c_items.vlor);
              end if;
            end if;

            v_json_items_1.put('value', v_vlor);

            if c_items.indcdor_tpo_dto = 'T' then
              v_json_items_1.put('value', v_vlor);
            else
              v_json_items_1.put('value',
                                 to_number(replace(v_vlor, '.', ',')));
            end if;

            json_array3.append(v_json_items_1);
          end loop;

          if v_cdgo_impsto_sbmpsto = 'SBT' then
            v_json_items_2.put('keyword', 'LIQUIDATION');
          else
            v_json_items_2.put('keyword', 'activities');
          end if;
          v_json_items_2.put('value', json_array3);
          json_array1.append(v_json_items_2);
        end loop;

        /* INICIO 19/06/2024 BVM */
      else
        v_n_actvddes := null;
      end if;
      /* FIN 19/06/2024 BVM */

      return json_array1.to_clob();

    elsif p_seccion in ('FD', 'FS') then

      -- Cursor para la firma del declarante (Obligatoria)
      for c_frma_dclrnte in (select distinct x.cdgo_item_prvdor,
                                             x.indcdor_frmlrio_atrbto_hmlga,
                                             x.Fncion_Frmlrio_Atrbto_Hmlga,
                                             x.indcdor_tpo_dto,
                                             case
                                               when x.vlor_extrccion = 'VL' then
                                                x.vlor
                                               when x.vlor_extrccion = 'VD' then
                                                x.vlor_dsplay
                                               when x.vlor_extrccion = 'VF' then
                                                x.vlor_fjo
                                             end as vlor
                               from (select d.cdgo_sccion,
                                            d.cdgo_item_prvdor,
                                            d.vlor_extrccion,
                                            d.indcdor_frmlrio_atrbto_hmlga,
                                            d.Fncion_Frmlrio_Atrbto_Hmlga,
                                            d.indcdor_tpo_dto,
                                            dbms_lob.substr(a.vlor, 4000, 1) vlor,
                                            dbms_lob.substr(a.vlor_dsplay,
                                                            4000,
                                                            1) vlor_dsplay,
                                            d.vlor_fjo
                                       from gi_g_declaraciones_detalle a
                                       join gi_g_declaraciones b
                                         on b.id_dclrcion = a.id_dclrcion
                                        and b.id_dclrcion = p_id_dclrcion
                                       join gi_d_dclrcnes_vgncias_frmlr c
                                         on b.id_dclrcion_vgncia_frmlrio =
                                            c.id_dclrcion_vgncia_frmlrio
                                      right join v_ws_d_prvdors_dclrcn_hmlgcn d
                                         on c.id_frmlrio = d.id_frmlrio
                                        and a.ID_FRMLRIO_RGION_ATRBTO =
                                            d.ID_FRMLRIO_RGION_ATRBTO
                                        and d.id_prvdor = p_id_prvdor
                                        and d.id_frmlrio = p_id_frmlrio
                                      where d.cdgo_sccion = 'FD') x
                              where (x.vlor is not null or
                                    x.vlor_fjo is not null)) loop
        v_vlor := c_frma_dclrnte.vlor;

        -- Si el atributo debe homologar con alguna funcion validamos que este en "S"
        if c_frma_dclrnte.indcdor_frmlrio_atrbto_hmlga = 'S' then
          -- Preguntar por la funcion usada para homologar el dato
          if c_frma_dclrnte.Fncion_Frmlrio_Atrbto_Hmlga =
             'fnc_co_tipo_identificacion' then
            v_vlor := pkg_ws_pagos_placetopay.fnc_co_tipo_identificacion(p_id_prvdor           => p_id_prvdor,
                                                                         p_cdgo_tpo_idntfccion => c_frma_dclrnte.vlor);
          elsif c_frma_dclrnte.Fncion_Frmlrio_Atrbto_Hmlga =
                'fnc_co_tipo_responsable' then
            v_vlor := pkg_ws_pagos_placetopay.fnc_co_tipo_responsable(p_id_prvdor         => p_id_prvdor,
                                                                      p_cdgo_rspnsble_tpo => c_frma_dclrnte.vlor);

          elsif c_frma_dclrnte.Fncion_Frmlrio_Atrbto_Hmlga =
                'fnc_co_clasificacion' then
            v_vlor := pkg_ws_pagos_placetopay.fnc_co_clasificacion(p_id_prvdor   => p_id_prvdor,
                                                                   p_id_sjto_tpo => c_frma_dclrnte.vlor);
          elsif c_frma_dclrnte.fncion_frmlrio_atrbto_hmlga =
                'fnc_co_nombres_firmante' then

            select trim(r.prmer_nmbre || ' ' || r.sgndo_nmbre)
              into v_vlor
              from si_i_sujetos_responsable r
             where r.id_sjto_rspnsble = c_frma_dclrnte.vlor;

          elsif c_frma_dclrnte.fncion_frmlrio_atrbto_hmlga =
                'fnc_co_apellidos_firmante' then

            select --trim(r.prmer_aplldo || ' ' || r.sgndo_aplldo)
            /* INICIO 19/06/2024 BVM */
             case
               when r.prmer_aplldo = '.' then
                trim(r.prmer_nmbre || ' ' || r.sgndo_nmbre)
               else
                trim(r.prmer_aplldo || ' ' || r.sgndo_aplldo)
             end
            /* FIN 19/06/2024 BVM */
              into v_vlor
              from si_i_sujetos_responsable r
             where r.id_sjto_rspnsble = c_frma_dclrnte.vlor;

            /* INICIO 19/06/2024 BVM */
          elsif c_frma_dclrnte.fncion_frmlrio_atrbto_hmlga =
                'fnc_co_email_firmante' then

            select r.email
              into v_vlor
              from si_i_sujetos_responsable r
             where r.id_sjto_rspnsble = c_frma_dclrnte.vlor;
            /* FIN 19/06/2024 BVM */

          else
            v_vlor := c_frma_dclrnte.vlor;
          end if;
        end if;

        if c_frma_dclrnte.indcdor_tpo_dto = 'N' then
          -- Si el dato es Numerico
          v_json_items_1.put(c_frma_dclrnte.cdgo_item_prvdor,
                             to_number(v_vlor));
        elsif c_frma_dclrnte.indcdor_tpo_dto = 'B' and
              lower(v_vlor) = 'true' then
          -- Si el dato es Booleano = "TRUE"
          v_json_items_1.put(c_frma_dclrnte.cdgo_item_prvdor, true);
        elsif c_frma_dclrnte.indcdor_tpo_dto = 'B' and
              lower(v_vlor) = 'false' then
          -- Si el dato es Booleano = "FALSE"
          v_json_items_1.put(c_frma_dclrnte.cdgo_item_prvdor, false);
        elsif c_frma_dclrnte.indcdor_tpo_dto = 'T' then
          -- Si el dato es Texto
          v_json_items_1.put(c_frma_dclrnte.cdgo_item_prvdor, v_vlor);
        end if;

      end loop;

      json_array1.append(v_json_items_1);

      v_cmpos_rqrdos := 0;

      -- Cursor para la firma secundaria (Opcional)
      for c_frma_scndria in (select distinct x.cdgo_item_prvdor,
                                             x.indcdor_frmlrio_atrbto_hmlga,
                                             x.Fncion_Frmlrio_Atrbto_Hmlga,
                                             x.indcdor_tpo_dto,
                                             x.orgn_extrccion,
                                             x.id_cnslta_dclrcion,
                                             x.vlor_extrccion,
                                             case
                                               when x.vlor_extrccion = 'VL' then
                                                x.vlor
                                               when x.vlor_extrccion = 'VD' then
                                                x.vlor_dsplay
                                               when x.vlor_extrccion = 'VF' then
                                                x.vlor_fjo
                                             end as vlor
                               from (select e.cdgo_sccion,
                                            e.cdgo_item_prvdor,
                                            e.vlor_extrccion,
                                            e.indcdor_frmlrio_atrbto_hmlga,
                                            e.Fncion_Frmlrio_Atrbto_Hmlga,
                                            e.orgn_extrccion,
                                            e.indcdor_tpo_dto,
                                            e.id_cnslta_dclrcion,
                                            dbms_lob.substr(a.vlor, 4000, 1) vlor,
                                            dbms_lob.substr(a.vlor_dsplay,
                                                            4000,
                                                            1) vlor_dsplay,
                                            e.vlor_fjo
                                       from gi_g_declaraciones_detalle a
                                       join gi_g_declaraciones b
                                         on b.id_dclrcion = a.id_dclrcion
                                        and b.id_dclrcion = p_id_dclrcion
                                       join gi_d_dclrcnes_vgncias_frmlr c
                                         on b.id_dclrcion_vgncia_frmlrio =
                                            c.id_dclrcion_vgncia_frmlrio
                                      right join v_ws_d_prvdors_dclrcn_hmlgcn e
                                         on c.id_frmlrio = e.id_frmlrio
                                        and a.ID_FRMLRIO_RGION_ATRBTO =
                                            e.ID_FRMLRIO_RGION_ATRBTO
                                        and e.id_prvdor = p_id_prvdor
                                        and e.id_frmlrio = p_id_frmlrio
                                      where e.cdgo_sccion = 'FS') x
                              where (x.vlor is not null or
                                    x.vlor_fjo is not null)) loop
        v_vlor := c_frma_scndria.vlor;

        if c_frma_scndria.vlor_extrccion in ('VL', 'VD') then
          v_cmpos_rqrdos := v_cmpos_rqrdos + 1;
        end if;

        -- dbms_output.put_line(c_frma_scndria.cdgo_item_prvdor|| ' -> '||v_vlor);

        if v_vlor is not null then

          if c_frma_scndria.orgn_extrccion = 'COL' then

            if c_frma_scndria.indcdor_frmlrio_atrbto_hmlga = 'S' then
              if c_frma_scndria.Fncion_Frmlrio_Atrbto_Hmlga =
                 'fnc_co_tipo_identificacion' then
                v_vlor := pkg_ws_pagos_placetopay.fnc_co_tipo_identificacion(p_id_prvdor           => p_id_prvdor,
                                                                             p_cdgo_tpo_idntfccion => c_frma_scndria.vlor);
              elsif c_frma_scndria.Fncion_Frmlrio_Atrbto_Hmlga =
                    'fnc_co_tipo_responsable' then
                v_vlor := pkg_ws_pagos_placetopay.fnc_co_tipo_responsable(p_id_prvdor         => p_id_prvdor,
                                                                          p_cdgo_rspnsble_tpo => c_frma_scndria.vlor);
              elsif c_frma_scndria.Fncion_Frmlrio_Atrbto_Hmlga =
                    'fnc_co_clasificacion' then
                v_vlor := pkg_ws_pagos_placetopay.fnc_co_clasificacion(p_id_prvdor   => p_id_prvdor,
                                                                       p_id_sjto_tpo => c_frma_scndria.vlor);
              elsif c_frma_scndria.fncion_frmlrio_atrbto_hmlga =
                    'fnc_co_nombres_firmante' then

                select trim(r.prmer_nmbre || ' ' || r.sgndo_nmbre)
                  into v_vlor
                  from si_i_sujetos_responsable r
                 where r.id_sjto_rspnsble = c_frma_scndria.vlor;

              elsif c_frma_scndria.fncion_frmlrio_atrbto_hmlga =
                    'fnc_co_apellidos_firmante' then

                select --trim(r.prmer_aplldo || ' ' || r.sgndo_aplldo)
                /* INICIO 19/06/2024 BVM */
                 case
                   when r.prmer_aplldo = '.' then
                    trim(r.prmer_nmbre || ' ' || r.sgndo_nmbre)
                   else
                    trim(r.prmer_aplldo || ' ' || r.sgndo_aplldo)
                 end
                /* FIN 19/06/2024 BVM */
                  into v_vlor
                  from si_i_sujetos_responsable r
                 where r.id_sjto_rspnsble = c_frma_scndria.vlor;

                /* INICIO 19/06/2024 BVM */
              elsif c_frma_scndria.fncion_frmlrio_atrbto_hmlga =
                    'fnc_co_email_firmante' then

                select r.email
                  into v_vlor
                  from si_i_sujetos_responsable r
                 where r.id_sjto_rspnsble = c_frma_scndria.vlor;
                /* FIN 19/06/2024 BVM */

              else
                v_vlor := c_frma_scndria.vlor;
              end if;
            end if;

          elsif c_frma_scndria.orgn_extrccion = 'SQL' then

            select cnslta_sql
              into v_sql
              from ws_d_prvdor_cnslta_dclrcion a
             where a.id_cnslta_dclrcion = c_frma_scndria.id_cnslta_dclrcion;

            if c_frma_scndria.indcdor_frmlrio_atrbto_hmlga = 'S' then
              v_vlor := c_frma_scndria.vlor;
            end if;

            execute immediate v_sql
              into v_vlor
              using p_id_dclrcion, v_vlor;

          end if;

          if c_frma_scndria.indcdor_tpo_dto = 'N' then
            -- Si el dato es Numerico
            v_json_items_2.put(c_frma_scndria.cdgo_item_prvdor,
                               to_number(v_vlor));
          elsif c_frma_scndria.indcdor_tpo_dto = 'B' and
                lower(v_vlor) = 'true' then
            -- Si el dato es Booleano = "TRUE"
            v_json_items_2.put(c_frma_scndria.cdgo_item_prvdor, true);
          elsif c_frma_scndria.indcdor_tpo_dto = 'B' and
                lower(v_vlor) = 'false' then
            -- Si el dato es Booleano = "FALSE"
            v_json_items_2.put(c_frma_scndria.cdgo_item_prvdor, false);
          elsif c_frma_scndria.indcdor_tpo_dto = 'T' then
            -- Si el dato es Texto
            v_json_items_2.put(c_frma_scndria.cdgo_item_prvdor, v_vlor);
          end if;

          --v_json_items_2.put(c_frma_scndria.cdgo_item_prvdor, v_vlor);
        end if;

      end loop;

      if v_cmpos_rqrdos > 1 then
        --if nvl(dbms_lob.getlength(regexp_replace(v_json_items_2.to_clob(), '(\{|\})', null)),0) > 0 then
        json_array1.append(v_json_items_2);
      end if;

      return json_array1.to_clob();

    elsif p_seccion = 'DP' then

      for c_dtos_prncpales in (select x.cdgo_item_prvdor,
                                      x.indcdor_frmlrio_atrbto_hmlga,
                                      x.Fncion_Frmlrio_Atrbto_Hmlga,
                                      x.indcdor_tpo_dto,
                                      x.orgn_extrccion,
                                      x.id_cnslta_dclrcion,
                                      case
                                        when x.vlor_extrccion = 'VL' and
                                             x.vlor is not null then
                                         x.vlor
                                        when x.vlor_extrccion = 'VD' and
                                             x.vlor_dsplay is not null then
                                         x.vlor_dsplay
                                        when x.vlor_extrccion = 'VF' and
                                             x.vlor_fjo is not null then
                                         x.vlor_fjo
                                      end as vlor
                                 from (select distinct e.cdgo_item_prvdor,
                                                       e.cdgo_sccion,
                                                       e.vlor_extrccion,
                                                       e.indcdor_frmlrio_atrbto_hmlga,
                                                       e.Fncion_Frmlrio_Atrbto_Hmlga,
                                                       e.indcdor_tpo_dto,
                                                       e.orgn_extrccion,
                                                       e.id_cnslta_dclrcion,
                                                       dbms_lob.substr(a.vlor,
                                                                       4000,
                                                                       1) vlor,
                                                       dbms_lob.substr(a.vlor_dsplay,
                                                                       4000,
                                                                       1) vlor_dsplay,
                                                       e.vlor_fjo
                                         from gi_g_declaraciones_detalle a
                                         join gi_g_declaraciones b
                                           on b.id_dclrcion = a.id_dclrcion
                                          and b.id_dclrcion = p_id_dclrcion
                                         join gi_d_dclrcnes_vgncias_frmlr c
                                           on b.id_dclrcion_vgncia_frmlrio =
                                              c.id_dclrcion_vgncia_frmlrio
                                        right join v_ws_d_prvdors_dclrcn_hmlgcn e
                                           on c.id_frmlrio = e.id_frmlrio
                                          and a.ID_FRMLRIO_RGION_ATRBTO =
                                              e.ID_FRMLRIO_RGION_ATRBTO
                                          and e.id_prvdor = p_id_prvdor
                                        where e.cdgo_sccion = p_seccion
                                          and e.id_frmlrio = p_id_frmlrio) x
                               --where (x.vlor is not null or x.vlor_fjo is not null or x.id_cnslta_dclrcion is not null)
                               ) loop
        v_vlor := c_dtos_prncpales.vlor;

        if c_dtos_prncpales.orgn_extrccion = 'COL' then

          -- Si el atributo debe homologar con alguna funcion validamos que este en "S"
          if c_dtos_prncpales.indcdor_frmlrio_atrbto_hmlga = 'S' then
            -- Preguntar por la funcion usada para homologar el dato
            if c_dtos_prncpales.Fncion_Frmlrio_Atrbto_Hmlga =
               'fnc_co_tipo_identificacion' then
              v_vlor := pkg_ws_pagos_placetopay.fnc_co_tipo_identificacion(p_id_prvdor           => p_id_prvdor,
                                                                           p_cdgo_tpo_idntfccion => c_dtos_prncpales.vlor);
            elsif c_dtos_prncpales.Fncion_Frmlrio_Atrbto_Hmlga =
                  'fnc_co_tipo_responsable' then
              v_vlor := pkg_ws_pagos_placetopay.fnc_co_tipo_responsable(p_id_prvdor         => p_id_prvdor,
                                                                        p_cdgo_rspnsble_tpo => c_dtos_prncpales.vlor);
            elsif c_dtos_prncpales.Fncion_Frmlrio_Atrbto_Hmlga =
                  'fnc_co_clasificacion' then
              v_vlor := pkg_ws_pagos_placetopay.fnc_co_clasificacion(p_id_prvdor   => p_id_prvdor,
                                                                     p_id_sjto_tpo => c_dtos_prncpales.vlor);
            elsif c_dtos_prncpales.Fncion_Frmlrio_Atrbto_Hmlga =
                  'fnc_co_codigo_departamento' then
              v_vlor := pkg_ws_pagos_placetopay.fnc_co_codigo_departamento(p_id_dprtmnto => c_dtos_prncpales.vlor);
            elsif c_dtos_prncpales.Fncion_Frmlrio_Atrbto_Hmlga =
                  'fnc_co_codigo_municipio' then
              v_vlor := pkg_ws_pagos_placetopay.fnc_co_codigo_municipio(p_id_mncpio => c_dtos_prncpales.vlor);
            else
              v_vlor := c_dtos_prncpales.vlor;
            end if;

          end if;

        elsif c_dtos_prncpales.orgn_extrccion = 'SQL' and
              c_dtos_prncpales.id_cnslta_dclrcion is not null then

          select cnslta_sql
            into v_sql
            from ws_d_prvdor_cnslta_dclrcion a
           where a.id_cnslta_dclrcion = c_dtos_prncpales.id_cnslta_dclrcion;

          execute immediate v_sql
            into v_vlor
            using p_id_dclrcion;
        else
          exit;
        end if;

        if c_dtos_prncpales.indcdor_tpo_dto = 'N' then
          -- Si el dato es Numerico
          v_json_items_1.put(c_dtos_prncpales.cdgo_item_prvdor,
                             to_number(v_vlor));
        elsif c_dtos_prncpales.indcdor_tpo_dto = 'B' and
              lower(v_vlor) = 'true' then
          -- Si el dato es Booleano = "TRUE"
          v_json_items_1.put(c_dtos_prncpales.cdgo_item_prvdor, true);
        elsif c_dtos_prncpales.indcdor_tpo_dto = 'B' and
              lower(v_vlor) = 'false' then
          -- Si el dato es Booleano = "FALSE"
          v_json_items_1.put(c_dtos_prncpales.cdgo_item_prvdor, false);
        elsif c_dtos_prncpales.indcdor_tpo_dto = 'T' then
          -- Si el dato es Texto
          v_json_items_1.put(c_dtos_prncpales.cdgo_item_prvdor, v_vlor);
        end if;

      end loop;

      return v_json_items_1.to_clob();

    end if;

  end fnc_ob_items_declaracion;

  procedure prc_ob_items_declaracion(p_id_prvdor   in number,
                                     p_id_frmlrio  in number,
                                     p_seccion     in varchar2,
                                     p_id_dclrcion in number,
                                     o_rspsta      out clob) as
    v_json_items          clob;
    v_json_items_1        json_object_t := new json_object_t();
    v_json_items_2        json_object_t := new json_object_t();
    v_json_items_3        json_object_t := new json_object_t();
    json_array1           json_array_t := new json_array_t();
    json_array3           json_array_t;
    v_sql                 WS_D_PRVDOR_CNSLTA_DCLRCION.cnslta_sql%type;
    v_vlor                varchar2(500);
    v_cntdad_actvddes     number;
    v_n_actvddes          number;
    v_cmpos_rqrdos        number;
    v_cdgo_impsto_sbmpsto df_i_impuestos_subimpuesto.cdgo_impsto_sbmpsto%type;
  begin

    if p_seccion = 'IT' then
      for c_items in (select a.cdgo_item_prvdor,
                             c.cnslta_sql,
                             a.indcdor_tpo_dto
                        from ws_d_provedores_dclrcn_itm a
                        join ws_d_prvdors_dclrcn_hmlgcn b
                          on b.id_prvdor_dclrcion_itm =
                             a.id_prvdor_dclrcion_itm
                        join WS_D_PRVDOR_CNSLTA_DCLRCION c
                          on b.id_cnslta_dclrcion = c.id_cnslta_dclrcion
                        join ws_d_provedores_declrcn d
                          on d.id_prvdor_dclrcion = a.id_prvdor_dclrcion
                       where d.id_prvdor = p_id_prvdor
                         and d.id_frmlrio = p_id_frmlrio
                         and a.orgn_extrccion = 'SQL'
                         and a.cdgo_sccion = 'IT') loop

        v_sql := c_items.cnslta_sql;
        execute immediate v_sql
          into v_vlor
          using p_id_dclrcion;

        v_json_items_1.put('keyword', c_items.cdgo_item_prvdor);

        if c_items.indcdor_tpo_dto = 'T' then
          v_json_items_1.put('value', v_vlor);
        elsif c_items.indcdor_tpo_dto = 'N' then
          v_json_items_1.put('value', to_number(v_vlor));
        end if;

        json_array1.append(v_json_items_1);

      end loop;

      for c_items in (select e.cdgo_item_prvdor,
                             case
                               when e.vlor_extrccion = 'VL' then
                                a.vlor
                               when e.vlor_extrccion = 'VF' and
                                    f.vlor_fjo is not null then
                                to_clob(f.vlor_fjo)
                               else
                                a.vlor_dsplay
                             end as vlor,
                             e.indcdor_tpo_dto
                        from gi_g_declaraciones_detalle a
                        join gi_g_declaraciones b
                          on a.id_dclrcion = b.id_dclrcion
                        join gi_d_dclrcnes_vgncias_frmlr c
                          on b.id_dclrcion_vgncia_frmlrio =
                             c.id_dclrcion_vgncia_frmlrio
                        join ws_d_provedores_declrcn d
                          on c.id_frmlrio = d.id_frmlrio
                        join ws_d_provedores_dclrcn_itm e
                          on d.id_prvdor_dclrcion = e.id_prvdor_dclrcion
                         and e.orgn_extrccion = 'COL'
                         and e.cdgo_sccion = 'IT'
                        join ws_d_prvdors_dclrcn_hmlgcn f
                          on e.id_prvdor_dclrcion_itm =
                             f.id_prvdor_dclrcion_itm
                         and a.id_frmlrio_rgion_atrbto =
                             f.id_frmlrio_rgion_atrbto
                       where d.id_prvdor = p_id_prvdor
                         and a.id_dclrcion = p_id_dclrcion
                         and d.id_frmlrio = p_id_frmlrio) loop

        v_json_items_2.put('keyword', c_items.cdgo_item_prvdor);

        if c_items.indcdor_tpo_dto = 'T' then
          v_json_items_2.put('value', c_items.vlor);
        elsif c_items.indcdor_tpo_dto = 'N' then
          v_json_items_2.put('value', to_number(c_items.vlor));
        end if;
        json_array1.append(v_json_items_2);
      end loop;

      for c_items_fijos in (select e.cdgo_item_prvdor,
                                   f.vlor_fjo vlor,
                                   e.indcdor_tpo_dto
                              from ws_d_provedores_declrcn d
                              join ws_d_provedores_dclrcn_itm e
                                on d.id_prvdor_dclrcion =
                                   e.id_prvdor_dclrcion
                               and e.orgn_extrccion = 'COL'
                               and e.cdgo_sccion = 'IT'
                               and e.vlor_extrccion = 'VF'
                              join ws_d_prvdors_dclrcn_hmlgcn f
                                on e.id_prvdor_dclrcion_itm =
                                   f.id_prvdor_dclrcion_itm
                               and f.vlor_fjo is not null
                             where d.id_prvdor = p_id_prvdor
                               and d.id_frmlrio = p_id_frmlrio) loop

        v_json_items_3.put('keyword', c_items_fijos.cdgo_item_prvdor);

        if c_items_fijos.indcdor_tpo_dto = 'T' then
          v_json_items_3.put('value', c_items_fijos.vlor);
        elsif c_items_fijos.indcdor_tpo_dto = 'N' then
          v_json_items_3.put('value', to_number(c_items_fijos.vlor));
        end if;
        json_array1.append(v_json_items_3);

      end loop;

      o_rspsta := json_array1.to_clob();

    elsif p_seccion = 'AC' then

      select max(a.fla), max(g.cdgo_impsto_sbmpsto)
        into v_n_actvddes, v_cdgo_impsto_sbmpsto
        from gi_g_declaraciones_detalle a
        join gi_g_declaraciones b
          on a.id_dclrcion = b.id_dclrcion
        join gi_d_dclrcnes_vgncias_frmlr c
          on b.id_dclrcion_vgncia_frmlrio = c.id_dclrcion_vgncia_frmlrio
        join ws_d_provedores_declrcn d
          on c.id_frmlrio = d.id_frmlrio
        join ws_d_provedores_dclrcn_itm e
          on d.id_prvdor_dclrcion = e.id_prvdor_dclrcion
         and e.orgn_extrccion = 'COL'
         and e.cdgo_sccion = 'AC'
        join ws_d_prvdors_dclrcn_hmlgcn f
          on e.id_prvdor_dclrcion_itm = f.id_prvdor_dclrcion_itm
         and f.id_frmlrio_rgion_atrbto = a.id_frmlrio_rgion_atrbto
        join df_i_impuestos_subimpuesto g
          on g.id_impsto_sbmpsto = b.id_impsto_sbmpsto
       where d.id_prvdor = p_id_prvdor
         and a.id_dclrcion = p_id_dclrcion
         and d.id_frmlrio = p_id_frmlrio;

      for i in 1 .. v_n_actvddes loop

        json_array3 := new json_array_t();

        for c_items in (select e.cdgo_item_prvdor,
                               case
                                 when e.vlor_extrccion = 'VL' then
                                  dbms_lob.substr(a.vlor, 4000, 1)
                                 when e.vlor_extrccion = 'VD' then
                                  dbms_lob.substr(a.vlor_dsplay, 4000, 1)
                                 when e.vlor_extrccion = 'VF' then
                                  f.vlor_fjo
                               end as vlor,
                               e.indcdor_tpo_dto,
                               f.indcdor_frmlrio_atrbto_hmlga,
                               f.fncion_frmlrio_atrbto_hmlga
                          from gi_g_declaraciones_detalle a
                          join gi_g_declaraciones b
                            on a.id_dclrcion = b.id_dclrcion
                          join gi_d_dclrcnes_vgncias_frmlr c
                            on b.id_dclrcion_vgncia_frmlrio =
                               c.id_dclrcion_vgncia_frmlrio

                          join ws_d_provedores_declrcn d
                            on c.id_frmlrio = d.id_frmlrio
                          join ws_d_provedores_dclrcn_itm e
                            on d.id_prvdor_dclrcion = e.id_prvdor_dclrcion
                           and e.orgn_extrccion = 'COL'
                           and e.cdgo_sccion = 'AC'
                          join ws_d_prvdors_dclrcn_hmlgcn f
                            on e.id_prvdor_dclrcion_itm =
                               f.id_prvdor_dclrcion_itm
                           and f.id_frmlrio_rgion_atrbto =
                               a.id_frmlrio_rgion_atrbto
                         where d.id_prvdor = p_id_prvdor
                           and a.id_dclrcion = p_id_dclrcion
                           and d.id_frmlrio = p_id_frmlrio
                           and a.fla = i) loop
          v_json_items_1.put('keyword', c_items.cdgo_item_prvdor);

          v_vlor := c_items.vlor;

          if c_items.cdgo_item_prvdor = 'code' then

            select cdgo_dclrcns_esqma_trfa
              into v_vlor
              from gi_d_dclrcns_esqma_trfa
             where id_dclrcns_esqma_trfa = to_number(c_items.vlor);

          end if;

          if c_items.indcdor_frmlrio_atrbto_hmlga = 'S' then

            if c_items.fncion_frmlrio_atrbto_hmlga = 'fnc_co_actvdad_tpo' then
              v_vlor := pkg_ws_pagos_placetopay.fnc_co_actvdad_tpo(p_id_prvdor   => p_id_prvdor,
                                                                   p_actvdad_tpo => c_items.vlor);
            end if;
          end if;

          v_json_items_1.put('value', v_vlor);

          if c_items.indcdor_tpo_dto = 'T' then
            v_json_items_1.put('value', v_vlor);
          else
            v_json_items_1.put('value', to_number(v_vlor));
          end if;

          json_array3.append(v_json_items_1);
        end loop;
        if v_cdgo_impsto_sbmpsto = 'SBT' then
          v_json_items_2.put('keyword', 'LIQUIDATION');
        else
          v_json_items_2.put('keyword', 'activities');
        end if;

        v_json_items_2.put('value', json_array3);
        json_array1.append(v_json_items_2);
      end loop;

      o_rspsta := json_array1.to_clob();

    elsif p_seccion in ('FD', 'FS') then

      -- Cursor para la firma del declarante (Obligatoria)
      for c_frma_dclrnte in (select distinct x.cdgo_item_prvdor,
                                             x.indcdor_frmlrio_atrbto_hmlga,
                                             x.Fncion_Frmlrio_Atrbto_Hmlga,
                                             x.indcdor_tpo_dto,
                                             case
                                               when x.vlor_extrccion = 'VL' then
                                                x.vlor
                                               when x.vlor_extrccion = 'VD' then
                                                x.vlor_dsplay
                                               when x.vlor_extrccion = 'VF' then
                                                x.vlor_fjo
                                             end as vlor
                               from (select d.cdgo_sccion,
                                            d.cdgo_item_prvdor,
                                            d.vlor_extrccion,
                                            d.indcdor_frmlrio_atrbto_hmlga,
                                            d.Fncion_Frmlrio_Atrbto_Hmlga,
                                            d.indcdor_tpo_dto,
                                            dbms_lob.substr(a.vlor, 4000, 1) vlor,
                                            dbms_lob.substr(a.vlor_dsplay,
                                                            4000,
                                                            1) vlor_dsplay,
                                            d.vlor_fjo
                                       from gi_g_declaraciones_detalle a
                                       join gi_g_declaraciones b
                                         on b.id_dclrcion = a.id_dclrcion
                                        and b.id_dclrcion = p_id_dclrcion
                                       join gi_d_dclrcnes_vgncias_frmlr c
                                         on b.id_dclrcion_vgncia_frmlrio =
                                            c.id_dclrcion_vgncia_frmlrio
                                      right join v_ws_d_prvdors_dclrcn_hmlgcn d
                                         on c.id_frmlrio = d.id_frmlrio
                                        and a.ID_FRMLRIO_RGION_ATRBTO =
                                            d.ID_FRMLRIO_RGION_ATRBTO
                                        and d.id_prvdor = p_id_prvdor
                                        and d.id_frmlrio = p_id_frmlrio
                                      where d.cdgo_sccion = 'FD') x
                              where (x.vlor is not null or
                                    x.vlor_fjo is not null)) loop
        v_vlor := c_frma_dclrnte.vlor;

        -- Si el atributo debe homologar con alguna funcion validamos que este en "S"
        if c_frma_dclrnte.indcdor_frmlrio_atrbto_hmlga = 'S' then
          -- Preguntar por la funcion usada para homologar el dato
          if c_frma_dclrnte.Fncion_Frmlrio_Atrbto_Hmlga =
             'fnc_co_tipo_identificacion' then
            v_vlor := pkg_ws_pagos_placetopay.fnc_co_tipo_identificacion(p_id_prvdor           => p_id_prvdor,
                                                                         p_cdgo_tpo_idntfccion => c_frma_dclrnte.vlor);
          elsif c_frma_dclrnte.Fncion_Frmlrio_Atrbto_Hmlga =
                'fnc_co_tipo_responsable' then
            v_vlor := pkg_ws_pagos_placetopay.fnc_co_tipo_responsable(p_id_prvdor         => p_id_prvdor,
                                                                      p_cdgo_rspnsble_tpo => c_frma_dclrnte.vlor);

          elsif c_frma_dclrnte.Fncion_Frmlrio_Atrbto_Hmlga =
                'fnc_co_clasificacion' then
            v_vlor := pkg_ws_pagos_placetopay.fnc_co_clasificacion(p_id_prvdor   => p_id_prvdor,
                                                                   p_id_sjto_tpo => c_frma_dclrnte.vlor);
          elsif c_frma_dclrnte.fncion_frmlrio_atrbto_hmlga =
                'fnc_co_nombres_firmante' then

            select trim(r.prmer_nmbre || ' ' || r.sgndo_nmbre)
              into v_vlor
              from si_i_sujetos_responsable r
             where r.id_sjto_rspnsble = c_frma_dclrnte.vlor;

          elsif c_frma_dclrnte.fncion_frmlrio_atrbto_hmlga =
                'fnc_co_apellidos_firmante' then

            select trim(r.prmer_aplldo || ' ' || r.sgndo_aplldo)
              into v_vlor
              from si_i_sujetos_responsable r
             where r.id_sjto_rspnsble = c_frma_dclrnte.vlor;
          else
            v_vlor := c_frma_dclrnte.vlor;
          end if;
        end if;

        if c_frma_dclrnte.indcdor_tpo_dto = 'N' then
          -- Si el dato es Numerico
          v_json_items_1.put(c_frma_dclrnte.cdgo_item_prvdor,
                             to_number(v_vlor));
        elsif c_frma_dclrnte.indcdor_tpo_dto = 'B' and
              lower(v_vlor) = 'true' then
          -- Si el dato es Booleano = "TRUE"
          v_json_items_1.put(c_frma_dclrnte.cdgo_item_prvdor, true);
        elsif c_frma_dclrnte.indcdor_tpo_dto = 'B' and
              lower(v_vlor) = 'false' then
          -- Si el dato es Booleano = "FALSE"
          v_json_items_1.put(c_frma_dclrnte.cdgo_item_prvdor, false);
        elsif c_frma_dclrnte.indcdor_tpo_dto = 'T' then
          -- Si el dato es Texto
          v_json_items_1.put(c_frma_dclrnte.cdgo_item_prvdor, v_vlor);
        end if;

      end loop;

      json_array1.append(v_json_items_1);

      v_cmpos_rqrdos := 0;

      -- Cursor para la firma secundaria (Opcional)
      for c_frma_scndria in (select distinct x.cdgo_item_prvdor,
                                             x.indcdor_frmlrio_atrbto_hmlga,
                                             x.Fncion_Frmlrio_Atrbto_Hmlga,
                                             x.indcdor_tpo_dto,
                                             x.orgn_extrccion,
                                             x.id_cnslta_dclrcion,
                                             x.vlor_extrccion,
                                             case
                                               when x.vlor_extrccion = 'VL' then
                                                x.vlor
                                               when x.vlor_extrccion = 'VD' then
                                                x.vlor_dsplay
                                               when x.vlor_extrccion = 'VF' then
                                                x.vlor_fjo
                                             end as vlor
                               from (select e.cdgo_sccion,
                                            e.cdgo_item_prvdor,
                                            e.vlor_extrccion,
                                            e.indcdor_frmlrio_atrbto_hmlga,
                                            e.Fncion_Frmlrio_Atrbto_Hmlga,
                                            e.orgn_extrccion,
                                            e.indcdor_tpo_dto,
                                            e.id_cnslta_dclrcion,
                                            dbms_lob.substr(a.vlor, 4000, 1) vlor,
                                            dbms_lob.substr(a.vlor_dsplay,
                                                            4000,
                                                            1) vlor_dsplay,
                                            e.vlor_fjo
                                       from gi_g_declaraciones_detalle a
                                       join gi_g_declaraciones b
                                         on b.id_dclrcion = a.id_dclrcion
                                        and b.id_dclrcion = p_id_dclrcion
                                       join gi_d_dclrcnes_vgncias_frmlr c
                                         on b.id_dclrcion_vgncia_frmlrio =
                                            c.id_dclrcion_vgncia_frmlrio
                                      right join v_ws_d_prvdors_dclrcn_hmlgcn e
                                         on c.id_frmlrio = e.id_frmlrio
                                        and a.ID_FRMLRIO_RGION_ATRBTO =
                                            e.ID_FRMLRIO_RGION_ATRBTO
                                        and e.id_prvdor = p_id_prvdor
                                        and e.id_frmlrio = p_id_frmlrio
                                      where e.cdgo_sccion = 'FS') x
                              where (x.vlor is not null or
                                    x.vlor_fjo is not null)) loop
        v_vlor := c_frma_scndria.vlor;

        if c_frma_scndria.vlor_extrccion in ('VL', 'VD') then
          v_cmpos_rqrdos := v_cmpos_rqrdos + 1;
        end if;

        -- dbms_output.put_line(c_frma_scndria.cdgo_item_prvdor|| ' -> '||v_vlor);

        if v_vlor is not null then

          if c_frma_scndria.orgn_extrccion = 'COL' then

            if c_frma_scndria.indcdor_frmlrio_atrbto_hmlga = 'S' then
              if c_frma_scndria.Fncion_Frmlrio_Atrbto_Hmlga =
                 'fnc_co_tipo_identificacion' then
                v_vlor := pkg_ws_pagos_placetopay.fnc_co_tipo_identificacion(p_id_prvdor           => p_id_prvdor,
                                                                             p_cdgo_tpo_idntfccion => c_frma_scndria.vlor);
              elsif c_frma_scndria.Fncion_Frmlrio_Atrbto_Hmlga =
                    'fnc_co_tipo_responsable' then
                v_vlor := pkg_ws_pagos_placetopay.fnc_co_tipo_responsable(p_id_prvdor         => p_id_prvdor,
                                                                          p_cdgo_rspnsble_tpo => c_frma_scndria.vlor);
              elsif c_frma_scndria.Fncion_Frmlrio_Atrbto_Hmlga =
                    'fnc_co_clasificacion' then
                v_vlor := pkg_ws_pagos_placetopay.fnc_co_clasificacion(p_id_prvdor   => p_id_prvdor,
                                                                       p_id_sjto_tpo => c_frma_scndria.vlor);
              elsif c_frma_scndria.fncion_frmlrio_atrbto_hmlga =
                    'fnc_co_nombres_firmante' then

                select trim(r.prmer_nmbre || ' ' || r.sgndo_nmbre)
                  into v_vlor
                  from si_i_sujetos_responsable r
                 where r.id_sjto_rspnsble = c_frma_scndria.vlor;

              elsif c_frma_scndria.fncion_frmlrio_atrbto_hmlga =
                    'fnc_co_apellidos_firmante' then

                select trim(r.prmer_aplldo || ' ' || r.sgndo_aplldo)
                  into v_vlor
                  from si_i_sujetos_responsable r
                 where r.id_sjto_rspnsble = c_frma_scndria.vlor;
              else
                v_vlor := c_frma_scndria.vlor;
              end if;
            end if;

          elsif c_frma_scndria.orgn_extrccion = 'SQL' then

            select cnslta_sql
              into v_sql
              from ws_d_prvdor_cnslta_dclrcion a
             where a.id_cnslta_dclrcion = c_frma_scndria.id_cnslta_dclrcion;

            if c_frma_scndria.indcdor_frmlrio_atrbto_hmlga = 'S' then
              v_vlor := c_frma_scndria.vlor;
            end if;

            execute immediate v_sql
              into v_vlor
              using p_id_dclrcion, v_vlor;

          end if;

          if c_frma_scndria.indcdor_tpo_dto = 'N' then
            -- Si el dato es Numerico
            v_json_items_2.put(c_frma_scndria.cdgo_item_prvdor,
                               to_number(v_vlor));
          elsif c_frma_scndria.indcdor_tpo_dto = 'B' and
                lower(v_vlor) = 'true' then
            -- Si el dato es Booleano = "TRUE"
            v_json_items_2.put(c_frma_scndria.cdgo_item_prvdor, true);
          elsif c_frma_scndria.indcdor_tpo_dto = 'B' and
                lower(v_vlor) = 'false' then
            -- Si el dato es Booleano = "FALSE"
            v_json_items_2.put(c_frma_scndria.cdgo_item_prvdor, false);
          elsif c_frma_scndria.indcdor_tpo_dto = 'T' then
            -- Si el dato es Texto
            v_json_items_2.put(c_frma_scndria.cdgo_item_prvdor, v_vlor);
          end if;

          --v_json_items_2.put(c_frma_scndria.cdgo_item_prvdor, v_vlor);
        else
          exit;
        end if;

      end loop;

      if v_cmpos_rqrdos > 0 then
        --if nvl(dbms_lob.getlength(regexp_replace(v_json_items_2.to_clob(), '(\{|\})', null)),0) > 0 then
        json_array1.append(v_json_items_2);
      end if;

      o_rspsta := json_array1.to_clob();

    elsif p_seccion = 'DP' then

      for c_dtos_prncpales in (select x.cdgo_item_prvdor,
                                      x.indcdor_frmlrio_atrbto_hmlga,
                                      x.Fncion_Frmlrio_Atrbto_Hmlga,
                                      x.indcdor_tpo_dto,
                                      x.orgn_extrccion,
                                      x.id_cnslta_dclrcion,
                                      case
                                        when x.vlor_extrccion = 'VL' and
                                             x.vlor is not null then
                                         x.vlor
                                        when x.vlor_extrccion = 'VD' and
                                             x.vlor_dsplay is not null then
                                         x.vlor_dsplay
                                        when x.vlor_extrccion = 'VF' and
                                             x.vlor_fjo is not null then
                                         x.vlor_fjo
                                      end as vlor
                                 from (select distinct e.cdgo_item_prvdor,
                                                       e.cdgo_sccion,
                                                       e.vlor_extrccion,
                                                       e.indcdor_frmlrio_atrbto_hmlga,
                                                       e.Fncion_Frmlrio_Atrbto_Hmlga,
                                                       e.indcdor_tpo_dto,
                                                       e.orgn_extrccion,
                                                       e.id_cnslta_dclrcion,
                                                       dbms_lob.substr(a.vlor,
                                                                       4000,
                                                                       1) vlor,
                                                       dbms_lob.substr(a.vlor_dsplay,
                                                                       4000,
                                                                       1) vlor_dsplay,
                                                       e.vlor_fjo
                                         from gi_g_declaraciones_detalle a
                                         join gi_g_declaraciones b
                                           on b.id_dclrcion = a.id_dclrcion
                                          and b.id_dclrcion = p_id_dclrcion
                                         join gi_d_dclrcnes_vgncias_frmlr c
                                           on b.id_dclrcion_vgncia_frmlrio =
                                              c.id_dclrcion_vgncia_frmlrio
                                        right join v_ws_d_prvdors_dclrcn_hmlgcn e
                                           on c.id_frmlrio = e.id_frmlrio
                                          and a.ID_FRMLRIO_RGION_ATRBTO =
                                              e.ID_FRMLRIO_RGION_ATRBTO
                                          and e.id_prvdor = p_id_prvdor
                                        where e.cdgo_sccion = p_seccion
                                          and e.id_frmlrio = p_id_frmlrio) x
                               --where (x.vlor is not null or x.vlor_fjo is not null or x.id_cnslta_dclrcion is not null)
                               ) loop
        v_vlor := c_dtos_prncpales.vlor;

        if c_dtos_prncpales.orgn_extrccion = 'COL' then

          -- Si el atributo debe homologar con alguna funcion validamos que este en "S"
          if c_dtos_prncpales.indcdor_frmlrio_atrbto_hmlga = 'S' then
            -- Preguntar por la funcion usada para homologar el dato
            if c_dtos_prncpales.Fncion_Frmlrio_Atrbto_Hmlga =
               'fnc_co_tipo_identificacion' then
              v_vlor := pkg_ws_pagos_placetopay.fnc_co_tipo_identificacion(p_id_prvdor           => p_id_prvdor,
                                                                           p_cdgo_tpo_idntfccion => c_dtos_prncpales.vlor);
            elsif c_dtos_prncpales.Fncion_Frmlrio_Atrbto_Hmlga =
                  'fnc_co_tipo_responsable' then
              v_vlor := pkg_ws_pagos_placetopay.fnc_co_tipo_responsable(p_id_prvdor         => p_id_prvdor,
                                                                        p_cdgo_rspnsble_tpo => c_dtos_prncpales.vlor);
            elsif c_dtos_prncpales.Fncion_Frmlrio_Atrbto_Hmlga =
                  'fnc_co_clasificacion' then
              v_vlor := pkg_ws_pagos_placetopay.fnc_co_clasificacion(p_id_prvdor   => p_id_prvdor,
                                                                     p_id_sjto_tpo => c_dtos_prncpales.vlor);
            elsif c_dtos_prncpales.Fncion_Frmlrio_Atrbto_Hmlga =
                  'fnc_co_codigo_departamento' then
              v_vlor := pkg_ws_pagos_placetopay.fnc_co_codigo_departamento(p_id_dprtmnto => c_dtos_prncpales.vlor);
            elsif c_dtos_prncpales.Fncion_Frmlrio_Atrbto_Hmlga =
                  'fnc_co_codigo_municipio' then
              v_vlor := pkg_ws_pagos_placetopay.fnc_co_codigo_municipio(p_id_mncpio => c_dtos_prncpales.vlor);
            else
              v_vlor := c_dtos_prncpales.vlor;
            end if;

          end if;

        elsif c_dtos_prncpales.orgn_extrccion = 'SQL' and
              c_dtos_prncpales.id_cnslta_dclrcion is not null then

          select cnslta_sql
            into v_sql
            from ws_d_prvdor_cnslta_dclrcion a
           where a.id_cnslta_dclrcion = c_dtos_prncpales.id_cnslta_dclrcion;

          execute immediate v_sql
            into v_vlor
            using p_id_dclrcion;
        else
          exit;
        end if;

        if c_dtos_prncpales.indcdor_tpo_dto = 'N' then
          -- Si el dato es Numerico
          v_json_items_1.put(c_dtos_prncpales.cdgo_item_prvdor,
                             to_number(v_vlor));
        elsif c_dtos_prncpales.indcdor_tpo_dto = 'B' and
              lower(v_vlor) = 'true' then
          -- Si el dato es Booleano = "TRUE"
          v_json_items_1.put(c_dtos_prncpales.cdgo_item_prvdor, true);
        elsif c_dtos_prncpales.indcdor_tpo_dto = 'B' and
              lower(v_vlor) = 'false' then
          -- Si el dato es Booleano = "FALSE"
          v_json_items_1.put(c_dtos_prncpales.cdgo_item_prvdor, false);
        elsif c_dtos_prncpales.indcdor_tpo_dto = 'T' then
          -- Si el dato es Texto
          v_json_items_1.put(c_dtos_prncpales.cdgo_item_prvdor, v_vlor);
        end if;

      end loop;

      o_rspsta := v_json_items_1.to_clob();

    end if;

  end prc_ob_items_declaracion;

  function fnc_co_tipo_identificacion(p_id_prvdor           in number,
                                      p_cdgo_tpo_idntfccion in varchar2)
    return varchar2 as
    v_cdgo_tpo_idntfccion varchar2(3);
  begin

    begin
      select cdgo_tpo_idntfccion_prvdor
        into v_cdgo_tpo_idntfccion
        from ws_d_prvdres_tpo_idntfccion
       where id_prvdor = p_id_prvdor
         and CDGO_IDNTFCCION_TPO = p_cdgo_tpo_idntfccion;
    exception
      when no_data_found then
        v_cdgo_tpo_idntfccion := 'X';
    end;

    return v_cdgo_tpo_idntfccion;

  end fnc_co_tipo_identificacion;

  function fnc_co_tipo_responsable(p_id_prvdor         in number,
                                   p_cdgo_rspnsble_tpo in varchar2)
    return varchar2 as
    v_cdgo_rspsbsble_prvdor varchar2(30);
  begin

    begin
      select cdgo_rspsbsble_prvdor
        into v_cdgo_rspsbsble_prvdor
        from ws_d_prvdres_rspnsble_tpo
       where id_prvdor = p_id_prvdor
         and cdgo_rspnsble_tpo = p_cdgo_rspnsble_tpo;
    exception
      when no_data_found then
        v_cdgo_rspsbsble_prvdor := 'GENERIC';
    end;

    return v_cdgo_rspsbsble_prvdor;

  end fnc_co_tipo_responsable;

  function fnc_co_clasificacion(p_id_prvdor   in number,
                                p_id_sjto_tpo in number) return varchar2 as
    v_cdgo_rgmen_prvdor varchar2(50);
  begin
    begin
      select cdgo_rgmen_prvdor
        into v_cdgo_rgmen_prvdor
        from ws_d_provedores_clasifccion
       where id_prvdor = p_id_prvdor
         and id_sjto_tpo = p_id_sjto_tpo;
    exception
      when no_data_found then
        v_cdgo_rgmen_prvdor := 'OTHER';
    end;

    return v_cdgo_rgmen_prvdor;

  end fnc_co_clasificacion;

  function fnc_co_codigo_departamento(p_id_dprtmnto in number)
    return varchar2 is
    v_cdgo_dprtmnto varchar2(3);
  begin

    begin
      select cdgo_dprtmnto --substr(cdgo_dprtmnto,3,3)
        into v_cdgo_dprtmnto
        from df_s_departamentos
       where id_dprtmnto = p_id_dprtmnto;
    exception
      when others then
        v_cdgo_dprtmnto := '###';
    end;

    return v_cdgo_dprtmnto;

  end fnc_co_codigo_departamento;

  function fnc_co_codigo_municipio(p_id_mncpio in number) return varchar2 is
    v_cdgo_mncpio varchar2(3);
  begin

    begin
      select substr(cdgo_mncpio, 3, 3)
        into v_cdgo_mncpio
        from df_s_municipios
       where id_mncpio = p_id_mncpio;
    exception
      when others then
        v_cdgo_mncpio := '###';
    end;

    return v_cdgo_mncpio;

  end fnc_co_codigo_municipio;

  function fnc_co_actvdad_tpo(p_id_prvdor   in number,
                              p_actvdad_tpo in varchar2) return varchar2 as
    v_actvdad_tpo_prvdor varchar2(100);
  begin
    begin
      select actvdad_tpo_prvdor
        into v_actvdad_tpo_prvdor
        from ws_d_prvdores_actvdad_tpo
       where id_prvdor = p_id_prvdor
         and actvdad_tpo = p_actvdad_tpo;
    exception
      when no_data_found then
        v_actvdad_tpo_prvdor := 'OTHER';
    end;

    return v_actvdad_tpo_prvdor;

  end fnc_co_actvdad_tpo;

  procedure prc_co_pdf_base64(p_cdgo_clnte   in number,
                              p_id_prvdor    in number,
                              o_cdgo_rspsta  out number,
                              o_mnsje_rspsta out varchar2) as

    v_count       number := 0;
    v_clob_header clob;
    v_url         varchar2(1000);
    v_cdgo_mnjdor varchar2(10);
    v_rcdos       number;
    v_nl          number;
    v_nmbre_up    sg_d_configuraciones_log.nmbre_up%type := 'pkg_ws_pagos_placetopay.prc_co_pdf_base64';

  begin

    v_nl           := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte,
                                                  null,
                                                  v_nmbre_up);
    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'inicio del procedimiento ' || v_nmbre_up;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          o_mnsje_rspsta,
                          1);

    -- Consultar datos del Endpoint para el metodo Income-pdf
    begin
      select a.url, a.cdgo_mnjdor
        into v_url, v_cdgo_mnjdor
        from ws_d_provedores_api a
       where a.id_prvdor = p_id_prvdor
         and a.cdgo_api = 'IPDF'; -- IPDF: Income-PDF
    exception
      when others then
        o_cdgo_rspsta  := 10;
        o_mnsje_rspsta := 'No se pudo obtener los datos de la peticion[PDCL]';
        return;
    end;

    -- Limpiar cabeceras
    --   APEX_WEB_SERVICE.g_request_headers.delete();
    --  v_clob_header := null;

    -- Recorrer las transacciones aprobadas
    for c_trnscciones in (select a.id_pgdor_dcmnto,
                                 a.request_id,
                                 a.id_impsto,
                                 a.id_impsto_sbmpsto,
                                 a.id_orgen,
                                 a.cdgo_frmlrio
                            from re_g_pagadores_documento a
                           where a.cdgo_clnte = p_cdgo_clnte
                             and a.id_prvdor = p_id_prvdor
                             and a.id_impsto in
                                 (p_cdgo_clnte || 2, p_cdgo_clnte || 8)
                             and a.indcdor_estdo_trnsccion = 'AP'
                             and a.cdgo_orgn_tpo = 'DL'
                             and a.request_id is not null
                             and a.cdgo_frmlrio is not null
                             and not exists
                           (select 1
                                    from gi_g_dclrcnes_arhvos_adjnto b
                                   where b.id_dclrcion = a.id_orgen)) loop

      -- Validar si realmente tiene un recaudo aplicado.
      select count(1)
        into v_rcdos
        from re_g_recaudos
       where id_orgen = c_trnscciones.id_orgen
         and cdgo_rcdo_orgn_tpo = 'DL'
         and cdgo_rcdo_estdo = 'AP';

      if v_rcdos = 0 then
        o_cdgo_rspsta  := 20;
        o_mnsje_rspsta := 'Validar declaracion #' || c_trnscciones.id_orgen ||
                          ' debido a que la transaccion ha sido Aprobada pero no se encuentra recaudo Aplicado.';
        continue;
      end if;

      begin
        -- Llamar al procedimiento auxiliar para procesar la transaccion
        pkg_ws_pagos_placetopay.prc_rg_pdf_base64(p_cdgo_clnte        => p_cdgo_clnte,
                                                  p_id_prvdor         => p_id_prvdor,
                                                  p_url               => v_url,
                                                  p_cdgo_mnjdor       => v_cdgo_mnjdor,
                                                  p_id_impsto         => c_trnscciones.id_impsto,
                                                  p_id_orgen          => c_trnscciones.id_orgen,
                                                  p_id_impsto_sbmpsto => c_trnscciones.id_impsto_sbmpsto,
                                                  p_request_id        => c_trnscciones.request_id,
                                                  p_cdgo_frmlrio      => c_trnscciones.cdgo_frmlrio,
                                                  o_cdgo_rspsta       => o_cdgo_rspsta,
                                                  o_mnsje_rspsta      => o_mnsje_rspsta);

      exception
        when others then
          o_cdgo_rspsta  := 30;
          o_mnsje_rspsta := 'error en procesamiento, . detalle: ' ||
                            sqlerrm;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                o_mnsje_rspsta,
                                3);
      end;

    end loop;

  exception
    when others then
      rollback;
      o_cdgo_rspsta  := 999;
      o_mnsje_rspsta := 'Error al consultar PDF en Base 64 de la declaracion. ' ||
                        sqlerrm;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            3);

  end prc_co_pdf_base64;

  procedure prc_rg_pdf_base64(p_cdgo_clnte        in number,
                              p_id_prvdor         in number,
                              p_url               in varchar2,
                              p_cdgo_mnjdor       in varchar2,
                              p_id_impsto         in number,
                              p_id_impsto_sbmpsto in number,
                              p_id_orgen          in number,
                              p_request_id        in clob,
                              p_cdgo_frmlrio      in varchar2 default null,
                              o_cdgo_rspsta       out number,
                              o_mnsje_rspsta      out varchar2) as
    v_rspsta               clob;
    v_estdo_rspsta         varchar2(20);
    v_nmbre_dcmnto         varchar2(100);
    v_dcmnto_b64           clob := empty_clob();
    v_clob_body            clob;
    v_json                 json_object_t;
    v_id_dclrcn_archvo_tpo number;
    v_blob                 blob;
    v_cntdad_dcmntos       number;
    v_login                varchar2(100);
    v_secretkey            varchar2(100);
    v_locale               varchar2(10);
    v_count                number := 0;
    v_clob_header          clob;
    v_nl                   number;
    v_nmbre_up             sg_d_configuraciones_log.nmbre_up%type := 'pkg_ws_pagos_placetopay.prc_rg_pdf_base64';

  begin

    v_nl           := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte,
                                                  null,
                                                  v_nmbre_up);
    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'inicio del procedimiento ' || v_nmbre_up;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          o_mnsje_rspsta,
                          1);

    -- Limpiar cabeceras
    APEX_WEB_SERVICE.g_request_headers.delete();
    v_clob_header := null;

    -- Si no se han seteado las cabeceras de la peticion.
    if v_clob_header is null then
      begin
        select json_arrayagg(json_object('clave' value a.nmbre_prpdad,
                                         'valor' value d.vlor))
          into v_clob_header
          from ws_d_provedor_propiedades a
          join ws_d_provedores_prpddes_api b
            on a.id_prvdor_prpdde = b.id_prvdor_prpdde
          join ws_d_provedores_api c
            on b.id_prvdor_api = c.id_prvdor_api
          join ws_d_prvdor_prpddes_impsto d
            on a.id_prvdor_prpdde = d.id_prvdor_prpdde
         where d.cdgo_clnte = p_cdgo_clnte
           and d.id_impsto = p_id_impsto
           and c.cdgo_api = 'IPDF'
           and a.cdgo_prpdad = 'TPE';
      exception
        when others then
          o_cdgo_rspsta  := 10;
          o_mnsje_rspsta := 'No se pudieron setear los headers de la peticion.';
          return;
      end;

      -- Setear las cabeceras que se envian a PlaceToPay
      for h in (select clave, valor
                  from json_table(v_clob_header,
                                  '$[*]'
                                  columns(clave varchar2 path '$.clave',
                                          valor varchar2 path '$.valor'))) loop

        v_count := v_count + 1;
        APEX_WEB_SERVICE.g_request_headers(v_count).name := h.clave;
        APEX_WEB_SERVICE.g_request_headers(v_count).value := h.valor;

      end loop;

    end if;

    -- Consultar propiedades
    v_login := fnc_ob_propiedad_provedor(p_cdgo_clnte        => p_cdgo_clnte,
                                         p_id_impsto         => p_id_impsto,
                                         p_id_impsto_sbmpsto => p_id_impsto_sbmpsto,
                                         p_id_prvdor         => p_id_prvdor,
                                         p_cdgo_frmlrio      => p_cdgo_frmlrio,
                                         p_cdgo_prpdad       => 'USR');

    v_secretkey := fnc_ob_propiedad_provedor(p_cdgo_clnte        => p_cdgo_clnte,
                                             p_id_impsto         => p_id_impsto,
                                             p_id_impsto_sbmpsto => p_id_impsto_sbmpsto,
                                             p_id_prvdor         => p_id_prvdor,
                                             p_cdgo_frmlrio      => p_cdgo_frmlrio,
                                             p_cdgo_prpdad       => 'SKY');

    v_locale := fnc_ob_propiedad_provedor(p_cdgo_clnte        => p_cdgo_clnte,
                                          p_id_impsto         => p_id_impsto,
                                          p_id_impsto_sbmpsto => p_id_impsto_sbmpsto,
                                          p_id_prvdor         => p_id_prvdor,
                                          p_cdgo_prpdad       => 'LCL');

    -- Construccion del Body
    select json_object('authorization' value
                       json_object('username' value v_login,
                                   'secret' value v_secretkey),
                       'locale' value v_locale,
                       'requestId' value p_request_id)
      into v_clob_body
      from dual;

    insert into sg_g_log_placetopay
      (v_001, c_001, d_001, t_001)
    values
      ('prc_rg_pdf_base64 REQUEST BODY', v_clob_body, sysdate, sysdate);
    COMMIT;

    -- Llamado al webservice de PlaceToPay
    v_rspsta := APEX_WEB_SERVICE.make_rest_request(p_url         => p_url,
                                                   p_http_method => p_cdgo_mnjdor,
                                                   p_body        => v_clob_body,
                                                   p_wallet_path => l_wallet.wallet_path,
                                                   p_wallet_pwd  => l_wallet.wallet_pwd);

    insert into sg_g_log_placetopay
      (v_001, c_001, d_001, t_001)
    values
      ('prc_rg_pdf_base64 v_rspsta', v_rspsta, sysdate, sysdate);
    COMMIT;

    -- Si se obtuvo una respuesta.
    if v_rspsta is not null then

      -- Si la respuesta obtenida viene en formato JSON.
      if v_rspsta is json then

        -- Obtenemos el estado de la respuesta.
        v_estdo_rspsta := json_value(v_rspsta, '$.status');

        -- Si la respuesta fue exitosa.
        if v_estdo_rspsta = 'SUCCESS' then

          -- Obtenemos los datos asociados al PDF o documento a almacenar.
          v_nmbre_dcmnto := json_value(v_rspsta, '$.reference');
          v_json         := json_object_t.parse(v_rspsta);
          v_dcmnto_b64   := v_json.get_clob('pdf');
          v_blob         := base64decode(v_dcmnto_b64);

          begin

            select d.id_dclrcn_archvo_tpo
              into v_id_dclrcn_archvo_tpo
              from gi_d_dclrcnes_vgncias_frmlr a
              join gi_d_dclrcnes_tpos_vgncias b
                on b.id_dclrcion_tpo_vgncia = a.id_dclrcion_tpo_vgncia
              join gi_g_declaraciones c
                on c.id_dclrcion_vgncia_frmlrio =
                   a.id_dclrcion_vgncia_frmlrio
              join gi_d_dclrcnes_archvos_tpo d
                on d.id_dclrcn_tpo = b.id_dclrcn_tpo
              join gi_d_subimpuestos_adjnto_tp e
                on e.id_sbmpto_adjnto_tpo = d.id_sbmpto_adjnto_tpo
             where c.id_dclrcion = p_id_orgen
               and e.dscrpcion_adjnto_tpo not like '%HISTORICAS%';
          exception
            when others then
              o_cdgo_rspsta  := 20;
              o_mnsje_rspsta := 'Error al intentar consultar el tipo de archivo de la declaracion. ' ||
                                sqlerrm;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta,
                                    3);
              return;
          end;

          -- Validar si la declaracion tiene documentos cargados.
          begin

            select count(1)
              into v_cntdad_dcmntos
              from gi_g_dclrcnes_arhvos_adjnto
             where id_dclrcion = p_id_orgen;

          exception
            when others then
              o_cdgo_rspsta  := 25;
              o_mnsje_rspsta := 'Error al intentar consultar si la declaracion tiene documentos cargados. ' ||
                                sqlerrm;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    o_mnsje_rspsta,
                                    3);
              return;
          end;

          -- Si no se encontraron documentos asociados a la declaracion.
          if v_cntdad_dcmntos = 0 then

            -- Almacenar el PDF de la declaracion obtenida.
            begin
              insert into gi_g_dclrcnes_arhvos_adjnto
                (id_dclrcion,
                 id_dclrcn_archvo_tpo,
                 file_blob,
                 file_name,
                 file_mimetype)
              values
                (p_id_orgen,
                 v_id_dclrcn_archvo_tpo,
                 v_blob,
                 v_nmbre_dcmnto,
                 'application/pdf');
            exception
              when others then
                o_cdgo_rspsta  := 30;
                o_mnsje_rspsta := 'Error al intentar guardar documento recibido. ' ||
                                  sqlerrm;
                return;
            end;
          else
            o_cdgo_rspsta  := 40;
            o_mnsje_rspsta := 'La declaracion #' || p_id_orgen ||
                              ' ya tiene documento asociado.';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  o_mnsje_rspsta,
                                  3);
            return;
          end if;

        else
          o_cdgo_rspsta  := 50;
          o_mnsje_rspsta := 'Proveedor: Error en la respuesta obtenida.';
          return;
        end if;

      else
        o_cdgo_rspsta  := 60;
        o_mnsje_rspsta := 'El formato de la respuesta del servicio no se reconoce como una respuesta valida.';
        return;
      end if;
    else
      o_cdgo_rspsta  := 70;
      o_mnsje_rspsta := 'No se ha obtenido una respuesta de la peticion.';
      return;
    end if;

    commit;

  exception
    when others then
      rollback;
      o_cdgo_rspsta  := 999;
      o_mnsje_rspsta := 'Error al procesar transaccion. ' || sqlerrm;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            3);

  end prc_rg_pdf_base64;

  procedure prc_co_bancos(p_cdgo_clnte        in number,
                          p_id_impsto         in number,
                          p_id_impsto_sbmpsto in number,
                          p_id_prvdor         in number,
                          o_cdgo_rspsta       out number,
                          o_mnsje_rspsta      out varchar2) as
    v_url           ws_d_provedores_api.url%type;
    v_cdgo_mnjdor   ws_d_provedores_api.cdgo_mnjdor%type;
    v_headers       clob; --varchar2(200);
    v_count         number := 0;
    v_tken_gnrdo    varchar2(1000);
    v_rspsta_ptcion clob;
    v_bncos_lstdos  number;
    v_bncos_rtrndos number;
    v_error_ws      varchar2(2000);

    v_nonce      varchar2(100) := DBMS_RANDOM.STRING('u', 10);
    v_trankey    varchar2(1000);
    v_seed       varchar2(100);
    v_login      varchar2(100);
    v_secretkey  varchar2(100);
    v_expiration varchar2(100);
    v_clob_body  clob;
    v_rspsta     clob;
  begin

    --dbms_output.put_line ( 'p_cdgo_clnte' || p_cdgo_clnte || ' p_id_impsto ' || p_id_impsto ||  '  p_id_impsto_sbmpsto ' || p_id_impsto_sbmpsto );
    insert into sg_g_log_placetopay
      (v_001, v_002, c_001)
    values
      ('prc_co_bancos', 'inicia', p_id_prvdor);
    commit;
    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'OK';

    -- Validar si el listado de bancos del SYSDATE ya ha sido creada.
    select count(1)
      into v_bncos_lstdos
      from ws_d_provedores_banco
     where id_prvdor = p_id_prvdor
       and trunc(fcha_rgstro) = trunc(systimestamp);

    insert into sg_g_log_placetopay
      (v_001, v_002, c_001)
    values
      ('prc_co_bancos', 'v_bncos_lstdos', v_bncos_lstdos);
    commit;

    -- Si no existe la lista de bancos en el SYSDATE
    if v_bncos_lstdos = 0 then
      -- Borramos la informacion de la tabla
      delete from ws_d_provedores_banco;
      commit;
    else
      o_cdgo_rspsta  := 10;
      o_mnsje_rspsta := 'Ya existe un listado de bancos del dÃ­a de hoy.';
      return;
    end if;

    --Se obtiene la peticiÃ³n
    begin
      select a.url, a.cdgo_mnjdor
        into v_url, v_cdgo_mnjdor
        from ws_d_provedores_api a
       where a.id_prvdor = p_id_prvdor
         and a.cdgo_api = 'LBCS'; -- LBCS: Api parametrizada para listar bancos
    exception
      when others then
        o_cdgo_rspsta  := 15;
        o_mnsje_rspsta := 'No se pudo obtener los datos de la petición.';
        return;
    end;

    -- Consultar propiedades
    v_login := fnc_ob_propiedad_provedor(p_cdgo_clnte        => p_cdgo_clnte,
                                         p_id_impsto         => p_id_impsto,
                                         p_id_impsto_sbmpsto => p_id_impsto_sbmpsto,
                                         p_id_prvdor         => p_id_prvdor,
                                         p_cdgo_prpdad       => 'USRA');

    v_secretkey := fnc_ob_propiedad_provedor(p_cdgo_clnte        => p_cdgo_clnte,
                                             p_id_impsto         => p_id_impsto,
                                             p_id_impsto_sbmpsto => p_id_impsto_sbmpsto,
                                             p_id_prvdor         => p_id_prvdor,
                                             p_cdgo_prpdad       => 'SKYA');

    --Se construyen las cabecera para consultar el estado de la transacciÃ³n
    begin
      select json_arrayagg(json_object('clave' value a.nmbre_prpdad,
                                       'valor' value d.vlor))
        into v_headers
        from ws_d_provedor_propiedades a
        join ws_d_provedores_prpddes_api b
          on a.id_prvdor_prpdde = b.id_prvdor_prpdde
        join ws_d_provedores_api c
          on b.id_prvdor_api = c.id_prvdor_api
        join ws_d_prvdor_prpddes_impsto d
          on a.id_prvdor_prpdde = d.id_prvdor_prpdde
       where d.cdgo_clnte = p_cdgo_clnte
         and d.id_impsto = p_id_impsto
         and d.id_impsto_sbmpsto = p_id_impsto_sbmpsto
         and c.cdgo_api = 'LBCS'
         and a.cdgo_prpdad = 'TPE';

      insert into sg_g_log_placetopay
        (v_001, v_002, c_001)
      values
        ('prc_co_bancos', 'v_headers', v_headers);
      commit;

    exception
      when others then
        o_cdgo_rspsta  := 20;
        o_mnsje_rspsta := 'No se han podido obtener las cabeceras para realizar la peticion.';
        return;
    end;

    -- Limpiar cabeceras
    APEX_WEB_SERVICE.g_request_headers.delete();

    -- Setear las cabeceras que se envia
    for h in (select clave, valor
                from json_table(v_headers,
                                '$[*]' columns(clave varchar2 path '$.clave',
                                        valor varchar2 path '$.valor'))) loop

      v_count := v_count + 1;

      APEX_WEB_SERVICE.g_request_headers(v_count).name := h.clave;
      APEX_WEB_SERVICE.g_request_headers(v_count).value := h.valor;
    end loop;

    --insert into sg_g_log_placetopay(v_001, v_002, c_001)values('val_lista_bancos_paymentez', 'v_tken_gnrdo', v_tken_gnrdo); commit;
    v_seed  := to_char(systimestamp, 'YYYY-MM-DD') || 'T' ||
               to_char(systimestamp, 'HH24:MI:SSTZH:TZM');
    v_nonce := pkg_gn_generalidades.fnc_ge_to_base64(v_nonce);

    /* select utl_raw.cast_to_varchar2(
               utl_encode.base64_encode(
                           dbms_crypto.hash( utl_raw.cast_to_raw(v_nonce || v_seed || v_secretkey),dbms_crypto.hash_sh256  )
                                        )
                                    )
    into v_trankey
    from dual; */

    v_trankey := pkg_gn_generalidades.fnc_ge_to_base64(UTL_RAW.CAST_TO_VARCHAR2(STANDARD_HASH_OUTPUT(str    => v_nonce ||
                                                                                                               v_seed ||
                                                                                                               v_secretkey,
                                                                                                     method => 'SHA256')));

    insert into sg_g_log_placetopay
      (v_001, v_002, c_001)
    values
      ('prc_co_bancos', 'v_trankey', v_trankey);
    commit;

    v_expiration := to_char(sysdate + INTERVAL '15' MINUTE, 'YYYY-MM-DD') || 'T' ||
                    to_char(sysdate + INTERVAL '15' MINUTE, 'HH24:MI:SS') ||
                    '-05:00';

    /*dbms_output.put_line ( 'v_login : ' || v_login   );
    dbms_output.put_line ( 'v_secretkey : ' || v_secretkey   );
    dbms_output.put_line ( 'v_seed : ' || v_seed   );
    dbms_output.put_line ( 'v_trankey : ' || v_trankey   );
    dbms_output.put_line ( 'v_nonce : ' || v_nonce   ); */

    select json_object('auth' value json_object('login' value v_login,
                                   'tranKey' value v_trankey,
                                   'nonce' value
                                   pkg_gn_generalidades.fnc_ge_to_base64(v_nonce),
                                   'seed' value v_seed),
                       'instrument' value
                       json_object('redirection' value
                                   json_object('paymentMethod' value '_PSE_' --,
                                               -- 'returnURL'     value 'https://your-site.com/your-return-path'
                                               ))

                       )
      into v_clob_body
      from dual;

    insert into sg_g_log_placetopay
      (v_001, v_002, c_001)
    values
      ('prc_co_bancos', 'v_clob_body', v_clob_body);
    commit;

    --dbms_output.put_line ( 'v_clob_body : ' || v_clob_body   );
    -- Llamado al webservice de PlaceToPay
    v_rspsta := APEX_WEB_SERVICE.make_rest_request(p_url         => v_url, --'https://api.test.avalpaycenter.com/gateway/information'
                                                   p_http_method => v_cdgo_mnjdor, --'POST'
                                                   p_body        => v_clob_body,
                                                   p_wallet_path => l_wallet.wallet_path,
                                                   p_wallet_pwd  => l_wallet.wallet_pwd);

    insert into sg_g_log_placetopay
      (v_001, v_002, c_001)
    values
      ('prc_co_bancos', 'v_rspsta', v_rspsta);
    commit;

    /*
    {
       "status":{
          "status":"OK",
          "reason":"00",
          "message":"La petici\u00f3n se ha procesado correctamente",
          "date":"2025-03-04T16:54:33+00:00"
       },
       "provider":"ACH",
       "serviceCode":"_PSE_",
       "requireRedirection":true,
       "bankList":[
          {
             "description":"BANCO AV VILLAS",
             "code":"1052"
          },
          {
             "description":"BANCOLOMBIA",
             "code":"1007"
          },
          {
             "description":"BANCO UNION COLOMBIANO",
             "code":"1022"
          },
          {
             "description":"ITAU",
             "code":"1014"
          },
          {
             "description":"NEQUI",
             "code":"1507"
          },
          {
             "description":"Placetopay Bank",
             "code":"9999"
          },
          {
             "description":"SCOTIABANK COLPATRIA S.A",
             "code":"1019"
          }
       ],
       "cardType":null,
       "cardTypes":null,
       "displayInterest":false,
       "requireOtp":false,
       "requireCvv2":false,
       "threeDS":"unsupported",
       "credits":[
       ]
    }
    */

    if v_rspsta is not null then
      if json_value(v_rspsta, '$.status.status') != 'OK' then
        o_cdgo_rspsta  := 25;
        o_mnsje_rspsta := 'Proveedor: ' ||
                          json_value(v_rspsta, '$.status.message'); --OJO REVISAR CUANDO SALE ERROR
        return;
      end if;
    end if;

    if v_rspsta is not null then

      -- Validamos si el servicio responde correctamente, a traves de la propiedad "banks"
      select count(cdgo_bnco)
        into v_bncos_rtrndos
        from json_table(v_rspsta,
                        '$.bankList[*]'
                        columns(cdgo_bnco varchar2 path '$.code',
                                nmbre_bnco varchar2 path '$.description'))
       where cdgo_bnco <> 0;

      -- Si nos retorna 1 o mÃ¡s bancos, procedemos a crear el listado.
      if v_bncos_rtrndos > 0 then
        -- Llenado de bancos en la tabla
        for c_bncos_prvdor in (select cdgo_bnco, nmbre_bnco
                                 from json_table(v_rspsta,
                                                 '$.bankList[*]'
                                                 columns(cdgo_bnco varchar2 path
                                                         '$.code',
                                                         nmbre_bnco varchar2 path
                                                         '$.description'))
                                where cdgo_bnco <> 0) loop
          begin
            insert into ws_d_provedores_banco
              (id_prvdor, cdgo_bnco, nmbre_bnco)
            values
              (p_id_prvdor,
               c_bncos_prvdor.cdgo_bnco,
               c_bncos_prvdor.nmbre_bnco);
          exception
            when others then
              o_cdgo_rspsta  := 30;
              o_mnsje_rspsta := 'Error al intentar registrar listado de bancos.';
              return;
          end;

        end loop;
      else
        o_cdgo_rspsta  := 35;
        o_mnsje_rspsta := 'El servicio ha retornado un error.';
        return;
      end if;
    else
      o_cdgo_rspsta  := 40;
      o_mnsje_rspsta := 'No se obtuvo respuesta del servicio.';
      return;
    end if;

    commit;

  exception
    when others then
      select utl_http.get_detailed_sqlerrm into v_error_ws from dual;
      --insert into sg_g_log_placetopay(v_001, c_001, t_001) values('prc_co_bancos v_error_ws:', v_error_ws, systimestamp); commit;
      dbms_output.put_line('v_error_ws: ' || v_error_ws);

      o_cdgo_rspsta  := 99;
      o_mnsje_rspsta := 'Error al intentar consultar listado de bancos.' ||
                        sqlerrm;
  end prc_co_bancos;

  procedure prc_ho_estado_transaccion(p_id_prvdor       IN NUMBER,
                                      p_rspsta_trzbldad IN CLOB,
                                      p_cdgo_impsto     IN VARCHAR2,
                                      p_cdgo_orgn_tpo   IN VARCHAR2,
                                      p_url_ntfccion    in varchar2 default 'N',
                                      o_estdo_trnsccion OUT VARCHAR2,
                                      o_cdgo_rspsta     OUT NUMBER,
                                      o_mnsje_rspsta    OUT VARCHAR2) AS
    v_estado          VARCHAR2(20);
    v_reason          VARCHAR2(20);
    v_estdo_trnsccion VARCHAR2(10);
    e_expcion_intrna  EXCEPTION;
  BEGIN
    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := NULL;

    IF p_rspsta_trzbldad IS NOT NULL THEN
      -- Normalizamos vocales (aunque no hace cambios)
      -- Se mantiene por consistencia con el código original
      -- No realiza cambios porque los caracteres son los mismos
      -- pero se deja por si se modifica la lógica luego

      -- Validamos si es JSON
      IF p_rspsta_trzbldad IS JSON THEN
        BEGIN
          IF (p_cdgo_impsto = 'ICA' or p_cdgo_impsto = 'SBT') AND
             p_cdgo_orgn_tpo = 'DL' and p_url_ntfccion = 'N' THEN
            BEGIN
              SELECT UPPER(estado)
                INTO v_estado
                FROM JSON_TABLE(p_rspsta_trzbldad,
                                '$.income'
                                COLUMNS(estado VARCHAR2(20) PATH '$.status'));
            EXCEPTION
              WHEN NO_DATA_FOUND THEN
                v_estado := 'DESCONOCIDO';
            END;
          ELSE
            SELECT UPPER(estado), UPPER(reason)
              INTO v_estado, v_reason
              FROM JSON_TABLE(p_rspsta_trzbldad,
                              '$.status'
                              COLUMNS(estado VARCHAR2(20) PATH '$.status',
                                      reason VARCHAR2(20) PATH '$.reason'));

            INSERT INTO sg_g_log_placetopay
              (v_001, c_001, d_001)
            VALUES
              ('prc_co_transacciones v_estado', v_estado, SYSDATE);

            INSERT INTO sg_g_log_placetopay
              (v_001, c_001, d_001)
            VALUES
              ('prc_co_transacciones v_reason', v_reason, SYSDATE);
            COMMIT;
          END IF;
        END;
      ELSE
        -- No es JSON válido
        v_estado := 'DESCONOCIDO';
      END IF;
    END IF;

    -- Mapeo de estados internos
    BEGIN
      SELECT cdgo_estdo_hmlgdo
        INTO v_estdo_trnsccion
        FROM ws_d_provedores_estados
       WHERE id_prvdor = p_id_prvdor
         AND dscrpcion_estdo = v_estado;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        o_cdgo_rspsta  := 4;
        o_mnsje_rspsta := 'El estado "' || v_estado ||
                          '" no se encuentra parametrizado.';
        return;
      WHEN OTHERS THEN
        v_estdo_trnsccion := 'PE';
    END;

    -- Reglas adicionales específicas
    IF v_estado = 'APPROVED' OR v_estado = 'PRESENTED' THEN
      v_estdo_trnsccion := 'AP';
    ELSIF v_estado = 'FAILED' THEN
      v_estdo_trnsccion := 'FA';
    ELSIF v_estado = 'REJECTED' AND v_reason = '?C' THEN
      v_estdo_trnsccion := 'RE_CU';
    ELSIF v_estado = 'REJECTED' AND v_reason = 'EX' THEN
      v_estdo_trnsccion := 'RE_EX';
    ELSIF v_estado = 'REJECTED' THEN
      v_estdo_trnsccion := 'RE';
    ELSIF v_estado = 'PENDING' THEN
      v_estdo_trnsccion := 'PE';
    ELSIF v_estado = 'INICIADA' THEN
      v_estdo_trnsccion := 'IN';
    ELSIF v_estado = 'DESCONOCIDO' THEN
      v_estdo_trnsccion := 'FA';
    END IF;

    INSERT INTO sg_g_log_placetopay
      (v_001, c_001, d_001)
    VALUES
      ('prc_co_transacciones v_estdo_trnsccion',
       v_estdo_trnsccion,
       SYSDATE);
    COMMIT;

    -- Salida final
    o_estdo_trnsccion := v_estdo_trnsccion;

  EXCEPTION
    WHEN e_expcion_intrna THEN
      -- ya se seteó o_cdgo_rspsta y o_mnsje_rspsta
      o_estdo_trnsccion := NULL;
    WHEN OTHERS THEN
      o_cdgo_rspsta     := 5;
      o_mnsje_rspsta    := 'Error inesperado al homologar: ' || SQLERRM;
      o_estdo_trnsccion := 'PE';
  END;

end pkg_ws_pagos_placetopay;
/

