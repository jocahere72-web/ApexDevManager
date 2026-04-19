
  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PKG_GI_INTERFAZ_CONTRATOS" as

  procedure prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int in number,
                                     p_cdgo_rspsta               in number,
                                     p_mnsje_rspsta              in varchar2) as
    PRAGMA autonomous_transaction;

  begin
    update gi_g_rntas_cntrto_extrno_int
       set cdgo_rspsta  = p_cdgo_rspsta,
           mnsje_rspsta = p_mnsje_rspsta,
           estdo        = 'ERROR'
     where id_rnta_cntrto_extrno_int = p_id_rnta_cntrto_extrno_int;
    commit;
  exception
    when others then
      rollback;
      return;
  end prc_rg_respuesta_externo;

  procedure prc_rg_informacion_externo as

    v_id_entidad   df_s_entidades.id_entdad%type;
    v_estdo        gi_g_rentas_contrato_externo.estdo%type;
    v_cdgo_rspsta  number;
    v_mnsje_rspsta varchar2(1000);
    v_json_cntrto  clob;

  begin
    --se recorre la tabla con los registros que esten en estado REGISTRADO
    --se validan los campos obligatorios
    for c_cntrtos in (select *
                        from gi_g_rntas_cntrto_extrno_int
                       where estdo = 'REGISTRADO') loop

      --Se busca la entidad
      begin
        select id_entdad
          into v_id_entidad
          from df_s_entidades
         where id_entdad = c_cntrtos.id_entdad;
      exception
        when others then
          prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int => c_cntrtos.id_rnta_cntrto_extrno_int,
                                   p_cdgo_rspsta               => 4,
                                   p_mnsje_rspsta              => 'El id de Entidad enviado ' ||
                                                                  c_cntrtos.id_entdad ||
                                                                  ', no existe.');
          continue;
      end;

      --Se valida si ya existe el contrato registrado
      begin
        select estdo
          into v_estdo
          from gi_g_rentas_contrato_externo
         where id = c_cntrtos.id;

        prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int => c_cntrtos.id_rnta_cntrto_extrno_int,
                                 p_cdgo_rspsta               => 6,
                                 p_mnsje_rspsta              => 'El id del contrato ya existe, en encuentra en estado : ' ||
                                                                v_estdo);
        continue;
      exception
        when no_data_found then
          null;
        when others then
          prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int => c_cntrtos.id_rnta_cntrto_extrno_int,
                                   p_cdgo_rspsta               => 7,
                                   p_mnsje_rspsta              => 'No se pudo consultar el id del contrato id : ' ||
                                                                  c_cntrtos.id || '-' ||
                                                                  SQLERRM);
          continue;
      end;

      if c_cntrtos.id is null then
        prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int => c_cntrtos.id_rnta_cntrto_extrno_int,
                                 p_cdgo_rspsta               => 10,
                                 p_mnsje_rspsta              => 'El Id de la transacción es requerido.');
        continue;
      elsif c_cntrtos.nmro_cntrto is null then
        prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int => c_cntrtos.id_rnta_cntrto_extrno_int,
                                 p_cdgo_rspsta               => 11,
                                 p_mnsje_rspsta              => 'El Número del Contrato es requerido.');
        continue;
      elsif c_cntrtos.objto is null then
        prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int => c_cntrtos.id_rnta_cntrto_extrno_int,
                                 p_cdgo_rspsta               => 12,
                                 p_mnsje_rspsta              => 'El Objeto del Contrato es requerido.');
        continue;
      elsif c_cntrtos.fcha_incio_cntrto is null then
        prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int => c_cntrtos.id_rnta_cntrto_extrno_int,
                                 p_cdgo_rspsta               => 13,
                                 p_mnsje_rspsta              => 'La fecha de Inicio del Contrato es requerida.');
        continue;
      elsif c_cntrtos.vlor_cntrto_inclye_iva is null then
        prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int => c_cntrtos.id_rnta_cntrto_extrno_int,
                                 p_cdgo_rspsta               => 14,
                                 p_mnsje_rspsta              => 'El valor del contrato  con IVA es requerido.');
        continue;
      elsif c_cntrtos.vlor_cntrto_sin_iva is null then
        prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int => c_cntrtos.id_rnta_cntrto_extrno_int,
                                 p_cdgo_rspsta               => 15,
                                 p_mnsje_rspsta              => 'El valor del contrato  sin IVA es requerido.');
        continue;
      elsif c_cntrtos.vlor_iva is null then
        prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int => c_cntrtos.id_rnta_cntrto_extrno_int,
                                 p_cdgo_rspsta               => 16,
                                 p_mnsje_rspsta              => 'El valor del IVA es requerido.');
        continue;
      elsif c_cntrtos.tpo_cntrto is null then
        prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int => c_cntrtos.id_rnta_cntrto_extrno_int,
                                 p_cdgo_rspsta               => 17,
                                 p_mnsje_rspsta              => 'El tipo de Contrato es requerido.');
        continue;
      elsif c_cntrtos.prmer_nmbre is null then
        prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int => c_cntrtos.id_rnta_cntrto_extrno_int,
                                 p_cdgo_rspsta               => 21,
                                 p_mnsje_rspsta              => 'El primer nombre es requerido.');
        continue;
      elsif c_cntrtos.prmer_aplldo is null then
        prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int => c_cntrtos.id_rnta_cntrto_extrno_int,
                                 p_cdgo_rspsta               => 22,
                                 p_mnsje_rspsta              => 'El primer apellido es requerido.');
        continue;
      elsif c_cntrtos.drccion is null then
        prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int => c_cntrtos.id_rnta_cntrto_extrno_int,
                                 p_cdgo_rspsta               => 23,
                                 p_mnsje_rspsta              => 'La direccion es requerida.');
        continue;
      elsif c_cntrtos.correo is null then
        prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int => c_cntrtos.id_rnta_cntrto_extrno_int,
                                 p_cdgo_rspsta               => 24,
                                 p_mnsje_rspsta              => 'El correo es requerido.');
        continue;
      elsif c_cntrtos.tpo_prsna is null or
            c_cntrtos.tpo_prsna not in ('N', 'J') then
        prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int => c_cntrtos.id_rnta_cntrto_extrno_int,
                                 p_cdgo_rspsta               => 25,
                                 p_mnsje_rspsta              => 'El tipo de persona es requerida o los posibles valores son N (para persona Natural) o J (para persona Jurídica).');
        continue;
      elsif c_cntrtos.cdgo_idntfccion_tpo is null or
            c_cntrtos.cdgo_idntfccion_tpo not in ('C', 'E', 'T', 'P', 'N') then
        prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int => c_cntrtos.id_rnta_cntrto_extrno_int,
                                 p_cdgo_rspsta               => 26,
                                 p_mnsje_rspsta              => 'El tipo de identificacion es requerido o los posibles valores son C(CÉDULA DE CIUDADANÍA), E(CÉDULA DE EXTRANJERIA), T(TARJETA DE IDENTIDAD), P(PASAPORTES), N(No DE IDENTIFICACIÓN TRIBUTARIA');
        continue;
      elsif c_cntrtos.nmro_idntfccion is null then
        prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int => c_cntrtos.id_rnta_cntrto_extrno_int,
                                 p_cdgo_rspsta               => 27,
                                 p_mnsje_rspsta              => 'El número de identificacion es requerido.');
        continue;
      elsif c_cntrtos.cdgo_mncpio is null then
        prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int => c_cntrtos.id_rnta_cntrto_extrno_int,
                                 p_cdgo_rspsta               => 28,
                                 p_mnsje_rspsta              => 'El municipio es requerido.');
        continue;
      elsif c_cntrtos.cdgo_dprtmnto is null then
        prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int => c_cntrtos.id_rnta_cntrto_extrno_int,
                                 p_cdgo_rspsta               => 29,
                                 p_mnsje_rspsta              => 'El departamento es requerido.');
        continue;
      end if;
      --Fin se validan los campos obligatorios

      -- Se arma el json para enviarlo a registrar en la tabla de contratos
      -- y crear el sujeto impuesto si no existe

      select json_object('id_rnta_cntrto_extrno_int' value
                         c_cntrtos.id_rnta_cntrto_extrno_int,
                         'id' value id,
                         'id_entdad' value id_entdad,
                         'nmro_cntrto' value nmro_cntrto,
                         'objto' value objto,
                         'fcha_frma' value fcha_frma,
                         'fcha_incio_cntrto' value fcha_incio_cntrto,
                         'fcha_fin' value fcha_fin,
                         'vlor_cntrto_inclye_iva' value
                         vlor_cntrto_inclye_iva,
                         'vlor_cntrto_sin_iva' value vlor_cntrto_sin_iva,
                         'vlor_iva' value vlor_iva,
                         'tpo_cntrto' value tpo_cntrto,
                         'drcion_dias' value drcion_dias,
                         'dscrpcion_frma_pgo' value dscrpcion_frma_pgo,
                         'drcion' value drcion,
                         'cdgo_dpndncia' value cdgo_dpndncia,
                         'nmbre_dpndncia' value nmbre_dpndncia,
                         'cnsctvo_rp' value cnsctvo_rp,
                         'fcha_rp' value fcha_rp,
                         'rspnsble_de_iva' value rspnsble_de_iva,
                         'contratista' value
                         (select json_arrayagg(json_object('prmer_nmbre'
                                                           value prmer_nmbre,
                                                           'sgndo_nmbre' value
                                                           sgndo_nmbre,
                                                           'prmer_aplldo'
                                                           value prmer_aplldo,
                                                           'sgndo_aplldo'
                                                           value sgndo_aplldo,
                                                           'drccion' value
                                                           drccion,
                                                           'tlfno' value
                                                           trim(tlfno),
                                                           'correo' value
                                                           correo,
                                                           'tpo_prsna' value
                                                           tpo_prsna,
                                                           'cdgo_idntfccion_tpo'
                                                           value
                                                           cdgo_idntfccion_tpo,
                                                           'nmro_idntfccion'
                                                           value
                                                           nmro_idntfccion,
                                                           'cdgo_dprtmnto'
                                                           value cdgo_dprtmnto,
                                                           'cdgo_mncpio' value
                                                           cdgo_dprtmnto ||
                                                           cdgo_mncpio,
                                                           'tpo_rgmen' value
                                                           tpo_rgmen,
                                                           'nmbre_rzon_scial'
                                                           value
                                                           nmbre_rzon_scial)
                                               returning clob)
                            from dual))
        into v_json_cntrto
        from gi_g_rntas_cntrto_extrno_int
       where id_rnta_cntrto_extrno_int =
             c_cntrtos.id_rnta_cntrto_extrno_int;

      begin
        -- Se envia para registrar la informacion del contrato
        pkg_gi_interfaz_contratos.prc_rg_json_contrato(p_json         => v_json_cntrto,
                                                       o_cdgo_rspsta  => v_cdgo_rspsta,
                                                       o_mnsje_rspsta => v_mnsje_rspsta);
        /*  if  v_cdgo_rspsta != 0 then
            rollback;
            prc_rg_respuesta_externo(   p_id_rnta_cntrto_extrno_int     => c_cntrtos.id_rnta_cntrto_extrno_int,
                                        p_cdgo_rspsta                   => v_cdgo_rspsta,
                                        p_mnsje_rspsta                  => v_mnsje_rspsta);
            continue;
        end if;*/

      exception
        when others then
          rollback;
          prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int => c_cntrtos.id_rnta_cntrto_extrno_int,
                                   p_cdgo_rspsta               => 99,
                                   p_mnsje_rspsta              => 'Error al registrar la información del contrato. ');
          continue;
      end;

      -- Validamos Si hubo errores
      if (v_cdgo_rspsta != 0) then
        rollback;
        prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int => c_cntrtos.id_rnta_cntrto_extrno_int,
                                 p_cdgo_rspsta               => v_cdgo_rspsta,
                                 p_mnsje_rspsta              => v_mnsje_rspsta);
        continue;
      else
        update gi_g_rntas_cntrto_extrno_int
           set cdgo_rspsta  = v_cdgo_rspsta,
               mnsje_rspsta = v_mnsje_rspsta,
               estdo        = 'PROCESADO'
         where id_rnta_cntrto_extrno_int =
               c_cntrtos.id_rnta_cntrto_extrno_int;
        commit;
      end if;

    end loop;

    --Se buscan los contratos en estado procesado en la tabla gi_g_rentas_contrato_externo y que tengan id_rnta
    --Si ya estan pagos, actualizarlo en la intermedia gi_g_rntas_cntrto_extrno_int
    -- buscar el indicador de renta pagada
    -- buscar la base grevable
    -- buscar el valor pagado
    for c_cntrtos_prcsdos in (select a.id_rnta_cntrto_extrno_int,
                                     a.id_rnta_cntrto_extrno,
                                     a.id_rnta,
                                     e.vlor,
                                     c.indcdor_rnta_pgda,
                                     c.vlor_bse_grvble
                                from gi_g_rentas_contrato_externo a
                                join gi_g_rntas_cntrto_extrno_int b
                                  on a.id_rnta_cntrto_extrno_int =
                                     b.id_rnta_cntrto_extrno_int
                                 and (b.indcdor_rnta_pgda = 'N' or
                                     b.indcdor_rnta_pgda is null)
                                join gi_g_rentas c
                                  on c.id_rnta = a.id_rnta
                                 and c.indcdor_rnta_pgda = 'S'
                                join re_g_documentos d
                                  on d.id_dcmnto = c.id_dcmnto
                                 and d.indcdor_pgo_aplcdo = 'S'
                                join re_g_recaudos e
                                  on e.id_orgen = d.id_dcmnto
                               where a.estdo = 'PROCESADO'
                                 and a.id_rnta is not null) loop

      update gi_g_rntas_cntrto_extrno_int
         set id_rnta           = c_cntrtos_prcsdos.id_rnta,
             indcdor_rnta_pgda = c_cntrtos_prcsdos.indcdor_rnta_pgda,
             vlor_bse_grvble   = c_cntrtos_prcsdos.vlor_bse_grvble,
             vlor_pgdo         = c_cntrtos_prcsdos.vlor
       where id_rnta_cntrto_extrno_int =
             c_cntrtos_prcsdos.id_rnta_cntrto_extrno_int;

    end loop;

  end prc_rg_informacion_externo;

  procedure prc_rg_json_contrato(p_json         in clob,
                                 o_cdgo_rspsta  out number,
                                 o_mnsje_rspsta out varchar2) as

    v_cntdor                number;
    v_id_impsto             gi_d_rentas_configuracion.id_impsto%type;
    v_id_rnta_cntrto_extrno gi_g_rentas_contrato_externo.id_rnta_cntrto_extrno%type;

    v_cdgo_clnte          df_s_clientes.cdgo_clnte%type;
    v_id_pais_clnte       df_s_clientes.id_pais%type;
    v_id_dprtmnto_clnte   df_s_clientes.id_dprtmnto%type;
    v_id_mncpio_clnte     df_s_clientes.id_mncpio%type;
    v_id_dprtmnto         df_s_clientes.id_dprtmnto%type;
    v_id_mncpio           df_s_clientes.id_mncpio%type;
    v_id_sjto_impsto      si_i_sujetos_impuesto.id_sjto_impsto%type;
    v_json_sjto           clob;
    v_cdgo_dprtmnto       v_df_s_municipios.cdgo_dprtmnto%type;
    v_cdgo_mncpio         v_df_s_municipios.cdgo_mncpio%type;
    v_cdgo_dprtmnto_clnte df_s_departamentos.cdgo_dprtmnto%type;
    v_cdgo_mncpio_clnte   df_s_municipios.cdgo_mncpio%type;

  begin
    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'Informacion registrada correctamente';

    v_cntdor := 0;

    --Se busca la informacion del cliente
    begin
      select cdgo_clnte,
             id_dprtmnto,
             id_mncpio,
             (select cdgo_dprtmnto
                from df_s_departamentos
               where id_dprtmnto = a.id_dprtmnto) cdgo_dprtmnto,
             (select cdgo_mncpio
                from df_s_municipios
               where id_mncpio = a.id_mncpio) cdgo_mncpio
        into v_cdgo_clnte,
             v_id_dprtmnto_clnte,
             v_id_mncpio_clnte,
             v_cdgo_dprtmnto_clnte,
             v_cdgo_mncpio_clnte
        from df_s_clientes a;
    exception
      when others then
        o_cdgo_rspsta  := 5;
        o_mnsje_rspsta := 'No se encontro el código del cliente.';
        rollback;
        return;
    end;

    --Se busca el id_impsto de rentas
    begin
      select id_impsto
        into v_id_impsto
        from gi_d_rentas_configuracion
       where cdgo_clnte = v_cdgo_clnte;
    exception
      when others then
        o_cdgo_rspsta  := 5;
        o_mnsje_rspsta := 'No se encontro el código del cliente.';
        rollback;
        return;
    end;

    --DBMS_OUTPUT.PUT_LINE('********** p_json = ' || p_json);

    -- Se extraen los campos del json
    for c_cntrto in (select *
                       from json_table(p_json,
                                       '$[*]'
                                       columns(id varchar2 path '$.id',
                                               id_rnta_cntrto_extrno_int
                                               number path
                                               '$.id_rnta_cntrto_extrno_int',
                                               id_entdad number path
                                               '$.id_entdad',
                                               nmro_cntrto varchar2 path
                                               '$.nmro_cntrto',
                                               objto varchar2 path '$.objto',
                                               fcha_frma date path
                                               '$.fcha_frma',
                                               fcha_incio_cntrto date path
                                               '$.fcha_incio_cntrto',
                                               fcha_fin date path '$.fcha_fin',
                                               vlor_cntrto_inclye_iva number path
                                               '$.vlor_cntrto_inclye_iva',
                                               vlor_cntrto_sin_iva number path
                                               '$.vlor_cntrto_sin_iva',
                                               vlor_iva number path
                                               '$.vlor_iva',
                                               tpo_cntrto varchar2 path
                                               '$.tpo_cntrto',
                                               drcion_dias number path
                                               '$.drcion_dias',
                                               dscrpcion_frma_pgo varchar2 path
                                               '$.dscrpcion_frma_pgo',
                                               drcion varchar2 path '$.drcion',
                                               cdgo_dpndncia number path
                                               '$.cdgo_dpndncia',
                                               nmbre_dpndncia varchar2 path
                                               '$.nmbre_dpndncia',
                                               rspnsble_de_iva varchar2 path
                                               '$.rspnsble_de_iva',
                                               cnsctvo_rp number path
                                               '$.cnsctvo_rp',
                                               fcha_rp date path '$.fcha_rp',
                                               prmer_nmbre varchar2 path
                                               '$.contratista.prmer_nmbre',
                                               sgndo_nmbre varchar2 path
                                               '$.contratista.sgndo_nmbre',
                                               prmer_aplldo varchar2 path
                                               '$.contratista.prmer_aplldo',
                                               sgndo_aplldo varchar2 path
                                               '$.contratista.sgndo_aplldo',
                                               drccion varchar2 path
                                               '$.contratista.drccion',
                                               tlfno varchar2 path
                                               '$.contratista.tlfno',
                                               correo varchar2 path
                                               '$.contratista.correo',
                                               tpo_prsna varchar2 path
                                               '$.contratista.tpo_prsna',
                                               cdgo_idntfccion_tpo varchar2 path
                                               '$.contratista.cdgo_idntfccion_tpo',
                                               nmro_idntfccion varchar2 path
                                               '$.contratista.nmro_idntfccion',
                                               cdgo_dprtmnto varchar2 path
                                               '$.contratista.cdgo_dprtmnto',
                                               cdgo_mncpio varchar2 path
                                               '$.contratista.cdgo_mncpio',
                                               tpo_rgmen varchar2 path
                                               '$.contratista.tpo_rgmen',
                                               nmbre_rzon_scial varchar2 path
                                               '$.contratista.nmbre_rzon_scial'))) loop
      v_cntdor := v_cntdor + 1;

      -- Consultamos el Municipio
      begin
        select id_mncpio, id_dprtmnto, cdgo_dprtmnto, cdgo_mncpio
          into v_id_mncpio, v_id_dprtmnto, v_cdgo_dprtmnto, v_cdgo_mncpio
          from v_df_s_municipios
         where cdgo_mncpio = c_cntrto.cdgo_mncpio;
      exception
        when others then
          -- Municipio y Departamento por defecto
          v_id_mncpio := v_id_mncpio_clnte;
          begin
            select id_mncpio, id_dprtmnto, cdgo_dprtmnto, cdgo_mncpio
              into v_id_mncpio,
                   v_id_dprtmnto,
                   v_cdgo_dprtmnto,
                   v_cdgo_mncpio
              from v_df_s_municipios
             where id_mncpio = v_id_mncpio;
          exception
            when others then
              v_id_mncpio     := v_id_mncpio_clnte;
              v_id_dprtmnto   := v_id_dprtmnto_clnte;
              v_cdgo_dprtmnto := v_cdgo_dprtmnto_clnte;
              v_cdgo_mncpio   := v_cdgo_mncpio_clnte;
          end;
      end;

      begin
        insert into gi_g_rentas_contrato_externo
          (id,
           id_entdad,
           nmro_cntrto,
           objto,
           fcha_frma,
           fcha_incio_cntrto,
           fcha_fin,
           vlor_cntrto_inclye_iva,
           vlor_cntrto_sin_iva,
           vlor_iva,
           tpo_cntrto,
           drcion_dias,
           dscrpcion_frma_pgo,
           drcion,
           cdgo_dpndncia,
           nmbre_dpndncia,
           prmer_nmbre,
           sgndo_nmbre,
           prmer_aplldo,
           sgndo_aplldo,
           drccion,
           tlfno,
           correo,
           tpo_prsna,
           cdgo_idntfccion_tpo,
           nmro_idntfccion,
           cdgo_dprtmnto,
           cdgo_mncpio,
           tpo_rgmen,
           rspnsble_de_iva,
           cnsctvo_rp,
           fcha_rp,
           id_rnta_cntrto_extrno_int,
           nmbre_rzon_scial)
        values
          (c_cntrto.id,
           c_cntrto.id_entdad,
           c_cntrto.nmro_cntrto,
           c_cntrto.objto,
           c_cntrto.fcha_frma,
           c_cntrto.fcha_incio_cntrto,
           c_cntrto.fcha_fin,
           c_cntrto.vlor_cntrto_inclye_iva,
           c_cntrto.vlor_cntrto_sin_iva,
           c_cntrto.vlor_iva,
           c_cntrto.tpo_cntrto,
           c_cntrto.drcion_dias,
           c_cntrto.dscrpcion_frma_pgo,
           c_cntrto.drcion,
           c_cntrto.cdgo_dpndncia,
           c_cntrto.nmbre_dpndncia,
           c_cntrto.prmer_nmbre,
           c_cntrto.sgndo_nmbre,
           c_cntrto.prmer_aplldo,
           c_cntrto.sgndo_aplldo,
           c_cntrto.drccion,
           c_cntrto.tlfno,
           c_cntrto.correo,
           c_cntrto.tpo_prsna,
           c_cntrto.cdgo_idntfccion_tpo,
           c_cntrto.nmro_idntfccion,
           v_cdgo_dprtmnto - c_cntrto.cdgo_dprtmnto,
           v_cdgo_mncpio --c_cntrto.cdgo_mncpio
          ,
           c_cntrto.tpo_rgmen,
           c_cntrto.rspnsble_de_iva,
           c_cntrto.cnsctvo_rp,
           c_cntrto.fcha_rp,
           c_cntrto.id_rnta_cntrto_extrno_int,
           c_cntrto.nmbre_rzon_scial)
        returning id_rnta_cntrto_extrno into v_id_rnta_cntrto_extrno;
      exception
        when others then
          o_cdgo_rspsta  := 40;
          o_mnsje_rspsta := 'Error al insertar la información en gi_g_rentas_contrato_externo. ' ||
                            sqlerrm;
          rollback;
          return;
      end;

      -- Validamos si el sujeto impuesto existe
      begin
        select id_sjto_impsto
          into v_id_sjto_impsto
          from v_si_i_sujetos_impuesto
         where id_impsto = v_id_impsto
           and idntfccion_sjto = c_cntrto.nmro_idntfccion;

        --Se actualiza el id_sjto_impsto
        update gi_g_rentas_contrato_externo
           set id_sjto_impsto = v_id_sjto_impsto
         where id_rnta_cntrto_extrno = v_id_rnta_cntrto_extrno;

      exception
        -- Si no existe lo creamos
        when no_data_found then
          -- Creamos el Json con los datos para registrar el sujeto-impuesto
          select json_object('cdgo_clnte' value v_cdgo_clnte,
                             'id_sjto' value null,
                             'id_sjto_impsto' value null,
                             'idntfccion' value c_cntrto.nmro_idntfccion,
                             'id_dprtmnto' value v_id_dprtmnto,
                             'id_mncpio' value v_id_mncpio,
                             'drccion' value c_cntrto.drccion,
                             'id_impsto' value v_id_impsto,
                             'id_dprtmnto_ntfccion' value v_id_dprtmnto,
                             'id_mncpio_ntfccion' value v_id_mncpio,
                             'drccion_ntfccion' value c_cntrto.drccion,
                             'email' value c_cntrto.correo,
                             'tlfno' value c_cntrto.tlfno,
                             'id_usrio' value 230017, -- ojo --
                             'cdgo_idntfccion_tpo' value
                             c_cntrto.cdgo_idntfccion_tpo,
                             'tpo_prsna' value c_cntrto.tpo_prsna, -- Se toma por defecto de la tabla de consiguracion
                             'prmer_nmbre' value c_cntrto.prmer_nmbre,
                             'sgndo_nmbre' value
                             nvl(c_cntrto.sgndo_nmbre, '.'),
                             'prmer_aplldo' value c_cntrto.prmer_aplldo,
                             'sgndo_aplldo' value
                             nvl(c_cntrto.sgndo_aplldo, '.'),
                             'nmbre_rzon_scial' value null,
                             'nmro_rgstro_cmra_cmrcio' value null,
                             'fcha_rgstro_cmra_cmrcio' value null,
                             'fcha_incio_actvddes' value null,
                             'nmro_scrsles' value null,
                             'drccion_cmra_cmrcio' value null,
                             'id_sjto_tpo' value null,
                             'id_actvdad_ecnmca' value null,
                             'nmbre_rzon_scial' value
                             c_cntrto.nmbre_rzon_scial,
                             'rspnsble' value
                             (select json_arrayagg(json_object('cdgo_clnte'
                                                               value
                                                               v_cdgo_clnte,
                                                               'id_sjto_impsto'
                                                               value null,
                                                               'cdgo_idntfccion_tpo'
                                                               value
                                                               c_cntrto.cdgo_idntfccion_tpo,
                                                               'idntfccion'
                                                               value
                                                               c_cntrto.nmro_idntfccion,
                                                               'prmer_nmbre'
                                                               value
                                                               c_cntrto.prmer_nmbre,
                                                               'sgndo_nmbre'
                                                               value nvl(c_cntrto.sgndo_nmbre,
                                                                   '.'),
                                                               'prmer_aplldo'
                                                               value
                                                               c_cntrto.prmer_aplldo,
                                                               'sgndo_aplldo'
                                                               value nvl(c_cntrto.sgndo_aplldo,
                                                                   '.'),
                                                               'prncpal' value 'S',
                                                               'cdgo_tpo_rspnsble'
                                                               value 'L',
                                                               'id_dprtmnto_ntfccion'
                                                               value
                                                               v_id_dprtmnto,
                                                               'id_mncpio_ntfccion'
                                                               value
                                                               v_id_mncpio,
                                                               'drccion_ntfccion'
                                                               value
                                                               REGEXP_REPLACE(decode(c_cntrto.drccion,
                                                                                     '(null)',
                                                                                     null,
                                                                                     ' ',
                                                                                     null,
                                                                                     c_cntrto.drccion),
                                                                              '[@+&%\$_|¿()¿!?¿¿]"*=~^<>'),
                                                               'email' value
                                                               c_cntrto.correo,
                                                               'tlfno' value
                                                               c_cntrto.tlfno,
                                                               'cllar' value
                                                               c_cntrto.tlfno,
                                                               'actvo' value 'S',
                                                               'id_sjto_rspnsble'
                                                               value null)
                                                   returning clob)
                                from dual) returning clob)
            into v_json_sjto
            from gi_g_rentas_contrato_externo
           where id_rnta_cntrto_extrno = v_id_rnta_cntrto_extrno;
          -- Fin Creacion del Json de Sujeto

          -- Validamos que el Json no sea nulo
          if v_json_sjto is null then
            o_cdgo_rspsta  := 40;
            o_mnsje_rspsta := 'Error al crear crear el json de sujeto-impuesto. ' ||
                              sqlerrm;
            rollback;
            return;
          end if;

          --DBMS_OUTPUT.PUT_LINE('v_json_sjto = ' || v_json_sjto);

          --  Registramos el Sujeto, Sujeto Impuesto, Persona y Tercero
          begin
            pkg_si_sujeto_impuesto.prc_rg_general_sujeto_impuesto(p_json         => v_json_sjto,
                                                                  o_sjto_impsto  => v_id_sjto_impsto,
                                                                  o_cdgo_rspsta  => o_cdgo_rspsta,
                                                                  o_mnsje_rspsta => o_mnsje_rspsta);
            --Se actualiza el id_sjto_impsto
            update gi_g_rentas_contrato_externo
               set id_sjto_impsto = v_id_sjto_impsto
             where id_rnta_cntrto_extrno = v_id_rnta_cntrto_extrno;

            if (o_cdgo_rspsta != 0) then
              o_cdgo_rspsta  := 40 || o_cdgo_rspsta;
              o_mnsje_rspsta := 'Error al crear crear el json de sujeto-impuesto. ' ||
                                o_mnsje_rspsta;
              rollback;
              return;
            else
              o_mnsje_rspsta := 'Informacion registrada correctamente.';
            end if;

          exception
            when others then
              o_cdgo_rspsta  := 50;
              o_mnsje_rspsta := 'No. ' || o_cdgo_rspsta ||
                                ': Error al crear sujeto-impuesto ' ||
                                sqlerrm;
              rollback;
              return;
          end;
          -- Fin registrar Sujeto
      end;
    end loop;

  end prc_rg_json_contrato;

end pkg_gi_interfaz_contratos;
/

