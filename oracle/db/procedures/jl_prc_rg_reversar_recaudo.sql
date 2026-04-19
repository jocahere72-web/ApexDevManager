
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_PRC_RG_REVERSAR_RECAUDO" (p_cdgo_clnte   in number,
                                                       p_id_usrio     in gf_g_recaudo_reversa.id_usrio%type,
                                                       p_nmro_dcmnto  in number,
                                                       p_id_rcdo      in number,
                                                       p_dscrpcion    in gf_g_recaudo_reversa.dscrpcion%type,
                                                       o_cdgo_rspsta  out number,
                                                       o_mnsje_rspsta out varchar2) as

  v_cntdad_rcdos             number;
  v_vlor_rcdos               number;
  v_id_sldo_fvor             number;
  v_id_sldo_fvor_slctud      number;
  v_cntdad_mvmntos           number;
  v_id_rcdo                  number;
  v_nvel                     number;
  v_id_dclrcion              number;
  v_id_lqdcion               number;
  v_id_rcdo_rvrsa            number;
  v_id_mvmnto_fncro          number;
  v_id_mvmnto_cncpto_cnslddo number;
  v_indcdor_nrmlzar_crtra    varchar2(1);
  v_mnsje_rspsta             varchar2(1000);
  v_mvmntos_cncpto_cnslddo   clob;

  v_re_g_documentos re_g_documentos%rowtype;
  v_re_g_recaudo    v_re_g_recaudos%rowtype;
  v_nmbre_up        sg_d_configuraciones_log.nmbre_up%type := 'pkg_re_recaudos.prc_rg_reversar_recaudo';

begin

  --Respuesta Exitosa
  o_cdgo_rspsta := 0;

  --Determinamos el Nivel del Log de la UP
  v_nvel := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte => p_cdgo_clnte,
                                        p_id_impsto  => null,
                                        p_nmbre_up   => v_nmbre_up);

  o_mnsje_rspsta := 'Inicio del procedimiento ' || v_nmbre_up;

  pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                        p_id_impsto  => null,
                        p_nmbre_up   => v_nmbre_up,
                        p_nvel_log   => v_nvel,
                        p_txto_log   => o_mnsje_rspsta,
                        p_nvel_txto  => 1);

  --Se obtiene el recaudo
  begin
    select a.*
      into v_re_g_recaudo
      from v_re_g_recaudos a
     where a.id_rcdo = p_id_rcdo;
  exception
    when no_data_found then
      o_cdgo_rspsta  := 1;
      o_mnsje_rspsta := o_cdgo_rspsta || '. El documento de pago #' ||
                        p_nmro_dcmnto || ', no tiene un recaudo.';
      pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                            p_id_impsto  => null,
                            p_nmbre_up   => v_nmbre_up,
                            p_nvel_log   => v_nvel,
                            p_txto_log   => o_mnsje_rspsta,
                            p_nvel_txto  => 3);
      rollback;
      return;
  end;

  --Se valida que el recaudo no venga de un archivo asobancaria o de web service
  if v_re_g_recaudo.cdgo_rcdo_orgen_cntrol in ('AC', 'WS') then
    o_cdgo_rspsta  := 2;
    o_mnsje_rspsta := o_cdgo_rspsta ||
                      '. La reversión aplica solo para pagos manuales';
    rollback;
    return;
  end if;

  --Se obtiene la cantidad de recaudos agregados al recaudo control y el valor total de recuados
  begin

    select a.cntdad_rcdos, a.vlor_rcdos
      into v_cntdad_rcdos, v_vlor_rcdos
      from re_g_recaudos_control a
     where id_rcdo_cntrol = v_re_g_recaudo.id_rcdo_cntrol;

  exception
    when others then
      o_cdgo_rspsta  := 3;
      o_mnsje_rspsta := o_cdgo_rspsta ||
                        '. No se pudo Obtener la cantidad de recaudos y valor total de los recuados';
      pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                            p_id_impsto  => null,
                            p_nmbre_up   => v_nmbre_up,
                            p_nvel_log   => v_nvel,
                            p_txto_log   => o_mnsje_rspsta,
                            p_nvel_txto  => 3);
      rollback;
      return;
  end;

  --Se obtiene el ultimo recaudo
  begin
    select a.id_rcdo
      into v_id_rcdo
      from re_g_recaudos a
      join re_g_recaudos_control b
        on a.id_rcdo_cntrol = b.id_rcdo_cntrol
     where b.cdgo_clnte = p_cdgo_clnte
       and b.id_impsto = v_re_g_recaudo.id_impsto
       and b.id_impsto_sbmpsto = v_re_g_recaudo.id_impsto_sbmpsto
       and a.id_sjto_impsto = v_re_g_recaudo.id_sjto_impsto
       and a.cdgo_rcdo_estdo = 'AP'
       and a.cdgo_rcdo_orgn_tpo = 'DC'
       and a.id_rcdo <> v_re_g_recaudo.id_rcdo
     order by fcha_rcdo desc
     fetch first 1 rows only;
  exception
    when no_data_found then
      null;
  end;

  --Se valida que el recaudo no haya generado un saldo a favor
  if v_re_g_recaudo.id_sldo_fvor is not null then

    --Se valida si el saldo a favor se encuentra en una solicitud abierta
    begin
      select a.id_sldo_fvor_slctud
        into v_id_sldo_fvor_slctud
        from gf_g_saldos_favor_solicitud a
        join wf_g_instancias_flujo b
          on a.id_instncia_fljo = b.id_instncia_fljo
        join gf_g_sldos_fvor_slctud_dtll c
          on a.id_sldo_fvor_slctud = c.id_sldo_fvor_slctud
         and c.id_sldo_fvor = v_re_g_recaudo.id_sldo_fvor
         and b.estdo_instncia = 'INICIADA';
    exception
      when no_data_found then
        null;
      when others then
        o_cdgo_rspsta  := 4;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          '. Problemas al consultar si el saldo a favor se encuentra en una solicitud';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        rollback;
        return;
    end;

    if v_id_sldo_fvor_slctud is not null then
      o_cdgo_rspsta  := 5;
      o_mnsje_rspsta := o_cdgo_rspsta ||
                        '. No se puede reversar el recaudo debido a que se esta proyectando el saldo a favor que se genero por el recuado';
      rollback;
      return;
    end if;

  end if;

  -- Se registra en el maestro del log de lo reversado - NLCZ
  v_id_rcdo_rvrsa := sq_gf_g_recaudo_reversa.nextval;
  begin
    insert into gf_g_recaudo_reversa
      (id_rcdo_rvrsa,
       nmro_dcmnto,
       id_usrio,
       fcha_rvrsa,
       id_rcdo,
       dscrpcion)
    values
      (v_id_rcdo_rvrsa,
       p_nmro_dcmnto,
       p_id_usrio,
       sysdate,
       v_re_g_recaudo.id_rcdo,
       p_dscrpcion)
    returning id_rcdo_rvrsa into v_id_rcdo_rvrsa;
  exception
    when others then
      o_cdgo_rspsta  := 6;
      o_mnsje_rspsta := o_cdgo_rspsta ||
                        '.0. No se pudo registrar el maestro del log para documento: ' ||
                        p_nmro_dcmnto || ' Error: ' || sqlerrm;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                            p_id_impsto  => null,
                            p_nmbre_up   => v_nmbre_up,
                            p_nvel_log   => v_nvel,
                            p_txto_log   => o_mnsje_rspsta,
                            p_nvel_txto  => 3);
      return;
  end;

  -- Se guarda el log de las vigencia de saldo a favor
  for fila in (select id_sldo_fvor_vgncia as llave,
                      json_object('ID_SLDO_FVOR_VGNCIA' value
                                  id_sldo_fvor_vgncia,
                                  'ID_SLDO_FVOR' value id_sldo_fvor,
                                  'VGNCIA' value vgncia,
                                  'ID_PRDO' value id_prdo) texto
                 from gf_g_saldos_favor_vigencia
                where id_sldo_fvor = v_id_sldo_fvor) loop

    begin

      pkg_re_recaudos.prc_rg_reversion_recaudo_log(p_id_scncia_rvrsa => v_id_rcdo_rvrsa,
                                                   p_nmbre_tbla      => 'gf_g_saldos_favor_vigencia',
                                                   p_id_orgen        => fila.llave,
                                                   p_fla             => fila.texto,
                                                   o_mnsje_rspsta    => o_mnsje_rspsta);
    exception
      when others then
        o_cdgo_rspsta  := 7;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          '.1. No se pudo registrar el log para gf_g_saldos_favor_vigencia ID: ' ||
                          fila.llave || ' Error: ' || v_mnsje_rspsta;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        rollback;
        return;
    end;
  end loop;

  --Se elimina las vigencia del saldo a favor
  begin
    delete from gf_g_saldos_favor_vigencia a
     where a.id_sldo_fvor = v_id_sldo_fvor;
  exception
    when others then
      o_cdgo_rspsta  := 8;
      o_mnsje_rspsta := o_cdgo_rspsta ||
                        '. No se pudo eliminar el saldo a favor';
      pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                            p_id_impsto  => null,
                            p_nmbre_up   => v_nmbre_up,
                            p_nvel_log   => v_nvel,
                            p_txto_log   => o_mnsje_rspsta,
                            p_nvel_txto  => 3);
      rollback;
      return;
  end;

  -- Se guarda el log del saldo a favor
  for fila in (select id_sldo_fvor as llave,
                      json_object('ID_SLDO_FVOR' value id_sldo_fvor,
                                  'CDGO_CLNTE' value cdgo_clnte,
                                  'ID_IMPSTO' value id_impsto,
                                  'ID_IMPSTO_SBMPSTO' value id_impsto_sbmpsto,
                                  'ID_SJTO_IMPSTO' value id_sjto_impsto,
                                  'VLOR_SLDO_FVOR' value vlor_sldo_fvor,
                                  'CDGO_SLDO_FVOR_TPO' value
                                  cdgo_sldo_fvor_tpo,
                                  'ID_ORGEN' value id_orgen,
                                  'ID_USRIO' value id_usrio,
                                  'INDCDOR_RCNCDO' value indcdor_rcncdo,
                                  'FCHA_RGSTRO' value fcha_rgstro,
                                  'FCHA_RCNCMNTO' value fcha_rcncmnto,
                                  'OBSRVCION' value obsrvcion,
                                  'INDCDOR_RGSTRO' value indcdor_rgstro,
                                  'ESTDO' value estdo) texto
                 from gf_g_saldos_favor
                where cdgo_clnte = p_cdgo_clnte
                  and id_sldo_fvor = v_id_sldo_fvor) loop

    begin

      pkg_re_recaudos.prc_rg_reversion_recaudo_log(p_id_scncia_rvrsa => v_id_rcdo_rvrsa,
                                                   p_nmbre_tbla      => 'gf_g_saldos_favor',
                                                   p_id_orgen        => fila.llave,
                                                   p_fla             => fila.texto,
                                                   o_mnsje_rspsta    => o_mnsje_rspsta);
    exception
      when others then
        o_cdgo_rspsta  := 9;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          '.1. No se pudo registrar el log para gf_g_saldos_favor ID: ' ||
                          fila.llave || ' Error: ' || v_mnsje_rspsta;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        rollback;
        return;
    end;
  end loop;

  --Se elimina el saldo a favor
  begin
    delete from gf_g_saldos_favor a
     where a.cdgo_clnte = p_cdgo_clnte
       and a.id_sldo_fvor = v_id_sldo_fvor;
  exception
    when others then
      o_cdgo_rspsta  := 10;
      o_mnsje_rspsta := o_cdgo_rspsta ||
                        '. No se pudo eliminar el saldo a favor';
      pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                            p_id_impsto  => null,
                            p_nmbre_up   => v_nmbre_up,
                            p_nvel_log   => v_nvel,
                            p_txto_log   => o_mnsje_rspsta,
                            p_nvel_txto  => 3);
      rollback;
      return;
  end;

  --Se valida si el recaudo es de un documento
  if v_re_g_recaudo.cdgo_rcdo_orgn_tpo = 'DC' then

    --Verifica si Existe el Documento de Pago
    begin
      select a.*
        into v_re_g_documentos
        from re_g_documentos a
       where nmro_dcmnto = p_nmro_dcmnto
         and indcdor_pgo_aplcdo = 'S'
         and cdgo_clnte = p_cdgo_clnte;
    exception
      when no_data_found then
        o_cdgo_rspsta  := 11;
        o_mnsje_rspsta := o_cdgo_rspsta || '. El documento de pago #' ||
                          p_nmro_dcmnto || ', no existe en el sistema.';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        rollback;
        return;
    end;

    --Se valida que no existan movimientos posteriores a la aplicación del recaudo
    begin

      select count(*)
        into v_cntdad_mvmntos
        from v_gf_g_movimientos_detalle a
       where a.id_sjto_impsto = v_re_g_recaudo.id_sjto_impsto
         and a.id_orgen <> v_re_g_recaudo.id_rcdo
         and a.fcha_mvmnto >
             (select max(a.fcha_mvmnto) as fcha_mvmnto_mxma
                from gf_g_movimientos_detalle a
               where a.cdgo_mvmnto_orgn = 'RE'
                 and a.id_orgen = v_re_g_recaudo.id_rcdo);
    exception
      when others then
        o_cdgo_rspsta  := 12;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          '. No se pudo obtener la cantidad de movimientos';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        rollback;
        return;
    end;

    if v_cntdad_mvmntos > 0 then
      o_cdgo_rspsta  := 13;
      o_mnsje_rspsta := o_cdgo_rspsta ||
                        '. No se pudo reversar el pago, se encontraron movimientos posteriores a la fecha del recaudo';
      rollback;
      return;
    end if;

    -- Se guarda el log de los movimientos detalle
    for fila in (select id_mvmnto_dtlle as llave,
                        json_object('ID_MVMNTO_DTLLE' value id_mvmnto_dtlle,
                                    'ID_MVMNTO_FNCRO' value id_mvmnto_fncro,
                                    'CDGO_MVMNTO_ORGN' value cdgo_mvmnto_orgn,
                                    'ID_ORGEN' value id_orgen,
                                    'CDGO_MVMNTO_TPO' value cdgo_mvmnto_tpo,
                                    'VGNCIA' value vgncia,
                                    'ID_PRDO' value id_prdo,
                                    'CDGO_PRDCDAD' value cdgo_prdcdad,
                                    'FCHA_MVMNTO' value fcha_mvmnto,
                                    'ID_CNCPTO' value id_cncpto,
                                    'ID_CNCPTO_CSDO' value id_cncpto_csdo,
                                    'VLOR_DBE' value vlor_dbe,
                                    'VLOR_HBER' value vlor_hber,
                                    'ID_MVMNTO_DTLLE_BSE' value
                                    id_mvmnto_dtlle_bse,
                                    'ACTVO' value actvo,
                                    'GNRA_INTRES_MRA' value gnra_intres_mra,
                                    'FCHA_VNCMNTO' value fcha_vncmnto,
                                    'ID_IMPSTO_ACTO_CNCPTO' value
                                    id_impsto_acto_cncpto) texto
                   from gf_g_movimientos_detalle
                  where cdgo_mvmnto_orgn = 'RE'
                    and id_orgen = v_re_g_recaudo.id_rcdo) loop

      begin

        pkg_re_recaudos.prc_rg_reversion_recaudo_log(p_id_scncia_rvrsa => v_id_rcdo_rvrsa,
                                                     p_nmbre_tbla      => 'gf_g_movimientos_detalle',
                                                     p_id_orgen        => fila.llave,
                                                     p_fla             => fila.texto,
                                                     o_mnsje_rspsta    => o_mnsje_rspsta);
      exception
        when others then
          o_cdgo_rspsta  := 14;
          o_mnsje_rspsta := o_cdgo_rspsta ||
                            '.1. No se pudo registrar el log para gf_g_movimientos_detalle ID: ' ||
                            fila.llave || ' Error: ' || v_mnsje_rspsta;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 3);
          rollback;
          return;
      end;

    end loop;

    --Se elimina los movimientos de origen recaudo (RE)
    begin
      delete from gf_g_movimientos_detalle
       where cdgo_mvmnto_orgn = 'RE'
         and id_orgen = v_re_g_recaudo.id_rcdo;
    exception
      when others then
        o_cdgo_rspsta  := 15;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          '. No se pudo reversar los movimientos' ||
                          ' Error: ' || sqlerrm;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        return;
    end;

    -- Se guarda el log de documento
    for fila in (select id_dcmnto as llave,
                        json_object('ID_DCMNTO' value id_dcmnto,
                                    'CDGO_CLNTE' value cdgo_clnte,
                                    'ID_IMPSTO' value id_impsto,
                                    'ID_IMPSTO_SBMPSTO' value
                                    id_impsto_sbmpsto,
                                    'ID_SJTO_IMPSTO' value id_sjto_impsto,
                                    'NMRO_DCMNTO' value nmro_dcmnto,
                                    'CDGO_DCMNTO_TPO' value cdgo_dcmnto_tpo,
                                    'ID_CNVNIO' value id_cnvnio,
                                    'NMRO_CTA' value nmro_cta,
                                    'FCHA_DCMNTO' value fcha_dcmnto,
                                    'VLOR_TTAL' value vlor_ttal,
                                    'FCHA_VNCMNTO' value fcha_vncmnto,
                                    'VLOR_TTAL_DBE' value vlor_ttal_dbe,
                                    'VLOR_TTAL_HBER' value vlor_ttal_hber,
                                    'INDCDOR_PGO_APLCDO' value
                                    indcdor_pgo_aplcdo,
                                    'VLOR_TTAL_DCMNTO' value vlor_ttal_dcmnto,
                                    'ID_DCMNTO_LTE' value id_dcmnto_lte,
                                    'INDCDOR_ENTRNO' value indcdor_entrno,
                                    'DRCCION' value drccion,
                                    'CDGO_PSTAL' value cdgo_pstal,
                                    'ID_RCDO_ULTMO' value id_rcdo_ultmo) texto
                   from re_g_documentos
                  where id_dcmnto = v_re_g_documentos.id_dcmnto) loop

      begin

        pkg_re_recaudos.prc_rg_reversion_recaudo_log(p_id_scncia_rvrsa => v_id_rcdo_rvrsa,
                                                     p_nmbre_tbla      => 're_g_documentos',
                                                     p_id_orgen        => fila.llave,
                                                     p_fla             => fila.texto,
                                                     o_mnsje_rspsta    => o_mnsje_rspsta);
      exception
        when others then
          o_cdgo_rspsta  := 16;
          o_mnsje_rspsta := o_cdgo_rspsta ||
                            '.1. No se pudo registrar el log para re_g_documentos ID: ' ||
                            fila.llave || ' Error: ' || v_mnsje_rspsta;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 3);
          rollback;
          return;
      end;

    end loop;

    --Actualizamos Documento
    begin
      update re_g_documentos
         set indcdor_pgo_aplcdo = 'N'
       where id_dcmnto = v_re_g_documentos.id_dcmnto;
    exception
      when others then
        o_cdgo_rspsta  := 17;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          '. No se pudo actualizar el estado del documento' ||
                          ' Error: ' || sqlerrm;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        rollback;
        return;
    end;

    -- Se guarda el log de documento
    for fila in (select id_dcmnto as llave,
                        json_object('id_dcmnto' value id_dcmnto,
                                    'cdgo_clnte' value cdgo_clnte,
                                    'id_impsto' value id_impsto,
                                    'id_impsto_sbmpsto' value
                                    id_impsto_sbmpsto,
                                    'id_sjto_impsto' value id_sjto_impsto,
                                    'nmro_dcmnto' value nmro_dcmnto,
                                    'cdgo_dcmnto_tpo' value cdgo_dcmnto_tpo,
                                    'id_cnvnio' value id_cnvnio,
                                    'nmro_cta' value nmro_cta,
                                    'fcha_dcmnto' value fcha_dcmnto,
                                    'fcha_vncmnto' value fcha_vncmnto,
                                    'vlor_ttal' value vlor_ttal,
                                    'vlor_ttal_dbe' value vlor_ttal_dbe,
                                    'vlor_ttal_hber' value vlor_ttal_hber,
                                    'indcdor_pgo_aplcdo' value
                                    indcdor_pgo_aplcdo,
                                    'vlor_ttal_dcmnto' value vlor_ttal_dcmnto,
                                    'id_dcmnto_lte' value id_dcmnto_lte,
                                    'indcdor_entrno' value indcdor_entrno,
                                    'drccion' value drccion,
                                    'cdgo_pstal' value cdgo_pstal,
                                    'id_rcdo_ultmo' value id_rcdo_ultmo) texto
                   from re_g_documentos
                  where id_rcdo_ultmo = v_re_g_recaudo.id_rcdo) loop

      begin

        pkg_re_recaudos.prc_rg_reversion_recaudo_log(p_id_scncia_rvrsa => v_id_rcdo_rvrsa,
                                                     p_nmbre_tbla      => 're_g_documentos',
                                                     p_id_orgen        => fila.llave,
                                                     p_fla             => fila.texto,
                                                     o_mnsje_rspsta    => o_mnsje_rspsta);
      exception
        when others then
          o_cdgo_rspsta  := 18;
          o_mnsje_rspsta := o_cdgo_rspsta ||
                            '.1. No se pudo registrar el log para re_g_documentos ID: ' ||
                            fila.llave || ' Error: ' || v_mnsje_rspsta;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 3);
          rollback;
          return;
      end;

    end loop;

    -- Actualizamos todos los documentos cuyo ID recaudo ultimo ...
    -- referencien al Recaudo a reversar
    begin
      update re_g_documentos
         set id_rcdo_ultmo = v_id_rcdo
       where id_rcdo_ultmo = v_re_g_recaudo.id_rcdo;
    exception
      when others then
        o_cdgo_rspsta  := 19;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          '. No se pudo Actualizar los documentos cuyo ID recaudo ultimo referencian al Recaudo a reversar' ||
                          ' Error: ' || sqlerrm;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        rollback;
        return;
    end;

  else

    --Se obtiene la declarción
    begin

      select a.id_dclrcion, a.id_lqdcion
        into v_id_dclrcion, v_id_lqdcion
        from gi_g_declaraciones a
       where id_rcdo = v_re_g_recaudo.id_rcdo;

    exception
      when no_data_found then
        o_cdgo_rspsta  := 20;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          '. No se pudo obtener la declaración';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        rollback;
        return;
      when others then
        o_cdgo_rspsta  := 21;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          'Problema al obtener la declaración';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        rollback;
        return;
    end;

    --Se obtiene el movimiento financiero
    begin

      select a.id_mvmnto_fncro
        into v_id_mvmnto_fncro
        from gf_g_movimientos_financiero a
       where id_orgen = v_id_dclrcion;

    exception
      when no_data_found then
        o_cdgo_rspsta  := 22;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          '. No se pudo obtener el movimeinto financiero';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        rollback;
        return;
      when others then
        o_cdgo_rspsta  := 23;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          'Problema al obtener el movimiento financiero';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        rollback;
        return;
    end;

    -- Se guarda el log de movimiento concepto consolidado
    for fila in (select id_mvmnto_cncpto_cnslddo as llave,
                        json_object('id_mvmnto_cncpto_cnslddo' value
                                    b.id_mvmnto_cncpto_cnslddo,
                                    'cdgo_clnte' value b.cdgo_clnte,
                                    'id_impsto' value b.id_impsto,
                                    'id_impsto_sbmpsto' value
                                    b.id_impsto_sbmpsto,
                                    'id_sjto_impsto' value b.id_sjto_impsto,
                                    'vgncia' value b.vgncia,
                                    'id_prdo' value b.id_prdo,
                                    'id_cncpto' value b.id_cncpto,
                                    'fcha_vncmnto' value b.fcha_vncmnto,
                                    'fcha_ultmo_mvmnto' value
                                    b.fcha_ultmo_mvmnto,
                                    'cdgo_mvnt_fncro_estdo' value
                                    b.cdgo_mvnt_fncro_estdo,
                                    'vlor_sldo_cptal' value b.vlor_sldo_cptal,
                                    'vlor_intres' value b.vlor_intres,
                                    'indcdor_mvmnto_blqdo' value
                                    b.indcdor_mvmnto_blqdo,
                                    'gnra_intres_mra' value b.gnra_intres_mra,
                                    'cdgo_mvmnto_orgn' value
                                    b.cdgo_mvmnto_orgn,
                                    'id_orgen' value b.id_orgen,
                                    'id_mvmnto_fncro' value b.id_mvmnto_fncro,
                                    'id_impsto_acto_cncpto' value
                                    b.id_impsto_acto_cncpto returning clob) texto
                   from gf_g_mvmntos_cncpto_cnslddo b
                  where b.id_mvmnto_fncro = v_id_mvmnto_fncro) loop
      --
      begin

        pkg_re_recaudos.prc_rg_reversion_recaudo_log(p_id_scncia_rvrsa => v_id_rcdo_rvrsa,
                                                     p_nmbre_tbla      => 'gf_g_mvmntos_cncpto_cnslddo',
                                                     p_id_orgen        => fila.llave,
                                                     p_fla             => fila.texto,
                                                     o_mnsje_rspsta    => o_mnsje_rspsta);
      exception
        when others then
          o_cdgo_rspsta  := 24;
          o_mnsje_rspsta := o_cdgo_rspsta ||
                            '.1. No se pudo registrar el log para gf_g_mvmntos_cncpto_cnslddo ID: ' ||
                            fila.llave || ' Error: ' || v_mnsje_rspsta;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 3);
          rollback;
          return;
      end;

    end loop;

    --Se elimina movimiento concepto consolidado
    begin
      delete from gf_g_mvmntos_cncpto_cnslddo
       where id_mvmnto_fncro = v_id_mvmnto_fncro;
    exception
      when others then
        o_cdgo_rspsta  := 25;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          'No se pudo eliminar el consolidado';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        rollback;
        return;
    end;

    -- Se guarda el log de declaraciones movimiento financiero
    for fila in (select id_dclrcion_mvmnto_fnncro as llave,
                        json_object('id_dclrcion_mvmnto_fnncro' value
                                    b.id_dclrcion_mvmnto_fnncro,
                                    'id_dclrcion' value b.id_dclrcion,
                                    'id_mvmnto_dtlle' value b.id_mvmnto_dtlle,
                                    'id_cncpto' value b.id_cncpto,
                                    'id_impsto_acto_cncpto' value
                                    b.id_impsto_acto_cncpto,
                                    'vlor_dbe' value b.vlor_dbe,
                                    'vlor_hber' value b.vlor_hber,
                                    'cdgo_cncpto_tpo' value b.cdgo_cncpto_tpo,
                                    'id_cncpto_rlcnal' value
                                    b.id_cncpto_rlcnal,
                                    'id_dscnto_rgla' value b.id_dscnto_rgla,
                                    'prcntje_dscnto' value b.prcntje_dscnto,
                                    'id_frmlrio_rgion' value
                                    b.id_frmlrio_rgion,
                                    'id_frmlrio_rgion_atrbto' value
                                    b.id_frmlrio_rgion_atrbto,
                                    'fla' value b.fla returning clob) texto
                   from gi_g_dclrcnes_mvmnto_fnncro b
                  where b.id_dclrcion = v_id_dclrcion) loop

      begin

        pkg_re_recaudos.prc_rg_reversion_recaudo_log(p_id_scncia_rvrsa => v_id_rcdo_rvrsa,
                                                     p_nmbre_tbla      => 'gi_g_dclrcnes_mvmnto_fnncro',
                                                     p_id_orgen        => fila.llave,
                                                     p_fla             => fila.texto,
                                                     o_mnsje_rspsta    => o_mnsje_rspsta);
      exception
        when others then
          o_cdgo_rspsta  := 26;
          o_mnsje_rspsta := o_cdgo_rspsta ||
                            '.1. No se pudo registrar el log para re_g_documentos ID: ' ||
                            fila.llave || ' Error: ' || v_mnsje_rspsta;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 3);
          rollback;
          return;
      end;

    end loop;

    --Se elimina declaraciones movivimiento financiero
    begin
      delete from gi_g_dclrcnes_mvmnto_fnncro
       where id_dclrcion = v_id_dclrcion;
    exception
      when others then
        o_cdgo_rspsta  := 27;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          'No se pudo eliminar declaraciones movimiento financiero';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        rollback;
        return;
    end;

    -- Se guarda el log de los movimientos detalle
    for fila in (select id_mvmnto_dtlle as llave,
                        json_object('id_mvmnto_dtlle' value id_mvmnto_dtlle,
                                    'id_mvmnto_fncro' value id_mvmnto_fncro,
                                    'cdgo_mvmnto_orgn' value cdgo_mvmnto_orgn,
                                    'id_orgen' value id_orgen,
                                    'cdgo_mvmnto_tpo' value cdgo_mvmnto_tpo,
                                    'vgncia' value vgncia,
                                    'id_prdo' value id_prdo,
                                    'cdgo_prdcdad' value cdgo_prdcdad,
                                    'fcha_mvmnto' value fcha_mvmnto,
                                    'id_cncpto' value id_cncpto,
                                    'id_cncpto_csdo' value id_cncpto_csdo,
                                    'vlor_dbe' value vlor_dbe,
                                    'vlor_hber' value vlor_hber,
                                    'id_mvmnto_dtlle_bse' value
                                    id_mvmnto_dtlle_bse,
                                    'actvo' value actvo,
                                    'gnra_intres_mra' value gnra_intres_mra,
                                    'fcha_vncmnto' value fcha_vncmnto,
                                    'id_impsto_acto_cncpto' value
                                    id_impsto_acto_cncpto) texto
                   from gf_g_movimientos_detalle
                  where id_mvmnto_fncro = v_id_mvmnto_fncro) loop

      begin

        pkg_re_recaudos.prc_rg_reversion_recaudo_log(p_id_scncia_rvrsa => v_id_rcdo_rvrsa,
                                                     p_nmbre_tbla      => 'gf_g_movimientos_detalle',
                                                     p_id_orgen        => fila.llave,
                                                     p_fla             => fila.texto,
                                                     o_mnsje_rspsta    => o_mnsje_rspsta);
      exception
        when others then
          o_cdgo_rspsta  := 28;
          o_mnsje_rspsta := o_cdgo_rspsta ||
                            '.1. No se pudo registrar el log para gf_g_movimientos_detalle ID: ' ||
                            fila.llave || ' Error: ' || v_mnsje_rspsta;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 3);
          rollback;
          return;
      end;

    end loop;

    --Se elimina los movimientos detalle
    begin
      delete from gf_g_movimientos_detalle
       where id_mvmnto_fncro = v_id_mvmnto_fncro;
    exception
      when others then
        o_cdgo_rspsta  := 29;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          '. No se pudo reversar los movimientos detalle' ||
                          ' Error: ' || sqlerrm;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        return;
    end;

    -- Se guarda el log de los movimientos financiero
    for fila in (select id_mvmnto_fncro as llave,
                        json_object('id_mvmnto_fncro' value
                                    b.id_mvmnto_fncro,
                                    'cdgo_clnte' value b.cdgo_clnte,
                                    'id_impsto' value b.id_impsto,
                                    'id_impsto_sbmpsto' value
                                    b.id_impsto_sbmpsto,
                                    'id_sjto_impsto' value b.id_sjto_impsto,
                                    'vgncia' value b.vgncia,
                                    'id_prdo' value b.id_prdo,
                                    'cdgo_prdcdad' value b.cdgo_prdcdad,
                                    'cdgo_mvmnto_orgn' value
                                    b.cdgo_mvmnto_orgn,
                                    'id_orgen' value b.id_orgen,
                                    'nmro_mvmnto_fncro' value
                                    b.nmro_mvmnto_fncro,
                                    'fcha_mvmnto' value b.fcha_mvmnto,
                                    'cdgo_mvnt_fncro_estdo' value
                                    b.cdgo_mvnt_fncro_estdo,
                                    'id_prcso_crga' value b.id_prcso_crga,
                                    'indcdor_mvmnto_blqdo' value
                                    b.indcdor_mvmnto_blqdo,
                                    'id_mvmnto_trza_blqueo' value
                                    b.id_mvmnto_trza_blqueo,
                                    'id_mvmnto_trza_ultma' value
                                    b.id_mvmnto_trza_ultma) texto
                   from gf_g_movimientos_financiero b
                  where b.id_orgen = v_id_dclrcion) loop

      begin

        pkg_re_recaudos.prc_rg_reversion_recaudo_log(p_id_scncia_rvrsa => v_id_rcdo_rvrsa,
                                                     p_nmbre_tbla      => 'gf_g_movimientos_financiero',
                                                     p_id_orgen        => fila.llave,
                                                     p_fla             => fila.texto,
                                                     o_mnsje_rspsta    => o_mnsje_rspsta);
      exception
        when others then
          o_cdgo_rspsta  := 30;
          o_mnsje_rspsta := o_cdgo_rspsta ||
                            '.1. No se pudo registrar el log para gf_g_movimientos_detalle ID: ' ||
                            fila.llave || ' Error: ' || v_mnsje_rspsta;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 3);
          rollback;
          return;
      end;

    end loop;

    --Se elimina el movimiento financiero
    begin
      delete from gf_g_movimientos_financiero
       where id_mvmnto_fncro = v_id_mvmnto_fncro;
    exception
      when others then
        o_cdgo_rspsta  := 31;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          '. No se pudo reversar el movimiento financiero' ||
                          ' Error: ' || sqlerrm;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        return;
    end;

    -- Se guarda el log de liquidaciones concepto
    for fila in (select id_lqdcion_cncpto as llave,
                        json_object('id_lqdcion_cncpto' value
                                    b.id_lqdcion_cncpto,
                                    'id_lqdcion' value b.id_lqdcion,
                                    'id_impsto_acto_cncpto' value
                                    b.id_impsto_acto_cncpto,
                                    'vlor_lqddo' value b.vlor_lqddo,
                                    'vlor_clcldo' value b.vlor_clcldo,
                                    'trfa' value b.trfa,
                                    'bse_cncpto' value b.bse_cncpto,
                                    'txto_trfa' value b.txto_trfa,
                                    'vlor_intres' value b.vlor_intres,
                                    'indcdor_lmta_impsto' value
                                    b.indcdor_lmta_impsto,
                                    'fcha_vncmnto' value b.fcha_vncmnto) texto
                   from gi_g_liquidaciones_concepto b
                  where id_lqdcion = v_id_lqdcion) loop

      begin

        pkg_re_recaudos.prc_rg_reversion_recaudo_log(p_id_scncia_rvrsa => v_id_rcdo_rvrsa,
                                                     p_nmbre_tbla      => 'gi_g_liquidaciones_concepto',
                                                     p_id_orgen        => fila.llave,
                                                     p_fla             => fila.texto,
                                                     o_mnsje_rspsta    => o_mnsje_rspsta);
      exception
        when others then
          o_cdgo_rspsta  := 32;
          o_mnsje_rspsta := o_cdgo_rspsta ||
                            '.1. No se pudo registrar el log para gf_g_movimientos_detalle ID: ' ||
                            fila.llave || ' Error: ' || v_mnsje_rspsta;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 3);
          rollback;
          return;
      end;

    end loop;

    --Se elimina liquidaciones concepto
    begin
      delete from gi_g_liquidaciones_concepto
       where id_lqdcion = v_id_lqdcion;
    exception
      when others then
        o_cdgo_rspsta  := 33;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          '. No se pudo reversar los concepto de la liquidación';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        return;
    end;

    --Se actualiza id_lqdcion a null
    begin
      update gi_g_declaraciones
         set id_lqdcion = null
       where id_dclrcion = v_id_dclrcion;
    exception
      when others then
        o_cdgo_rspsta  := 34;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          '. No se pudo actualizar la columna liquidación en declaraciones';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        return;
    end;

    -- Se guarda el log de liquidaciones
    for fila in (select id_lqdcion as llave,
                        json_object('id_lqdcion' value b.id_lqdcion,
                                    'cdgo_clnte' value b.cdgo_clnte,
                                    'id_impsto' value b.id_impsto,
                                    'id_impsto_sbmpsto' value
                                    b.id_impsto_sbmpsto,
                                    'vgncia' value b.vgncia,
                                    'id_prdo' value b.id_prdo,
                                    'id_sjto_impsto' value b.id_sjto_impsto,
                                    'fcha_lqdcion' value b.fcha_lqdcion,
                                    'cdgo_lqdcion_estdo' value
                                    b.cdgo_lqdcion_estdo,
                                    'bse_grvble' value b.bse_grvble,
                                    'vlor_ttal' value b.vlor_ttal,
                                    'nmro_dcmnto_sprte' value
                                    b.nmro_dcmnto_sprte,
                                    'id_dcmnto_tpo_sprte' value
                                    b.id_dcmnto_tpo_sprte,
                                    'fcha_dcmnto_sprte' value
                                    b.fcha_dcmnto_sprte,
                                    'id_lqdcion_tpo' value b.id_lqdcion_tpo,
                                    'id_ttlo_ejctvo' value b.id_ttlo_ejctvo,
                                    'cdgo_prdcdad' value b.cdgo_prdcdad,
                                    'id_prcso_crga' value b.id_prcso_crga,
                                    'id_lqdcion_antrior' value
                                    b.id_lqdcion_antrior,
                                    'id_usrio' value b.id_usrio,
                                    'nmro_mses' value b.nmro_mses) texto
                   from gi_g_liquidaciones b
                  where id_lqdcion = v_id_lqdcion) loop

      begin

        pkg_re_recaudos.prc_rg_reversion_recaudo_log(p_id_scncia_rvrsa => v_id_rcdo_rvrsa,
                                                     p_nmbre_tbla      => 'gi_g_liquidaciones',
                                                     p_id_orgen        => fila.llave,
                                                     p_fla             => fila.texto,
                                                     o_mnsje_rspsta    => o_mnsje_rspsta);
      exception
        when others then
          o_cdgo_rspsta  := 35;
          o_mnsje_rspsta := o_cdgo_rspsta ||
                            '.1. No se pudo registrar el log para gf_g_movimientos_detalle ID: ' ||
                            fila.llave || ' Error: ' || v_mnsje_rspsta;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 3);
          rollback;
          return;
      end;

    end loop;

    --Se elimina la liquidacion
    begin
      delete from gi_g_liquidaciones where id_lqdcion = v_id_lqdcion;
    exception
      when others then
        o_cdgo_rspsta  := 36;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          '. No se pudo reversar la liquidación';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        return;
    end;

    --Se actualiza id_rcdo a null
    begin
      update gi_g_declaraciones
         set id_rcdo             = null,
             cdgo_dclrcion_estdo = 'AUT',
             fcha_aplccion       = null,
             id_usrio_aplccion   = null
       where id_dclrcion = v_id_dclrcion;
    exception
      when others then
        o_cdgo_rspsta  := 37;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          '. No se pudo actualizar el recaudo en declaraciones';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        return;
    end;

  end if;

  -- Se guarda el log de lo que se elimina
  for fila in (select id_rcdo_cntrol as llave,
                      json_object('ID_RCDO_CNTROL' value id_rcdo_cntrol,
                                  'CDGO_CLNTE' value cdgo_clnte,
                                  'ID_IMPSTO' value id_impsto,
                                  'ID_IMPSTO_SBMPSTO' value id_impsto_sbmpsto,
                                  'ID_BNCO' value id_bnco,
                                  'ID_BNCO_CNTA' value id_bnco_cnta,
                                  'FCHA_CNTROL' value fcha_cntrol,
                                  'OBSRVCION' value obsrvcion,
                                  'CNTDAD_RCDOS' value cntdad_rcdos,
                                  'VLOR_RCDOS' value vlor_rcdos,
                                  'CDGO_RCDO_ORGEN' value cdgo_rcdo_orgen,
                                  'ID_PRCSO_CRGA' value id_prcso_crga,
                                  'ID_USRIO' value id_usrio,
                                  'FCHA_RGSTRO' value fcha_rgstro) texto
                 from re_g_recaudos_control
                where id_rcdo_cntrol = v_re_g_recaudo.id_rcdo_cntrol) loop

    begin

      pkg_re_recaudos.prc_rg_reversion_recaudo_log(p_id_scncia_rvrsa => v_id_rcdo_rvrsa,
                                                   p_nmbre_tbla      => 're_g_recaudos_control',
                                                   p_id_orgen        => fila.llave,
                                                   p_fla             => fila.texto,
                                                   o_mnsje_rspsta    => o_mnsje_rspsta);
    exception
      when others then
        o_cdgo_rspsta  := 12;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          '.1. No se pudo registrar el log para re_g_recaudos_control ID: ' ||
                          fila.llave || ' Error: ' || v_mnsje_rspsta;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        rollback;
        return;
    end;

  end loop;

  v_cntdad_rcdos := v_cntdad_rcdos - 1;
  v_vlor_rcdos   := v_vlor_rcdos - v_re_g_recaudo.vlor;

  --Se actualiza el recaudo control
  begin

    update re_g_recaudos_control a
       set a.vlor_rcdos = v_vlor_rcdos, a.cntdad_rcdos = v_cntdad_rcdos
     where id_rcdo_cntrol = v_re_g_recaudo.id_rcdo_cntrol;

  exception
    when others then
      o_cdgo_rspsta  := 12;
      o_mnsje_rspsta := o_cdgo_rspsta ||
                        '. No se pudo Actualizar la cantidad de recaudos y valor total de los recuados' ||
                        ' Erro: ' || sqlerrm;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                            p_id_impsto  => null,
                            p_nmbre_up   => v_nmbre_up,
                            p_nvel_log   => v_nvel,
                            p_txto_log   => o_mnsje_rspsta,
                            p_nvel_txto  => 3);
      rollback;
      return;
  end;

  --Se elimina la foto de la cartera antes de aplicar el recaudo
  begin
    delete from re_g_recaudos_cartera
     where id_rcdo = v_re_g_recaudo.id_rcdo;
  exception
    when others then
      o_cdgo_rspsta  := 15;
      o_mnsje_rspsta := o_cdgo_rspsta ||
                        '. No se pudo eliminar la foto de la cartera antes de aplicar el recaudo';
      pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                            p_id_impsto  => null,
                            p_nmbre_up   => v_nmbre_up,
                            p_nvel_log   => v_nvel,
                            p_txto_log   => o_mnsje_rspsta,
                            p_nvel_txto  => 3);
      rollback;
      return;
  end;

  -- Se guarda el log de recaudo
  for fila in (select id_rcdo as llave,
                      json_object('ID_RCDO' value id_rcdo,
                                  'ID_RCDO_CNTROL' value id_rcdo_cntrol,
                                  'ID_SJTO_IMPSTO' value id_sjto_impsto,
                                  'CDGO_RCDO_ORGN_TPO' value
                                  cdgo_rcdo_orgn_tpo,
                                  'ID_ORGEN' value id_orgen,
                                  'FCHA_RCDO' value fcha_rcdo,
                                  'FCHA_INGRSO_BNCO' value fcha_ingrso_bnco,
                                  'VLOR' value vlor,
                                  'OBSRVCION' value obsrvcion,
                                  'CDGO_FRMA_PGO' value cdgo_frma_pgo,
                                  'CDGO_RCDO_ESTDO' value cdgo_rcdo_estdo,
                                  'FCHA_APLICCION' value fcha_apliccion,
                                  'MNSJE_RSPSTA' value mnsje_rspsta,
                                  'ID_USRIO_APLCO' value id_usrio_aplco,
                                  'ID_SLDO_FVOR' value id_sldo_fvor,
                                  'ID_CNVNIO' value id_cnvnio,
                                  'INDCDOR_INTRFAZ' value indcdor_intrfaz) texto
                 from re_g_recaudos
                where id_rcdo = v_re_g_recaudo.id_rcdo) loop

    begin

      pkg_re_recaudos.prc_rg_reversion_recaudo_log(p_id_scncia_rvrsa => v_id_rcdo_rvrsa,
                                                   p_nmbre_tbla      => 're_g_recaudos',
                                                   p_id_orgen        => fila.llave,
                                                   p_fla             => fila.texto,
                                                   o_mnsje_rspsta    => o_mnsje_rspsta);
    exception
      when others then
        o_cdgo_rspsta  := 15;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          '.1. No se pudo registrar el log para re_g_recaudos ID: ' ||
                          fila.llave || ' Error: ' || v_mnsje_rspsta;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        rollback;
        return;
    end;

  end loop;

  --Se elimina el recaudo
  begin
    delete from re_g_recaudos where id_rcdo = v_re_g_recaudo.id_rcdo;
  exception
    when others then
      o_cdgo_rspsta  := 15;
      o_mnsje_rspsta := o_cdgo_rspsta || '. No se pudo revertir el recaudo' ||
                        ' Error: ' || sqlerrm;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                            p_id_impsto  => null,
                            p_nmbre_up   => v_nmbre_up,
                            p_nvel_log   => v_nvel,
                            p_txto_log   => o_mnsje_rspsta,
                            p_nvel_txto  => 3);
      rollback;
      return;
  end;

  --Se elimina el recaudo si cantidad de recaudo es 0
  if v_cntdad_rcdos = 0 then
    delete from re_g_recaudos_control
     where id_rcdo_cntrol = v_re_g_recaudo.id_rcdo_cntrol;
  end if;

  --Se actualiza el consolidado
  begin
    pkg_gf_movimientos_financiero.prc_ac_concepto_consolidado(p_cdgo_clnte     => p_cdgo_clnte,
                                                              p_id_sjto_impsto => v_re_g_recaudo.id_sjto_impsto);
  exception
    when others then
      o_cdgo_rspsta  := 18;
      o_mnsje_rspsta := o_cdgo_rspsta ||
                        '. No se pudo actualizar el consolidado' ||
                        ' Error: ' || sqlerrm;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                            p_id_impsto  => null,
                            p_nmbre_up   => v_nmbre_up,
                            p_nvel_log   => v_nvel,
                            p_txto_log   => o_mnsje_rspsta,
                            p_nvel_txto  => 3);
      rollback;
      return;
  end;

end JL_prc_rg_reversar_recaudo;
/

