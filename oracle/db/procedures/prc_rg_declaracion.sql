
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_RG_DECLARACION" (p_cdgo_clnte                 in number,
                               p_id_dclrcion_vgncia_frmlrio in number,
                               p_id_cnddto_vgncia           in number default null,
                               p_id_usrio                   in number,
                               p_json                       in clob,
                               p_id_orgen_tpo               in  number default 1,
                               p_id_dclrcion        in  out number,
                               p_id_sjto_impsto             in  number default null,
                               o_cdgo_rspsta                out number,
                               o_mnsje_rspsta               out varchar2) as
    v_nl         number;
    v_prcdmnto   varchar2(200) := 'pkg_gi_declaraciones.prc_rg_declaracion';
    v_cdgo_prcso varchar2(100) := 'DCL10';

    v_json_length                 number;
    v_id_impsto                   number;
    v_id_impsto_sbmpsto           number;
    v_vgncia                      number;
    v_id_prdo                     number;
    v_id_frmlrio                  number;
    v_cdgo_cnsctvo                varchar2(3);
    v_nmro_cnsctvo                number;
    v_cdgo_dclrcion_estdo         varchar2(3);
    v_idntfccion                  varchar2(100);
    v_cdgo_dclrcion_uso           varchar2(3);
    v_fcha_prsntcion_pryctda      varchar2(100);
    v_id_dclrcion_uso             varchar2(100);
    v_id_sjto_impsto              number;
    v_id_dclrcion_crrcion         number;
    v_cdgo_dclrcion_crrcion_estdo varchar2(3);
    v_bse_grvble                  varchar2(30);
    v_vlor_ttal                   varchar2(30);
    v_vlor_pgo                    varchar2(30);
    v_exste_incial                number := 0; -- REQ. DIAN
  begin
    --Determinamos el nivel del Log de la UPv
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_prcdmnto);
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_prcdmnto,
                          v_nl,
                          'Proceso iniciado',
                          1);
    o_cdgo_rspsta := 0;

    /*rollback;
    delete muerto;
    insert into muerto (c_001) values (p_json);
    commit;
    return;*/

    --Se valida que p_json no este vacio
    begin
      select count(*)
        into v_json_length
        from json_table(p_json,
                        '$[*]' columns(id varchar2(1000) path '$.id'));
      if (v_json_length = 0) then
        o_cdgo_rspsta  := 1;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>La declaracion no ha sido gestionada, ' ||
                          'por favor intente nuevamente.' || o_mnsje_rspsta ||
                          '</summary>' || '<p>' ||
                          'Para mas informacion consultar el codigo ' ||
                          v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                          '</details>';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              o_mnsje_rspsta,
                              2);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              sqlerrm,
                              2);
        return;
      end if;
    end;

    --Se consulta el impuesto y el formulario de la declaracion
    begin
      select a.id_frmlrio,
             c.id_impsto,
             c.id_impsto_sbmpsto,
             b.vgncia,
             b.id_prdo
        into v_id_frmlrio,
             v_id_impsto,
             v_id_impsto_sbmpsto,
             v_vgncia,
             v_id_prdo
        from gi_d_dclrcnes_vgncias_frmlr a
       inner join gi_d_dclrcnes_tpos_vgncias b
          on b.id_dclrcion_tpo_vgncia = a.id_dclrcion_tpo_vgncia
       inner join gi_d_declaraciones_tipo c
          on c.id_dclrcn_tpo = b.id_dclrcn_tpo
       where a.id_dclrcion_vgncia_frmlrio = p_id_dclrcion_vgncia_frmlrio;
    exception
      when others then
        o_cdgo_rspsta  := 2;
        o_mnsje_rspsta := '|' || v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                          ' Problemas al consultar el impuesto y el formulario de la declaracion,' ||
                          ' por favor, solicitar apoyo tecnico con este mensaje.' ||
                          o_mnsje_rspsta;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              o_mnsje_rspsta,
                              2);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              sqlerrm,
                              2);
        return;
    end;

    --Se define si registra o actualiza una declaracion existente para el encabezado
    if (p_id_dclrcion is null) then
      --Se consulta el codigo del consecutivo a utilizar en el formulario
      begin
        select a.cdgo_cnsctvo
          into v_cdgo_cnsctvo
          from df_c_consecutivos a
         where exists (select 1
                  from gi_d_formularios b
                 where b.id_frmlrio = v_id_frmlrio
                   and b.id_cnsctvo = a.id_cnsctvo);
      exception
        when others then
          o_cdgo_rspsta  := 3;
          o_mnsje_rspsta := '|' || v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                            ' Problemas al consular el consecutivo con el cual se registra la declaracion,' ||
                            ' por favor, solicitar apoyo tecnico con este mensaje.' ||
                            o_mnsje_rspsta;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_prcdmnto,
                                v_nl,
                                o_mnsje_rspsta,
                                2);
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_prcdmnto,
                                v_nl,
                                sqlerrm,
                                2);
          return;
      end;
      --Se genera el consecutivo
      begin

        /*
                cOMENTARIAMOS Para
        v_nmro_cnsctvo := pkg_gn_generalidades.fnc_cl_consecutivo (p_cdgo_clnte   => p_cdgo_clnte,
                                       p_cdgo_cnsctvo => v_cdgo_cnsctvo);
            */
        v_nmro_cnsctvo := '1' || to_char(sysdate, 'YYYY') ||
                          lpad(sq_gi_g_dclrcns_nmro_cnsctvo.nextval, 7, '0');

      exception
        when others then
          o_cdgo_rspsta  := 4;
          o_mnsje_rspsta := '|' || v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                            ' Problemas al generar el consecutivo con el cual se registra la declaracion,' ||
                            ' por favor, solicitar apoyo tecnico con este mensaje.' ||
                            o_mnsje_rspsta;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_prcdmnto,
                                v_nl,
                                o_mnsje_rspsta,
                                2);
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_prcdmnto,
                                v_nl,
                                sqlerrm,
                                2);
          return;
      end;

      --Se define el estado de registro de la declaracion
      --(Si nace desde una declaracion del contribuyente o por un proceso de fiscalizacion)
      if (p_id_cnddto_vgncia is null) then
        v_cdgo_dclrcion_estdo := 'REG';
      else
        v_cdgo_dclrcion_estdo := 'RLA';
      end if;

      --Se registra la declaracion
      begin
        insert into gi_g_declaraciones
          (id_dclrcion_vgncia_frmlrio,
           cdgo_clnte,
           id_impsto,
           id_impsto_sbmpsto,
           vgncia,
           id_prdo,
           id_cnddto_vgncia,
           cdgo_dclrcion_estdo,
           nmro_cnsctvo,
           id_usrio_rgstro,
           fcha_rgstro,
           cdgo_orgn_tpo)
        values
          (p_id_dclrcion_vgncia_frmlrio,
           p_cdgo_clnte,
           v_id_impsto,
           v_id_impsto_sbmpsto,
           v_vgncia,
           v_id_prdo,
           p_id_cnddto_vgncia,
           v_cdgo_dclrcion_estdo,
           v_nmro_cnsctvo,
           p_id_usrio,
           systimestamp,
           p_id_orgen_tpo)
        returning id_dclrcion into p_id_dclrcion;
      exception
        when others then
          o_cdgo_rspsta  := 5;
          o_mnsje_rspsta := '<details>' ||
                            '<summary>No se pudo registrar la declaracion, ' ||
                            'por favor intente nuevamente.' ||
                            o_mnsje_rspsta || '</summary>' || '<p>' ||
                            'Para mas informacion consultar el codigo ' ||
                            v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                            '<br><p>' || sqlerrm || '.</p>' || '</details>';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_prcdmnto,
                                v_nl,
                                o_mnsje_rspsta,
                                2);
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_prcdmnto,
                                v_nl,
                                sqlerrm,
                                2);
          return;
      end;
    else
      --Se valida que existe la declaracion.
      begin
        select a.cdgo_dclrcion_estdo
          into v_cdgo_dclrcion_estdo
          from gi_g_declaraciones a
         where a.id_dclrcion = p_id_dclrcion;
      exception
        when no_data_found then
          o_cdgo_rspsta  := 6;
          o_mnsje_rspsta := '|' || v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                            ' la declaracion no se encuentra registrada en la base de datos,' ||
                            ' por favor, verificar datos gestionados.' ||
                            o_mnsje_rspsta;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_prcdmnto,
                                v_nl,
                                o_mnsje_rspsta,
                                2);
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_prcdmnto,
                                v_nl,
                                sqlerrm,
                                2);
          return;
      end;
      --Se valida que el estado de la declaracion no sea diferente a registrado
      if (v_cdgo_dclrcion_estdo not in ('REG', 'RLA')) then
        -- REG: Registrada de forma normal, RLA: Registrada desde fiscalizacion
        o_cdgo_rspsta  := 7;
        o_mnsje_rspsta := '|' || v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                          ' El estado de la declaracion no permite que sea editada,' ||
                          ' por favor gestionar una nueva declaracion.' ||
                          o_mnsje_rspsta;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              o_mnsje_rspsta,
                              2);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              sqlerrm,
                              2);
        return;
      end if;
      --Se actualiza la declaracion
      begin
        update gi_g_declaraciones a
           set a.id_usrio_ultima_mdfccion = p_id_usrio,
               a.fcha_ultma_mdfccion      = systimestamp
         where a.id_dclrcion = p_id_dclrcion;
      exception
        when others then
          o_cdgo_rspsta  := 8;
          o_mnsje_rspsta := '|' || v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                            ' La declaracion no pudo ser actualizada,' ||
                            ' por favor intente nuevamente.' ||
                            o_mnsje_rspsta;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_prcdmnto,
                                v_nl,
                                o_mnsje_rspsta,
                                2);
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_prcdmnto,
                                v_nl,
                                sqlerrm,
                                2);
          return;
      end;
    end if;

    pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto, v_nl, 'p_json:'||p_json, 3);

    --Se gestiona el detalle segun la declaracion
    begin
      for c_json in (select id,
                            id_frmlrio_rgion,
                            id_frmlrio_rgion_atrbto,
                            fla,
                            orden,
                            vlor,
                            vlor_dsplay,
                            accion
                       from json_table(p_json,
                                       '$[*]'
                                       columns(id varchar2(1000) path '$.ID',
                                               id_frmlrio_rgion number path
                                               '$.ID_FRMLRIO_RGION',
                                               id_frmlrio_rgion_atrbto number path
                                               '$.ID_FRMLRIO_RGION_ATRBTO',
                                               fla number path '$.FLA',
                                               orden number path '$.ORDEN',
                                               vlor varchar2(4000) path
                                               '$.NEW',
                                               vlor_dsplay varchar2(4000) path
                                               '$.DISPLAY',
                                               accion varchar2(2) path
                                               '$.ACCION'))) loop
        --Se define la accion a realizar
        --Se elimina el valor de atributo
        if (c_json.accion = 'D') then
          begin
            delete gi_g_declaraciones_detalle a
             where a.id_dclrcion = p_id_dclrcion
               and a.id_frmlrio_rgion_atrbto =
                   c_json.id_frmlrio_rgion_atrbto
               and a.fla = c_json.fla;
          exception
            when others then
              rollback;
              o_cdgo_rspsta  := 9;
              o_mnsje_rspsta := '|' || v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                                ' Problemas al eliminar valor no.' ||
                                c_json.id || 'de la declaracion,' ||
                                ' por favor, solicitar apoyo tecnico con este mensaje.' ||
                                o_mnsje_rspsta;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_prcdmnto,
                                    v_nl,
                                    o_mnsje_rspsta,
                                    3);
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_prcdmnto,
                                    v_nl,
                                    sqlerrm,
                                    3);
              return;
          end;
          --Se actualiza el valor de atributo
        elsif (c_json.accion = 'U') then
          begin
            update gi_g_declaraciones_detalle a
               set a.vlor        = c_json.vlor,
                   a.orden       = c_json.orden,
                   a.vlor_dsplay = c_json.vlor_dsplay
             where a.id_dclrcion = p_id_dclrcion
               and a.id_frmlrio_rgion_atrbto =
                   c_json.id_frmlrio_rgion_atrbto
               and a.fla = c_json.fla;
          exception
            when others then
              rollback;
              o_cdgo_rspsta  := 10;
              o_mnsje_rspsta := '|' || v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                                ' Problemas al actualizar valor no.' ||
                                c_json.id || 'de la declaracion,' ||
                                ' por favor, solicitar apoyo tecnico con este mensaje.' ||
                                o_mnsje_rspsta;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_prcdmnto,
                                    v_nl,
                                    o_mnsje_rspsta,
                                    3);
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_prcdmnto,
                                    v_nl,
                                    sqlerrm,
                                    3);
              return;
          end;
          --Se inserta el valor de atributo
        elsif (c_json.accion = 'I') then
        pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, 'detalle:=>id'||p_id_dclrcion||
                                                                      'rgnatr=>'||c_json.id_frmlrio_rgion_atrbto
                                                                      ||'fla=>'||c_json.fla, 3);

          --Se inserta el detalle de declaraciones temporales
          begin
            insert into gi_g_declaraciones_detalle
              (id_dclrcion,
               id_frmlrio_rgion,
               id_frmlrio_rgion_atrbto,
               fla,
               orden,
               vlor,
               vlor_dsplay)
            values
              (p_id_dclrcion,
               c_json.id_frmlrio_rgion,
               c_json.id_frmlrio_rgion_atrbto,
               c_json.fla,
               c_json.orden,
               c_json.vlor,
               c_json.vlor_dsplay);
          exception
            when others then
              rollback;
              o_cdgo_rspsta  := 11;
              o_mnsje_rspsta := '<details>' ||
                                '<summary>No se pudo registrar la declaracion, ' ||
                                'por favor intente nuevamente.' ||
                                o_mnsje_rspsta || '</summary>' || '<p>' ||
                                'Para mas informacion consultar el codigo ' ||
                                v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                                '.</p>' || '<p>' || 'RGN' ||
                                c_json.id_frmlrio_rgion || 'ATR' ||
                                c_json.id_frmlrio_rgion_atrbto ||
                                ' Error: ' || sqlerrm || '.</p>' ||
                                '</details>';
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_prcdmnto,
                                    v_nl,
                                    o_mnsje_rspsta,
                                    3);
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_prcdmnto,
                                    v_nl,
                                    sqlerrm,
                                    3);
              return;
          end;
        end if;
      end loop;
    exception
      when others then
        rollback;
        o_cdgo_rspsta  := 12;
        o_mnsje_rspsta := '|' || v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                          ' Problemas al recorrer el detalle de la declaracion,' ||
                          ' por favor, solicitar apoyo tecnico con este mensaje.' ||
                          o_mnsje_rspsta;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              o_mnsje_rspsta,
                              2);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              sqlerrm,
                              2);
        return;
    end;

    --Se valida el sujeto impuesto, para esto es necesario:
    --  --  1. Se homologa la identificacion del declarante en el formulario

  v_id_sjto_impsto := p_id_sjto_impsto;
  if (p_id_orgen_tpo <> 2)then
    begin
      pkg_gi_declaraciones.prc_co_homologacion(p_cdgo_clnte    => p_cdgo_clnte,
                                               p_cdgo_hmlgcion => 'PRD',
                                               p_cdgo_prpdad   => 'IDT',
                                               p_id_dclrcion   => p_id_dclrcion,
                                               o_vlor          => v_idntfccion,
                                               o_cdgo_rspsta   => o_cdgo_rspsta,
                                               o_mnsje_rspsta  => o_mnsje_rspsta);
      if (o_cdgo_rspsta <> 0) then
        rollback;
        o_cdgo_rspsta  := 13;
        o_mnsje_rspsta := '|' || v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                          'Identificacion del declarante: ' ||
                          o_mnsje_rspsta;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              o_mnsje_rspsta,
                              2);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              sqlerrm,
                              2);
        return;
      end if;
    exception
      when others then
        rollback;
        o_cdgo_rspsta  := 14;
        o_mnsje_rspsta := '|' || v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                          ' No se pudo homologar la identificacion del declarante en el formulario,' ||
                          ' por favor intente nuevamente.' ||
                          o_mnsje_rspsta;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              o_mnsje_rspsta,
                              2);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              sqlerrm,
                              2);
        return;
    end;
    --  --  2. Se consulta el sujeto-impuesto con la identificacion homologada
    begin
      select id_sjto_impsto
        into v_id_sjto_impsto
        from v_si_i_sujetos_impuesto
       where cdgo_clnte = p_cdgo_clnte
         and id_impsto = v_id_impsto
         and idntfccion_sjto = v_idntfccion;
    exception
      when no_data_found then
        declare
          v_indcdor_rgstro_sjto_impsto varchar2(100);
        begin
          --Consultamos las definiciones donde se indica si se puede registrar
          --un sujeto impuesto desde la declaracion
          v_indcdor_rgstro_sjto_impsto := pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte                => p_cdgo_clnte,
                                                                                          p_cdgo_dfncion_clnte_ctgria => 'DCL',
                                                                                          p_cdgo_dfncion_clnte        => 'RST');
          if (v_indcdor_rgstro_sjto_impsto = '-1') then
            rollback;
            o_cdgo_rspsta  := 15;
            o_mnsje_rspsta := '|' || v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                              ' No se pudo registrar la declaracion,' ||
                              ' por favor intente nuevamente.' ||
                              o_mnsje_rspsta;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_prcdmnto,
                                  v_nl,
                                  o_mnsje_rspsta,
                                  2);
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_prcdmnto,
                                  v_nl,
                                  sqlerrm,
                                  2);
            return;
          elsif (v_indcdor_rgstro_sjto_impsto = 'N') then
            --Si la definicion no permite registrar sujeto-tributo desde la declaracion
            rollback;
            o_cdgo_rspsta  := 16;
            o_mnsje_rspsta := '|' || v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                              ' El declarante no existe en la base de datos.' ||
                              o_mnsje_rspsta;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_prcdmnto,
                                  v_nl,
                                  o_mnsje_rspsta,
                                  2);
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_prcdmnto,
                                  v_nl,
                                  sqlerrm,
                                  2);
            return;
          elsif (v_indcdor_rgstro_sjto_impsto = 'S') then
            pkg_gi_declaraciones.prc_rg_sujeto_impuesto_dclrcion(p_cdgo_clnte        => p_cdgo_clnte,
                                                                 p_id_frmlrio        => v_id_frmlrio,
                                                                 p_id_dclrcion       => p_id_dclrcion,
                                                                 p_id_impsto         => v_id_impsto,
                                                                 p_id_impsto_sbmpsto => v_id_impsto_sbmpsto,
                                                                 o_id_sjto_impsto    => v_id_sjto_impsto,
                                                                 o_cdgo_rspsta       => o_cdgo_rspsta,
                                                                 o_mnsje_rspsta      => o_mnsje_rspsta);
            if (o_cdgo_rspsta <> 0) then
              --La definicion del cliente no existe o tiene problemas
              rollback;
              o_cdgo_rspsta  := 17;
              o_mnsje_rspsta := '<details>' ||
                                '<summary>No se pudo registrar la declaracion, ' ||
                                'por favor intente nuevamente.' ||
                                o_mnsje_rspsta || '</summary>' || '<p>' ||
                                'Para mas informacion consultar el codigo ' ||
                                v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                                '.</p>' || '</details>';
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_prcdmnto,
                                    v_nl,
                                    o_mnsje_rspsta,
                                    3);
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_prcdmnto,
                                    v_nl,
                                    sqlerrm,
                                    3);
              return;
            end if;
          else
            --La definicion del cliente no existe o tiene problemas
            rollback;
            o_cdgo_rspsta  := 18;
            o_mnsje_rspsta := '<details>' ||
                              '<summary>No se pudo registrar la declaracion, ' ||
                              'por favor intente nuevamente.' ||
                              o_mnsje_rspsta || '</summary>' || '<p>' ||
                              'Para mas informacion consultar el codigo ' ||
                              v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                              '.</p>' || '</details>';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_prcdmnto,
                                  v_nl,
                                  o_mnsje_rspsta,
                                  3);
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_prcdmnto,
                                  v_nl,
                                  sqlerrm,
                                  3);
            return;
          end if;
        exception
          when others then
            rollback;
            o_cdgo_rspsta  := 19;
            o_mnsje_rspsta := '<details>' ||
                              '<summary>No se pudo registrar la declaracion, ' ||
                              'por favor intente nuevamente.' ||
                              o_mnsje_rspsta || '</summary>' || '<p>' ||
                              'Para mas informacion consultar el codigo ' ||
                              v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                              '.</p>' || '</details>';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_prcdmnto,
                                  v_nl,
                                  o_mnsje_rspsta,
                                  3);
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_prcdmnto,
                                  v_nl,
                                  sqlerrm,
                                  3);
            return;
        end;
      when others then
        rollback;
        o_cdgo_rspsta  := 20;
        o_mnsje_rspsta := '|' || v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                          ' Problemas al consultar si el declarante existe en la base de datos,' ||
                          ' por favor, solicitar apoyo tecnico con este mensaje.' ||
                          o_mnsje_rspsta;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              o_mnsje_rspsta,
                              2);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              sqlerrm,
                              2);
        return;
    end;

    --Se valida la fecha proyectada de presentacion
    --  --  1. Se homologa la fecha proyectada de presentacion en el formulario
    begin
      pkg_gi_declaraciones.prc_co_homologacion(p_cdgo_clnte    => p_cdgo_clnte,
                                               p_cdgo_hmlgcion => 'PRD',
                                               p_cdgo_prpdad   => 'FPY',
                                               p_id_dclrcion   => p_id_dclrcion,
                                               o_vlor          => v_fcha_prsntcion_pryctda,
                                               o_cdgo_rspsta   => o_cdgo_rspsta,
                                               o_mnsje_rspsta  => o_mnsje_rspsta);
      if (o_cdgo_rspsta <> 0) then
        rollback;
        o_cdgo_rspsta  := 21;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>No se pudo registrar la declaracion, ' ||
                          'por favor intente nuevamente.' || o_mnsje_rspsta ||
                          '</summary>' || '<p>' ||
                          'Para mas informacion consultar el codigo ' ||
                          v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                          '</details>';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              o_mnsje_rspsta,
                              2);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              sqlerrm,
                              2);
        return;
      end if;
    exception
      when others then
        rollback;
        o_cdgo_rspsta  := 22;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>No se pudo registrar la declaracion, ' ||
                          'por favor intente nuevamente.' || o_mnsje_rspsta ||
                          '</summary>' || '<p>' ||
                          'Para mas informacion consultar el codigo ' ||
                          v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                          '</details>';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              o_mnsje_rspsta,
                              2);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              sqlerrm,
                              2);
        return;
    end;

    if (v_fcha_prsntcion_pryctda is null) then
      rollback;
      o_cdgo_rspsta  := 23;
      o_mnsje_rspsta := '<details>' ||
                        '<summary>No se pudo registrar la declaracion, debe proyectar una fecha de presentacion, ' ||
                        'por favor intente nuevamente.' || o_mnsje_rspsta ||
                        '</summary>' || '<p>' ||
                        'Para mas informacion consultar el codigo ' ||
                        v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                        '</details>';
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_prcdmnto,
                            v_nl,
                            o_mnsje_rspsta,
                            2);
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_prcdmnto,
                            v_nl,
                            sqlerrm,
                            2);
      return;
    end if;

    --Se valida el uso de declaracion, para esto es necesario:
    --  --  1. Se homologa el uso de la declaracion en el formulario
    begin
      pkg_gi_declaraciones.prc_co_homologacion(p_cdgo_clnte    => p_cdgo_clnte,
                                               p_cdgo_hmlgcion => 'PRD',
                                               p_cdgo_prpdad   => 'UDC',
                                               p_id_dclrcion   => p_id_dclrcion,
                                               o_vlor          => v_cdgo_dclrcion_uso,
                                               o_cdgo_rspsta   => o_cdgo_rspsta,
                                               o_mnsje_rspsta  => o_mnsje_rspsta);
      if (o_cdgo_rspsta <> 0) then
        rollback;
        o_cdgo_rspsta  := 24;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>No se pudo registrar la declaracion, ' ||
                          'por favor intente nuevamente.' || o_mnsje_rspsta ||
                          '</summary>' || '<p>' ||
                          'Para mas informacion consultar el codigo ' ||
                          v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                          '</details>';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              o_mnsje_rspsta,
                              2);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              sqlerrm,
                              2);
        return;
      end if;
    exception
      when others then
        rollback;
        o_cdgo_rspsta  := 25;
        o_mnsje_rspsta := '|' || v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                          ' No se pudo homologar el uso de la declaracion en el formulario,' ||
                          ' por favor intente nuevamente.' ||
                          o_mnsje_rspsta;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              o_mnsje_rspsta,
                              2);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              sqlerrm,
                              2);
        return;
    end;

    --Se consulta el uso de la declaracion
    begin
      select a.id_dclrcion_uso
        into v_id_dclrcion_uso
        from gi_d_declaraciones_uso a
       where a.cdgo_dclrcion_uso = v_cdgo_dclrcion_uso;
    exception
      when others then
        rollback;
        o_cdgo_rspsta  := 26;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>No se pudo registrar la declaracion, ' ||
                          'por favor intente nuevamente.' || o_mnsje_rspsta ||
                          '</summary>' || '<p>' ||
                          'Para mas informacion consultar el codigo ' ||
                          v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                          '</details>';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              o_mnsje_rspsta,
                              3);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              sqlerrm,
                              3);
        return;
    end;

    if (v_cdgo_dclrcion_uso = 'DCO') then
      --Se consulta si hay una declaracion anterior
      begin
        select a.id_dclrcion, a.cdgo_dclrcion_estdo
          into v_id_dclrcion_crrcion, v_cdgo_dclrcion_crrcion_estdo
          from gi_g_declaraciones a
         where a.id_dclrcion_vgncia_frmlrio = p_id_dclrcion_vgncia_frmlrio
           and a.id_sjto_impsto = v_id_sjto_impsto
           and a.id_dclrcion <> p_id_dclrcion
           and a.cdgo_dclrcion_estdo in ('APL', 'PRS', 'FRM');
      exception
        when no_data_found then
          null;
        when others then
          rollback;
          o_cdgo_rspsta  := 27;
          o_mnsje_rspsta := '<details>' ||
                            '<summary>No se pudo registrar la declaracion de correccion, ' ||
                            'por favor intente nuevamente.' ||
                            o_mnsje_rspsta || '</summary>' || '<p>' ||
                            'Para mas informacion consultar el codigo ' ||
                            v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                            '</details>';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_prcdmnto,
                                v_nl,
                                o_mnsje_rspsta,
                                3);
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_prcdmnto,
                                v_nl,
                                sqlerrm,
                                3);
          return;
      end;

      --Se valida el estado de la declaracion
      if (v_cdgo_dclrcion_crrcion_estdo = 'FRM') then
        o_cdgo_rspsta  := 28;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>No se pudo registrar la declaracion, ' ||
                          'ya que existe una presentada en estado de firmeza que impide ser modificada o corregida.
                    ' || o_mnsje_rspsta || '</summary>' ||
                          '<p>' ||
                          'Para mas informacion consultar el codigo ' ||
                          v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                          '</details>';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              o_mnsje_rspsta,
                              3);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              sqlerrm,
                              3);
        return;
      end if;

      --Si es una declaracion de correccion se valida que exista una que la preceda.
      if (v_id_dclrcion_crrcion is null) then
        rollback;
        o_cdgo_rspsta  := 29;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>No se pudo registrar la declaracion de correccion, ' ||
                          'no existe una que la anteceda, por favor intente nuevamente.' ||
                          o_mnsje_rspsta || '</summary>' || '<p>' ||
                          'Para mas informacion consultar el codigo ' ||
                          v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                          '</details>';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              o_mnsje_rspsta,
                              3);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              sqlerrm,
                              3);
        return;
        --Se valida si la declaracion inicial no tiene una que la preceda
        /*elsif (v_cdgo_dclrcion_uso = 'DIN' and v_id_dclrcion_crrcion is not null) then
        v_cdgo_dclrcion_uso := 'DCO';*/
      end if;
    end if;

    --Se valida la base gravable de la declaracion, para esto es necesario:
    --  --  1. Se homologa la base gravable en el formulario
    begin
      pkg_gi_declaraciones.prc_co_homologacion(p_cdgo_clnte    => p_cdgo_clnte,
                                               p_cdgo_hmlgcion => 'PRD',
                                               p_cdgo_prpdad   => 'VBG',
                                               p_id_dclrcion   => p_id_dclrcion,
                                               o_vlor          => v_bse_grvble,
                                               o_cdgo_rspsta   => o_cdgo_rspsta,
                                               o_mnsje_rspsta  => o_mnsje_rspsta);
      if (o_cdgo_rspsta <> 0) then
        rollback;
        o_cdgo_rspsta  := 30;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>No se pudo registrar la declaracion, ' ||
                          'por favor intente nuevamente.</summary>' ||
                          '<p>' ||
                          'Para mas informacion consultar el codigo ' ||
                          v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                          '.</p><br>' || '<p>' || o_mnsje_rspsta || '.</p>' ||
                          '</details>';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              o_mnsje_rspsta,
                              2);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              sqlerrm,
                              2);
        return;
      end if;
    exception
      when others then
        rollback;
        o_cdgo_rspsta  := 31;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>No se pudo registrar la declaracion, ' ||
                          'por favor intente nuevamente.</summary>' ||
                          '<p>' ||
                          'Para mas informacion consultar el codigo ' ||
                          v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                          '.</p><br>' || '<p>' || o_mnsje_rspsta || '.</p>' ||
                          '</details>';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              o_mnsje_rspsta,
                              2);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              sqlerrm,
                              2);
        return;
    end;

    --Se valida el valor total de la declaracion, para esto es necesario:
    --  --  1. Se homologa el valor total de la declaracion en el formulario
    begin
      pkg_gi_declaraciones.prc_co_homologacion(p_cdgo_clnte    => p_cdgo_clnte,
                                               p_cdgo_hmlgcion => 'PRD',
                                               p_cdgo_prpdad   => 'VTL',
                                               p_id_dclrcion   => p_id_dclrcion,
                                               o_vlor          => v_vlor_ttal,
                                               o_cdgo_rspsta   => o_cdgo_rspsta,
                                               o_mnsje_rspsta  => o_mnsje_rspsta);
      if (o_cdgo_rspsta <> 0) then
        rollback;
        o_cdgo_rspsta  := 32;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>No se pudo registrar la declaracion, ' ||
                          'por favor intente nuevamente.</summary>' ||
                          '<p>' ||
                          'Para mas informacion consultar el codigo ' ||
                          v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                          '.</p><br>' || '<p>' || o_mnsje_rspsta || '.</p>' ||
                          '</details>';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              o_mnsje_rspsta,
                              2);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              sqlerrm,
                              2);
        return;
      end if;
    exception
      when others then
        rollback;
        o_cdgo_rspsta  := 33;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>No se pudo registrar la declaracion, ' ||
                          'por favor intente nuevamente.</summary>' ||
                          '<p>' ||
                          'Para mas informacion consultar el codigo ' ||
                          v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                          '.</p><br>' || '<p>' || o_mnsje_rspsta || '.</p>' ||
                          '</details>';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              o_mnsje_rspsta,
                              2);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              sqlerrm,
                              2);
        return;
    end;

    --Se valida el valor del pago de la declaracion, para esto es necesario:
    --  --  1. Se homologa el valor del pago de la declaracion en el formulario
    begin
      pkg_gi_declaraciones.prc_co_homologacion(p_cdgo_clnte    => p_cdgo_clnte,
                                               p_cdgo_hmlgcion => 'PRD',
                                               p_cdgo_prpdad   => 'VPG',
                                               p_id_dclrcion   => p_id_dclrcion,
                                               o_vlor          => v_vlor_pgo,
                                               o_cdgo_rspsta   => o_cdgo_rspsta,
                                               o_mnsje_rspsta  => o_mnsje_rspsta);
      if (o_cdgo_rspsta <> 0) then
        rollback;
        o_cdgo_rspsta  := 34;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>No se pudo registrar la declaracion, ' ||
                          'por favor intente nuevamente.</summary>' ||
                          '<p>' ||
                          'Para mas informacion consultar el codigo ' ||
                          v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                          '.</p><br>' || '<p>' || o_mnsje_rspsta || '.</p>' ||
                          '</details>';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              o_mnsje_rspsta,
                              2);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              sqlerrm,
                              2);
        return;
      end if;
    exception
      when others then
        rollback;
        o_cdgo_rspsta  := 35;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>No se pudo registrar la declaracion, ' ||
                          'por favor intente nuevamente.</summary>' ||
                          '<p>' ||
                          'Para mas informacion consultar el codigo ' ||
                          v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                          '.</p><br>' || '<p>' || o_mnsje_rspsta || '.</p>' ||
                          '</details>';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              o_mnsje_rspsta,
                              2);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              sqlerrm,
                              2);
        return;
    end;
/*** se comentarea REQ DIAN
    --Se actualiza en la tabla gi_g_declaraciones:
    --Sujeto Impuesto
    --Uso de la declaracion
    --Fecha de presentacion proyectada
    --Base gravable de la declaracion
    --Valor total de la declaracion
    --Valor del pago de la declaracion
    begin
      update gi_g_declaraciones a
         set a.id_sjto_impsto         = v_id_sjto_impsto,
             a.id_dclrcion_uso        = v_id_dclrcion_uso,
             a.id_dclrcion_crrccion   = v_id_dclrcion_crrcion,
             a.fcha_prsntcion_pryctda = to_timestamp(v_fcha_prsntcion_pryctda,
                                                     'dd/mm/yyyy'),
             a.bse_grvble             = to_number(v_bse_grvble),
             a.vlor_ttal              = to_number(v_vlor_ttal),
             a.vlor_pago              = to_number(v_vlor_pgo)
       where a.id_dclrcion = p_id_dclrcion;
    exception
      when others then
        rollback;
        o_cdgo_rspsta  := 36;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>No se pudo registrar la declaracion, ' ||
                          'por favor intente nuevamente.' || o_mnsje_rspsta ||
                          '</summary>' || '<p>' ||
                          'Para mas informacion consultar el codigo ' ||
                          v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                          '<br><p>' || sqlerrm || '.</p>' ||
                          '<br><p>v_id_sjto_impsto: ' || v_id_sjto_impsto ||
                          '.</p>' || '<br><p>v_id_dclrcion_uso: ' ||
                          v_id_dclrcion_uso || '.</p>' ||
                          '<br><p>v_bse_grvble: ' || v_bse_grvble ||
                          '.</p>' || '<br><p>v_vlor_ttal: ' || v_vlor_ttal ||
                          '.</p>' || '<br><p>v_vlor_pgo: ' || v_vlor_pgo ||
                          '.</p>' || '<br><p>p_id_dclrcion: ' ||
                          p_id_dclrcion || '.</p>' || '</details>';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              o_mnsje_rspsta,
                              2);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              sqlerrm,
                              2);
        return;
    end;
  ***/
    begin
      pkg_gi_declaraciones.prc_co_homologacion_sujeto(p_cdgo_clnte     => p_cdgo_clnte,
                                                      p_id_usrio       => p_id_usrio,
                                                      p_id_sjto_impsto => v_id_sjto_impsto,
                                                      p_id_dclrcion    => p_id_dclrcion,
                                                      o_cdgo_rspsta    => o_cdgo_rspsta,
                                                      o_mnsje_rspsta   => o_mnsje_rspsta);

      if (o_cdgo_rspsta <> 0) then
        o_cdgo_rspsta  := 40;
        o_mnsje_rspsta := '<details>' ||
                          '<summary>No se pudo registrar la declaracion, ' ||
                          'por favor intente nuevamente. ' ||
                          o_mnsje_rspsta || '</summary>' || '<p>' ||
                          'Para mas informacion consultar el codigo ' ||
                          v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                         --'<br><p>' || sqlerrm || '.</p>' ||
                          '</details>';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              o_mnsje_rspsta,
                              2);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              sqlerrm,
                              2);
        return;
      end if;

    end;

    /*
      Solo si es una declaracion que nace desde un proceso de fiscalizacion,
      se registran los datos financieros para que sean calculados todos los conceptos asociados
      y que iran a movimientos financieros
    */
    if (p_id_cnddto_vgncia is not null) then
      begin
        update gi_g_declaraciones a
           set a.fcha_prsntcion = systimestamp
         where a.id_dclrcion = p_id_dclrcion;
      exception
        when others then
          o_cdgo_rspsta  := 37;
          o_mnsje_rspsta := '<details>' ||
                            '<summary>No se pudo registrar la declaracion, ' ||
                            'al nacer desde un proceso de fiscalizacion ' ||
                            'es necesario tener una fecha de presentacion, ' ||
                            'por favor intente nuevamente. ' ||
                            o_mnsje_rspsta || '</summary>' || '<p>' ||
                            'Para mas informacion consultar el codigo ' ||
                            v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                           --'<br><p>' || sqlerrm || '.</p>' ||
                            '</details>';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_prcdmnto,
                                v_nl,
                                o_mnsje_rspsta,
                                2);
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_prcdmnto,
                                v_nl,
                                sqlerrm,
                                2);
          return;
      end;

      begin
        pkg_gi_declaraciones.prc_rg_dclrcion_mvmnto_fnncro(p_cdgo_clnte   => p_cdgo_clnte,
                                                           p_id_dclrcion  => p_id_dclrcion,
                                                           p_idntfccion   => v_idntfccion,
                                                           o_cdgo_rspsta  => o_cdgo_rspsta,
                                                           o_mnsje_rspsta => o_mnsje_rspsta);
        if (o_cdgo_rspsta <> 0) then
          o_cdgo_rspsta  := 38;
          o_mnsje_rspsta := '<details>' ||
                            '<summary>No se pudo registrar la declaracion, ' ||
                            'por favor intente nuevamente. ' ||
                            o_mnsje_rspsta || '</summary>' || '<p>' ||
                            'Para mas informacion consultar el codigo ' ||
                            v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                           --'<br><p>' || sqlerrm || '.</p>' ||
                            '</details>';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_prcdmnto,
                                v_nl,
                                o_mnsje_rspsta,
                                2);
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_prcdmnto,
                                v_nl,
                                sqlerrm,
                                2);
          return;
        end if;
      exception
        when others then
          o_cdgo_rspsta  := 39;
          o_mnsje_rspsta := '<details>' ||
                            '<summary>No se pudo registrar la declaracion, ' ||
                            'por favor intente nuevamente. ' ||
                            o_mnsje_rspsta || '</summary>' || '<p>' ||
                            'Para mas informacion consultar el codigo ' ||
                            v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                           --'<br><p>' || sqlerrm || '.</p>' ||
                            '</details>';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_prcdmnto,
                                v_nl,
                                o_mnsje_rspsta,
                                2);
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_prcdmnto,
                                v_nl,
                                sqlerrm,
                                2);
          return;
      end;
    end if;

    --commit;
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          'pkg_gi_declaraciones.prc_rg_declaracion',
                          v_nl,
                          'Proceso Terminado con exito',
                          1);
    elsif p_id_orgen_tpo = 2 then
        --Se valida la fecha proyectada de presentaci¿n
    --  --  1. Se homologa la fecha proyectada de presentaci¿n en el formulario
    begin
      pkg_gi_declaraciones.prc_co_homologacion   (p_cdgo_clnte    =>  p_cdgo_clnte,
                            p_cdgo_hmlgcion   =>  'PRD',
                            p_cdgo_prpdad   =>  'FPY',
                            p_id_dclrcion   =>  p_id_dclrcion,
                            o_vlor        =>  v_fcha_prsntcion_pryctda,
                            o_cdgo_rspsta   =>  o_cdgo_rspsta,
                            o_mnsje_rspsta    =>  o_mnsje_rspsta);

            v_fcha_prsntcion_pryctda := to_date(v_fcha_prsntcion_pryctda,'yyyymmdd');
            pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, 'v_fcha_prsntcion_pryctda: '||v_fcha_prsntcion_pryctda, 2);
      if (o_cdgo_rspsta <> 0) then
        rollback;
        o_cdgo_rspsta := 21;
        o_mnsje_rspsta := '<details>' ||
                    '<summary>No se pudo registrar la declaraci¿n, ' ||
                    'por favor intente nuevamente.'||o_mnsje_rspsta || '</summary>' ||
                    '<p>' || 'Para mas informaci¿n consultar el c¿digo ' || v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                  '</details>';
        pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, o_mnsje_rspsta, 2);
        pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, sqlerrm, 2);
        return;
      end if;
        exception
            when others then
                rollback;
                o_cdgo_rspsta := 22;
                o_mnsje_rspsta := '<details>' ||
                                        '<summary>No se pudo registrar la declaraci¿n, ' ||
                                        'por favor intente nuevamente.'||o_mnsje_rspsta || '</summary>' ||
                                        '<p>' || 'Para mas informaci¿n consultar el c¿digo ' || v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                                  '</details>';
                pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, o_mnsje_rspsta, 2);
                pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, sqlerrm, 2);
                return;
    end;

        --HOMOLOGACI¿N DE BASE GRAVABLE--JGA

        begin
      pkg_gi_declaraciones.prc_co_homologacion   (p_cdgo_clnte    =>  p_cdgo_clnte,
                            p_cdgo_hmlgcion   =>  'PRD',
                            p_cdgo_prpdad   =>  'VBG',
                            p_id_dclrcion   =>  p_id_dclrcion,
                            o_vlor        =>  v_bse_grvble,
                            o_cdgo_rspsta   =>  o_cdgo_rspsta,
                            o_mnsje_rspsta    =>  o_mnsje_rspsta);
      if (o_cdgo_rspsta <> 0) then
        rollback;
        o_cdgo_rspsta := 30;
        o_mnsje_rspsta := '<details>' ||
                    '<summary>No se pudo registrar la declaraci¿n, ' ||
                    'por favor intente nuevamente.</summary>' ||
                    '<p>' || 'Para mas informaci¿n consultar el c¿digo ' || v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p><br>' ||
                    '<p>' || o_mnsje_rspsta || '.</p>' ||
                  '</details>';
        pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, o_mnsje_rspsta, 2);
        pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, sqlerrm, 2);
        return;
      end if;
      exception
        when others then
          rollback;
          o_cdgo_rspsta := 31;
          o_mnsje_rspsta := '<details>' ||
                      '<summary>No se pudo registrar la declaraci¿n, ' ||
                      'por favor intente nuevamente.</summary>' ||
                      '<p>' || 'Para mas informaci¿n consultar el c¿digo ' || v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p><br>' ||
                      '<p>' || o_mnsje_rspsta || '.</p>' ||
                    '</details>';
          pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, o_mnsje_rspsta, 2);
          pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, sqlerrm, 2);
          return;
    end;

        ----------------------------------
        --HOMOLOGACI¿N DE VALOR TOTAL--JGA


        begin
      pkg_gi_declaraciones.prc_co_homologacion   (p_cdgo_clnte    =>  p_cdgo_clnte,
                            p_cdgo_hmlgcion   =>  'PRD',
                            p_cdgo_prpdad   =>  'VTL',
                            p_id_dclrcion   =>  p_id_dclrcion,
                            o_vlor        =>  v_vlor_ttal,
                            o_cdgo_rspsta   =>  o_cdgo_rspsta,
                            o_mnsje_rspsta    =>  o_mnsje_rspsta);
      if (o_cdgo_rspsta <> 0) then
        rollback;
        o_cdgo_rspsta := 32;
        o_mnsje_rspsta := '<details>' ||
                    '<summary>No se pudo registrar la declaraci¿n, ' ||
                    'por favor intente nuevamente.</summary>' ||
                    '<p>' || 'Para mas informaci¿n consultar el c¿digo ' || v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p><br>' ||
                    '<p>' || o_mnsje_rspsta || '.</p>' ||
                  '</details>';
        pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, o_mnsje_rspsta, 2);
        pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, sqlerrm, 2);
        return;
      end if;
      exception
        when others then
          rollback;
          o_cdgo_rspsta := 33;
          o_mnsje_rspsta := '<details>' ||
                      '<summary>No se pudo registrar la declaraci¿n, ' ||
                      'por favor intente nuevamente.</summary>' ||
                      '<p>' || 'Para mas informaci¿n consultar el c¿digo ' || v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p><br>' ||
                      '<p>' || o_mnsje_rspsta || '.</p>' ||
                    '</details>';
          pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, o_mnsje_rspsta, 2);
          pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, sqlerrm, 2);
          return;
    end;

        -----------------------------------------------------
        --HOMOLOGACI¿N DE VALOR PAGO--JGA

        begin
      pkg_gi_declaraciones.prc_co_homologacion   (p_cdgo_clnte    =>  p_cdgo_clnte,
                            p_cdgo_hmlgcion   =>  'PRD',
                            p_cdgo_prpdad   =>  'VPG',
                            p_id_dclrcion   =>  p_id_dclrcion,
                            o_vlor        =>  v_vlor_pgo,
                            o_cdgo_rspsta   =>  o_cdgo_rspsta,
                            o_mnsje_rspsta    =>  o_mnsje_rspsta);
      if (o_cdgo_rspsta <> 0) then
        rollback;
        o_cdgo_rspsta := 34;
        o_mnsje_rspsta := '<details>' ||
                    '<summary>No se pudo registrar la declaraci¿n, ' ||
                    'por favor intente nuevamente.</summary>' ||
                    '<p>' || 'Para mas informaci¿n consultar el c¿digo ' || v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p><br>' ||
                    '<p>' || o_mnsje_rspsta || '.</p>' ||
                  '</details>';
        pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, o_mnsje_rspsta, 2);
        pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, sqlerrm, 2);
        return;
      end if;
      exception
        when others then
          rollback;
          o_cdgo_rspsta := 35;
          o_mnsje_rspsta := '<details>' ||
                      '<summary>No se pudo registrar la declaraci¿n, ' ||
                      'por favor intente nuevamente.</summary>' ||
                      '<p>' || 'Para mas informaci¿n consultar el c¿digo ' || v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p><br>' ||
                      '<p>' || o_mnsje_rspsta || '.</p>' ||
                    '</details>';
          pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, o_mnsje_rspsta, 2);
          pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, sqlerrm, 2);
          return;
    end;


        --Se valida el uso de declaraci¿n, para esto es necesario:
    --  --  1. Se homologa el uso de la declaraci¿n en el formulario
        /*select  count(1) into v_exste_incial
        from    gi_g_declaraciones a
        where   a.id_sjto_impsto      = p_id_sjto_impsto
        and    exists ( select  1
                         from    gi_g_declaraciones  b
                         where   b.cdgo_clnte          = a.cdgo_clnte
                            and     b.id_impsto           = a.id_impsto
                            and     b.id_impsto_sbmpsto   = a.id_impsto_sbmpsto
                            and     b.id_sjto_impsto      = a.id_sjto_impsto
                            and     b.id_dclrcion_vgncia_frmlrio = a.id_dclrcion_vgncia_frmlrio
                            and     id_dclrcion = p_id_dclrcion
                            );  */
        select  count(1) into v_exste_incial
        from    gi_g_declaraciones  b
        where   b.id_sjto_impsto      = p_id_sjto_impsto
        and     b.id_dclrcion_vgncia_frmlrio = p_id_dclrcion_vgncia_frmlrio;

    pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, 'p_id_sjto_impsto: '||p_id_sjto_impsto||' - v_exste_incial:'||v_exste_incial, 2);
        if( v_exste_incial > 0 ) then
            v_cdgo_dclrcion_uso := 'DCO';
        else
            v_cdgo_dclrcion_uso := 'DIN';
        end if;

        begin
            select  a.id_dclrcion_uso
            into    v_id_dclrcion_uso
            from    gi_d_declaraciones_uso  a
            where   a.cdgo_dclrcion_uso   = v_cdgo_dclrcion_uso;

            exception
                when others then
                    rollback;
                    o_cdgo_rspsta := 26;
                    o_mnsje_rspsta := '<details>' ||
                                            '<summary>No se pudo registrar la declaraci¿n, ' ||
                                            'por favor intente nuevamente.'||o_mnsje_rspsta || '</summary>' ||
                                            '<p>' || 'Para mas informaci¿n consultar el c¿digo ' || v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                                      '</details>';
                    pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, o_mnsje_rspsta, 3);
                    pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, sqlerrm, 3);
                    return;
        end;

    end if;    --Se actualiza en la tabla gi_g_declaraciones:
    --Sujeto Impuesto
    --Uso de la declaraci¿n
    --Fecha de presentaci¿n proyectada
    --Base gravable de la declaraci¿n
    --Valor total de la declaraci¿n
    --Valor del pago de la declaraci¿n
    begin
        update  gi_g_declaraciones  a
        set   a.id_sjto_impsto    = v_id_sjto_impsto,
                a.id_dclrcion_uso   = v_id_dclrcion_uso,
                a.id_dclrcion_crrccion  = v_id_dclrcion_crrcion,
                a.fcha_prsntcion_pryctda= to_timestamp(v_fcha_prsntcion_pryctda, 'dd/mm/yyyy'),
                a.bse_grvble          =   to_number(v_bse_grvble),
                a.vlor_ttal           =   to_number(v_vlor_ttal),
                a.vlor_pago       = to_number(v_vlor_pgo)
        where a.id_dclrcion     = p_id_dclrcion;
        exception
            when others then
                rollback;
                o_cdgo_rspsta := 36;
                o_mnsje_rspsta := '<details>' ||
                                        '<summary>No se pudo registrar la declaraci¿n, ' ||
                                        'por favor intente nuevamente.'||o_mnsje_rspsta || '</summary>' ||
                                        '<p>' || 'Para mas informaci¿n consultar el c¿digo ' || v_cdgo_prcso || '-' || o_cdgo_rspsta || '.</p>' ||
                                        '<br><p>' || sqlerrm || '.</p>' ||
                                        '<br><p>v_id_sjto_impsto: ' || v_id_sjto_impsto || '.</p>' ||
                                        '<br><p>v_id_dclrcion_uso: ' || v_id_dclrcion_uso || '.</p>' ||
                                        '<br><p>v_bse_grvble: ' || v_bse_grvble || '.</p>' ||
                                        '<br><p>v_vlor_ttal: ' || v_vlor_ttal || '.</p>' ||
                                        '<br><p>v_vlor_pgo: ' || v_vlor_pgo || '.</p>' ||
                                        '<br><p>p_id_dclrcion: ' || p_id_dclrcion || '.</p>' ||
                                  '</details>';
                pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, o_mnsje_rspsta, 2);
                pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, sqlerrm, 2);
                return;
    end;

    pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, 'pkg_gi_declaraciones.prc_rg_declaracion',  v_nl, 'Proceso Terminado con exito', 1);
    --commit;
    end prc_rg_declaracion;
/

