
  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PKG_GI_DECLARACIONES_FUNCIONES" as

  --Funcion de declaraciones que retorna el valor de intereses de un concepto
  --FDCL100
  function fnc_co_concepto_interes(p_id_dclrcion_vgncia_frmlrio number,
                                   p_item_acto_cncpto           varchar2,
                                   p_vlor_acto_cncpto           number,
                                   p_idntfccion                 varchar2,
                                   p_id_sjto_tpo                number default null,
                                   p_fcha_pryccion              varchar2)
    return number as
    v_id_frmlrio_rgion_atrbto number;
    v_fla                     number;
    v_id_cncpto               number;
    v_gnra_intres_mra         varchar2(1);
    v_cdgo_clnte              number;
    v_id_impsto               number;
    v_id_impsto_sbmpsto       number;
    v_vgncia                  number;
    v_id_prdo                 number;
    v_fcha_fnal               timestamp;

    v_vlor_intres number := 0;
  begin
    --Se identifica el atributo en el item
    select to_number(regexp_substr(regexp_substr(p_item_acto_cncpto,
                                                 'ATR[1-9][0-9]*'),
                                   '[0-9]+'))
      into v_id_frmlrio_rgion_atrbto
      from dual;

    --Se identifica la fila en el item
    select nvl(to_number(regexp_substr(regexp_substr(p_item_acto_cncpto,
                                                     'FLA[1-9][0-9]*'),
                                       '[0-9]+')),
               1)
      into v_fla
      from dual;

    --Se identifica el concepto
    select b.id_cncpto, b.gnra_intres_mra
      into v_id_cncpto, v_gnra_intres_mra
      from df_i_impuestos_acto_concepto b
     where exists
     (select 1
              from gi_d_dclrcnes_acto_cncpto c
             where c.id_dclrcion_vgncia_frmlrio =
                   p_id_dclrcion_vgncia_frmlrio
               and c.id_frmlrio_rgion_atrbto = v_id_frmlrio_rgion_atrbto
               and c.fla = v_fla
               and c.id_impsto_acto_cncpto = b.id_impsto_acto_cncpto);

    if (v_gnra_intres_mra = 'N') then
      return v_vlor_intres;
    end if;

    --Se consultan los datos necesarios para calcular la sancion
    select c.cdgo_clnte,
           c.id_impsto,
           c.id_impsto_sbmpsto,
           b.vgncia,
           b.id_prdo
      into v_cdgo_clnte,
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

    --Se consulta la fecha limite de declaracion
    select pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(p_id_dclrcion_vgncia_frmlrio => p_id_dclrcion_vgncia_frmlrio,
                                                          p_idntfccion                 => p_idntfccion,
                                                          p_id_sjto_tpo                => p_id_sjto_tpo)
      into v_fcha_fnal
      from dual;

    --Se calcula el valor de los interes
    select pkg_gf_movimientos_financiero.fnc_cl_interes_mora(p_cdgo_clnte         => v_cdgo_clnte,
                                                             p_id_impsto          => v_id_impsto,
                                                             p_id_impsto_sbmpsto  => v_id_impsto_sbmpsto,
                                                             p_vgncia             => v_vgncia,
                                                             p_id_prdo            => v_id_prdo,
                                                             p_id_cncpto          => v_id_cncpto,
                                                             p_vlor_cptal         => p_vlor_acto_cncpto,
                                                             p_indcdor_clclo      => 'PRY',
                                                             p_fcha_incio_vncmnto => v_fcha_fnal,
                                                             p_fcha_pryccion      => to_timestamp(p_fcha_pryccion,
                                                                                                  'dd/mm/yyyy'))
      into v_vlor_intres
      from dual;

    return v_vlor_intres;

  exception
    when others then
      return v_vlor_intres;
  end fnc_co_concepto_interes;

  --Funcion de declaraciones que retorna si existe una declaracion presentada o aplicada
  --para la identificacion de un sujeto-impuesto
  --FDCL110
  function fnc_co_declaracion(p_id_dclrcion_vgncia_frmlrio number,
                              p_idntfccion                 varchar2)
    return number as

    v_id_dclrcion_crrccion number := 0;
    v_id_sjto_impsto       number;

    v_error exception;

  begin

    --Se calcula el sujeto impuesto
    begin
      select a.id_sjto_impsto
        into v_id_sjto_impsto
        from v_si_i_sujetos_impuesto a
       where exists
       (select 1
                from gi_d_dclrcnes_vgncias_frmlr b
               inner join gi_d_dclrcnes_tpos_vgncias c
                  on c.id_dclrcion_tpo_vgncia = b.id_dclrcion_tpo_vgncia
               inner join gi_d_declaraciones_tipo d
                  on d.id_dclrcn_tpo = c.id_dclrcn_tpo
               where b.id_dclrcion_vgncia_frmlrio =
                     p_id_dclrcion_vgncia_frmlrio
                 and d.cdgo_clnte = a.cdgo_clnte
                 and d.id_impsto = a.id_impsto)
         and a.idntfccion_sjto = p_idntfccion;
    exception
      when others then
        raise v_error;
    end;

    --Se valida si existe una declaracion presentada o aplicada
    begin
      select a.id_dclrcion
        into v_id_dclrcion_crrccion
        from gi_g_declaraciones a
       where a.id_dclrcion_vgncia_frmlrio = p_id_dclrcion_vgncia_frmlrio
         and a.id_sjto_impsto = v_id_sjto_impsto
         and (a.indcdor_mgrdo not in ('C') or a.indcdor_mgrdo is null)
         and a.cdgo_dclrcion_estdo in ('APL', 'PRS');
    exception
      when others then
        raise v_error;
    end;

    return v_id_dclrcion_crrccion;

  exception
    when v_error then
      return v_id_dclrcion_crrccion;
  end fnc_co_declaracion;

  --Funcion de declaraciones que consulta el valor de la sancion de la declaracion
  --FDCL120
  function fnc_co_valor_sancion(p_cdgo_clnte                 number,
                                p_id_dclrcion_vgncia_frmlrio number,
                                p_idntfccion                 varchar2,
                                p_id_sjto_tpo                number default null,
                                p_fcha_prsntcion             varchar2,
                                p_fcha_expdcion              varchar2 default null, --Parametro usado para calcular sí debe aplicarse sanción - solo para DELINEACIÓN
                                p_cdgo_sncion_tpo            varchar2,
                                p_cdgo_dclrcion_uso          varchar2,
                                p_id_dclrcion_incial         number,
                                p_impsto_crgo                number,
                                p_ingrsos_brtos              number,
                                p_saldo_favor                number)
    return number as
    v_vlor_sncion number := 0;
  begin

    --Se hace el llamado a la funcion de sanciones que retorna el valor
    v_vlor_sncion := pkg_gi_sanciones.fnc_ca_valor_sancion(p_cdgo_clnte                 => p_cdgo_clnte,
                                                           p_id_dclrcion_vgncia_frmlrio => p_id_dclrcion_vgncia_frmlrio,
                                                           p_idntfccion                 => p_idntfccion,
                                                           p_fcha_prsntcion             => to_timestamp(p_fcha_prsntcion,
                                                                                                        'dd/mm/yyyy'),
                                                           p_fcha_expdcion              => to_timestamp(p_fcha_expdcion,
                                                                                                        'dd/mm/yyyy'), --Parametro usado para calcular sí debe aplicarse sanción - solo para DELINEACIÓN
                                                           p_id_sjto_tpo                => p_id_sjto_tpo,
                                                           p_cdgo_sncion_tpo            => p_cdgo_sncion_tpo,
                                                           p_cdgo_dclrcion_uso          => p_cdgo_dclrcion_uso,
                                                           p_id_dclrcion_incial         => p_id_dclrcion_incial,
                                                           p_impsto_crgo                => p_impsto_crgo,
                                                           p_ingrsos_brtos              => p_ingrsos_brtos,
                                                           p_saldo_favor                => p_saldo_favor);

    return v_vlor_sncion;

  exception
    when others then
      return v_vlor_sncion;
  end fnc_co_valor_sancion;

  --Funcion de declaraciones que calcula el valor de descuento de un concepto
  --FDCL130
  function fnc_co_valor_descuento(p_id_dclrcion_vgncia_frmlrio number,
                                  p_id_dclrcion_crrccion       number,
                                  p_item_cncpto                varchar2,
                                  p_vlor_cncpto                number,
                                  p_idntfccion                 varchar2,
                                  p_fcha_pryccion              varchar2)
    return pkg_re_documentos.g_dtos_dscntos
    pipelined as

    v_id_frmlrio_rgion_atrbto number;
    v_fla                     number;
    v_id_cncpto               number;
    v_cdgo_clnte              number;
    v_id_impsto               number;
    v_id_impsto_sbmpsto       number;
    v_vgncia                  number;
    v_id_prdo                 number;
    v_id_sjto_impsto          number;

    v_dscnto pkg_re_documentos.g_dtos_dscntos := pkg_re_documentos.g_dtos_dscntos();
  begin
    --Se identifica el atributo en el item
    select to_number(regexp_substr(regexp_substr(p_item_cncpto,
                                                 'ATR[1-9][0-9]*'),
                                   '[0-9]+'))
      into v_id_frmlrio_rgion_atrbto
      from dual;

    --Se identifica la fila en el item
    select nvl(to_number(regexp_substr(regexp_substr(p_item_cncpto,
                                                     'FLA[1-9][0-9]*'),
                                       '[0-9]+')),
               1)
      into v_fla
      from dual;

    --Se identifica el concepto
    select e.id_cncpto
      into v_id_cncpto
      from v_gi_d_declaraciones_concepto e
     where e.id_dclrcion_vgncia_frmlrio = p_id_dclrcion_vgncia_frmlrio
       and e.id_frmlrio_rgion_atrbto = v_id_frmlrio_rgion_atrbto
       and e.fla = v_fla;

    --Se calcula el descuento
    select a.id_dscnto_rgla,
           a.prcntje_dscnto,
           a.vlor_dscnto,
           a.id_cncpto_dscnto,
           a.id_cncpto_dscnto_grpo,
           null,
           null,
           null,
           null
      bulk collect
      into v_dscnto
      from table(pkg_gi_declaraciones.fnc_co_valor_descuento(p_id_dclrcion_vgncia_frmlrio => p_id_dclrcion_vgncia_frmlrio,
                                                             p_id_dclrcion_crrccion       => p_id_dclrcion_crrccion,
                                                             p_id_cncpto                  => v_id_cncpto,
                                                             p_vlor_cncpto                => p_vlor_cncpto,
                                                             p_idntfccion                 => p_idntfccion,
                                                             p_fcha_pryccion              => p_fcha_pryccion)) a;

    for i in 1 .. v_dscnto.count loop
      pipe row(v_dscnto(i));
    end loop;
  exception
    when others then
      null;
  end fnc_co_valor_descuento;

  --Funcion que valida la fecha maxima de presentacion de una declaracion
  --FDCL150
  function fnc_co_fcha_mxma_prsntcion(p_id_dclrcion_vgncia_frmlrio number,
                                      p_idntfccion                 varchar2,
                                      p_id_sjto_tpo                number default null,
                                      p_lcncia                     varchar2 default null)
    return timestamp as

    v_fcha_fnal         timestamp;
    v_cdgo_clnte        number;
    v_id_impsto         number;
    v_fcha_mxma_tsa_mra timestamp;

    v_error exception;

  begin

    --Se consulta la fecha limite de declaracion
    v_fcha_fnal := pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(p_id_dclrcion_vgncia_frmlrio => p_id_dclrcion_vgncia_frmlrio,
                                                                  p_idntfccion                 => p_idntfccion,
                                                                  p_id_sjto_tpo                => p_id_sjto_tpo,
                                                                  p_lcncia                     => p_lcncia);

    v_fcha_mxma_tsa_mra := v_fcha_fnal;
    --Si la fecha de declaracion supera la fecha actual
    if (v_fcha_fnal < trunc(systimestamp)) then
      --Se identifica el cliente y el impuesto
      begin
        select c.cdgo_clnte, c.id_impsto
          into v_cdgo_clnte, v_id_impsto
          from gi_d_dclrcnes_vgncias_frmlr a
         inner join gi_d_dclrcnes_tpos_vgncias b
            on b.id_dclrcion_tpo_vgncia = a.id_dclrcion_tpo_vgncia
         inner join gi_d_declaraciones_tipo c
            on c.id_dclrcn_tpo = b.id_dclrcn_tpo
         where a.id_dclrcion_vgncia_frmlrio = p_id_dclrcion_vgncia_frmlrio;
      exception
        when others then
          raise v_error;
      end;

      --Se consulta la fecha maxima de tasa mora
      begin
        select max(a.fcha_hsta)
          into v_fcha_mxma_tsa_mra
          from df_i_tasas_mora a
         where cdgo_clnte = v_cdgo_clnte
           and id_impsto = v_id_impsto;
      exception
        when others then
          raise v_error;
      end;
    end if;

    return v_fcha_mxma_tsa_mra;
  exception
    when v_error then
      return systimestamp - 1;
  end fnc_co_fcha_mxma_prsntcion;

  --Funcion que calcula el digito de verificacion de una identificacion
  --FDCL160
  function fnc_ca_digito_verificacion(p_identificacion varchar2)
    return number as

    v_identificacion   varchar2(100);
    v_tmnio_idntfccion number;
    x                  number := 0;
    y                  number := 0;

    type array_t is varray(15) of number;
    v_array_t array_t := array_t(3,
                                 7,
                                 13,
                                 17,
                                 19,
                                 23,
                                 29,
                                 37,
                                 41,
                                 43,
                                 47,
                                 53,
                                 59,
                                 67,
                                 71);

  begin
    --Se limpia la identificacion
    v_identificacion := replace(p_identificacion, ' ', ''); --Espacios
    v_identificacion := replace(v_identificacion, ',', ''); --Comas
    v_identificacion := replace(v_identificacion, '.', ''); --Puntos
    v_identificacion := replace(v_identificacion, '-', ''); --Guiones

    --Se valida que haya una identificacion
    if (v_identificacion is null) then
      dbms_output.put_line('return null');
    end if;

    v_tmnio_idntfccion := length(v_identificacion);

    --Procedimiento
    for i in 1 .. v_tmnio_idntfccion loop
      y := substr(v_identificacion, i, 1);
      x := x + (y * v_array_t((v_tmnio_idntfccion + 1) - i));
    end loop;

    y := mod(x, 11);

    if (y > 1) then
      return 11 - y;
    else
      return y;
    end if;
  end fnc_ca_digito_verificacion;

  /*function fnc_co_cncpto_intrs_vlddo(p_id_dclrcion_vgncia_frmlrio number,
                                     p_item_acto_cncpto           varchar2,
                                     p_vlor_acto_cncpto           number,
                                     p_dclrcion_uso               varchar2 default null,
                                     p_id_dclrcion_antrior        number default null,
                                     p_idntfccion                 varchar2,
                                     p_id_sjto_tpo                number default null,
                                     p_fcha_pryccion              varchar2,
                                     p_vlor_ttal                  number default null)

   return number as

    v_id_frmlrio_rgion_atrbto number;
    v_vlr_total_inicial       number;
    v_fla                     number;
    v_id_cncpto               number;
    v_gnra_intres_mra         varchar2(1);
    v_cdgo_clnte              number;
    v_id_impsto               number;
    v_id_impsto_sbmpsto       number;
    v_vgncia                  number;
    v_id_prdo                 number;
    v_fcha_fnal               timestamp;
    v_nl                      number := 6;
    v_vlor_intres             number := 0;
    v_fcha_prsntcion_inicial  timestamp;

  begin
    v_nl := pkg_sg_log.fnc_ca_nivel_log(23001,
                                        null,
                                        'pkg_gi_declaraciones_funciones.fnc_co_cncpto_intrs_vlddo');
    pkg_sg_log.prc_rg_log(23001,
                          null,
                          'pkg_gi_declaraciones_funciones.fnc_co_cncpto_intrs_vlddo',
                          v_nl,
                          'p_id_dclrcion_vgncia_frmlrio' ||
                          p_id_dclrcion_vgncia_frmlrio,
                          1);
    pkg_sg_log.prc_rg_log(23001,
                          null,
                          'pkg_gi_declaraciones_funciones.fnc_co_cncpto_intrs_vlddo',
                          v_nl,
                          'p_item_acto_cncpto' || p_item_acto_cncpto,
                          1);
    pkg_sg_log.prc_rg_log(23001,
                          null,
                          'pkg_gi_declaraciones_funciones.fnc_co_cncpto_intrs_vlddo',
                          v_nl,
                          'p_vlor_acto_cncpto' || p_vlor_acto_cncpto,
                          1);
    pkg_sg_log.prc_rg_log(23001,
                          null,
                          'pkg_gi_declaraciones_funciones.fnc_co_cncpto_intrs_vlddo',
                          v_nl,
                          'p_idntfccion' || p_idntfccion,
                          1);
    pkg_sg_log.prc_rg_log(23001,
                          null,
                          'pkg_gi_declaraciones_funciones.fnc_co_cncpto_intrs_vlddo',
                          v_nl,
                          'p_id_sjto_tpo' || p_id_sjto_tpo,
                          1);
    pkg_sg_log.prc_rg_log(23001,
                          null,
                          'pkg_gi_declaraciones_funciones.fnc_co_cncpto_intrs_vlddo',
                          v_nl,
                          'p_fcha_pryccion' || p_fcha_pryccion,
                          1);

   -- p_id_dclrcion_vgncia_frmlrio  :=9941;
   -- p_item_acto_cncpto        :='RGN1042ATR5128FLAX';
   -- p_vlor_acto_cncpto              :=500000;
   -- p_dclrcion_uso                  :='DCO';
   -- p_id_dclrcion_antrior      :=773392;
   -- p_idntfccion                   :=860020369;
   -- p_id_sjto_tpo         :=345;
   -- p_fcha_pryccion                 :='15/04/2022';

    --if(p_dclrcion_uso is null or p_fcha_pryccion is null or p_id_sjto_tpo is null) then
    if (p_dclrcion_uso is null or p_fcha_pryccion is null) then
      pkg_sg_log.prc_rg_log(23001,
                            null,
                            'pkg_gi_declaraciones_funciones.fnc_co_cncpto_intrs_vlddo',
                            v_nl,
                            'p_dclrcion_uso is null or p_fcha_pryccion is null or p_id_sjto_tpo is null',
                            1);

      return 0;
    end if;
    --Se identifica el atributo en el item
    select to_number(regexp_substr(regexp_substr(p_item_acto_cncpto,
                                                 'ATR[1-9][0-9]*'),
                                   '[0-9]+'))
      into v_id_frmlrio_rgion_atrbto
      from dual;

    --Se identifica la fila en el item
    select nvl(to_number(regexp_substr(regexp_substr(p_item_acto_cncpto,
                                                     'FLA[1-9][0-9]*'),
                                       '[0-9]+')),
               1)
      into v_fla
      from dual;

    DBMS_OUTPUT.PUT_LINE('v_fla : ' || v_fla);

    --Se identifica el concepto
    select b.id_cncpto, b.gnra_intres_mra
      into v_id_cncpto, v_gnra_intres_mra
      from df_i_impuestos_acto_concepto b
     where exists
     (select 1
              from gi_d_dclrcnes_acto_cncpto c
             where c.id_dclrcion_vgncia_frmlrio =
                   p_id_dclrcion_vgncia_frmlrio
               and c.id_frmlrio_rgion_atrbto = v_id_frmlrio_rgion_atrbto
               and c.fla = v_fla
               and c.id_impsto_acto_cncpto = b.id_impsto_acto_cncpto);

    if (v_gnra_intres_mra = 'N') then
      pkg_sg_log.prc_rg_log(23001,
                            null,
                            'pkg_gi_declaraciones_funciones.fnc_co_cncpto_intrs_vlddo',
                            v_nl,
                            'v_gnra_intres_mra = N',
                            1);

      return v_vlor_intres;

    end if;

    --DBMS_OUTPUT.PUT_LINE('COMENZANDO 3') ;--retorna 0
    --Se consultan los datos necesarios para calcular la sancion
    select c.cdgo_clnte,
           c.id_impsto,
           c.id_impsto_sbmpsto,
           b.vgncia,
           b.id_prdo
      into v_cdgo_clnte,
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

    --Se consulta la fecha limite de declaracion
    DBMS_OUTPUT.PUT_LINE('v_cdgo_clnte : ' || v_cdgo_clnte ||
                         'v_id_impsto : ' || v_id_impsto_sbmpsto ||
                         'v_vgncia: ' || v_vgncia || 'v_id_prdo: ' ||
                         v_id_prdo);

    select pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(p_id_dclrcion_vgncia_frmlrio => p_id_dclrcion_vgncia_frmlrio,
                                                          p_idntfccion                 => p_idntfccion,
                                                          p_id_sjto_tpo                => p_id_sjto_tpo)
      into v_fcha_fnal
      from dual;
    DBMS_OUTPUT.PUT_LINE('v_fcha_fnal: ' || v_fcha_fnal);

    if (p_dclrcion_uso = 'DCO') then
      --se calcula el valor total de la declaracion inicial
      pkg_sg_log.prc_rg_log(23001,
                            null,
                            'pkg_gi_declaraciones_funciones.fnc_co_cncpto_intrs_vlddo',
                            v_nl,
                            'p_dclrcion_uso = DCO',
                            1);

      begin
        select vlor_ttal
          into v_vlr_total_inicial
          from gi_g_declaraciones a
         where a.nmro_cnsctvo = p_id_dclrcion_antrior;

        pkg_sg_log.prc_rg_log(23001,
                              null,
                              'pkg_gi_declaraciones_funciones.fnc_co_cncpto_intrs_vlddo',
                              v_nl,
                              'v_vlr_total_inicial: ' ||
                              v_vlr_total_inicial,
                              1);

      exception
        when no_data_found then
          return v_vlor_intres;
          --null;
        when too_many_rows then
          return v_vlor_intres;
          --null;
      end;

      --se calcula la fecha de la presentación de la declaracion inicial

      begin
        select a.fcha_prsntcion
          into v_fcha_prsntcion_inicial
          from gi_g_declaraciones a
         where a.nmro_cnsctvo = p_id_dclrcion_antrior;

      exception
        when no_data_found then
          return v_vlor_intres;
        when too_many_rows then
          return v_vlor_intres;
      end;

      --Se calcula el valor de los interes en base a las condiciones del cliente
      --1.
      pkg_sg_log.prc_rg_log(23001,
                            null,
                            'pkg_gi_declaraciones_funciones.fnc_co_cncpto_intrs_vlddo',
                            v_nl,
                            'p_vlor_ttal: ' || p_vlor_ttal,
                            6);
      pkg_sg_log.prc_rg_log(23001,
                            null,
                            'pkg_gi_declaraciones_funciones.fnc_co_cncpto_intrs_vlddo',
                            v_nl,
                            'v_vlr_total_inicial: ' || v_vlr_total_inicial,
                            6);

      if ((p_vlor_ttal <= v_vlr_total_inicial or
         p_vlor_ttal >= v_vlr_total_inicial) and
         p_fcha_pryccion < v_fcha_fnal) then

        pkg_sg_log.prc_rg_log(23001,
                              null,
                              'pkg_gi_declaraciones_funciones.fnc_co_cncpto_intrs_vlddo',
                              v_nl,
                              'p_dclrcion_uso = DCO. hmz',
                              1);

        return v_vlor_intres;

      end if;

      --2.Cuando la declaración inicial se presenta dentro del plazo y la declaración de corrección se presenta fuera del plazo.
      if (v_fcha_prsntcion_inicial <= v_fcha_fnal and
         p_fcha_pryccion > v_fcha_fnal) then

        --¿Qué sucede si el nuevo valor a pagar es mayor?
        --En este caso, cuando es mayor valor a pagar,
        --SI se genera intereses de mora sobre ese mayor valor,
        if (p_vlor_ttal > v_vlr_total_inicial) then

          select pkg_gf_movimientos_financiero.fnc_cl_interes_mora(p_cdgo_clnte         => v_cdgo_clnte,
                                                                   p_id_impsto          => v_id_impsto,
                                                                   p_id_impsto_sbmpsto  => v_id_impsto_sbmpsto,
                                                                   p_vgncia             => v_vgncia,
                                                                   p_id_prdo            => v_id_prdo,
                                                                   p_id_cncpto          => v_id_cncpto,
                                                                   p_vlor_cptal         => p_vlor_acto_cncpto,
                                                                   p_indcdor_clclo      => 'PRY',
                                                                   p_fcha_incio_vncmnto => v_fcha_fnal,
                                                                   p_fcha_pryccion      => to_timestamp(p_fcha_pryccion,
                                                                                                        'dd/mm/yyyy'))
            into v_vlor_intres
            from dual;

          return v_vlor_intres;

        end if;

        if (p_vlor_ttal <= v_vlr_total_inicial) then

          return v_vlor_intres;

        end if;

      end if;

      --3.Cuando la declaración inicial se presenta fuera del plazo y la declaración de corrección se presenta fuera del plazo.
      if (v_fcha_prsntcion_inicial > v_fcha_fnal and
         p_fcha_pryccion > v_fcha_fnal) then

        if (p_vlor_ttal > v_vlr_total_inicial) then

          select pkg_gf_movimientos_financiero.fnc_cl_interes_mora(p_cdgo_clnte         => v_cdgo_clnte,
                                                                   p_id_impsto          => v_id_impsto,
                                                                   p_id_impsto_sbmpsto  => v_id_impsto_sbmpsto,
                                                                   p_vgncia             => v_vgncia,
                                                                   p_id_prdo            => v_id_prdo,
                                                                   p_id_cncpto          => v_id_cncpto,
                                                                   p_vlor_cptal         => p_vlor_acto_cncpto,
                                                                   p_indcdor_clclo      => 'PRY',
                                                                   p_fcha_incio_vncmnto => v_fcha_fnal,
                                                                   p_fcha_pryccion      => to_timestamp(p_fcha_pryccion,
                                                                                                        'dd/mm/yyyy'))
            into v_vlor_intres
            from dual;

          return v_vlor_intres;

        end if;

        if (p_vlor_ttal <= v_vlr_total_inicial) then

          return v_vlor_intres;

        end if;

      end if;

    end if;

    if (p_dclrcion_uso = 'DIN') then

      select pkg_gf_movimientos_financiero.fnc_cl_interes_mora(p_cdgo_clnte         => v_cdgo_clnte,
                                                               p_id_impsto          => v_id_impsto,
                                                               p_id_impsto_sbmpsto  => v_id_impsto_sbmpsto,
                                                               p_vgncia             => v_vgncia,
                                                               p_id_prdo            => v_id_prdo,
                                                               p_id_cncpto          => v_id_cncpto,
                                                               p_vlor_cptal         => p_vlor_acto_cncpto,
                                                               p_indcdor_clclo      => 'PRY',
                                                               p_fcha_incio_vncmnto => v_fcha_fnal,
                                                               p_fcha_pryccion      => to_timestamp(p_fcha_pryccion,
                                                                                                    'dd/mm/yyyy'))
        into v_vlor_intres
        from dual;

      return v_vlor_intres;

    end if;

    --return v_vlor_intres;

  exception
    when others then
      return v_vlor_intres;

  end fnc_co_cncpto_intrs_vlddo;*/

  /*
        Función que calcula la fecha limite de presentación
        para las declaraciones de delineación urbana

  */
  function fnc_ca_fecha_limite(p_cdgo_clnte                 in number,
                               p_id_dclrcion_vgncia_frmlrio in gi_d_dclrcnes_vgncias_frmlr.id_dclrcion_vgncia_frmlrio%type,
                               p_idntfccion                 in varchar2 default null,
                               --p_fcha_prsntcion        in  varchar2,
                               p_fcha_expdcion in varchar2 default null,
                               p_id_sjto_tpo   in number default null)
    return timestamp as

    v_fcha_lmte_dclrcion   gi_d_dclrcnes_fcha_prsntcn.fcha_fnal%type;
    v_numero_meses_sancion number;
    v_indcdor_dlneacion    varchar2(1);
    /*Variables para calcular la fecha limete de presentación de declaración delineación*/
    v_undad_drcion varchar2(10);
    v_dia_tpo      varchar2(10);
    v_drcion       number;

  begin
    --Calcula sí es delineación urbana
    begin
      select a.indcdor_dlneacion, a.undad_drcion, a.drcion, a.dia_tpo
        into v_indcdor_dlneacion, v_undad_drcion, v_drcion, v_dia_tpo
        from gi_d_dclrcnes_vgncias_frmlr a
       where a.id_dclrcion_vgncia_frmlrio = p_id_dclrcion_vgncia_frmlrio;
    exception
      when no_data_found then
        null;
      when others then
        return 'N';
    end;

    --Se calcula la fecha limite de presentacion de la declaracion
    if v_indcdor_dlneacion = 'S' then

      v_fcha_lmte_dclrcion := pk_util_calendario.fnc_cl_fecha_final(p_cdgo_clnte    => p_cdgo_clnte, --consultar codigo cliente
                                                                    p_fecha_inicial => p_fcha_expdcion,
                                                                    p_undad_drcion  => v_undad_drcion,
                                                                    p_drcion        => v_drcion,
                                                                    p_dia_tpo       => v_dia_tpo);
    else
      v_fcha_lmte_dclrcion := trunc(sysdate);
    end if;

    return v_fcha_lmte_dclrcion;

  exception
    when others then
      return sysdate;
  end fnc_ca_fecha_limite;

  /*
      Función que valida si la fecha de presentación es extemporanea
      para las declaraciones de delineación urbana
  */
  function fnc_vl_fecha_limite(p_cdgo_clnte                 in number,
                               p_id_dclrcion_vgncia_frmlrio in gi_d_dclrcnes_vgncias_frmlr.id_dclrcion_vgncia_frmlrio%type,
                               p_idntfccion                 in varchar2,
                               p_fcha_prsntcion             in varchar2,
                               p_fcha_expdcion              in varchar2 default null,
                               p_id_sjto_tpo                in number default null)
    return varchar2 as

    v_fcha_lmte_dclrcion   gi_d_dclrcnes_fcha_prsntcn.fcha_fnal%type;
    v_numero_meses_sancion number;
    v_indcdor_dlneacion    varchar2(1);
    /*Variables para calcular la fecha limete de presentación de declaración delineación*/
    v_undad_drcion varchar2(10);
    v_dia_tpo      varchar2(10);
    v_drcion       number;
  begin

    --Calcula sí es delineación urbana
    begin
      select a.indcdor_dlneacion, a.undad_drcion, a.drcion, a.dia_tpo
        into v_indcdor_dlneacion, v_undad_drcion, v_drcion, v_dia_tpo
        from gi_d_dclrcnes_vgncias_frmlr a
       where a.id_dclrcion_vgncia_frmlrio = p_id_dclrcion_vgncia_frmlrio;
    exception
      when no_data_found then
        null;
      when others then
        return 'N';
    end;
    --Se calcula la fecha limite de presentacion de la declaracion
    if v_indcdor_dlneacion = 'S' then
      begin
        v_fcha_lmte_dclrcion := pk_util_calendario.fnc_cl_fecha_final(p_cdgo_clnte    => p_cdgo_clnte, --consultar codigo cliente
                                                                      p_fecha_inicial => p_fcha_expdcion,
                                                                      p_undad_drcion  => v_undad_drcion,
                                                                      p_drcion        => v_drcion,
                                                                      p_dia_tpo       => v_dia_tpo);
      end;
    else
      begin
        v_fcha_lmte_dclrcion := pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(p_id_dclrcion_vgncia_frmlrio => p_id_dclrcion_vgncia_frmlrio,
                                                                               p_id_sjto_tpo                => p_id_sjto_tpo,
                                                                               p_idntfccion                 => p_idntfccion);
      end;
    end if;

    if (p_fcha_prsntcion > v_fcha_lmte_dclrcion) then
      return 'S';
    else
      return 'N';
    end if;
  exception
    when others then
      return 'N';
  end fnc_vl_fecha_limite;

  function fnc_co_cncpto_intrs_vlddo(p_id_dclrcion_vgncia_frmlrio number,
                                     p_item_acto_cncpto           varchar2 default null,
                                     p_item                       varchar2 default null, --Parametro que recibe el nombre del atributo creado en la pagina DECLARACIÓN VERSIÓN 2
                                     p_vlor_acto_cncpto           number,
                                     p_dclrcion_uso               varchar2 default null,
                                     p_id_dclrcion_antrior        number default null,
                                     p_idntfccion                 varchar2,
                                     p_id_sjto_tpo                number default null,
                                     p_fcha_pryccion              varchar2,
                                     p_fcha_expdcion              varchar2 default null, --NUEVO CAMPO PARA CALCULAR INTERES DE DEL
                                     p_vlor_ttal                  number default null)

   return number as

    v_nmbre_up                   varchar2(100) := 'pkg_gi_declaraciones_funciones.fnc_co_cncpto_intrs_vlddo';
    v_id_frmlrio_rgion_atrbto    number;
    v_vlr_total_anterior         number := 0;
    v_fla                        number;
    v_id_cncpto                  number;
    v_gnra_intres_mra            varchar2(1);
    v_cdgo_clnte                 number;
    v_id_impsto                  number;
    v_id_impsto_sbmpsto          number;
    v_vgncia                     number;
    v_id_prdo                    number;
    v_fcha_fnal                  timestamp;
    v_nl                         number;
    v_vlor_intres                number := 0;
    v_fcha_prsntcion_inicial     timestamp;
    v_indcdor_dlneacion          varchar2(1);
    v_vlor_ttal_crccion          number := 0; --Nuevo 14/11/2024 Luis ariza
    v_vlor_rcdo                  number := 0;
    v_id_dclrcion_anterior       number := 0;
    v_vlor_ttal_interes_anterior number := 0;
    v_vlor_interes_anterior      number := 0;

  begin
    begin
      select a.cdgo_clnte
        into v_cdgo_clnte
        from df_s_clientes a
       where a.actvo = 'S';
    exception
      when others then
        null;
    end;
    v_nl := pkg_sg_log.fnc_ca_nivel_log(v_cdgo_clnte, null, v_nmbre_up);
    pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'p_id_dclrcion_vgncia_frmlrio' ||
                          p_id_dclrcion_vgncia_frmlrio,
                          1);
    pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'p_item_acto_cncpto' || p_item_acto_cncpto,
                          1);
    pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'p_vlor_acto_cncpto' || p_vlor_acto_cncpto,
                          1);
    pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'p_idntfccion' || p_idntfccion,
                          1);
    pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'p_id_sjto_tpo' || p_id_sjto_tpo,
                          1);
    pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'p_fcha_pryccion' || p_fcha_pryccion,
                          1);
    pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'p_dclrcion_uso' || p_dclrcion_uso,
                          1);

    /*p_id_dclrcion_vgncia_frmlrio  :=9941;
    p_item_acto_cncpto        :='RGN1042ATR5128FLAX';
    p_vlor_acto_cncpto              :=500000;
    p_dclrcion_uso                  :='DCO';
    p_id_dclrcion_antrior      :=773392;
    p_idntfccion                   :=860020369;
    p_id_sjto_tpo         :=345;
    p_fcha_pryccion                 :='15/04/2022';*/

    if (p_dclrcion_uso is null or p_fcha_pryccion is null or
       p_id_sjto_tpo is null) then
      pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            'p_dclrcion_uso is null or p_fcha_pryccion is null or p_id_sjto_tpo is null',
                            1);

      return 0;
    end if;
    --Se identifica el atributo en el item
    select to_number(regexp_substr(regexp_substr(p_item_acto_cncpto,
                                                 'ATR[1-9][0-9]*'),
                                   '[0-9]+'))
      into v_id_frmlrio_rgion_atrbto
      from dual;

    --Se identifica la fila en el item
    select nvl(to_number(regexp_substr(regexp_substr(p_item_acto_cncpto,
                                                     'FLA[1-9][0-9]*'),
                                       '[0-9]+')),
               1)
      into v_fla
      from dual;

    DBMS_OUTPUT.PUT_LINE('v_fla : ' || v_fla);

    --Se identifica el concepto
    --Se identifica el concepto
    select b.id_cncpto, b.gnra_intres_mra
      into v_id_cncpto, v_gnra_intres_mra
      from df_i_impuestos_acto_concepto b
     where exists
     (select 1
              from gi_d_dclrcnes_acto_cncpto c
             where c.id_dclrcion_vgncia_frmlrio =
                   p_id_dclrcion_vgncia_frmlrio
               and 1 = case
                     when c.id_frmlrio_rgion_atrbto =
                          v_id_frmlrio_rgion_atrbto then
                      1
                     when upper(c.id_frmlrio_rgion_item) like upper(p_item) then
                      1
                     else
                      0
                   end
               and 1 = case
                     when c.fla = v_fla then
                      1
                     when upper(c.id_frmlrio_rgion_item) like upper(p_item) then
                      1
                     else
                      0
                   end

               and c.id_impsto_acto_cncpto = b.id_impsto_acto_cncpto);

    if (v_gnra_intres_mra = 'N') then
      pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            'v_gnra_intres_mra = N',
                            1);

      return v_vlor_intres;

    end if;

    --DBMS_OUTPUT.PUT_LINE('COMENZANDO 3') ;--retorna 0
    --Se consultan los datos necesarios para calcular la sancion
    select c.cdgo_clnte,
           c.id_impsto,
           c.id_impsto_sbmpsto,
           b.vgncia,
           b.id_prdo,
           a.indcdor_dlneacion
      into v_cdgo_clnte,
           v_id_impsto,
           v_id_impsto_sbmpsto,
           v_vgncia,
           v_id_prdo,
           v_indcdor_dlneacion
      from gi_d_dclrcnes_vgncias_frmlr a
     inner join gi_d_dclrcnes_tpos_vgncias b
        on b.id_dclrcion_tpo_vgncia = a.id_dclrcion_tpo_vgncia
     inner join gi_d_declaraciones_tipo c
        on c.id_dclrcn_tpo = b.id_dclrcn_tpo
     where a.id_dclrcion_vgncia_frmlrio = p_id_dclrcion_vgncia_frmlrio;

    pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Cosnulta tipo de fecha de vencimiento',
                          1);

    --Se consulta la fecha limite de declaracion
    DBMS_OUTPUT.PUT_LINE('v_cdgo_clnte : ' || v_cdgo_clnte ||
                         'v_id_impsto : ' || v_id_impsto_sbmpsto ||
                         'v_vgncia: ' || v_vgncia || 'v_id_prdo: ' ||
                         v_id_prdo);
    if (v_indcdor_dlneacion = 'N') then
      select pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(p_id_dclrcion_vgncia_frmlrio => p_id_dclrcion_vgncia_frmlrio,
                                                            p_idntfccion                 => p_idntfccion,
                                                            p_id_sjto_tpo                => p_id_sjto_tpo)
        into v_fcha_fnal
        from dual;
      -- DBMS_OUTPUT.PUT_LINE('v_fcha_fnal: '||v_fcha_fnal) ;
    else
      --v_fcha_fnal :=  to_timestamp(p_fcha_expdcion, 'dd/mm/yyyy') ;
      v_fcha_fnal := fnc_ca_fecha_limite(p_cdgo_clnte                 => v_cdgo_clnte,
                                         p_id_dclrcion_vgncia_frmlrio => p_id_dclrcion_vgncia_frmlrio,
                                         p_idntfccion                 => p_idntfccion,
                                         -- p_fcha_prsntcion        => p_fcha_pryccion,
                                         p_fcha_expdcion => p_fcha_expdcion,
                                         p_id_sjto_tpo   => p_id_sjto_tpo);
      --v_fcha_fnal :=  p_fcha_expdcion ;
    end if;

    pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'v_fcha_fnal => ' || v_fcha_fnal,
                          1);

    if (p_dclrcion_uso = 'DCO') then
      --se calcula el valor total de la declaracion inicial
      pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            'p_dclrcion_uso = DCO',
                            1);

      --se calcula la fecha de la presentación de la declaracion inicial

      begin
        select a.fcha_prsntcion, a.id_dclrcion
          into v_fcha_prsntcion_inicial, v_id_dclrcion_anterior
          from gi_g_declaraciones a
         where a.nmro_cnsctvo = p_id_dclrcion_antrior;

      exception
        when no_data_found then
          return v_vlor_intres;
        when too_many_rows then
          return v_vlor_intres;
      end;

      pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            'v_id_dclrcion_anterior => ' ||
                            v_id_dclrcion_anterior,
                            1);
      pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            'v_id_cncpto => ' || v_id_cncpto,
                            1);

      begin
        for c_pgos in (WITH Correcciones(id_dclrcion,
                         id_dclrcion_crrccion,
                         id_rcdo,
                         vlor_pago,
                         fcha_vncmnto) AS
                          (SELECT id_dclrcion,
                                 id_dclrcion_crrccion,
                                 id_rcdo,
                                 vlor_pago,
                                 (case
                                   when trunc(fcha_prsntcion) >
                                        trunc(fcha_prsntcion_pryctda) then
                                    trunc(fcha_prsntcion)
                                   else
                                    trunc(fcha_prsntcion_pryctda)
                                 end) fcha_vncmnto
                            FROM gi_g_declaraciones
                           WHERE id_dclrcion = v_id_dclrcion_anterior -- El ID de la declaración que quieres buscar

                          UNION ALL

                          SELECT d.id_dclrcion,
                                 d.id_dclrcion_crrccion,
                                 d.id_rcdo,
                                 d.vlor_pago,
                                 (case
                                   when trunc(fcha_prsntcion) >
                                        trunc(fcha_prsntcion_pryctda) then
                                    trunc(fcha_prsntcion)
                                   else
                                    trunc(fcha_prsntcion_pryctda)
                                 end) fcha_vncmnto
                            FROM gi_g_declaraciones d
                           INNER JOIN Correcciones c
                              ON d.id_dclrcion = c.id_dclrcion_crrccion
                          -- and d.cdgo_dclrcion_estdo in ( 'APL', 'RLA')
                          )
                         SELECT * FROM Correcciones order by id_dclrcion) loop
          pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'Entro al for de pagos=> ',
                                1);

          select sum(nvl(vlor_hber, 0)),
                 sum(decode(cdgo_mvmnto_tpo, 'PI', nvl(vlor_hber, 0), 0))
            into v_vlor_rcdo, v_vlor_interes_anterior
            from v_gf_g_movimientos_detalle a
            join df_i_conceptos b
              on a.id_cncpto = b.id_cncpto
             and b.sncion = 'N'
           where id_orgen = c_pgos.id_dclrcion
             and b.id_cncpto = v_id_cncpto
             and cdgo_mvmnto_orgn_dtlle = 'RE'
             and cdgo_mvmnto_tpo in ('PC' /*,'PI','DI'*/);

          v_vlor_ttal_interes_anterior := v_vlor_ttal_interes_anterior +
                                          v_vlor_interes_anterior;

          pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'for de pagos v_vlor_rcdo => ' ||
                                v_vlor_rcdo,
                                1);
          pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'for de pagos v_vlor_interes_anterior => ' ||
                                v_vlor_interes_anterior,
                                1);

          v_vlr_total_anterior := v_vlr_total_anterior +
                                  nvl(v_vlor_rcdo, 0);

        end loop; -- FIN cursor c_pgos
      exception
        when no_data_found then
          return v_vlor_intres;
          --null;
        when too_many_rows then
          return v_vlor_intres;
          --null;
      end;
      --
      pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            'v_vlr_total_anterior => ' ||
                            v_vlr_total_anterior,
                            1);

      pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            '2. Antes de entrar al if p_vlor_ttal <=v_vlr_total_anterior',
                            1);

      --Se calcula el valor de los interes en base a las condiciones del cliente
      --1.
      if ((p_vlor_ttal <= v_vlr_total_anterior or
         p_vlor_ttal >= v_vlr_total_anterior) and
         p_fcha_pryccion < v_fcha_fnal) then

        pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              'Entro en el if que retorna 0',
                              1);

        return v_vlor_intres;

      end if;

      --2.Cuando la declaración inicial se presenta dentro del plazo y la declaración de corrección se presenta fuera del plazo.
      if (v_fcha_prsntcion_inicial <= v_fcha_fnal and
         p_fcha_pryccion > v_fcha_fnal) then

        pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              'Entro en el if que retorna calculo interes',
                              1);

        --¿Qué sucede si el nuevo valor a pagar es mayor?
        --En este caso, cuando es mayor valor a pagar,
        --SI se genera intereses de mora sobre ese mayor valor,
        if (p_vlor_ttal > v_vlr_total_anterior) then

          select pkg_gf_movimientos_financiero.fnc_cl_interes_mora(p_cdgo_clnte         => v_cdgo_clnte,
                                                                   p_id_impsto          => v_id_impsto,
                                                                   p_id_impsto_sbmpsto  => v_id_impsto_sbmpsto,
                                                                   p_vgncia             => v_vgncia,
                                                                   p_id_prdo            => v_id_prdo,
                                                                   p_id_cncpto          => v_id_cncpto,
                                                                   p_vlor_cptal         => p_vlor_acto_cncpto,
                                                                   p_indcdor_clclo      => 'PRY',
                                                                   p_fcha_incio_vncmnto => v_fcha_fnal,
                                                                   p_fcha_pryccion      => to_timestamp(p_fcha_pryccion,
                                                                                                        'dd/mm/yyyy'))
            into v_vlor_intres
            from dual;

          return v_vlor_intres;

        end if;

        if (p_vlor_ttal <= v_vlr_total_anterior) then

          return v_vlor_intres;

        end if;

      end if;

      if (v_fcha_prsntcion_inicial > v_fcha_fnal and
         p_fcha_pryccion > v_fcha_fnal and
         p_fcha_pryccion = v_fcha_prsntcion_inicial) then

        if (p_vlor_ttal =
           (v_vlr_total_anterior - v_vlor_ttal_interes_anterior)) then
          v_vlor_intres := 0;
          return v_vlor_intres;
        end if;

        if (p_vlor_ttal > v_vlr_total_anterior) then

          select pkg_gf_movimientos_financiero.fnc_cl_interes_mora(p_cdgo_clnte         => v_cdgo_clnte,
                                                                   p_id_impsto          => v_id_impsto,
                                                                   p_id_impsto_sbmpsto  => v_id_impsto_sbmpsto,
                                                                   p_vgncia             => v_vgncia,
                                                                   p_id_prdo            => v_id_prdo,
                                                                   p_id_cncpto          => v_id_cncpto,
                                                                   p_vlor_cptal         => p_vlor_acto_cncpto,
                                                                   p_indcdor_clclo      => 'PRY',
                                                                   p_fcha_incio_vncmnto => v_fcha_fnal,
                                                                   p_fcha_pryccion      => to_timestamp(p_fcha_pryccion,
                                                                                                        'dd/mm/yyyy'))
            into v_vlor_intres
            from dual;

          return v_vlor_intres;
        end if;

      end if;

      pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            'Antes de fcha proyección mayor a inicial',
                            1);

      /*if(v_fcha_prsntcion_inicial > v_fcha_fnal and p_fcha_pryccion > v_fcha_fnal and p_fcha_pryccion > v_fcha_prsntcion_inicial) then
      pkg_sg_log.prc_rg_log( v_cdgo_clnte, null, v_nmbre_up,  v_nl, 'Entro de fcha proyección mayor a inicial',1);

          /*
             Recordemos que  p_vlor_ttal y v_vlr_total_anterior
             contienen ambas el capital  más la suma del interes
          */
      /*
               if(p_vlor_ttal = (v_vlr_total_anterior - v_vlor_ttal_interes_anterior)) then
                  pkg_sg_log.prc_rg_log( v_cdgo_clnte, null, v_nmbre_up,  v_nl, 'Entro de fcha proyección mayor a inicial igual valor',1);

                      select  pkg_gf_movimientos_financiero.fnc_cl_interes_mora (p_cdgo_clnte   => v_cdgo_clnte,
                                                                 p_id_impsto            => v_id_impsto,
                                                                 p_id_impsto_sbmpsto    => v_id_impsto_sbmpsto,
                                                                 p_vgncia               => v_vgncia,
                                                                 p_id_prdo              => v_id_prdo,
                                                                 p_id_cncpto            => v_id_cncpto,
                                                                 p_vlor_cptal           => p_vlor_ttal,
                                                                 p_indcdor_clclo        => 'PRY',
                                                                 p_fcha_incio_vncmnto   => v_fcha_prsntcion_inicial,
                                                                 p_fcha_pryccion        => to_timestamp(p_fcha_pryccion, 'dd/mm/yyyy'))
                      into    v_vlor_intres
                      from    dual;

                      return v_vlor_intres;
               end if;

               if(p_vlor_ttal = v_vlr_total_anterior) then
                      v_vlor_intres := 0;
                      return v_vlor_intres;
               end if;
      end if;
      */
      --3.Cuando la declaración inicial se presenta fuera del plazo y la declaración de corrección se presenta fuera del plazo.
      if (v_fcha_prsntcion_inicial > v_fcha_fnal and
         p_fcha_pryccion > v_fcha_fnal) then

        pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              'Cuando la declaración inicial se presenta fuera del plazo',
                              1);
        pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              'v_vlr_total_anterior => ' ||
                              v_vlr_total_anterior,
                              1);
        pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              'p_vlor_ttal => ' || p_vlor_ttal,
                              1);

        if (p_vlor_ttal > v_vlr_total_anterior) then
          pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'Entro en if(p_vlor_ttal > v_vlr_total_anterior) then',
                                1);

          select pkg_gf_movimientos_financiero.fnc_cl_interes_mora(p_cdgo_clnte         => v_cdgo_clnte,
                                                                   p_id_impsto          => v_id_impsto,
                                                                   p_id_impsto_sbmpsto  => v_id_impsto_sbmpsto,
                                                                   p_vgncia             => v_vgncia,
                                                                   p_id_prdo            => v_id_prdo,
                                                                   p_id_cncpto          => v_id_cncpto,
                                                                   p_vlor_cptal         => p_vlor_acto_cncpto,
                                                                   p_indcdor_clclo      => 'PRY',
                                                                   p_fcha_incio_vncmnto => v_fcha_fnal,
                                                                   p_fcha_pryccion      => to_timestamp(p_fcha_pryccion,
                                                                                                        'dd/mm/yyyy'))
            into v_vlor_intres
            from dual;

          return v_vlor_intres;

        end if;

        if (p_vlor_ttal <= v_vlr_total_anterior) then
          pkg_sg_log.prc_rg_log(v_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'Entro en if(p_vlor_ttal > v_vlr_total_anterior) then',
                                1);

          select pkg_gf_movimientos_financiero.fnc_cl_interes_mora(p_cdgo_clnte         => v_cdgo_clnte,
                                                                   p_id_impsto          => v_id_impsto,
                                                                   p_id_impsto_sbmpsto  => v_id_impsto_sbmpsto,
                                                                   p_vgncia             => v_vgncia,
                                                                   p_id_prdo            => v_id_prdo,
                                                                   p_id_cncpto          => v_id_cncpto,
                                                                   p_vlor_cptal         => p_vlor_acto_cncpto,
                                                                   p_indcdor_clclo      => 'PRY',
                                                                   p_fcha_incio_vncmnto => v_fcha_fnal,
                                                                   p_fcha_pryccion      => to_timestamp(p_fcha_pryccion,
                                                                                                        'dd/mm/yyyy'))
            into v_vlor_intres
            from dual;

          v_vlor_ttal_crccion := p_vlor_ttal + v_vlor_intres;

          if (v_vlor_ttal_crccion > v_vlr_total_anterior) then
            return v_vlor_intres;
          end if;

        end if;

        if (p_vlor_ttal <= v_vlr_total_anterior) then
          v_vlor_intres := 0;
          return v_vlor_intres;
        end if;

      end if;

    end if;

    if (p_dclrcion_uso in ('DIN', 'RCO')) then

      select pkg_gf_movimientos_financiero.fnc_cl_interes_mora(p_cdgo_clnte         => v_cdgo_clnte,
                                                               p_id_impsto          => v_id_impsto,
                                                               p_id_impsto_sbmpsto  => v_id_impsto_sbmpsto,
                                                               p_vgncia             => v_vgncia,
                                                               p_id_prdo            => v_id_prdo,
                                                               p_id_cncpto          => v_id_cncpto,
                                                               p_vlor_cptal         => p_vlor_acto_cncpto,
                                                               p_indcdor_clclo      => 'PRY',
                                                               p_fcha_incio_vncmnto => v_fcha_fnal,
                                                               p_fcha_pryccion      => to_timestamp(p_fcha_pryccion,
                                                                                                    'dd/mm/yyyy'))
        into v_vlor_intres
        from dual;

      return v_vlor_intres;

    end if;

    return v_vlor_intres;

  exception
    when others then
      return v_vlor_intres;

  end fnc_co_cncpto_intrs_vlddo;

  function fnc_co_cncpto_intrs_vlddo_2(p_cdgo_clnte                 number,
                                       p_id_dclrcion_vgncia_frmlrio number,
                                       p_id_cncpto                  number,
                                       p_vlor_cncpto                number,
                                       p_dclrcion_uso               varchar2 default 'DCO',
                                       p_id_dclrcion                number default null,
                                       p_id_dclrcion_antrior        number default null,
                                       p_fcha_vncmnto               varchar2,
                                       p_vlor_ttal                  number default null)

   return number as

    v_nmbre_up                varchar2(100) := 'pkg_gi_declaraciones_funciones.fnc_co_cncpto_intrs_vlddo_2';
    v_id_frmlrio_rgion_atrbto number;
    v_vlr_total_anterior      number := 0;
    v_fla                     number;
    v_id_cncpto               number;
    v_gnra_intres_mra         varchar2(1);
    v_id_impsto               number;
    v_id_impsto_sbmpsto       number;
    v_vgncia                  number;
    v_id_prdo                 number;
    v_fcha_fnal               timestamp;
    v_nl                      number;
    v_vlor_intres             number := 0;

    v_fcha_prsntcion_inicial     timestamp;
    v_indcdor_dlneacion          varchar2(1);
    v_vlor_ttal_crccion          number := 0; --Nuevo 14/11/2024 Luis ariza
    v_vlor_rcdo                  number := 0;
    v_id_dclrcion_anterior       number := 0;
    v_vlor_ttal_interes_anterior number := 0;
    v_vlor_interes_anterior      number := 0;

    v_id_sjto_tpo            varchar2(10);
    v_idntfccion             varchar2(50);
    v_fcha_prsntcion_pryctda varchar2(100);
    o_cdgo_rspsta            number;
    o_mnsje_rspsta           varchar2(4000);
  begin
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'p_id_dclrcion_vgncia_frmlrio' ||
                          p_id_dclrcion_vgncia_frmlrio,
                          1);
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'p_id_cncpto' || p_id_cncpto,
                          1);
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'p_vlor_cncpto' || p_vlor_cncpto,
                          1);
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'p_dclrcion_uso' || p_dclrcion_uso,
                          1);
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'p_id_dclrcion_antrior' || p_id_dclrcion_antrior,
                          1);
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'p_fcha_vncmnto' || p_fcha_vncmnto,
                          1);
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'p_vlor_ttal' || p_vlor_ttal,
                          1);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Antes de entrar' || p_vlor_ttal,
                          1);

    if (p_dclrcion_uso is null or p_fcha_vncmnto is null) then
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            'p_dclrcion_uso is null or p_fcha_vncmnto is null',
                            1);

      return 0;
    end if;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Antes de consultar IDT' || p_vlor_ttal,
                          1);

    pkg_gi_declaraciones.prc_co_homologacion(p_cdgo_clnte    => p_cdgo_clnte,
                                             p_cdgo_hmlgcion => 'PRD',
                                             p_cdgo_prpdad   => 'IDT',
                                             p_id_dclrcion   => p_id_dclrcion,
                                             o_vlor          => v_idntfccion,
                                             o_cdgo_rspsta   => o_cdgo_rspsta,
                                             o_mnsje_rspsta  => o_mnsje_rspsta);

    if (o_cdgo_rspsta <> 0) then
      o_cdgo_rspsta  := 1;
      o_mnsje_rspsta := 'Error al consultar la identificación' ||
                        o_cdgo_rspsta;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            1);

      return v_vlor_intres;
    end if;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Antes de consultar TST' || p_vlor_ttal,
                          1);

    pkg_gi_declaraciones.prc_co_homologacion(p_cdgo_clnte    => p_cdgo_clnte,
                                             p_cdgo_hmlgcion => 'PRD',
                                             p_cdgo_prpdad   => 'TST',
                                             p_id_dclrcion   => p_id_dclrcion,
                                             o_vlor          => v_id_sjto_tpo,
                                             o_cdgo_rspsta   => o_cdgo_rspsta,
                                             o_mnsje_rspsta  => o_mnsje_rspsta);
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Antes de consultar TST' || v_id_sjto_tpo,
                          1);

    if (o_cdgo_rspsta <> 0) then
      o_cdgo_rspsta  := 1;
      o_mnsje_rspsta := 'Error al consultar el sujeto tipo ' ||
                        o_cdgo_rspsta;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            1);
      return v_vlor_intres;
    end if;

    pkg_gi_declaraciones.prc_co_homologacion(p_cdgo_clnte    => p_cdgo_clnte,
                                             p_cdgo_hmlgcion => 'PRD',
                                             p_cdgo_prpdad   => 'FPY',
                                             p_id_dclrcion   => p_id_dclrcion,
                                             o_vlor          => v_fcha_prsntcion_pryctda,
                                             o_cdgo_rspsta   => o_cdgo_rspsta,
                                             o_mnsje_rspsta  => o_mnsje_rspsta);
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Antes de consultar FPY' ||
                          v_fcha_prsntcion_pryctda,
                          1);

    if (o_cdgo_rspsta <> 0) then
      o_cdgo_rspsta  := 1;
      o_mnsje_rspsta := 'Error al consultar la fecha de presentación ' ||
                        o_cdgo_rspsta;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            o_mnsje_rspsta,
                            1);

      return v_vlor_intres;
    end if;

    --Se consultan los datos necesarios para calcular la sancion
    select c.id_impsto,
           c.id_impsto_sbmpsto,
           b.vgncia,
           b.id_prdo,
           a.indcdor_dlneacion
      into v_id_impsto,
           v_id_impsto_sbmpsto,
           v_vgncia,
           v_id_prdo,
           v_indcdor_dlneacion
      from gi_d_dclrcnes_vgncias_frmlr a
     inner join gi_d_dclrcnes_tpos_vgncias b
        on b.id_dclrcion_tpo_vgncia = a.id_dclrcion_tpo_vgncia
     inner join gi_d_declaraciones_tipo c
        on c.id_dclrcn_tpo = b.id_dclrcn_tpo
     where a.id_dclrcion_vgncia_frmlrio = p_id_dclrcion_vgncia_frmlrio;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Consulta tipo de fecha de vencimiento',
                          1);
    begin
      --Se identifica el concepto
      select b.id_cncpto, b.gnra_intres_mra
        into v_id_cncpto, v_gnra_intres_mra
        from df_i_impuestos_acto_concepto b
       where b.id_cncpto = p_id_cncpto
         and b.vgncia = v_vgncia
         and b.id_prdo = v_id_prdo;
    exception
      when too_many_rows then
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              'Se encontró más de un registro para el concepto id ' ||
                              p_id_cncpto,
                              1);
      when others then
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              'Error al consultar concepto id ' ||
                              p_id_cncpto,
                              1);
    end;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Antes de consultar SANCION' || p_vlor_ttal,
                          1);

    if (v_gnra_intres_mra = 'N') then
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            'v_gnra_intres_mra = N',
                            1);

      return v_vlor_intres;

    end if;
    --Se consulta la fecha limite de declaracion
    if (v_indcdor_dlneacion = 'N') then
      select TO_CHAR(pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(p_id_dclrcion_vgncia_frmlrio => p_id_dclrcion_vgncia_frmlrio,
                                                                    p_idntfccion                 => v_idntfccion,
                                                                    p_id_sjto_tpo                => to_number(v_id_sjto_tpo)),
                     'DD/MM/YYYY')
        into v_fcha_fnal
        from dual;

    else
      v_fcha_fnal := p_fcha_vncmnto;
    end if;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'v_fcha_fnal => ' || v_fcha_fnal,
                          1);

    if (p_dclrcion_uso = 'DCO') then
      --se calcula el valor total de la declaracion inicial
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            'p_dclrcion_uso = DCO',
                            1);

      --se calcula la fecha de la presentación de la declaracion inicial

      begin
        select a.fcha_prsntcion, a.id_dclrcion
          into v_fcha_prsntcion_inicial, v_id_dclrcion_anterior
          from gi_g_declaraciones a
         where a.id_dclrcion = p_id_dclrcion_antrior;

      exception
        when no_data_found then
          return v_vlor_intres;
        when too_many_rows then
          return v_vlor_intres;
      end;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            'v_id_dclrcion_anterior => ' ||
                            v_id_dclrcion_anterior,
                            1);
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            'v_id_cncpto => ' || v_id_cncpto,
                            1);

      begin
        for c_pgos in (WITH Correcciones(id_dclrcion,
                         id_dclrcion_crrccion,
                         id_rcdo,
                         vlor_pago,
                         fcha_vncmnto) AS
                          (SELECT id_dclrcion,
                                 id_dclrcion_crrccion,
                                 id_rcdo,
                                 vlor_pago,
                                 (case
                                   when trunc(fcha_prsntcion) >
                                        trunc(fcha_prsntcion_pryctda) then
                                    trunc(fcha_prsntcion)
                                   else
                                    trunc(fcha_prsntcion_pryctda)
                                 end) fcha_vncmnto
                            FROM gi_g_declaraciones
                           WHERE id_dclrcion = v_id_dclrcion_anterior -- El ID de la declaración que quieres buscar

                          UNION ALL

                          SELECT d.id_dclrcion,
                                 d.id_dclrcion_crrccion,
                                 d.id_rcdo,
                                 d.vlor_pago,
                                 (case
                                   when trunc(fcha_prsntcion) >
                                        trunc(fcha_prsntcion_pryctda) then
                                    trunc(fcha_prsntcion)
                                   else
                                    trunc(fcha_prsntcion_pryctda)
                                 end) fcha_vncmnto
                            FROM gi_g_declaraciones d
                           INNER JOIN Correcciones c
                              ON d.id_dclrcion = c.id_dclrcion_crrccion
                          -- and d.cdgo_dclrcion_estdo in ( 'APL', 'RLA')
                          )
                         SELECT * FROM Correcciones order by id_dclrcion) loop
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'Entro al for de pagos=> ',
                                1);

          select sum(nvl(vlor_hber, 0)),
                 sum(decode(cdgo_mvmnto_tpo, 'PI', nvl(vlor_hber, 0), 0))
            into v_vlor_rcdo, v_vlor_interes_anterior
            from v_gf_g_movimientos_detalle a
            join df_i_conceptos b
              on a.id_cncpto = b.id_cncpto
             and b.sncion = 'N'
           where id_orgen = c_pgos.id_dclrcion
             and b.id_cncpto = v_id_cncpto
             and cdgo_mvmnto_orgn_dtlle = 'RE'
             and cdgo_mvmnto_tpo in ('PC' /*,'PI','DI'*/);

          v_vlor_ttal_interes_anterior := v_vlor_ttal_interes_anterior +
                                          v_vlor_interes_anterior;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'for de pagos v_vlor_rcdo => ' ||
                                v_vlor_rcdo,
                                1);
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'for de pagos v_vlor_interes_anterior => ' ||
                                v_vlor_interes_anterior,
                                1);

          v_vlr_total_anterior := v_vlr_total_anterior +
                                  nvl(v_vlor_rcdo, 0);

        end loop; -- FIN cursor c_pgos
      exception
        when no_data_found then
          return v_vlor_intres;
          --null;
        when too_many_rows then
          return v_vlor_intres;
          --null;
      end;
      --
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            'v_vlr_total_anterior => ' ||
                            v_vlr_total_anterior,
                            1);
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            'v_fcha_prsntcion_pryctda => ' ||
                            v_fcha_prsntcion_pryctda,
                            1);
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            'v_fcha_fnal => ' || v_fcha_fnal,
                            1);

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            '1. Antes de entrar al if p_vlor_ttal <=v_vlr_total_anterior',
                            1);

      --Se calcula el valor de los interes en base a las condiciones del cliente
      --1.
      if ((p_vlor_ttal <= v_vlr_total_anterior or
         p_vlor_ttal >= v_vlr_total_anterior) and
         v_fcha_prsntcion_pryctda < v_fcha_fnal) then

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              'Entro en el if que retorna 0',
                              1);

        return v_vlor_intres;

      end if;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            '--2.Cuando la declaración inicial',
                            1);

      --2.Cuando la declaración inicial se presenta dentro del plazo y la declaración de corrección se presenta fuera del plazo.
      if (v_fcha_prsntcion_inicial <= v_fcha_fnal and
         v_fcha_prsntcion_pryctda > v_fcha_fnal) then

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              'Entro en el if que retorna calculo interes',
                              1);

        --¿Qué sucede si el nuevo valor a pagar es mayor?
        --En este caso, cuando es mayor valor a pagar,
        --SI se genera intereses de mora sobre ese mayor valor,
        if (p_vlor_ttal > v_vlr_total_anterior) then

          select pkg_gf_movimientos_financiero.fnc_cl_interes_mora(p_cdgo_clnte        => p_cdgo_clnte,
                                                                   p_id_impsto         => v_id_impsto,
                                                                   p_id_impsto_sbmpsto => v_id_impsto_sbmpsto,
                                                                   p_vgncia            => v_vgncia,
                                                                   p_id_prdo           => v_id_prdo,
                                                                   p_id_cncpto         => v_id_cncpto,
                                                                   p_vlor_cptal        => p_vlor_cncpto,
                                                                   p_indcdor_clclo     => 'CLD',
                                                                   p_cdgo_mvmnto_orgn  => 'DL',
                                                                   --p_fcha_incio_vncmnto   => v_fcha_fnal,
                                                                   p_fcha_pryccion => to_timestamp(p_fcha_vncmnto,
                                                                                                   'dd/mm/yyyy'))
            into v_vlor_intres
            from dual;

          return v_vlor_intres;

        end if;

        if (p_vlor_ttal <= v_vlr_total_anterior) then

          return v_vlor_intres;

        end if;

      end if;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            'SALIO --2.Cuando la declaración inicial',
                            1);

      if (v_fcha_prsntcion_inicial > v_fcha_fnal and
         v_fcha_prsntcion_pryctda > v_fcha_fnal and
         v_fcha_prsntcion_pryctda = v_fcha_prsntcion_inicial) then

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              'Entro 5',
                              1);

        if (p_vlor_ttal =
           (v_vlr_total_anterior - v_vlor_ttal_interes_anterior)) then
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'Entro 6',
                                1);

          v_vlor_intres := 0;
          return v_vlor_intres;
        end if;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              'Entro 7',
                              1);

        if (p_vlor_ttal > v_vlr_total_anterior) then
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'Entro 8',
                                1);

          select pkg_gf_movimientos_financiero.fnc_cl_interes_mora(p_cdgo_clnte        => p_cdgo_clnte,
                                                                   p_id_impsto         => v_id_impsto,
                                                                   p_id_impsto_sbmpsto => v_id_impsto_sbmpsto,
                                                                   p_vgncia            => v_vgncia,
                                                                   p_id_prdo           => v_id_prdo,
                                                                   p_id_cncpto         => v_id_cncpto,
                                                                   p_vlor_cptal        => p_vlor_cncpto,
                                                                   p_indcdor_clclo     => 'PRY',
                                                                   -- p_cdgo_mvmnto_orgn     => 'DL',
                                                                   p_fcha_incio_vncmnto => v_fcha_fnal,
                                                                   p_fcha_pryccion      => to_timestamp(v_fcha_prsntcion_pryctda,
                                                                                                        'dd/mm/yyyy'))
            into v_vlor_intres
            from dual;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'Entro 9',
                                1);

          return v_vlor_intres;

        end if;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              'Entro 10',
                              1);

      end if;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            'Entro 11',
                            1);

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            'Antes de fcha proyección mayor a inicial',
                            1);

      /*if(v_fcha_prsntcion_inicial > v_fcha_fnal and p_fcha_pryccion > v_fcha_fnal and p_fcha_pryccion > v_fcha_prsntcion_inicial) then
      pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_nmbre_up,  v_nl, 'Entro de fcha proyección mayor a inicial',1);

          /*
             Recordemos que  p_vlor_ttal y v_vlr_total_anterior
             contienen ambas el capital  más la suma del interes
          */
      /*
               if(p_vlor_ttal = (v_vlr_total_anterior - v_vlor_ttal_interes_anterior)) then
                  pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_nmbre_up,  v_nl, 'Entro de fcha proyección mayor a inicial igual valor',1);

                      select  pkg_gf_movimientos_financiero.fnc_cl_interes_mora (p_cdgo_clnte   => p_cdgo_clnte,
                                                                 p_id_impsto            => v_id_impsto,
                                                                 p_id_impsto_sbmpsto    => v_id_impsto_sbmpsto,
                                                                 p_vgncia               => v_vgncia,
                                                                 p_id_prdo              => v_id_prdo,
                                                                 p_id_cncpto            => v_id_cncpto,
                                                                 p_vlor_cptal           => p_vlor_ttal,
                                                                 p_indcdor_clclo        => 'PRY',
                                                                 p_fcha_incio_vncmnto   => v_fcha_prsntcion_inicial,
                                                                 p_fcha_pryccion        => to_timestamp(p_fcha_pryccion, 'dd/mm/yyyy'))
                      into    v_vlor_intres
                      from    dual;

                      return v_vlor_intres;
               end if;

               if(p_vlor_ttal = v_vlr_total_anterior) then
                      v_vlor_intres := 0;
                      return v_vlor_intres;
               end if;
      end if;
      */
      --3.Cuando la declaración inicial se presenta fuera del plazo y la declaración de corrección se presenta fuera del plazo.
      if (v_fcha_prsntcion_inicial > v_fcha_fnal and
         v_fcha_prsntcion_pryctda > v_fcha_fnal) then

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              'Cuando la declaración inicial se presenta fuera del plazo',
                              1);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              'v_vlr_total_anterior => ' ||
                              v_vlr_total_anterior,
                              1);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              'p_vlor_ttal => ' || p_vlor_ttal,
                              1);

        if (p_vlor_ttal > v_vlr_total_anterior) then
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'Entro en if(p_vlor_ttal > v_vlr_total_anterior) then',
                                1);

          select pkg_gf_movimientos_financiero.fnc_cl_interes_mora(p_cdgo_clnte        => p_cdgo_clnte,
                                                                   p_id_impsto         => v_id_impsto,
                                                                   p_id_impsto_sbmpsto => v_id_impsto_sbmpsto,
                                                                   p_vgncia            => v_vgncia,
                                                                   p_id_prdo           => v_id_prdo,
                                                                   p_id_cncpto         => v_id_cncpto,
                                                                   p_vlor_cptal        => p_vlor_cncpto,
                                                                   p_indcdor_clclo     => 'CLD',
                                                                   p_cdgo_mvmnto_orgn  => 'DL',
                                                                   --p_fcha_incio_vncmnto   => v_fcha_fnal,
                                                                   p_fcha_pryccion => to_timestamp(p_fcha_vncmnto,
                                                                                                   'dd/mm/yyyy'))
            into v_vlor_intres
            from dual;

          return v_vlor_intres;

        end if;

        if (p_vlor_ttal <= v_vlr_total_anterior) then
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'Entro en if(p_vlor_ttal > v_vlr_total_anterior) then',
                                1);

          select pkg_gf_movimientos_financiero.fnc_cl_interes_mora(p_cdgo_clnte        => p_cdgo_clnte,
                                                                   p_id_impsto         => v_id_impsto,
                                                                   p_id_impsto_sbmpsto => v_id_impsto_sbmpsto,
                                                                   p_vgncia            => v_vgncia,
                                                                   p_id_prdo           => v_id_prdo,
                                                                   p_id_cncpto         => v_id_cncpto,
                                                                   p_vlor_cptal        => p_vlor_cncpto,
                                                                   p_indcdor_clclo     => 'CLD',
                                                                   p_cdgo_mvmnto_orgn  => 'DL',
                                                                   --p_fcha_incio_vncmnto   => v_fcha_fnal,
                                                                   p_fcha_pryccion => to_timestamp(p_fcha_vncmnto,
                                                                                                   'dd/mm/yyyy'))
            into v_vlor_intres
            from dual;

          v_vlor_ttal_crccion := p_vlor_ttal + v_vlor_intres;

          if (v_vlor_ttal_crccion > v_vlr_total_anterior) then
            return v_vlor_intres;
          end if;

        end if;

        if (p_vlor_ttal <= v_vlr_total_anterior) then
          v_vlor_intres := 0;
          return v_vlor_intres;
        end if;

      end if;

    end if;

    return v_vlor_intres;

  exception
    when others then
      return v_vlor_intres;

  end fnc_co_cncpto_intrs_vlddo_2;

  /********************** Funcion Calcula el valor de la sancion de la declaracion por Extemporaneidad o Correccion******************************************************************************************************************/
  function fnc_ca_valor_sancion(p_cdgo_clnte                 in number,
                                p_id_dclrcion_vgncia_frmlrio in gi_d_dclrcnes_vgncias_frmlr.id_dclrcion_vgncia_frmlrio%type,
                                p_idntfccion                 in varchar2,
                                p_fcha_prsntcion             in gi_d_dclrcnes_fcha_prsntcn.fcha_fnal%type, -- o date('DD/MM/YY')?
                                p_fcha_expdcion              in gi_d_dclrcnes_fcha_prsntcn.fcha_incial%type default null,
                                p_id_sjto_tpo                in number default null,
                                p_cdgo_sncion_tpo            in gi_d_sanciones.cdgo_sncion_tpo%type,
                                p_cdgo_dclrcion_uso          in gi_d_declaraciones_uso.cdgo_dclrcion_uso%type,
                                p_id_dclrcion_incial         in number default null,
                                p_impsto_crgo                in number default 0,
                                p_ingrsos_brtos              in number default 0,
                                p_saldo_favor                in number default 0)
    return number as
    --PRAGMA autonomous_transaction;

    v_cdgo_rspsta  number;
    v_mnsje_rspsta varchar2(1000);

    v_valor_sancion                number := 0;
    v_vlor_dfrncia_impsto_crgo     number := 0;
    v_id_sjto_impsto               number;
    v_vgncia                       number;
    v_id_prdo                      number;
    v_sobrepaso_fecha_limite       varchar2(1);
    v_numero_meses_x_sancion       number;
    v_existe_emplazamiento         varchar2(1);
    v_prcntje_tarifa               number;
    v_prcntje_trfa_empl            number;
    v_prcntje_trfa_ingrso_brto     number;
    v_prcntje_trfa_ingrso_brt_empl number;
    v_undad_vlor_sncion_mnmo       varchar2(9);
    --v_cdgo_sncion_tpo           varchar2(4);
    v_vlor_mxmo_sncion                   number;
    v_valor_sancion_min                  number;
    v_vlor_sncion_mnsual_impsto_crgo_cro number;
    v_prcntje_mxmo_impst_crg             number;
    v_prcntje_mxmo_impst_crg_empl        number;
    v_tpe_vlor_impst_crg                 number;
    v_tpe_vlor_ingrsos_brtos             number;
    v_prcntje_mxmo_ingr_brt              number;
    v_prcntje_mxmo_ingr_brt_empl         number;
    v_impsto_crgo_incial                 clob;
    v_vlor_sncion_anterior               clob;
    v_impsto_crgo_anterior               clob;
    v_fcha_prsntcion_dclrcion_incl       gi_d_dclrcnes_fcha_prsntcn.fcha_fnal%type;
    v_saldo_favor_inicial                clob;
    v_aumnt_prcntj_x_dclrcn_inc_extm     number;
    o_cdgo_rspsta                        number;
    o_mnsje_rspsta                       varchar2(100);
    v_indcdor_dlneacion                  varchar2(2);
    --BVM 4/3/2024
    v_cdgo_nmbre_vlor_sncn_prdtrmnda varchar2(10);
    v_id_sncion                      number;
    v_nl                             number;
    v_nmbre_up                       varchar2(100) := 'pkg_gi_sanciones.fnc_ca_valor_sancion';
    v_cdgo_prdcdad                   varchar2(3);

  begin
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Entrando a Sanciones: ' || systimestamp,
                          1);
    o_cdgo_rspsta := 0;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'p_cdgo_clnte: ' || p_cdgo_clnte ||
                          ', p_id_dclrcion_vgncia_frmlrio: ' ||
                          p_id_dclrcion_vgncia_frmlrio ||
                          ', p_idntfccion: ' || p_idntfccion ||
                          ', p_id_sjto_tpo: ' || p_id_sjto_tpo ||
                          ', p_fcha_prsntcion: ' || p_fcha_prsntcion ||
                          ', p_fcha_expdcion: ' || p_fcha_expdcion,
                          1);
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          ', p_cdgo_sncion_tpo: ' || p_cdgo_sncion_tpo ||
                          ', p_cdgo_dclrcion_uso: ' || p_cdgo_dclrcion_uso ||
                          ', p_id_dclrcion_incial: ' ||
                          p_id_dclrcion_incial || ', p_impsto_crgo: ' ||
                          p_impsto_crgo || ', p_ingrsos_brtos: ' ||
                          p_ingrsos_brtos || ', p_saldo_favor: ' ||
                          p_saldo_favor,
                          1);

    --Inicializacion del valor de la sancion
    v_valor_sancion := 0;
    --Definir que se hace cuando no existe el sujeto impuesto
    --Consultar el sujeto impuesto
    begin
      select a.id_sjto_impsto, c.vgncia, c.id_prdo, d.indcdor_dlneacion
        into v_id_sjto_impsto, v_vgncia, v_id_prdo, v_indcdor_dlneacion
        from v_si_i_sujetos_impuesto a
       inner join gi_d_declaraciones_tipo b
          on b.id_impsto = a.id_impsto
       inner join gi_d_dclrcnes_tpos_vgncias c
          on c.id_dclrcn_tpo = b.id_dclrcn_tpo
       inner join gi_d_dclrcnes_vgncias_frmlr d
          on d.id_dclrcion_tpo_vgncia = c.id_dclrcion_tpo_vgncia
       where a.idntfccion_sjto = p_idntfccion
         and d.id_dclrcion_vgncia_frmlrio = p_id_dclrcion_vgncia_frmlrio;
    exception
      when others then
        return ceil(v_valor_sancion);
    end;
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'v_id_sjto_impsto: ' || v_id_sjto_impsto ||
                          ', v_vgncia: ' || v_vgncia || ', v_id_prdo: ' ||
                          v_id_prdo,
                          1);
    --BVM 4/3/2024
    --Valida que el periodo a presentar sea Anual para utilizar cuando existe una sanción predeterminada
    /*begin
      select      a.cdgo_prdcdad
      into        v_cdgo_prdcdad
      from        df_i_periodos     a
      where       a.id_prdo         =   v_id_prdo
      and         a.cdgo_prdcdad    =   'ANU';
      exception
        when others then
          return ceil(v_valor_sancion);
    end;*/

    --Seleccion de las porcentajes aplicados a las tarifas
    begin
      select prcntje_trfa,
             prcntje_trfa_empl,
             prcntje_trfa_ingrso_brto,
             prcntje_trfa_ingrso_brto_empl,
             undad_vlor_sncion_mnmo,
             prcntje_mxmo_impst_crg,
             prcntje_mxmo_impst_crg_empl,
             prcntje_mxmo_ingr_brt,
             prcntje_mxmo_ingr_brt_empl,
             aumnt_prcntj_x_dclrcn_inc_extm,
             id_sncion --BVM 4/3/2024
        into v_prcntje_tarifa,
             v_prcntje_trfa_empl,
             v_prcntje_trfa_ingrso_brto,
             v_prcntje_trfa_ingrso_brt_empl,
             v_undad_vlor_sncion_mnmo,
             v_prcntje_mxmo_impst_crg,
             v_prcntje_mxmo_impst_crg_empl,
             v_prcntje_mxmo_ingr_brt,
             v_prcntje_mxmo_ingr_brt_empl,
             v_aumnt_prcntj_x_dclrcn_inc_extm,
             v_id_sncion --BVM 4/3/2024
        from gi_d_sanciones
       where cdgo_sncion_tpo = p_cdgo_sncion_tpo
         and vgncia = v_vgncia
         and id_prdo = v_id_prdo;
    exception
      when no_Data_found then
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              'No se encontro sanción parametrizada: ' ||
                              v_id_sncion,
                              1);
        return ceil(v_valor_sancion);
      when others then
        return ceil(v_valor_sancion);
    end;
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'v_id_sncion: ' || v_id_sncion,
                          1);

    --BVM 4/3/2024
    begin
      select a.cdgo_nmbre_vlor
        into v_cdgo_nmbre_vlor_sncn_prdtrmnda
        from gi_d_sanciones_calculo_valor a
       where a.id_sncion = v_id_sncion
         and a.sncion_prdtrmnda = 'S';

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            'v_cdgo_nmbre_vlor_sncn_prdtrmnda: ' ||
                            v_cdgo_nmbre_vlor_sncn_prdtrmnda,
                            1);

    exception
      when too_many_rows then
        o_cdgo_rspsta  := 2;
        o_mnsje_rspsta := 'Error al consultar sanción predeterminada, existe mas de un registro, por favor valide la parametrización.' ||
                          v_cdgo_nmbre_vlor_sncn_prdtrmnda;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              o_cdgo_rspsta || ' - ' || o_mnsje_rspsta,
                              1);
      when no_data_found then
        --v_cdgo_nmbre_vlor_sncn_prdtrmnda := 0;
        o_cdgo_rspsta  := 3;
        o_mnsje_rspsta := 'Error al consultar sanción predeterminada, no existe registro, por favor valide la parametrización.' ||
                          v_cdgo_nmbre_vlor_sncn_prdtrmnda;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              o_cdgo_rspsta || ' - ' || o_mnsje_rspsta,
                              1);
        --continue;
      /*when others then
      return ceil(v_valor_sancion);*/
    end;
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'p_cdgo_dclrcion_uso: ' || p_cdgo_dclrcion_uso,
                          1);

    -- Condicional si la Declarcion es Inicial
    if (p_cdgo_dclrcion_uso = 'DIN') then
      --Condicional si el tipo de sancion es por Extemporaneidad --
      if (p_cdgo_sncion_tpo = 'EXT') then
        -- Condicion de verificacion si existe emplazamiento --
        begin
          -- Verificacion de fecha limite y retorno de nuemro de meses de sancion --
          pkg_gi_sanciones.prc_vl_fecha_limite(p_id_dclrcion_vgncia_frmlrio => p_id_dclrcion_vgncia_frmlrio,
                                               p_idntfccion                 => p_idntfccion,
                                               p_fcha_prsntcion             => p_fcha_prsntcion,
                                               p_fcha_expdcion              => p_fcha_expdcion,
                                               p_id_sjto_tpo                => p_id_sjto_tpo,
                                               o_sobrepaso_fecha_limite     => v_sobrepaso_fecha_limite,
                                               o_numero_meses_x_sancion     => v_numero_meses_x_sancion,
                                               o_cdgo_rspsta                => o_cdgo_rspsta,
                                               o_mnsje_rspsta               => v_mnsje_rspsta);
          if (o_cdgo_rspsta <> 0) then
            return ceil(v_valor_sancion);
          end if;
        exception
          when others then
            return ceil(v_valor_sancion);
        end;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              '10 v_sobrepaso_fecha_limite: ' ||
                              v_sobrepaso_fecha_limite ||
                              ', v_numero_meses_x_sancion: ' ||
                              v_numero_meses_x_sancion,
                              1);
        if (v_sobrepaso_fecha_limite = 'S') then
          --BVM 4/3/2024
          --if (v_cdgo_nmbre_vlor_sncn_prdtrmnda is null) then
          begin
            v_existe_emplazamiento := pkg_gi_sanciones.fnc_vl_existe_emplazamiento(p_cdgo_clnte     => p_cdgo_clnte,
                                                                                   p_id_sjto_impsto => v_id_sjto_impsto);
          end;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'v_existe_emplazamiento: ' ||
                                v_existe_emplazamiento,
                                1);

          begin
            /*pkg_gi_sanciones.prc_cl_valor_sancion_min (p_cdgo_sncion_tpo    =>  p_cdgo_sncion_tpo,
                                                       p_vgncia         =>  v_vgncia,
                                                       p_id_prdo        =>  v_id_prdo,
                                                       p_undad_vlor_sncion_mnmo =>  v_undad_vlor_sncion_mnmo,
                                                       o_vlor_sncion_mnmo   =>  v_valor_sancion_min,
                                                       o_cdgo_rspsta      =>  o_cdgo_rspsta,
                                                       o_mnsje_rspsta     =>  v_mnsje_rspsta);
            */
            pkg_gi_sanciones.prc_cl_valor(p_cdgo_sncion_tpo => p_cdgo_sncion_tpo,
                                          p_vgncia          => v_vgncia,
                                          p_id_prdo         => v_id_prdo,
                                          p_cdgo_nmbre_vlor => 'SNCMIN', --'SNCMIN';  (parametro para recivir que valor se va a calcular)
                                          o_vlor_clclo      => v_valor_sancion_min,
                                          o_cdgo_rspsta     => o_cdgo_rspsta,
                                          o_mnsje_rspsta    => v_mnsje_rspsta);

            if (o_cdgo_rspsta <> 0) then
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    o_cdgo_rspsta || ' v_mnsje_rspsta: ' ||
                                    v_mnsje_rspsta,
                                    1);
              return ceil(v_valor_sancion);
            end if;
          exception
            when others then
              return ceil(v_valor_sancion);
          end;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'v_valor_sancion_min: ' ||
                                v_valor_sancion_min,
                                1);

          if (v_cdgo_nmbre_vlor_sncn_prdtrmnda = 'SNCMIN') then
            return v_valor_sancion_min;
          else
            if (v_existe_emplazamiento = 'N') then
              --PROCESO SANCIONATORIO POR EXTEMPORANIEDAD DE LA DECLARACION INICIAL SIN EMPLAZAMIENTO
              if ((p_impsto_crgo is not null) and (p_impsto_crgo > 0)) then
                v_tpe_vlor_impst_crg := p_impsto_crgo *
                                        v_prcntje_mxmo_impst_crg;
                v_valor_sancion      := v_prcntje_tarifa *
                                        v_numero_meses_x_sancion *
                                        p_impsto_crgo;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      'v_tpe_vlor_impst_crg: ' ||
                                      v_tpe_vlor_impst_crg ||
                                      'v_valor_sancion: ' ||
                                      v_valor_sancion,
                                      1);

                if (v_valor_sancion > v_tpe_vlor_impst_crg) then
                  v_valor_sancion := v_tpe_vlor_impst_crg;
                end if;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      'v_valor_sancion: ' ||
                                      v_valor_sancion,
                                      1);

                --se valida que la sanción sugerida no sea menor a la sanción minima cuando el impuesto a cargo es mayor a 0(cero).
                if (v_valor_sancion < v_valor_sancion_min) then
                  v_valor_sancion := v_valor_sancion_min;
                end if;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      'v_valor_sancion: ' ||
                                      v_valor_sancion,
                                      1);

                return ceil(v_valor_sancion);

              elsif (p_impsto_crgo = 0) then
                pkg_gi_sanciones.prc_cl_valor(p_cdgo_sncion_tpo => p_cdgo_sncion_tpo,
                                              p_vgncia          => v_vgncia,
                                              p_id_prdo         => v_id_prdo,
                                              p_cdgo_nmbre_vlor => 'TICCER',
                                              o_vlor_clclo      => v_vlor_sncion_mnsual_impsto_crgo_cro,
                                              o_cdgo_rspsta     => o_cdgo_rspsta,
                                              o_mnsje_rspsta    => v_mnsje_rspsta);

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      'v_vlor_sncion_mnsual_impsto_crgo_cro: ' ||
                                      v_vlor_sncion_mnsual_impsto_crgo_cro,
                                      1);

                v_valor_sancion := ceil(v_vlor_sncion_mnsual_impsto_crgo_cro *
                                        v_numero_meses_x_sancion);

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      'v_valor_sancion: ' ||
                                      v_valor_sancion,
                                      1);
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      'v_valor_sancion_min: ' ||
                                      v_valor_sancion_min,
                                      1);

                --se valida que la sanción sugerida no sea mayor a la sanción minima cuando el impuesto a cargo es igual a 0(cero).
                if (v_valor_sancion < v_valor_sancion_min) then
                  --CONSULTAR ING MAYRA indicador > se cambio a <
                  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                        null,
                                        v_nmbre_up,
                                        v_nl,
                                        'Entro en if (v_valor_sancion > v_valor_sancion_min) v_valor_sancion_min : ' ||
                                        v_valor_sancion_min,
                                        1);

                  v_valor_sancion := v_valor_sancion_min;
                end if;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      'v_valor_sancion: ' ||
                                      v_valor_sancion,
                                      1);
                return ceil(v_valor_sancion);
              else
                v_valor_sancion := v_valor_sancion_min;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      'v_valor_sancion: ' ||
                                      v_valor_sancion,
                                      1);

                return ceil(v_valor_sancion);
              end if;
            elsif (v_existe_emplazamiento = 'S') then
              -- /* PROCESO SANCIONATORIO POR EXTEMPORANIEDAD DE LA DECLARACION INICIAL CON EMPLAZAMIENTO */
              if ((p_impsto_crgo is not null) and (p_impsto_crgo > 0)) then
                v_tpe_vlor_impst_crg := p_impsto_crgo *
                                        v_prcntje_mxmo_impst_crg_empl;
                v_valor_sancion      := v_prcntje_trfa_empl *
                                        v_numero_meses_x_sancion *
                                        p_impsto_crgo;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      'v_tpe_vlor_impst_crg: ' ||
                                      v_tpe_vlor_impst_crg ||
                                      'v_valor_sancion: ' ||
                                      v_valor_sancion,
                                      1);
                if (v_valor_sancion > v_tpe_vlor_impst_crg) then
                  v_valor_sancion := v_tpe_vlor_impst_crg;
                end if;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      'v_valor_sancion: ' ||
                                      v_valor_sancion,
                                      1);

                --se valida que la sanción sugerida no sea menor a la sanción minima cuando el impuesto a cargo es mayor a 0(cero).
                if (v_valor_sancion < v_valor_sancion_min) then
                  v_valor_sancion := v_valor_sancion_min;
                end if;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      'v_valor_sancion: ' ||
                                      v_valor_sancion,
                                      1);
                return ceil(v_valor_sancion);
              elsif (p_impsto_crgo = 0) then
                pkg_gi_sanciones.prc_cl_valor(p_cdgo_sncion_tpo => p_cdgo_sncion_tpo,
                                              p_vgncia          => v_vgncia,
                                              p_id_prdo         => v_id_prdo,
                                              p_cdgo_nmbre_vlor => 'TICCEM',
                                              o_vlor_clclo      => v_vlor_sncion_mnsual_impsto_crgo_cro,
                                              o_cdgo_rspsta     => o_cdgo_rspsta,
                                              o_mnsje_rspsta    => v_mnsje_rspsta);

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      'v_vlor_sncion_mnsual_impsto_crgo_cro: ' ||
                                      v_vlor_sncion_mnsual_impsto_crgo_cro,
                                      1);

                v_valor_sancion := v_vlor_sncion_mnsual_impsto_crgo_cro *
                                   v_numero_meses_x_sancion;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      'v_valor_sancion: ' ||
                                      v_valor_sancion,
                                      1);

                --se valida que la sanción sugerida no sea mayor a la sanción minima cuando el impuesto a cargo es igual a 0(cero).
                if (v_valor_sancion > v_valor_sancion_min) then
                  v_valor_sancion := v_valor_sancion_min;
                end if;

                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nl,
                                      'v_valor_sancion: ' ||
                                      v_valor_sancion,
                                      1);
                return ceil(v_valor_sancion);
              else
                v_valor_sancion := v_valor_sancion_min;
                return ceil(v_valor_sancion);
              end if;
            end if;
          end if;
        elsif (v_sobrepaso_fecha_limite = 'N') then
          v_valor_sancion := 0;
          return ceil(v_valor_sancion);
        end if;
      end if;
      --Condicional si la Declarcion de Correccion
    elsif (p_cdgo_dclrcion_uso = 'DCO') then
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nl,
                            'Entro en  DCO: ' || p_cdgo_dclrcion_uso,
                            1);
      --Condicional si el tipo de sancion es por Correccion
      if (p_cdgo_sncion_tpo = 'COR') then
        DBMS_OUTPUT.PUT_LINE('Paso 1');
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              'Entro en  COR: ' || p_cdgo_sncion_tpo,
                              1);

        --seleccionar valor total y la fecha de presentacion de la declaracion inicial de la declaracion de correccion
        begin
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'Antes v_fcha_prsntcion_dclrcion_incl: ' ||
                                v_fcha_prsntcion_dclrcion_incl,
                                1);

          select fcha_prsntcion
            into v_fcha_prsntcion_dclrcion_incl
            from gi_g_declaraciones
           where id_dclrcion = p_id_dclrcion_incial;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'v_fcha_prsntcion_dclrcion_incl: ' ||
                                v_fcha_prsntcion_dclrcion_incl,
                                1);

        exception
          when others then
            return ceil(v_valor_sancion);
        end;

        --calcular si la declaracion inicial fue presentada por extemporaneidad
        begin
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'Antes de calcular fecha limete: ',
                                1);

          pkg_gi_sanciones.prc_vl_fecha_limite(p_id_dclrcion_vgncia_frmlrio => p_id_dclrcion_vgncia_frmlrio,
                                               p_idntfccion                 => p_idntfccion,
                                               p_fcha_prsntcion             => p_fcha_prsntcion,
                                               p_fcha_expdcion              => p_fcha_expdcion,
                                               p_id_sjto_tpo                => p_id_sjto_tpo,
                                               o_sobrepaso_fecha_limite     => v_sobrepaso_fecha_limite,
                                               o_numero_meses_x_sancion     => v_numero_meses_x_sancion,
                                               o_cdgo_rspsta                => o_cdgo_rspsta,
                                               o_mnsje_rspsta               => v_mnsje_rspsta);
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'v_sobrepaso_fecha_limite: ' ||
                                v_sobrepaso_fecha_limite,
                                1);
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'v_numero_meses_x_sancion: ' ||
                                v_numero_meses_x_sancion,
                                1);

          if (o_cdgo_rspsta <> 0) then
            return ceil(v_valor_sancion);
          end if;

          if (v_sobrepaso_fecha_limite = 'N' and
             v_numero_meses_x_sancion = 0) then
            v_valor_sancion := 0;
            return ceil(v_valor_sancion);
          end if;
        exception
          when others then
            return ceil(v_valor_sancion);
        end;

        begin
          -- Homologación el valor del impuesto a cargo en la declaracion inicial
          pkg_gi_declaraciones.prc_co_homologacion(p_cdgo_clnte    => p_cdgo_clnte,
                                                   p_cdgo_hmlgcion => 'FSN',
                                                   p_cdgo_prpdad   => 'CIC',
                                                   p_id_dclrcion   => p_id_dclrcion_incial,
                                                   o_vlor          => v_impsto_crgo_anterior,
                                                   o_cdgo_rspsta   => o_cdgo_rspsta,
                                                   o_mnsje_rspsta  => o_mnsje_rspsta);
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'v_impsto_crgo_anterior: ' ||
                                v_impsto_crgo_anterior,
                                1);

          if (o_cdgo_rspsta <> 0) then
            return ceil(v_valor_sancion);
          end if;

          -- Homologación el valor de la sanción en la declaracion anterior  VASA => Homologación del item del valor sanción manual
          pkg_gi_declaraciones.prc_co_homologacion(p_cdgo_clnte    => p_cdgo_clnte,
                                                   p_cdgo_hmlgcion => 'FIS',
                                                   p_cdgo_prpdad   => 'VASA', --Sanción manual
                                                   p_id_dclrcion   => p_id_dclrcion_incial,
                                                   o_vlor          => v_vlor_sncion_anterior,
                                                   o_cdgo_rspsta   => o_cdgo_rspsta,
                                                   o_mnsje_rspsta  => o_mnsje_rspsta);
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'v_vlor_sncion_anterior: ' ||
                                v_vlor_sncion_anterior,
                                1);

          if (o_cdgo_rspsta <> 0) then
            return ceil(v_valor_sancion);
          end if;
          --v_impsto_crgo_incial := to_char(to_number(to_char(v_impsto_crgo_anterior)) - to_number(to_char(v_vlor_sncion_anterior)));
          v_impsto_crgo_incial := to_char(to_number(to_char(v_impsto_crgo_anterior)));

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'v_impsto_crgo_incial: ' ||
                                v_impsto_crgo_incial,
                                1);

        exception
          when others then
            return ceil(v_valor_sancion);
        end;
        DBMS_OUTPUT.PUT_LINE('Paso 2');
        --Homologación del item de Saldo a Favor en el formulario
        begin
          --parametrizar en la homologacion de las declaraciones
          pkg_gi_declaraciones.prc_co_homologacion(p_cdgo_clnte    => p_cdgo_clnte,
                                                   p_cdgo_hmlgcion => 'FSN',
                                                   p_cdgo_prpdad   => 'PRP',
                                                   p_id_dclrcion   => p_id_dclrcion_incial,
                                                   o_vlor          => v_saldo_favor_inicial,
                                                   o_cdgo_rspsta   => o_cdgo_rspsta,
                                                   o_mnsje_rspsta  => o_mnsje_rspsta);
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'v_saldo_favor_inicial: ' ||
                                v_saldo_favor_inicial,
                                1);

          if (o_cdgo_rspsta <> 0) then
            --return ceil(v_valor_sancion);
            null;
          end if;
        exception
          when others then
            DBMS_OUTPUT.PUT_LINE('Paso 2.5: ' || chr(13) ||
                                 'o_mnsje_rspsta: ' || o_mnsje_rspsta ||
                                 chr(13) || sqlerrm);
            --return ceil(v_valor_sancion);
            null;
        end;
        DBMS_OUTPUT.PUT_LINE('Paso 3');

        --BVM 4/3/2024
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              'Antes de if v_cdgo_nmbre_vlor_sncn_prdtrmnda: ' ||
                              v_cdgo_nmbre_vlor_sncn_prdtrmnda,
                              1);

        --if (v_cdgo_nmbre_vlor_sncn_prdtrmnda is null) then

        begin
          v_existe_emplazamiento := pkg_gi_sanciones.fnc_vl_existe_emplazamiento(p_cdgo_clnte     => p_cdgo_clnte,
                                                                                 p_id_sjto_impsto => v_id_sjto_impsto);

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'Entro en if v_cdgo_nmbre_vlor_sncn_prdtrmnda v_existe_emplazamiento: ' ||
                                v_existe_emplazamiento,
                                1);

        exception
          when others then
            return ceil(v_valor_sancion);
        end;
        begin

          pkg_gi_sanciones.prc_cl_valor(p_cdgo_sncion_tpo => p_cdgo_sncion_tpo,
                                        p_vgncia          => v_vgncia,
                                        p_id_prdo         => v_id_prdo,
                                        p_cdgo_nmbre_vlor => 'SNCMIN', -- --'SNCMIN';  (parametro para recivir que valor se va a calcular)
                                        o_vlor_clclo      => v_valor_sancion_min,
                                        o_cdgo_rspsta     => o_cdgo_rspsta,
                                        o_mnsje_rspsta    => v_mnsje_rspsta);
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'v_valor_sancion_min: ' ||
                                v_valor_sancion_min,
                                1);
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'o_cdgo_rspsta ' || o_cdgo_rspsta,
                                1);

          if (o_cdgo_rspsta <> 0) then
            return ceil(v_valor_sancion);
          end if;
        exception
          when others then
            return ceil(v_valor_sancion);
        end;
        if (v_cdgo_nmbre_vlor_sncn_prdtrmnda = 'SNCMIN') then
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'Entro en if v_cdgo_nmbre_vlor_sncn_prdtrmnda: ' ||
                                v_cdgo_nmbre_vlor_sncn_prdtrmnda,
                                1);

          return v_valor_sancion_min;
        else
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'Entro en else v_cdgo_nmbre_vlor_sncn_prdtrmnda = SNCMIN: ' ||
                                v_cdgo_nmbre_vlor_sncn_prdtrmnda,
                                1);

          --Condicional si existe EMPLAZAMIENTO
          if (v_existe_emplazamiento = 'N') then
            /* Condicional si la declaracion inicial fue presentada extemporaneidad********/
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  'Entro en emplazamiento N v_sobrepaso_fecha_limite ' ||
                                  v_sobrepaso_fecha_limite,
                                  1);

            if (v_sobrepaso_fecha_limite = 'S') then
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    'v_sobrepaso_fecha_limite = S' ||
                                    v_sobrepaso_fecha_limite,
                                    1);

              v_prcntje_tarifa := v_prcntje_tarifa +
                                  v_aumnt_prcntj_x_dclrcn_inc_extm;
            end if;

            /*v_vlor_dfrncia_impsto_crgo := (p_impsto_crgo - to_number(to_char(v_impsto_crgo_incial)));

                --Condición que valida sí el impuesto a cargo actual menos el anterior es igual a cero no debe cobrar valor sanción y devolver valor cero 0
            if (v_vlor_dfrncia_impsto_crgo = 0) then
                return v_vlor_dfrncia_impsto_crgo;
            end if ;   */

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  ' v_prcntje_tarifa => ' ||
                                  v_prcntje_tarifa,
                                  1);

            if (to_number(to_char(v_impsto_crgo_incial)) < p_impsto_crgo and
               to_number(to_char(v_saldo_favor_inicial)) = 0 and
               p_saldo_favor = 0) then
              v_valor_sancion := (p_impsto_crgo -
                                 to_number(to_char(v_impsto_crgo_incial))) *
                                 v_prcntje_tarifa;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    'Entro 1: v_valor_sancion => ' ||
                                    v_valor_sancion,
                                    1);

            elsif (p_saldo_favor > 0 and
                  p_saldo_favor <
                  to_number(to_char(v_saldo_favor_inicial)) and
                  (to_number(to_char(v_saldo_favor_inicial)) -
                  p_saldo_favor) > 0) then
              v_valor_sancion := (to_number(to_char(v_saldo_favor_inicial)) -
                                 p_saldo_favor) * v_prcntje_tarifa;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    'Entro 2: v_valor_sancion => ' ||
                                    v_valor_sancion,
                                    1);
            elsif p_saldo_favor = 0 and
                  to_number(to_char(v_saldo_favor_inicial)) > 0 and
                  (p_impsto_crgo > to_number(to_char(v_impsto_crgo_incial))) then

              v_valor_sancion := (to_number(to_char(v_saldo_favor_inicial)) +
                                 p_impsto_crgo) * v_prcntje_tarifa;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    'Entro 3: v_valor_sancion => ' ||
                                    v_valor_sancion,
                                    1);
              /* elsif (p_impsto_crgo > to_number(to_char(v_impsto_crgo_incial)) ) then
                       v_valor_sancion:= (p_impsto_crgo - to_number(to_char(v_impsto_crgo_incial) )) * v_prcntje_tarifa;
              */
            else
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    'Entro else:  (v_impsto_crgo_incial)) <= p_impsto_crg',
                                    1);

              --v_valor_sancion:= p_impsto_crgo * v_prcntje_tarifa;
              v_valor_sancion := 0;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    'Entro 4: v_valor_sancion => ' ||
                                    v_valor_sancion,
                                    1);
            end if;

          elsif (v_existe_emplazamiento = 'S') then
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  'Entro en emplazamiento S v_sobrepaso_fecha_limite ' ||
                                  v_sobrepaso_fecha_limite,
                                  1);

            /* Condicional si la declaracion inicial fue presentada extemporaneidad********/
            if (v_sobrepaso_fecha_limite = 'S') then
              v_prcntje_trfa_empl := v_prcntje_trfa_empl +
                                     v_aumnt_prcntj_x_dclrcn_inc_extm;
            end if;
            /*if (to_number(to_char(v_impsto_crgo_incial)) <= p_impsto_crgo) then
                v_valor_sancion:= (p_impsto_crgo - to_number(to_char(v_impsto_crgo_incial)) )  * v_prcntje_trfa_empl;
            else
                v_valor_sancion:= p_impsto_crgo * v_prcntje_trfa_empl;
            end if; */
            if (to_number(to_char(v_impsto_crgo_incial)) < p_impsto_crgo and
               to_number(to_char(v_saldo_favor_inicial)) = 0 and
               p_saldo_favor = 0) then
              v_valor_sancion := (p_impsto_crgo -
                                 to_number(to_char(v_impsto_crgo_incial))) *
                                 v_prcntje_trfa_empl;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    'Entro 1: v_valor_sancion => ' ||
                                    v_valor_sancion,
                                    1);

            elsif (p_saldo_favor > 0 and
                  p_saldo_favor <
                  to_number(to_char(v_saldo_favor_inicial)) and
                  (to_number(to_char(v_saldo_favor_inicial)) -
                  p_saldo_favor) > 0) then
              v_valor_sancion := (to_number(to_char(v_saldo_favor_inicial)) -
                                 p_saldo_favor) * v_prcntje_trfa_empl;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    'Entro 2: v_valor_sancion => ' ||
                                    v_valor_sancion,
                                    1);
            elsif p_saldo_favor = 0 and
                  to_number(to_char(v_saldo_favor_inicial)) > 0 and
                  (p_impsto_crgo > to_number(to_char(v_impsto_crgo_incial))) then

              v_valor_sancion := (to_number(to_char(v_saldo_favor_inicial)) +
                                 p_impsto_crgo) * v_prcntje_trfa_empl;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    'Entro 3: v_valor_sancion => ' ||
                                    v_valor_sancion,
                                    1);
              /* elsif (p_impsto_crgo > to_number(to_char(v_impsto_crgo_incial)) ) then
                       v_valor_sancion:= (p_impsto_crgo - to_number(to_char(v_impsto_crgo_incial) )) * v_prcntje_tarifa;
              */
            else
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    'Entro else:  (v_impsto_crgo_incial)) <= p_impsto_crg',
                                    1);

              --v_valor_sancion:= p_impsto_crgo * v_prcntje_tarifa;
              v_valor_sancion := 0;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    'Entro 4: v_valor_sancion => ' ||
                                    v_valor_sancion,
                                    1);
            end if;

          end if;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'Antes :  if (v_prcntje_mxmo_impst_crg > 0 ) ' ||
                                v_prcntje_mxmo_impst_crg,
                                1);

          if (v_prcntje_mxmo_impst_crg > 0) then

            --v_vlor_mxmo_sncion := p_impsto_crgo * v_prcntje_mxmo_impst_crg;
            if (to_number(to_char(v_impsto_crgo_incial)) < p_impsto_crgo and
               to_number(to_char(v_saldo_favor_inicial)) = 0 and
               p_saldo_favor = 0) then
              v_vlor_mxmo_sncion := (p_impsto_crgo -
                                    to_number(to_char(v_impsto_crgo_incial))) *
                                    v_prcntje_mxmo_impst_crg;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    'Entro 1 max: v_valor_sancion => ' ||
                                    v_vlor_mxmo_sncion,
                                    1);

            elsif (p_saldo_favor > 0 and
                  p_saldo_favor <
                  to_number(to_char(v_saldo_favor_inicial)) and
                  (to_number(to_char(v_saldo_favor_inicial)) -
                  p_saldo_favor) > 0) then
              v_vlor_mxmo_sncion := (to_number(to_char(v_saldo_favor_inicial)) -
                                    p_saldo_favor) *
                                    v_prcntje_mxmo_impst_crg;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    'Entro 2 max: v_valor_sancion => ' ||
                                    v_vlor_mxmo_sncion,
                                    1);
            elsif p_saldo_favor = 0 and
                  to_number(to_char(v_saldo_favor_inicial)) > 0 and
                  (p_impsto_crgo > to_number(to_char(v_impsto_crgo_incial))) then

              v_vlor_mxmo_sncion := (to_number(to_char(v_saldo_favor_inicial)) +
                                    p_impsto_crgo) *
                                    v_prcntje_mxmo_impst_crg;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    'Entro 3 max: v_valor_sancion => ' ||
                                    v_vlor_mxmo_sncion,
                                    1);
              /* elsif (p_impsto_crgo > to_number(to_char(v_impsto_crgo_incial)) ) then
                       v_valor_sancion:= (p_impsto_crgo - to_number(to_char(v_impsto_crgo_incial) )) * v_prcntje_tarifa;
              */
            else
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    'Entro else:  (v_impsto_crgo_incial)) <= p_impsto_crg',
                                    1);

              --v_valor_sancion:= p_impsto_crgo * v_prcntje_tarifa;
              v_vlor_mxmo_sncion := p_impsto_crgo *
                                    v_prcntje_mxmo_impst_crg;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nl,
                                    'Entro 4 max: v_valor_sancion => ' ||
                                    v_vlor_mxmo_sncion,
                                    1);
            end if;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  'v_vlor_mxmo_sncion ' ||
                                  v_vlor_mxmo_sncion,
                                  1);
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  'v_valor_sancion ' || v_valor_sancion,
                                  1);

            if (v_valor_sancion > v_vlor_mxmo_sncion) then
              v_valor_sancion := v_vlor_mxmo_sncion;
            end if;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  'Entro :  if (v_prcntje_mxmo_impst_crg > 0 ) ' ||
                                  v_valor_sancion,
                                  1);

          end if;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'If validar valor sanción minina  v_valor_sancion => ' ||
                                v_valor_sancion,
                                1);
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nl,
                                'If validar valor sanción minina  v_valor_sancion_min => ' ||
                                v_valor_sancion_min,
                                1);

          if ((v_valor_sancion < v_valor_sancion_min) and
             (v_valor_sancion > 0)) then
            v_valor_sancion := v_valor_sancion_min;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nl,
                                  'Entro :  if (v_valor_sancion < v_valor_sancion_min) ' ||
                                  v_valor_sancion,
                                  1);

          end if;
        end if;
      end if;
    end if;
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nl,
                          'Antes de return ' || v_valor_sancion,
                          1);

    return ceil(v_valor_sancion);
  end fnc_ca_valor_sancion;

end pkg_gi_declaraciones_funciones;
/

