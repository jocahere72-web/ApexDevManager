
  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PKG_GI_ASOCIADO" as

  procedure prc_rg_solicitud_asociado(p_cdgo_clnte      in number,
                                      p_tken            in varchar2,
                                      p_nmro_cnsctvo    in number,
                                      p_id_sjto         in number,
                                      p_id_usrio        in number,
                                      p_email           in varchar2,
                                      o_id_slctud_ascdo out number,
                                      o_cdgo_rspsta     out number,
                                      o_mnsje_rspsta    out varchar2) as
    v_nl         number;
    v_mnsje_log  varchar2(4000);
    nmbre_up     varchar2(100) := 'pkg_gi_asociado.prc_rg_solicitud_asociado';
    v_cdgo_clnte number;

  begin
    o_cdgo_rspsta := 0;

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'Entrando: ' || systimestamp,
                          1);

    -- Inserta la información del sujeto impuesto
    begin
      insert into si_g_solicitudes_asociados
        (cdgo_slctud,
         nmro_cnsctvo,
         cdgo_clnte,
         id_sjto,
         id_usrio,
         email,
         estdo,
         fcha_slctud)
      values
        (p_tken,
         p_nmro_cnsctvo,
         p_cdgo_clnte,
         p_id_sjto,
         p_id_usrio,
         p_email,
         'PEN',
         sysdate)
      returning id_slctud_ascdo into o_id_slctud_ascdo;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'Se registró la solicitud de asociado correctamente',
                            6);

    exception
      when others then
        o_cdgo_rspsta  := 10;
        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo registrar la solicitud';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);
        return;
    end;

  end prc_rg_solicitud_asociado;

  procedure prc_gn_envio_asociado(p_cdgo_clnte      number,
                                  p_cdna            clob,
                                  p_id_sjto         number,
                                  p_id_usrio        number,
                                  p_email           varchar2,
                                  p_id_slctud_ascdo out number,
                                  o_cdgo_rspsta     out number,
                                  o_mnsje_rspsta    out varchar2) as

    -- Manejo de errores
    v_nl                       number;
    v_prcdmnto                 varchar2(200) := 'pkg_gi_asociado.prc_gn_envio_asociado';
    v_nmbre_impsto             varchar2(100);
    v_email                    varchar2(50);
    v_email_l                  varchar2(50);
    v_dscrpcion_rspnsble_tpo_l varchar2(50);
    v_mntos_drcion             number;
    id_slctud_ascdo            number;
    v_idntfccion_sjto          varchar2(50);
    v_nmro_cnsctvo             number;
    v_json_parametros          clob;
    v_id_trcro                 number;
    v_id_slctud_ascdo          number;
    v_vldar                    number;
    v_id_impsto                number;
    v_id_sjto_impsto           number;
    v_ids                      varchar2(4000);
    v_pos                      number := 1;
    v_tken                     varchar2(50);

  begin
    -- Determinamos el nivel del log de la up
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_prcdmnto);
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_prcdmnto,
                          v_nl,
                          'Proceso iniciado.',
                          1);
    o_cdgo_rspsta := 0;

    -- Se valida si el usuario ya tiene 3 solicitudes en estado PEN para al mismo sujeto impuesto
    begin
      select count(*)
        into v_vldar
        from si_g_solicitudes_asociados
       where id_usrio = p_id_usrio
         and id_sjto = p_id_sjto
         and estdo = 'PEN';

      -- Si el usuario ya tiene 3 solicitudes en estado PEN
      if v_vldar >= 3 then
        o_cdgo_rspsta  := 21;
        o_mnsje_rspsta := 'Usuario ya cuenta con 3 solicitudes pendientes para el sujeto impuesto especificado. No se puede registrar más solicitudes.';
        return;
      end if;

    exception
      when no_data_found then
        null;
      when others then
        o_cdgo_rspsta  := 22;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>Hubo un error en la validación de solicitudes pendientes.</summary>' ||
                          '<p>' ||
                          'Para más información, consulte el código ' ||
                          v_prcdmnto || '-' || o_cdgo_rspsta || '.</p>' ||
                          '<p>' || sqlerrm || '.</p>' || '<p>' ||
                          o_mnsje_rspsta || '.</p>' || '</details>';
        return;
    end;

    -- Se consulta informacion del solicitante
    begin
      select b.email
        into v_email
        from sg_g_usuarios a
       inner join si_c_terceros b
          on a.id_trcro = b.id_trcro
       where id_usrio = p_id_usrio;
    exception
      when others then
        o_cdgo_rspsta  := 30;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>El usuario no pudo ser validado, por favor intente nuevamente.</summary>' ||
                          '<p>' ||
                          'Para mas información consultar el código ' ||
                          v_prcdmnto || '-' || o_cdgo_rspsta || '.</p>' ||
                          '<p>' || sqlerrm || '.</p>' || '<p>' ||
                          o_mnsje_rspsta || '.</p>' || '</details>';
        return;
    end;

    if (v_email is null) then
      o_cdgo_rspsta  := 35;
      o_mnsje_rspsta := '<details>' ||
                        '<summary>La dirección de correo electrónico del sujeto impuesto que realiza la solicitud no se encuentra registrada, por favor intente nuevamente.</summary>' ||
                        '<p>' ||
                        'Para mas información consultar el código ' ||
                        v_prcdmnto || '-' || o_cdgo_rspsta || '.</p>' ||
                        '<p>' || sqlerrm || '.</p>' || '<p>' ||
                        o_mnsje_rspsta || '.</p>' || '</details>';
      return;
    elsif (regexp_like(v_email,
                       '^[A-Za-z]+[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$') =
          false) then
      o_cdgo_rspsta  := 40;
      o_mnsje_rspsta := '<details>' ||
                        '<summary>La dirección de correo electrónico del sujeto que realiza solicitud no es válida, por favor intente nuevamente.</summary>' ||
                        '<p>' ||
                        'Para mas información consultar el código ' ||
                        v_prcdmnto || '-' || o_cdgo_rspsta || '.</p>' ||
                        '<p>' || sqlerrm || '.</p>' || '<p>' ||
                        o_mnsje_rspsta || '.</p>' || '</details>';
      return;
    end if;

    select pkg_gn_generalidades.fnc_cl_consecutivo(p_cdgo_clnte, 'SAS')
      into v_nmro_cnsctvo
      from dual;

    if v_nmro_cnsctvo is not null then

      select substr(translate(dbms_random.string('A', 20),
                              'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
                              'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'),
                    1,
                    20) || seq_tkn_slctdes_ascdo.nextval as unique_token
        into v_tken
        from dual;

      begin
        prc_rg_solicitud_asociado(p_cdgo_clnte      => p_cdgo_clnte,
                                  p_tken            => v_tken,
                                  p_nmro_cnsctvo    => v_nmro_cnsctvo,
                                  p_id_sjto         => p_id_sjto,
                                  p_id_usrio        => p_id_usrio,
                                  p_email           => p_email,
                                  o_id_slctud_ascdo => v_id_slctud_ascdo,
                                  o_cdgo_rspsta     => o_cdgo_rspsta,
                                  o_mnsje_rspsta    => o_mnsje_rspsta);

        if (o_cdgo_rspsta <> 0) then
          o_cdgo_rspsta  := 50;
          o_mnsje_rspsta := '<details>' ||
                            '<summary>No se pudo registrar la solicitud.</summary>' ||
                            '<p>' ||
                            'Para más información consultar el código ' ||
                            v_prcdmnto || '-' || o_cdgo_rspsta || '.</p>' ||
                            '<p>' || sqlerrm || '.</p>' || '<p>' ||
                            o_mnsje_rspsta || '.</p>' || '</details>';
          return;
        end if;
      exception
        when others then
          o_cdgo_rspsta  := 60;
          o_mnsje_rspsta := '<details>' ||
                            '<summary>No se pudo registrar la solicitud, por favor intente nuevamente.</summary>' ||
                            '<p>' ||
                            'Para más información consultar el código ' ||
                            v_prcdmnto || '-' || o_cdgo_rspsta || '.</p>' ||
                            '<p>' || sqlerrm || '.</p>' || '<p>' ||
                            o_mnsje_rspsta || '.</p>' || '</details>';
          return;
      end;
    else
      o_cdgo_rspsta  := 70;
      o_mnsje_rspsta := '<details>' ||
                        '<summary>Numero de consecutivo de solicitud es nulo.</summary>' ||
                        '<p>' ||
                        'Para mas información consultar el código ' ||
                        v_prcdmnto || '-' || o_cdgo_rspsta || '.</p>' ||
                        '<p>' || sqlerrm || '.</p>' || '<p>' ||
                        o_mnsje_rspsta || '.</p>' || '</details>';
    end if;
    -- Consultamos los envíos programados
    if v_id_slctud_ascdo is not null then

      v_ids := p_cdna; -- La cadena de IDs separada por ":"

      loop
        -- Extraemos un ID de la cadena de IDs
        v_id_sjto_impsto := regexp_substr(v_ids, '[^:]+', 1, v_pos);

        -- Si no hay más ID en la cadena, salimos del loop
        exit when v_id_sjto_impsto is null;

        begin
          select a.id_impsto
            into v_id_impsto
            from v_si_i_sujetos_impuesto a
           where a.id_sjto_impsto = v_id_sjto_impsto;
        exception
          when others then
            o_cdgo_rspsta  := 80;
            o_mnsje_rspsta := '<details>' ||
                              '<summary>error en consulta de tributo de sujeto impuesto.</summary>' ||
                              '<p>' ||
                              'Para mas información consultar el código ' ||
                              v_prcdmnto || '-' || o_cdgo_rspsta || '.</p>' ||
                              '<p>' || sqlerrm || '.</p>' || '<p>' ||
                              o_mnsje_rspsta || '.</p>' || '</details>';
            return;
        end;

        begin
          prc_rg_solicitud_asociado_detalle(p_cdgo_clnte      => p_cdgo_clnte,
                                            p_id_slctud_ascdo => v_id_slctud_ascdo,
                                            p_id_impsto       => v_id_impsto,
                                            p_id_sjto_impsto  => v_id_sjto_impsto,
                                            p_id_usrio        => p_id_usrio,
                                            o_cdgo_rspsta     => o_cdgo_rspsta,
                                            o_mnsje_rspsta    => o_mnsje_rspsta);

          if (o_cdgo_rspsta <> 0) then
            o_cdgo_rspsta  := 90;
            o_mnsje_rspsta := '<details>' ||
                              '<summary>No se pudo registrar la solicitud.</summary>' ||
                              '<p>' ||
                              'Para más información consultar el código ' ||
                              v_prcdmnto || '-' || o_cdgo_rspsta || '.</p>' ||
                              '<p>' || sqlerrm || '.</p>' || '<p>' ||
                              o_mnsje_rspsta || '.</p>' || '</details>';
            return;
          end if;
          commit;
        exception
          when others then
            o_cdgo_rspsta  := 100;
            o_mnsje_rspsta := '<details>' ||
                              '<summary>No se pudo registrar la solicitud, por favor intente nuevamente.</summary>' ||
                              '<p>' ||
                              'Para más información consultar el código ' ||
                              v_prcdmnto || '-' || o_cdgo_rspsta || '.</p>' ||
                              '<p>' || sqlerrm || '.</p>' || '<p>' ||
                              o_mnsje_rspsta || '.</p>' || '</details>';
            return;
        end;

        -- Aumentamos la posición para el siguiente ID
        v_pos := v_pos + 1;
      end loop;

      begin
        /*  select json_object(
           key 'p_id_slctud_ascdo' value p_id_slctud_ascdo
          -- key 'p_id_sjto_impsto' value p_id_sjto_impsto
        ) into v_json_parametros from dual;*/

        pkg_ma_envios.prc_co_envio_programado(p_cdgo_clnte   => p_cdgo_clnte,
                                              p_idntfcdor    => 'SOLICITUD_AUTORIZACION',
                                              p_json_prmtros => '{"p_id_slctud_ascdo":"' ||
                                                                v_id_slctud_ascdo || '"}');
        o_mnsje_rspsta := 'envíos programados, ' || v_json_parametros;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_prcdmnto,
                              p_nvel_log   => v_nl,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 1);

      exception
        when others then
          o_cdgo_rspsta  := 110;
          o_mnsje_rspsta := 'no. ' || o_cdgo_rspsta ||
                            ': error en los envíos programados, ' ||
                            sqlerrm;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_prcdmnto,
                                p_nvel_log   => v_nl,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 1);
          rollback;
          return;
      end; -- Fin Consultamos los envíos programados

    else
      o_cdgo_rspsta  := 120;
      o_mnsje_rspsta := '<details>' ||
                        '<summary>ID de solicitud de solicitud es nulo.</summary>' ||
                        '<p>' ||
                        'Para mas información consultar el código ' ||
                        v_prcdmnto || '-' || o_cdgo_rspsta || '.</p>' ||
                        '<p>' || sqlerrm || '.</p>' || '<p>' ||
                        o_mnsje_rspsta || '.</p>' || '</details>';
      rollback;
      return;
    end if;

    p_id_slctud_ascdo := v_id_slctud_ascdo;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_prcdmnto,
                          v_nl,
                          'Proceso terminado.',
                          1);
    commit;

  end prc_gn_envio_asociado;

  procedure prc_ac_solicitud_asociado_detalle(p_cdgo_clnte           in number,
                                              p_id_slctud_ascdo      in number,
                                              p_id_slctd_ascdo_dtlle in number default null,
                                              p_cdgo_rspta           in varchar2,
                                              p_id_usuario           in number,
                                              o_cdgo_rspsta          out number,
                                              o_mnsje_rspsta         out varchar2) as
    v_nl              number;
    v_mnsje_log       varchar2(4000);
    nmbre_up          varchar2(100) := 'pkg_gi_asociado.prc_ac_solicitud_asociado_detalle';
    v_cdgo_clnte      number;
    v_estado          varchar2(20);
    v_json_parametros varchar2(4000);
  begin
    -- Inicializamos el código de respuesta a 0
    o_cdgo_rspsta := 0;

    -- Obtiene el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, nmbre_up);

    -- Log de entrada
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'Entrando: ' || systimestamp,
                          1);

    -- Verificación de parámetros de entrada
    if p_cdgo_clnte is null or p_id_slctud_ascdo is null or
       p_cdgo_rspta is null then
      o_cdgo_rspsta  := 10;
      o_mnsje_rspsta := 'Parámetros de entrada inválidos';
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);
      return;
    end if;
    if p_cdgo_rspta = 'A' then
      -- Se actualiza el estado de la solicitud
      begin
        update si_g_slctd_asociado_detalle
           set cdgo_rspta = p_cdgo_rspta, fcha_gstion = sysdate
         where id_slctd_ascdo_dtlle = p_id_slctd_ascdo_dtlle
           and id_slctud_ascdo = p_id_slctud_ascdo
           and cdgo_rspta is null;

        -- Log de éxito
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'Se actualizó la solicitud de asociado correctamente',
                              6);
      exception
        when others then
          o_cdgo_rspsta  := 20;
          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'No se pudo actualizar el detalle de la solicitud';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);
          return;
      end;

    elsif p_cdgo_rspta = 'R' then
      -- Se actualiza el estado de la solicitud
      begin
        update si_g_slctd_asociado_detalle
           set cdgo_rspta = p_cdgo_rspta, fcha_gstion = sysdate
         where id_slctud_ascdo = p_id_slctud_ascdo
           and cdgo_rspta is null;

        -- Log de éxito
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'Se actualizó la solicitud de asociado correctamente',
                              6);
      exception
        when others then
          o_cdgo_rspsta  := 30;
          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'No se pudo actualizar el detalle de la solicitud';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);
          return;
      end;

    end if;
  end prc_ac_solicitud_asociado_detalle;

  procedure prc_ac_sujeto_asociado(p_cdgo_clnte      in number,
                                   p_id_slctud_ascdo in number,
                                   p_cdna            in varchar2,
                                   p_cdgo_rspta      in varchar2,
                                   o_cdgo_rspsta     out number,
                                   o_mnsje_rspsta    out varchar2) as

    -- Manejo de errores
    v_nl                   number;
    v_prcdmnto             varchar2(200) := 'pkg_gi_asociado.prc_rg_sujeto_asociado';
    v_id_dclrcion          number;
    v_actvo                varchar2(1);
    v_cdgo_rspsta          number;
    v_indcdor_atrzdo       varchar2(1);
    v_cdgo_prcso           varchar2(10);
    v_estdo                varchar2(5);
    v_cdgo_rspta           varchar2(10);
    v_id_usuario           number;
    v_json_parametros      clob;
    v_ids                  varchar2(4000);
    v_pos                  number := 1;
    v_id_slctd_ascdo_dtlle number;
    v_contar               number;

  begin
    -- Determinamos el nivel del Log de la UP
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_prcdmnto);
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_prcdmnto,
                          v_nl,
                          'Proceso iniciado.',
                          1);
    o_cdgo_rspsta := 0;

    -- Se valida el estado de la solicitud
    begin
      select a.estdo, a.id_usrio
        into v_estdo, v_id_usuario
        from si_g_solicitudes_asociados a
       where a.id_slctud_ascdo = p_id_slctud_ascdo;
    exception
      when others then
        o_cdgo_rspsta  := 10;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>El estado de la solicitud no pudo ser validado, por favor intente nuevamente.</summary>' ||
                          '<p>' ||
                          'Para mas información consultar el código ' ||
                          v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                          '<p>' || sqlerrm || '.</p>' || '<p>' ||
                          o_mnsje_rspsta || '.</p>' || '</details>';
        return;
    end;

    -- Se valida que esté pendiente la solicitud
    if (v_estdo <> 'PEN') then
      o_cdgo_rspsta  := 20;
      o_mnsje_rspsta := '<details>' ||
                        '<summary>Esta solicitud ya fue procesada, no puede gestionarse nuevamente.</summary>' ||
                        '<p>' ||
                        'Para mas información consultar el código ' ||
                        v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                        '<p>' || sqlerrm || '.</p>' || '<p>' ||
                        o_mnsje_rspsta || '.</p>' || '</details>';
      return;
    end if;

    -- Se valida que no tenga respuesta
    if (v_cdgo_rspta is not null) then
      o_cdgo_rspsta  := 30;
      o_mnsje_rspsta := '<details>' ||
                        '<summary>Esta solicitud ya fue procesada, no puede realizarse nuevamente.</summary>' ||
                        '<p>' ||
                        'Para mas información consultar el código ' ||
                        v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                        '<p>' || sqlerrm || '.</p>' || '<p>' ||
                        o_mnsje_rspsta || '.</p>' || '</details>';
      return;
    end if;

    -- Se actualiza la autorización
    begin
      update si_g_solicitudes_asociados a
         set a.estdo = 'PRS', a.fcha_gstion = systimestamp
       where a.id_slctud_ascdo = p_id_slctud_ascdo;
    exception
      when others then
        rollback;
        o_cdgo_rspsta  := 40;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>La solicitud no pudo gestionarse, por favor intente nuevamente.</summary>' ||
                          '<p>' ||
                          'Para mas información consultar el código ' ||
                          v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                          '<p>' || sqlerrm || '.</p>' || '<p>' ||
                          o_mnsje_rspsta || '.</p>' || '</details>';
        return;
    end;
    -- Se valida el código de respuesta
    if (p_cdgo_rspta is not null and p_cdgo_rspta = 'R') then

      begin
        prc_ac_solicitud_asociado_detalle(p_cdgo_clnte      => p_cdgo_clnte,
                                          p_id_slctud_ascdo => p_id_slctud_ascdo,
                                          p_cdgo_rspta      => p_cdgo_rspta,
                                          p_id_usuario      => v_id_usuario,
                                          o_cdgo_rspsta     => o_cdgo_rspsta,
                                          o_mnsje_rspsta    => o_mnsje_rspsta);

        -- Verificación del código de respuesta después de la ejecución
        if (o_cdgo_rspsta <> 0) then
          rollback;
          o_cdgo_rspsta  := 50;
          o_mnsje_rspsta := '<details>' ||
                            '<summary>La solicitud no pudo gestionarse, por favor intente nuevamente.</summary>' ||
                            '<p>' ||
                            'Para más información consultar el código ' ||
                            v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                            '<p>' || sqlerrm || '.</p>' || '<p>' ||
                            o_mnsje_rspsta || '.</p>' || '</details>';
          return;
        end if;
      exception
        when others then
          rollback;
          o_cdgo_rspsta  := 60;
          o_mnsje_rspsta := '<details>' ||
                            '<summary>La solicitud no pudo gestionarse, por favor intente nuevamente.</summary>' ||
                            '<p>' ||
                            'Para más información consultar el código ' ||
                            v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                            '<p>' || sqlerrm || '.</p>' || '<p>' ||
                            o_mnsje_rspsta || '.</p>' || '</details>';
          return;
      end;

      -- Se valida el código de respuesta
    elsif (p_cdgo_rspta is not null and p_cdgo_rspta = 'A') then
      -- Llamada al procedimiento para aceptar la solicitud

      v_ids := p_cdna; -- La cadena de IDs separada por ":"

      loop
        -- Extraemos un ID de la cadena de IDs
        v_id_slctd_ascdo_dtlle := regexp_substr(v_ids, '[^:]+', 1, v_pos);

        -- Si no hay más ID en la cadena, salimos del loop
        exit when v_id_slctd_ascdo_dtlle is null;

        begin
          prc_ac_solicitud_asociado_detalle(p_cdgo_clnte           => p_cdgo_clnte,
                                            p_id_slctud_ascdo      => p_id_slctud_ascdo,
                                            p_id_slctd_ascdo_dtlle => v_id_slctd_ascdo_dtlle,
                                            p_cdgo_rspta           => p_cdgo_rspta,
                                            p_id_usuario           => v_id_usuario,
                                            o_cdgo_rspsta          => o_cdgo_rspsta,
                                            o_mnsje_rspsta         => o_mnsje_rspsta);

          -- Verificación del código de respuesta después de la ejecución
          if (o_cdgo_rspsta <> 0) then
            rollback;
            o_cdgo_rspsta  := 70;
            o_mnsje_rspsta := '<details>' ||
                              '<summary>La solicitud no pudo gestionarse, por favor intente nuevamente.</summary>' ||
                              '<p>' ||
                              'Para más información consultar el código ' ||
                              v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                              '.</p>' || '<p>' || sqlerrm || '.</p>' ||
                              '<p>' || o_mnsje_rspsta || '.</p>' ||
                              '</details>';
            return;
          end if;
        exception
          when others then
            rollback;
            o_cdgo_rspsta  := 80;
            o_mnsje_rspsta := '<details>' ||
                              '<summary>La solicitud no pudo gestionarse, por favor intente nuevamente.</summary>' ||
                              '<p>' ||
                              'Para más información consultar el código ' ||
                              v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                              '.</p>' || '<p>' || sqlerrm || '.</p>' ||
                              '<p>' || o_mnsje_rspsta || '.</p>' ||
                              '</details>';
            return;
        end;

        -- Aumentamos la posición para el siguiente ID
        v_pos := v_pos + 1;
      end loop;

      -- Se valida el detalle de las solicitudes que fueron rechazadas al no ser escogidas
      begin
        select count(a.id_slctd_ascdo_dtlle)
          into v_contar
          from si_g_slctd_asociado_detalle a
         where a.id_slctud_ascdo = p_id_slctud_ascdo
           and cdgo_rspta is null;
      exception
        when others then
          o_cdgo_rspsta  := 90;
          o_mnsje_rspsta := '<details>' ||
                            '<summary>Error al consultar estado de detalles de solicitudes pendientes de procesar</summary>' ||
                            '<p>' ||
                            'Para mas información consultar el código ' ||
                            v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                            '<p>' || sqlerrm || '.</p>' || '<p>' ||
                            o_mnsje_rspsta || '.</p>' || '</details>';
          return;
      end;

      if v_contar > 0 then
        begin
          prc_ac_solicitud_asociado_detalle(p_cdgo_clnte      => p_cdgo_clnte,
                                            p_id_slctud_ascdo => p_id_slctud_ascdo,
                                            p_cdgo_rspta      => 'R',
                                            p_id_usuario      => v_id_usuario,
                                            o_cdgo_rspsta     => o_cdgo_rspsta,
                                            o_mnsje_rspsta    => o_mnsje_rspsta);

          -- Verificación del código de respuesta después de la ejecución
          if (o_cdgo_rspsta <> 0) then
            rollback;
            o_cdgo_rspsta  := 100;
            o_mnsje_rspsta := '<details>' ||
                              '<summary>La solicitud no pudo gestionarse, por favor intente nuevamente.</summary>' ||
                              '<p>' ||
                              'Para más información consultar el código ' ||
                              v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                              '.</p>' || '<p>' || sqlerrm || '.</p>' ||
                              '<p>' || o_mnsje_rspsta || '.</p>' ||
                              '</details>';
            return;
          end if;
        exception
          when others then
            rollback;
            o_cdgo_rspsta  := 110;
            o_mnsje_rspsta := '<details>' ||
                              '<summary>La solicitud no pudo gestionarse, por favor intente nuevamente.</summary>' ||
                              '<p>' ||
                              'Para más información consultar el código ' ||
                              v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                              '.</p>' || '<p>' || sqlerrm || '.</p>' ||
                              '<p>' || o_mnsje_rspsta || '.</p>' ||
                              '</details>';
            return;
        end;

      end if;

    end if;
    commit;

    -- Se valida si hay registros en solicitud detalle pendientes por gestionar para la creacion de registros de sujetos asociados a estado activo
    begin
      select count(id_slctd_ascdo_dtlle)
        into v_contar
        from si_g_slctd_asociado_detalle a
       where id_slctud_ascdo = p_id_slctud_ascdo
         and not exists (select 1
                from si_i_sujetos_asociados b
               where a.id_impsto = b.id_impsto
                 and a.id_sjto_impsto = b.id_sjto_impsto
                 and a.id_usrio = b.id_usrio)
         and cdgo_rspta = 'A';
    exception
      when others then
        o_cdgo_rspsta  := 113;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>Error al consultar estado de detalles de solicitudes pendientes de procesar</summary>' ||
                          '<p>' ||
                          'Para mas información consultar el código ' ||
                          v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                          '<p>' || sqlerrm || '.</p>' || '<p>' ||
                          o_mnsje_rspsta || '.</p>' || '</details>';
        return;
    end;

    if v_contar > 0 then

      begin

        for cur in (select id_impsto, id_sjto_impsto, id_usrio
                      from si_g_slctd_asociado_detalle a
                     where id_slctud_ascdo = p_id_slctud_ascdo
                       and not exists
                     (select 1
                              from si_i_sujetos_asociados b
                             where a.id_impsto = b.id_impsto
                               and a.id_sjto_impsto = b.id_sjto_impsto
                               and a.id_usrio = b.id_usrio)
                       and cdgo_rspta = 'A') loop
          begin
            pkg_gi_asociado.prc_rg_sujeto_asociado(p_cdgo_clnte     => p_cdgo_clnte,
                                                   p_id_impsto      => cur.id_impsto,
                                                   p_id_sjto_impsto => cur.id_sjto_impsto,
                                                   p_id_usrio       => cur.id_usrio,
                                                   o_cdgo_rspsta    => o_cdgo_rspsta,
                                                   o_mnsje_rspsta   => o_mnsje_rspsta);
          exception
            when others then
              o_cdgo_rspsta  := 115;
              o_mnsje_rspsta := 'error en procesamiento, . detalle: ' ||
                                sqlerrm;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_prcdmnto,
                                    v_nl,
                                    o_mnsje_rspsta,
                                    3);
          end;
        end loop;
      exception
        when others then
          o_cdgo_rspsta  := 118;
          o_mnsje_rspsta := 'error general en registro de sujetos asociados: ' ||
                            sqlerrm;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_prcdmnto,
                                v_nl,
                                o_mnsje_rspsta,
                                3);

      end;
    end if;

    -- Se valida si hay registros en solicitud detalle pendientes por gestionar para la actualizaciond de estado del sujeto asociado a estado activo
    begin
      select count(id_slctd_ascdo_dtlle)
        into v_contar
        from si_g_slctd_asociado_detalle a
       where id_slctud_ascdo = p_id_slctud_ascdo
         and exists (select 1
                from si_i_sujetos_asociados b
               where a.id_impsto = b.id_impsto
                 and a.id_sjto_impsto = b.id_sjto_impsto
                 and a.id_usrio = b.id_usrio)
         and cdgo_rspta = 'A';
    exception
      when others then
        o_cdgo_rspsta  := 120;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>Error al consultar estado de detalles de solicitudes pendientes de procesar</summary>' ||
                          '<p>' ||
                          'Para mas información consultar el código ' ||
                          v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                          '<p>' || sqlerrm || '.</p>' || '<p>' ||
                          o_mnsje_rspsta || '.</p>' || '</details>';
        return;
    end;

    if v_contar > 0 then

      begin

        for cur in (select id_impsto, id_sjto_impsto, id_usrio
                      from si_g_slctd_asociado_detalle a
                     where id_slctud_ascdo = p_id_slctud_ascdo
                       and exists
                     (select 1
                              from si_i_sujetos_asociados b
                             where a.id_impsto = b.id_impsto
                               and a.id_sjto_impsto = b.id_sjto_impsto
                               and a.id_usrio = b.id_usrio)
                       and cdgo_rspta = 'A') loop

          begin
            prc_ac_estado_asociado(p_cdgo_clnte     => p_cdgo_clnte,
                                   p_cdgo_gstion    => 'H',
                                   p_id_usuario     => cur.id_usrio,
                                   p_id_sjto_impsto => cur.id_sjto_impsto,
                                   o_cdgo_rspsta    => o_cdgo_rspsta,
                                   o_mnsje_rspsta   => o_mnsje_rspsta);

            -- Verificación del código de respuesta después de la ejecución
            if (o_cdgo_rspsta <> 0) then
              rollback;
              o_cdgo_rspsta  := 130;
              o_mnsje_rspsta := '<details>' ||
                                '<summary>La solicitud no pudo gestionarse, por favor intente nuevamente.</summary>' ||
                                '<p>' ||
                                'Para más información consultar el código ' ||
                                v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                                '.</p>' || '<p>' || sqlerrm || '.</p>' ||
                                '<p>' || o_mnsje_rspsta || '.</p>' ||
                                '</details>';
              return;
            end if;
          exception
            when others then
              rollback;
              o_cdgo_rspsta  := 140;
              o_mnsje_rspsta := '<details>' ||
                                '<summary>La solicitud no pudo gestionarse, por favor intente nuevamente.</summary>' ||
                                '<p>' ||
                                'Para más información consultar el código ' ||
                                v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                                '.</p>' || '<p>' || sqlerrm || '.</p>' ||
                                '<p>' || o_mnsje_rspsta || '.</p>' ||
                                '</details>';
              return;
          end;

        end loop;
      exception
        when others then
          o_cdgo_rspsta  := 150;
          o_mnsje_rspsta := 'error general en registro de sujetos asociados: ' ||
                            sqlerrm;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_prcdmnto,
                                v_nl,
                                o_mnsje_rspsta,
                                3);

      end;
    end if;

    -- Envíos programados
    begin
      select json_object(key 'p_id_slctud_ascdo' value p_id_slctud_ascdo
                         -- key 'p_id_usuario' value p_id_usuario
                         )
        into v_json_parametros
        from dual;

      pkg_ma_envios.prc_co_envio_programado(p_cdgo_clnte   => p_cdgo_clnte,
                                            p_idntfcdor    => 'RSPSTA_SLCTUD_ASCDOS',
                                            p_json_prmtros => v_json_parametros);

      o_mnsje_rspsta := 'Envíos programados, ' || v_json_parametros;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                            p_id_impsto  => null,
                            p_nmbre_up   => v_prcdmnto,
                            p_nvel_log   => v_nl,
                            p_txto_log   => o_mnsje_rspsta,
                            p_nvel_txto  => 1);
    exception
      when others then
        o_cdgo_rspsta  := 160;
        o_mnsje_rspsta := 'no. ' || o_cdgo_rspsta ||
                          ': error en los envíos programados, ' || sqlerrm;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_prcdmnto,
                              p_nvel_log   => v_nl,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 1);
        rollback;
        return;
    end;

    commit;

    -- Log de finalización
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_prcdmnto,
                          v_nl,
                          'Proceso terminado.',
                          1);

  end prc_ac_sujeto_asociado;

  procedure prc_rg_solicitud_asociado_detalle(p_cdgo_clnte      in number,
                                              p_id_slctud_ascdo in number,
                                              p_id_impsto       in number,
                                              p_id_sjto_impsto  in number,
                                              p_id_usrio        in number,
                                              o_cdgo_rspsta     out number,
                                              o_mnsje_rspsta    out varchar2) as
    v_nl         number;
    v_mnsje_log  varchar2(4000);
    nmbre_up     varchar2(100) := 'pkg_gi_asociado.prc_rg_solicitud_asociado_detalle';
    v_cdgo_clnte number;

  begin
    o_cdgo_rspsta := 0;

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'Entrando: ' || systimestamp,
                          1);

    -- Inserta la información del sujeto impuesto
    begin
      insert into si_g_slctd_asociado_detalle
        (id_slctud_ascdo, id_impsto, id_sjto_impsto, id_usrio, fcha_slctud)
      values
        (p_id_slctud_ascdo,
         p_id_impsto,
         p_id_sjto_impsto,
         p_id_usrio,
         sysdate);

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'Se registró la solicitud de asociado correctamente',
                            6);

    exception
      when others then
        o_cdgo_rspsta  := 10;
        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo registrar el detalle de la solicitud';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);
        return;
    end;

  end prc_rg_solicitud_asociado_detalle;

  procedure prc_rg_sujeto_asociado(p_cdgo_clnte in number,
                                   --  p_id_slctud_ascdo  in number,
                                   p_id_impsto      in number,
                                   p_id_sjto_impsto in number,
                                   p_id_usrio       in number,
                                   o_cdgo_rspsta    out number,
                                   o_mnsje_rspsta   out varchar2) as
    v_nl         number;
    v_mnsje_log  varchar2(4000);
    nmbre_up     varchar2(100) := 'pkg_gi_asociado.prc_rg_sujeto_asociado';
    v_cdgo_clnte number;

  begin
    o_cdgo_rspsta := 0;

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'Entrando: ' || systimestamp,
                          1);

    -- Inserta la información del sujeto asociado
    begin
      insert into si_i_sujetos_asociados
        (cdgo_clnte, id_impsto, id_sjto_impsto, id_usrio, actvo)
      values
        (p_cdgo_clnte, p_id_impsto, p_id_sjto_impsto, p_id_usrio, 'S');

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'Se registró la relacion de sijeuto impuesto y sujeto asociado correctamente',
                            6);

    exception
      when others then
        o_cdgo_rspsta  := 10;
        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo registrar el detalle de la solicitud';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);
        return;
    end;

  end prc_rg_sujeto_asociado;

  procedure prc_rg_solicitud_gestion_permisos(p_cdgo_clnte         in number,
                                              p_tken               in varchar2,
                                              p_nmro_cnsctvo       in number,
                                              p_cdna_id_sjto_ascdo in varchar2,
                                              p_id_sjto            in number,
                                              p_id_usrio           in number,
                                              p_cdgo_gstion        in varchar2,
                                              p_email              in varchar2,
                                              o_id_slctud_prmsos   out number,
                                              o_cdgo_rspsta        out number,
                                              o_mnsje_rspsta       out varchar2) as
    v_nl         number;
    v_mnsje_log  varchar2(4000);
    nmbre_up     varchar2(100) := 'pkg_gi_asociado.prc_rg_solicitud_gestion_permisos';
    v_cdgo_clnte number;

  begin
    o_cdgo_rspsta := 0;

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'Entrando: ' || systimestamp,
                          1);

    begin
      insert into si_g_slctds_permisos_asociado
        (cdgo_clnte,
         cdgo_slctud,
         nmro_cnsctvo,
         cdna_sjto_impsto,
         id_sjto,
         id_usrio,
         email,
         cdgo_gstion,
         estdo,
         fcha_slctud)
      values
        (p_cdgo_clnte,
         p_tken,
         p_nmro_cnsctvo,
         p_cdna_id_sjto_ascdo,
         p_id_sjto,
         p_id_usrio,
         p_email,
         p_cdgo_gstion,
         'PEN',
         sysdate)
      returning id_slctud_prmsos into o_id_slctud_prmsos;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'Se registró la solicitud de gestion de permisos correctamente',
                            6);

    exception
      when others then
        o_cdgo_rspsta  := 10;
        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo registrar la solicitud';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);
        return;
    end;

  end prc_rg_solicitud_gestion_permisos;

  procedure prc_gn_envio_permisos(p_cdgo_clnte       number,
                                  p_id_sjto          number,
                                  p_cdna             varchar2,
                                  p_id_usrio         number,
                                  p_cdgo_gstion      varchar2,
                                  p_email            varchar2,
                                  p_id_slctud_prmsos out number,
                                  o_cdgo_rspsta      out number,
                                  o_mnsje_rspsta     out varchar2) as

    -- Manejo de errores
    v_nl                       number;
    v_prcdmnto                 varchar2(200) := 'pkg_gi_asociado.prc_gn_envio_permisos';
    v_nmbre_impsto             varchar2(100);
    v_email                    varchar2(50);
    v_email_l                  varchar2(50);
    v_dscrpcion_rspnsble_tpo_l varchar2(50);
    v_mntos_drcion             number;
    id_slctud_ascdo            number;
    v_idntfccion_sjto          varchar2(50);
    v_nmro_cnsctvo             number;
    v_json_parametros          clob;
    v_id_slctud_prmsos         number;
    v_vldar                    number;
    v_id_impsto                number;
    v_id_sjto_impsto           number;
    v_ids                      varchar2(4000);
    v_pos                      number := 1;
    v_tken                     varchar2(50);
  begin
    -- Determinamos el nivel del log de la up
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_prcdmnto);
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_prcdmnto,
                          v_nl,
                          'Proceso iniciado.',
                          1);
    o_cdgo_rspsta := 0;

    -- Se valida si el usuario ya tiene 3 solicitudes en estado PEN para al mismo sujeto impuesto
    begin
      select count(*)
        into v_vldar
        from si_g_slctds_permisos_asociado
       where id_usrio = p_id_usrio
         and id_sjto = p_id_sjto
         and estdo = 'PEN';

      -- Si el usuario ya tiene 3 solicitudes en estado PEN
      if v_vldar >= 3 then
        o_cdgo_rspsta  := 21;
        o_mnsje_rspsta := 'Usuario ya cuenta con 3 solicitudes pendientes para el sujeto impuesto especificado. No se puede registrar más solicitudes.';
        return;
      end if;

    exception
      when no_data_found then
        null;
      when others then
        o_cdgo_rspsta  := 22;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>Hubo un error en la validación de solicitudes pendientes.</summary>' ||
                          '<p>' ||
                          'Para más información, consulte el código ' ||
                          v_prcdmnto || '-' || o_cdgo_rspsta || '.</p>' ||
                          '<p>' || sqlerrm || '.</p>' || '<p>' ||
                          o_mnsje_rspsta || '.</p>' || '</details>';
        return;
    end;

    -- Se consulta informacion del solicitante
    begin
      select b.email
        into v_email
        from sg_g_usuarios a
       inner join si_c_terceros b
          on a.id_trcro = b.id_trcro
       where id_usrio = p_id_usrio;
    exception
      when others then
        o_cdgo_rspsta  := 30;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>El usuario no pudo ser validado, por favor intente nuevamente.</summary>' ||
                          '<p>' ||
                          'Para mas información consultar el código ' ||
                          v_prcdmnto || '-' || o_cdgo_rspsta || '.</p>' ||
                          '<p>' || sqlerrm || '.</p>' || '<p>' ||
                          o_mnsje_rspsta || '.</p>' || '</details>';
        return;
    end;

    if (v_email is null) then
      o_cdgo_rspsta  := 35;
      o_mnsje_rspsta := '<details>' ||
                        '<summary>La dirección de correo electrónico del sujeto impuesto que realiza la solicitud no se encuentra registrada, por favor intente nuevamente.</summary>' ||
                        '<p>' ||
                        'Para mas información consultar el código ' ||
                        v_prcdmnto || '-' || o_cdgo_rspsta || '.</p>' ||
                        '<p>' || sqlerrm || '.</p>' || '<p>' ||
                        o_mnsje_rspsta || '.</p>' || '</details>';
      return;
    elsif (regexp_like(v_email,
                       '^[A-Za-z]+[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$') =
          false) then
      o_cdgo_rspsta  := 40;
      o_mnsje_rspsta := '<details>' ||
                        '<summary>La dirección de correo electrónico del sujeto que realiza solicitud no es válida, por favor intente nuevamente.</summary>' ||
                        '<p>' ||
                        'Para mas información consultar el código ' ||
                        v_prcdmnto || '-' || o_cdgo_rspsta || '.</p>' ||
                        '<p>' || sqlerrm || '.</p>' || '<p>' ||
                        o_mnsje_rspsta || '.</p>' || '</details>';
      return;
    end if;

    select pkg_gn_generalidades.fnc_cl_consecutivo(p_cdgo_clnte, 'SAS')
      into v_nmro_cnsctvo
      from dual;

    if v_nmro_cnsctvo is not null then

      select substr(translate(dbms_random.string('A', 20),
                              'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
                              'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'),
                    1,
                    20) || seq_tkn_slctdes_ascdo.nextval as unique_token
        into v_tken
        from dual;

      begin
        prc_rg_solicitud_gestion_permisos(p_cdgo_clnte         => p_cdgo_clnte,
                                          p_tken               => v_tken,
                                          p_nmro_cnsctvo       => v_nmro_cnsctvo,
                                          p_cdna_id_sjto_ascdo => p_cdna,
                                          p_id_sjto            => p_id_sjto,
                                          p_id_usrio           => p_id_usrio,
                                          p_cdgo_gstion        => p_cdgo_gstion,
                                          p_email              => p_email,
                                          o_id_slctud_prmsos   => v_id_slctud_prmsos,
                                          o_cdgo_rspsta        => o_cdgo_rspsta,
                                          o_mnsje_rspsta       => o_mnsje_rspsta);

        if (o_cdgo_rspsta <> 0) then
          o_cdgo_rspsta  := 50;
          o_mnsje_rspsta := '<details>' ||
                            '<summary>No se pudo registrar la solicitud.</summary>' ||
                            '<p>' ||
                            'Para más información consultar el código ' ||
                            v_prcdmnto || '-' || o_cdgo_rspsta || '.</p>' ||
                            '<p>' || sqlerrm || '.</p>' || '<p>' ||
                            o_mnsje_rspsta || '.</p>' || '</details>';
          return;
        end if;
        commit;
      exception
        when others then
          o_cdgo_rspsta  := 60;
          o_mnsje_rspsta := '<details>' ||
                            '<summary>No se pudo registrar la solicitud, por favor intente nuevamente.</summary>' ||
                            '<p>' ||
                            'Para más información consultar el código ' ||
                            v_prcdmnto || '-' || o_cdgo_rspsta || '.</p>' ||
                            '<p>' || sqlerrm || '.</p>' || '<p>' ||
                            o_mnsje_rspsta || '.</p>' || '</details>';
          return;
      end;
    else
      o_cdgo_rspsta  := 70;
      o_mnsje_rspsta := '<details>' ||
                        '<summary>Numero de consecutivo de solicitud es nulo.</summary>' ||
                        '<p>' ||
                        'Para mas información consultar el código ' ||
                        v_prcdmnto || '-' || o_cdgo_rspsta || '.</p>' ||
                        '<p>' || sqlerrm || '.</p>' || '<p>' ||
                        o_mnsje_rspsta || '.</p>' || '</details>';
    end if;
    -- Consultamos los envíos programados
    if v_id_slctud_prmsos is not null then

      begin
        /*  select json_object(
           key 'p_id_slctud_ascdo' value p_id_slctud_ascdo
          -- key 'p_id_sjto_impsto' value p_id_sjto_impsto
        ) into v_json_parametros from dual;*/

        pkg_ma_envios.prc_co_envio_programado(p_cdgo_clnte   => p_cdgo_clnte,
                                              p_idntfcdor    => 'GSTION_PRMSOS_AUTRZCION',
                                              p_json_prmtros => '{"p_id_slctud_prmsos":"' ||
                                                                v_id_slctud_prmsos || '"}');
        o_mnsje_rspsta := 'envíos programados, ' || v_json_parametros;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_prcdmnto,
                              p_nvel_log   => v_nl,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 1);

      exception
        when others then
          o_cdgo_rspsta  := 80;
          o_mnsje_rspsta := 'no. ' || o_cdgo_rspsta ||
                            ': error en los envíos programados, ' ||
                            sqlerrm;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_prcdmnto,
                                p_nvel_log   => v_nl,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 1);
          rollback;
          return;
      end; -- Fin Consultamos los envíos programados*/

    else
      o_cdgo_rspsta  := 90;
      o_mnsje_rspsta := '<details>' ||
                        '<summary>ID de solicitud de permisos de autorizacion es nulo.</summary>' ||
                        '<p>' ||
                        'Para mas información consultar el código ' ||
                        v_prcdmnto || '-' || o_cdgo_rspsta || '.</p>' ||
                        '<p>' || sqlerrm || '.</p>' || '<p>' ||
                        o_mnsje_rspsta || '.</p>' || '</details>';
      rollback;
      return;
    end if;

    p_id_slctud_prmsos := v_id_slctud_prmsos;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_prcdmnto,
                          v_nl,
                          'Proceso terminado.',
                          1);
    commit;

  end prc_gn_envio_permisos;

  procedure prc_rg_traza_estado_asociados(p_cdgo_clnte       in number,
                                          p_id_slctud_prmsos in number,
                                          p_id_sjto_ascdo    in number,
                                          p_id_sjto_impsto   in number,
                                          p_id_usrio         in number,
                                          p_cdgo_gstion      in varchar2,
                                          o_cdgo_rspsta      out number,
                                          o_mnsje_rspsta     out varchar2) as
    v_nl         number;
    v_mnsje_log  varchar2(4000);
    nmbre_up     varchar2(100) := 'pkg_gi_asociado.prc_rg_traza_estado_asociados';
    v_cdgo_clnte number;

  begin
    o_cdgo_rspsta := 0;

    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'Entrando: ' || systimestamp,
                          1);

    begin
      insert into si_i_audt_estado_asociado
        (id_slctud_prmsos,
         id_sjto_ascdo,
         id_sjto_impsto,
         id_usrio,
         cdgo_gstion,
         fcha)
      values
        (p_id_slctud_prmsos,
         p_id_sjto_ascdo,
         p_id_sjto_impsto,
         p_id_usrio,
         p_cdgo_gstion,
         sysdate);

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            'Se registró la traza de estado de sujetos asociados correctamente',
                            6);

    exception
      when others then
        o_cdgo_rspsta  := 10;
        o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                          'No se pudo registrar la traza';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              o_mnsje_rspsta || ' , ' || sqlerrm,
                              6);
        return;
    end;

  end prc_rg_traza_estado_asociados;

  procedure prc_ac_estado_asociado(p_cdgo_clnte     in number,
                                   p_cdgo_gstion    in varchar2,
                                   p_id_usuario     in number,
                                   p_id_sjto_impsto in number,
                                   o_cdgo_rspsta    out number,
                                   o_mnsje_rspsta   out varchar2) as
    v_nl              number;
    v_mnsje_log       varchar2(4000);
    nmbre_up          varchar2(100) := 'pkg_si_sujeto_impuesto.prc_ac_estado_asociado';
    v_cdgo_clnte      number;
    v_estado          varchar2(20);
    v_json_parametros varchar2(4000);
  begin
    -- Inicializamos el código de respuesta a 0
    o_cdgo_rspsta := 0;

    -- Obtiene el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, nmbre_up);

    -- Log de entrada
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'Entrando: ' || systimestamp,
                          1);

    -- Verificación de parámetros de entrada
    if p_cdgo_clnte is null or p_cdgo_gstion is null then
      o_cdgo_rspsta  := 10;
      o_mnsje_rspsta := 'Parámetros de entrada inválidos';
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);
      return;
    end if;
    if p_cdgo_gstion = 'H' then
      -- Se actualiza el estado del sujeto asociado
      begin
        update si_i_sujetos_asociados
           set actvo = 'S'
         where id_usrio = p_id_usuario
           and id_sjto_impsto = p_id_sjto_impsto
           and actvo = 'N';

        -- Log de éxito
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'Se actualizó el estado de sujeto asociado correctamente',
                              6);
      exception
        when others then
          o_cdgo_rspsta  := 20;
          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'No se pudo actualizar el estado del sujeto asociado';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);
          return;
      end;

    elsif p_cdgo_gstion = 'D' then
      -- Se actualiza el estado del sujeto asociado
      begin
        update si_i_sujetos_asociados
           set actvo = 'N'
         where id_usrio = p_id_usuario
           and id_sjto_impsto = p_id_sjto_impsto
           and actvo = 'S';

        -- Log de éxito
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'Se actualizó la solicitud de asociado correctamente',
                              6);
      exception
        when others then
          o_cdgo_rspsta  := 30;
          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'No se pudo actualizar el detalle de la solicitud';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);
          return;
      end;

    end if;
  end prc_ac_estado_asociado;

  procedure prc_ac_permisos_sujeto_asociado(p_cdgo_clnte       in number,
                                            p_id_slctud_prmsos in number,
                                            p_cdna             in varchar2,
                                            p_cdgo_rspta       in varchar2,
                                            p_cdgo_gstion      in varchar2,
                                            o_cdgo_rspsta      out number,
                                            o_mnsje_rspsta     out varchar2) as

    -- Manejo de errores
    v_nl                   number;
    v_prcdmnto             varchar2(200) := 'pkg_gi_asociado.prc_ac_permisos_sujeto_asociado';
    v_id_dclrcion          number;
    v_actvo                varchar2(1);
    v_cdgo_rspsta          number;
    v_indcdor_atrzdo       varchar2(1);
    v_cdgo_prcso           varchar2(10);
    v_estdo                varchar2(5);
    v_cdgo_rspta           varchar2(10);
    v_id_usuario           number;
    v_json_parametros      clob;
    v_ids                  varchar2(4000);
    v_pos                  number := 1;
    v_id_slctd_ascdo_dtlle number;
    v_contar               number;
    v_id_sjto_impsto       number;
    v_id_usrio             number;
    v_id_sjto_ascdo        number;

  begin
    -- Determinamos el nivel del Log de la UP
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_prcdmnto);
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_prcdmnto,
                          v_nl,
                          'Proceso iniciado.',
                          1);
    o_cdgo_rspsta := 0;

    -- Se valida el estado de la solicitud
    begin
      select a.estdo
        into v_estdo
        from si_g_slctds_permisos_asociado a
       where a.id_slctud_prmsos = p_id_slctud_prmsos;
    exception
      when others then
        o_cdgo_rspsta  := 10;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>El estado de la solicitud no pudo ser validado, por favor intente nuevamente.</summary>' ||
                          '<p>' ||
                          'Para mas información consultar el código ' ||
                          v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                          '<p>' || sqlerrm || '.</p>' || '<p>' ||
                          o_mnsje_rspsta || '.</p>' || '</details>';
        return;
    end;

    -- Se valida que esté pendiente la solicitud
    if (v_estdo <> 'PEN') then
      o_cdgo_rspsta  := 20;
      o_mnsje_rspsta := '<details>' ||
                        '<summary>Esta solicitud ya fue procesada, no puede gestionarse nuevamente.</summary>' ||
                        '<p>' ||
                        'Para mas información consultar el código ' ||
                        v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                        '<p>' || sqlerrm || '.</p>' || '<p>' ||
                        o_mnsje_rspsta || '.</p>' || '</details>';
      return;
    end if;

    -- Se actualiza la autorización
    begin
      update si_g_slctds_permisos_asociado a
         set a.estdo = 'PRS', a.fcha_gstion = systimestamp
       where a.id_slctud_prmsos = p_id_slctud_prmsos;
    exception
      when others then
        rollback;
        o_cdgo_rspsta  := 40;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>La solicitud no pudo gestionarse, por favor intente nuevamente.</summary>' ||
                          '<p>' ||
                          'Para mas información consultar el código ' ||
                          v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                          '<p>' || sqlerrm || '.</p>' || '<p>' ||
                          o_mnsje_rspsta || '.</p>' || '</details>';
        return;
    end;

    -- Se valida el código de respuesta
    if (p_cdgo_rspta = 'A' and p_cdgo_gstion = 'D') then

      v_ids := p_cdna; -- La cadena de IDs separada por ":"

      loop
        -- Extraemos un ID de la cadena de IDs
        v_id_sjto_ascdo := regexp_substr(v_ids, '[^:]+', 1, v_pos);

        -- Si no hay más ID en la cadena, salimos del loop
        exit when v_id_sjto_ascdo is null;

        -- Se valida el usuario y sujeto impuesto de la tabla de sujetos asociados
        begin
          select id_sjto_impsto, id_usrio
            into v_id_sjto_impsto, v_id_usrio
            from si_i_sujetos_asociados a
           where a.id_sjto_ascdo = v_id_sjto_ascdo;
        exception
          when others then
            o_cdgo_rspsta  := 50;
            o_mnsje_rspsta := '<details>' ||
                              '<summary>Error al consultar estado de sujetos asociados</summary>' ||
                              '<p>' ||
                              'Para mas información consultar el código ' ||
                              v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                              '.</p>' || '<p>' || sqlerrm || '.</p>' ||
                              '<p>' || o_mnsje_rspsta || '.</p>' ||
                              '</details>';
            return;
        end;

        begin
          prc_ac_estado_asociado(p_cdgo_clnte     => p_cdgo_clnte,
                                 p_cdgo_gstion    => p_cdgo_gstion,
                                 p_id_usuario     => v_id_usrio,
                                 p_id_sjto_impsto => v_id_sjto_impsto,
                                 o_cdgo_rspsta    => o_cdgo_rspsta,
                                 o_mnsje_rspsta   => o_mnsje_rspsta);

          -- Verificación del código de respuesta después de la ejecución
          if (o_cdgo_rspsta <> 0) then
            rollback;
            o_cdgo_rspsta  := 60;
            o_mnsje_rspsta := '<details>' ||
                              '<summary>La solicitud no pudo gestionarse, por favor intente nuevamente.</summary>' ||
                              '<p>' ||
                              'Para más información consultar el código ' ||
                              v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                              '.</p>' || '<p>' || sqlerrm || '.</p>' ||
                              '<p>' || o_mnsje_rspsta || '.</p>' ||
                              '</details>';
            return;
          end if;
        exception
          when others then
            rollback;
            o_cdgo_rspsta  := 70;
            o_mnsje_rspsta := '<details>' ||
                              '<summary>La solicitud no pudo gestionarse, por favor intente nuevamente.</summary>' ||
                              '<p>' ||
                              'Para más información consultar el código ' ||
                              v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                              '.</p>' || '<p>' || sqlerrm || '.</p>' ||
                              '<p>' || o_mnsje_rspsta || '.</p>' ||
                              '</details>';
            return;
        end;

        begin
          prc_rg_traza_estado_asociados(p_cdgo_clnte       => p_cdgo_clnte,
                                        p_id_slctud_prmsos => p_id_slctud_prmsos,
                                        p_id_sjto_ascdo    => v_id_sjto_ascdo,
                                        p_id_sjto_impsto   => v_id_sjto_impsto,
                                        p_id_usrio         => v_id_usrio,
                                        p_cdgo_gstion      => p_cdgo_gstion,
                                        o_cdgo_rspsta      => o_cdgo_rspsta,
                                        o_mnsje_rspsta     => o_mnsje_rspsta);

          -- Verificación del código de respuesta después de la ejecución
          if (o_cdgo_rspsta <> 0) then
            rollback;
            o_cdgo_rspsta  := 80;
            o_mnsje_rspsta := '<details>' ||
                              '<summary>La traza de estado de sujeto asociado no pudo insertarse, por favor intente nuevamente.</summary>' ||
                              '<p>' ||
                              'Para más información consultar el código ' ||
                              v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                              '.</p>' || '<p>' || sqlerrm || '.</p>' ||
                              '<p>' || o_mnsje_rspsta || '.</p>' ||
                              '</details>';
            return;
          end if;
        exception
          when others then
            rollback;
            o_cdgo_rspsta  := 90;
            o_mnsje_rspsta := '<details>' ||
                              '<summary>La traza de estado de sujeto asociado no pudo insertarse, por favor intente nuevamente.</summary>' ||
                              '<p>' ||
                              'Para más información consultar el código ' ||
                              v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                              '.</p>' || '<p>' || sqlerrm || '.</p>' ||
                              '<p>' || o_mnsje_rspsta || '.</p>' ||
                              '</details>';
            return;
        end;

        -- Aumentamos la posición para el siguiente ID
        v_pos := v_pos + 1;
      end loop;

      commit;

      begin
        pkg_ma_envios.prc_co_envio_programado(p_cdgo_clnte   => p_cdgo_clnte,
                                              p_idntfcdor    => 'RPSTA_PRMSOS_AUTRZCION',
                                              p_json_prmtros => '{"p_id_slctud_prmsos":"' ||
                                                                p_id_slctud_prmsos || '"}');
        o_mnsje_rspsta := 'envíos programados, ' || v_json_parametros;

      exception
        when others then
          o_cdgo_rspsta  := 95;
          o_mnsje_rspsta := 'no. ' || o_cdgo_rspsta ||
                            ': error en los envíos programados, ' ||
                            sqlerrm;
          rollback;
          return;
      end; -- Fin Consultamos los envíos programados*/

      -- Se valida el código de respuesta
    elsif (p_cdgo_rspta = 'A' and p_cdgo_gstion = 'H') then
      -- Llamada al procedimiento para aceptar la solicitud

      v_ids := p_cdna; -- La cadena de IDs separada por ":"

      loop
        -- Extraemos un ID de la cadena de IDs
        v_id_sjto_ascdo := regexp_substr(v_ids, '[^:]+', 1, v_pos);

        -- Si no hay más ID en la cadena, salimos del loop
        exit when v_id_sjto_ascdo is null;

        -- Se valida el usuario y sujeto impuesto de la tabla de sujetos asociados
        begin
          select id_sjto_impsto, id_usrio
            into v_id_sjto_impsto, v_id_usrio
            from si_i_sujetos_asociados a
           where a.id_sjto_ascdo = v_id_sjto_ascdo;
        exception
          when others then
            o_cdgo_rspsta  := 100;
            o_mnsje_rspsta := '<details>' ||
                              '<summary>Error al consultar estado de sujetos asociados</summary>' ||
                              '<p>' ||
                              'Para mas información consultar el código ' ||
                              v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                              '.</p>' || '<p>' || sqlerrm || '.</p>' ||
                              '<p>' || o_mnsje_rspsta || '.</p>' ||
                              '</details>';
            return;
        end;

        begin
          prc_ac_estado_asociado(p_cdgo_clnte     => p_cdgo_clnte,
                                 p_cdgo_gstion    => p_cdgo_gstion,
                                 p_id_usuario     => v_id_usrio,
                                 p_id_sjto_impsto => v_id_sjto_impsto,
                                 o_cdgo_rspsta    => o_cdgo_rspsta,
                                 o_mnsje_rspsta   => o_mnsje_rspsta);

          -- Verificación del código de respuesta después de la ejecución
          if (o_cdgo_rspsta <> 0) then
            rollback;
            o_cdgo_rspsta  := 110;
            o_mnsje_rspsta := '<details>' ||
                              '<summary>La solicitud no pudo gestionarse, por favor intente nuevamente.</summary>' ||
                              '<p>' ||
                              'Para más información consultar el código ' ||
                              v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                              '.</p>' || '<p>' || sqlerrm || '.</p>' ||
                              '<p>' || o_mnsje_rspsta || '.</p>' ||
                              '</details>';
            return;
          end if;
        exception
          when others then
            rollback;
            o_cdgo_rspsta  := 120;
            o_mnsje_rspsta := '<details>' ||
                              '<summary>La solicitud no pudo gestionarse, por favor intente nuevamente.</summary>' ||
                              '<p>' ||
                              'Para más información consultar el código ' ||
                              v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                              '.</p>' || '<p>' || sqlerrm || '.</p>' ||
                              '<p>' || o_mnsje_rspsta || '.</p>' ||
                              '</details>';
            return;
        end;

        begin
          prc_rg_traza_estado_asociados(p_cdgo_clnte       => p_cdgo_clnte,
                                        p_id_slctud_prmsos => p_id_slctud_prmsos,
                                        p_id_sjto_ascdo    => v_id_sjto_ascdo,
                                        p_id_sjto_impsto   => v_id_sjto_impsto,
                                        p_id_usrio         => v_id_usrio,
                                        p_cdgo_gstion      => p_cdgo_gstion,
                                        o_cdgo_rspsta      => o_cdgo_rspsta,
                                        o_mnsje_rspsta     => o_mnsje_rspsta);

          -- Verificación del código de respuesta después de la ejecución
          if (o_cdgo_rspsta <> 0) then
            rollback;
            o_cdgo_rspsta  := 130;
            o_mnsje_rspsta := '<details>' ||
                              '<summary>La traza de estado de sujeto asociado no pudo insertarse, por favor intente nuevamente.</summary>' ||
                              '<p>' ||
                              'Para más información consultar el código ' ||
                              v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                              '.</p>' || '<p>' || sqlerrm || '.</p>' ||
                              '<p>' || o_mnsje_rspsta || '.</p>' ||
                              '</details>';
            return;
          end if;
        exception
          when others then
            rollback;
            o_cdgo_rspsta  := 140;
            o_mnsje_rspsta := '<details>' ||
                              '<summary>La traza de estado de sujeto asociado no pudo insertarse, por favor intente nuevamente.</summary>' ||
                              '<p>' ||
                              'Para más información consultar el código ' ||
                              v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                              '.</p>' || '<p>' || sqlerrm || '.</p>' ||
                              '<p>' || o_mnsje_rspsta || '.</p>' ||
                              '</details>';
            return;
        end;

        -- Aumentamos la posición para el siguiente ID
        v_pos := v_pos + 1;
      end loop;
    end if;

    commit;
    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := '<details>' ||
                      '<summary>Proceso ejecutado correctamente.</summary>' ||
                      '<p>' || 'Para más información consultar el código ' ||
                      v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                      '</details>';
    return;

  exception
    when others then
      rollback;
      o_cdgo_rspsta  := 999;
      o_mnsje_rspsta := '<details>' ||
                        '<summary>El procedimiento no pudo ejecutarse correctamente, por favor intente nuevamente.</summary>' ||
                        '<p>' ||
                        'Para más información consultar el código ' ||
                        v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                        '<p>' || sqlerrm || '.</p>' || '<p>' ||
                        o_mnsje_rspsta || '.</p>' || '</details>';
      return;
  end prc_ac_permisos_sujeto_asociado;

  procedure prc_ac_estado_solicitud(p_cdgo_clnte   in number,
                                    p_cdgo_vncmnto in varchar2,
                                    p_id_slctud    in number,
                                    o_cdgo_rspsta  out number,
                                    o_mnsje_rspsta out varchar2) as
    v_nl        number;
    v_mnsje_log varchar2(4000);
    nmbre_up    varchar2(100) := 'pkg_gi_asociado.prc_ac_estado_solicitud';
  begin
    -- Inicializamos el código de respuesta a 0
    o_cdgo_rspsta := 0;

    -- Obtiene el nivel de log
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, nmbre_up);

    -- Log de entrada
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          nmbre_up,
                          v_nl,
                          'Entrando: ' || systimestamp,
                          1);

    -- Verificación de parámetros de entrada
    if p_cdgo_clnte is null or p_id_slctud is null then
      o_cdgo_rspsta  := 10;
      o_mnsje_rspsta := 'Parámetros de entrada inválidos';
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            6);
      return;
    end if;

    if p_cdgo_vncmnto = 'SAS' then
      -- Se actualiza el estado de la solicitud
      begin
        update si_g_solicitudes_asociados
           set estdo = 'VEN', fcha_gstion = sysdate
         where id_slctud_ascdo = p_id_slctud
           and estdo = 'PEN';

        -- Log de éxito
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'Se actualizó el estado de la solicitud correctamente',
                              6);
      exception
        when others then
          o_cdgo_rspsta  := 20;
          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'No se pudo actualizar el estado de la solicitud';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);
          return;
      end;
    elsif p_cdgo_vncmnto = 'SPA' then
      -- Se actualiza el estado de la solicitud
      begin
        update si_g_slctds_permisos_asociado
           set estdo = 'VEN', fcha_gstion = sysdate
         where id_slctud_prmsos = p_id_slctud
           and estdo = 'PEN';

        -- Log de éxito
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              nmbre_up,
                              v_nl,
                              'Se actualizó el estado de la solicitud correctamente',
                              6);
      exception
        when others then
          o_cdgo_rspsta  := 20;
          o_mnsje_rspsta := o_cdgo_rspsta || ' - ' ||
                            'No se pudo actualizar el estado de la solicitud';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                nmbre_up,
                                v_nl,
                                o_mnsje_rspsta || ' , ' || sqlerrm,
                                6);
          return;
      end;

    end if;
  end prc_ac_estado_solicitud;

  procedure prc_co_solicitudes_ascdos(p_cdgo_clnte   in number,
                                      o_cdgo_rspsta  out number,
                                      o_mnsje_rspsta out varchar2) as
    v_nl       number;
    v_nmbre_up sg_d_configuraciones_log.nmbre_up%type := 'pkg_gi_asociado.prc_co_solicitudes_ascdos';

  begin
    -- determinamos el nivel del log de la up
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

    for cur in (select s.id_slctud_ascdo,
                       trunc(s.fcha_slctud) as fecha_slctud,
                       v.cdgo_vncmnto,
                       v.vlor,
                       v.dscrpcion,
                       (trunc(s.fcha_slctud) + v.vlor) as fecha_vencimiento
                  from si_g_solicitudes_asociados s
                  join si_d_fcha_vncmnto v
                    on 1 = 1
                 where s.estdo = 'PEN'
                   and cdgo_vncmnto = 'SAS'
                   and (trunc(s.fcha_slctud) + v.vlor) < trunc(sysdate)

                ) loop
      begin
        pkg_gi_asociado.prc_ac_estado_solicitud(p_cdgo_clnte   => p_cdgo_clnte,
                                                p_cdgo_vncmnto => cur.cdgo_vncmnto,
                                                p_id_slctud    => cur.id_slctud_ascdo,
                                                o_cdgo_rspsta  => o_cdgo_rspsta,
                                                o_mnsje_rspsta => o_mnsje_rspsta);
      exception
        when others then
          o_cdgo_rspsta  := 10;
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

    for cur in (select s.id_slctud_prmsos,
                       trunc(s.fcha_slctud) as fecha_slctud,
                       v.cdgo_vncmnto,
                       v.vlor,
                       v.dscrpcion,
                       (trunc(s.fcha_slctud) + v.vlor) as fecha_vencimiento
                  from si_g_slctds_permisos_asociado s
                  join si_d_fcha_vncmnto v
                    on 1 = 1
                 where s.estdo = 'PEN'
                   and cdgo_vncmnto = 'SPA'
                   and (trunc(s.fcha_slctud) + v.vlor) < trunc(sysdate)

                ) loop
      begin
        pkg_gi_asociado.prc_ac_estado_solicitud(p_cdgo_clnte   => p_cdgo_clnte,
                                                p_cdgo_vncmnto => cur.cdgo_vncmnto,
                                                p_id_slctud    => cur.id_slctud_prmsos,
                                                o_cdgo_rspsta  => o_cdgo_rspsta,
                                                o_mnsje_rspsta => o_mnsje_rspsta);
      exception
        when others then
          o_cdgo_rspsta  := 20;
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
      o_cdgo_rspsta  := 30;
      o_mnsje_rspsta := 'error general: ' || sqlerrm;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            3);

  end prc_co_solicitudes_ascdos;

end pkg_gi_asociado;
/

