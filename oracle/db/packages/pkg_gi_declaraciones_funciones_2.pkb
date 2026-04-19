
  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PKG_GI_DECLARACIONES_FUNCIONES_2" as

  --Funcion de declaraciones que retorna el valor de intereses de un concepto
  --FDCL100
  function fnc_co_concepto_interes(p_id_dclrcion_vgncia_frmlrio number,
                                   p_item_acto_cncpto           varchar2  default null,
                                   p_item                       varchar2  default null,--Parametro que recibe el nombre del atributo creado en la pagina (nuevo)
                                   p_vlor_acto_cncpto           number ,
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

     v_nl                        number;
    v_mnsje_log                 varchar2(4000);
    nmbre_up                    varchar2(200) := 'pkg_gi_declaraciones_funciones_2.fnc_co_concepto_interes';
    o_cdgo_rspsta               number;
  begin

    o_cdgo_rspsta := 0;

    v_nl := pkg_sg_log.fnc_ca_nivel_log(68081,
                                        null,
                                        nmbre_up);

    pkg_sg_log.prc_rg_log(68081,
                          null,
                         nmbre_up,
                          v_nl,
                          'Entrando:' || systimestamp,
                          6);


  v_mnsje_log := 'Extrae el valor del item si p_item_acto_cncpto viene lleno p_item_acto_cncpto => '||p_item_acto_cncpto;
   pkg_sg_log.prc_rg_log(68081,
                              null,
                              nmbre_up,
                              v_nl,
                              v_mnsje_log || ' , ' || sqlerrm,
                              6);
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
--MODIFICADO
v_mnsje_log := 'Paso 1 => '||p_item_acto_cncpto;
pkg_sg_log.prc_rg_log(68081,
                          null,
                          nmbre_up,
                          v_nl,
                          v_mnsje_log || ' , ' || sqlerrm,
                          6);
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
                        when  c.id_frmlrio_rgion_atrbto = v_id_frmlrio_rgion_atrbto then
                                1
                        when  upper(c.id_frmlrio_rgion_item) like upper(p_item) then
                                1
                        else
                                0
                    end
               and
               1 = case
                        when c.fla = v_fla  then
                            1
                        when upper(c.id_frmlrio_rgion_item) like upper(p_item) then
                                1
                    else
                            0
                    end

               and c.id_impsto_acto_cncpto = b.id_impsto_acto_cncpto);
v_mnsje_log := 'Paso 2 => '||p_item;
pkg_sg_log.prc_rg_log(68081,
                          null,
                          nmbre_up,
                          v_nl,
                          v_mnsje_log || ' , ' || sqlerrm,
                          6);
 v_mnsje_log := 'v_id_cncpto => '||v_id_cncpto||'- v_gnra_intres_mra => '||v_gnra_intres_mra;
   pkg_sg_log.prc_rg_log(68081,
                              null,
                              nmbre_up,
                              v_nl,
                              v_mnsje_log || ' , ' || sqlerrm,
                              6);

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

v_mnsje_log := 'v_id_impsto => '||v_id_impsto||'- v_id_impsto_sbmpsto => '||v_id_impsto_sbmpsto||
'- v_vgncia => '||v_vgncia||'- v_id_prdo => '||v_id_prdo;
   pkg_sg_log.prc_rg_log(68081,
                              null,
                              nmbre_up,
                              v_nl,
                              v_mnsje_log || ' , ' || sqlerrm,
                              6);
    --Se consulta la fecha limite de declaracion
    select pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(p_id_dclrcion_vgncia_frmlrio => p_id_dclrcion_vgncia_frmlrio,
                                                          p_idntfccion                 => p_idntfccion,
                                                          p_id_sjto_tpo                => p_id_sjto_tpo)
      into v_fcha_fnal
      from dual;

   v_mnsje_log := 'v_fcha_fnal => '||v_fcha_fnal;
   pkg_sg_log.prc_rg_log(68081,
                              null,
                              nmbre_up,
                              v_nl,
                              v_mnsje_log || ' , ' || sqlerrm,
                              6);
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


     v_mnsje_log := 'v_vlor_intres => '||v_vlor_intres;
   pkg_sg_log.prc_rg_log(68081,
                              null,
                              nmbre_up,
                              v_nl,
                              v_mnsje_log || ' , ' || sqlerrm,
                              6);
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
                                  p_item_cncpto                varchar2  default null,
                                  p_item                       varchar2  default null, --Parametro que recibe el nombre del atributo creado en la pagina (nuevo)
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
       and 1 = case
                        when  e.id_frmlrio_rgion_atrbto = v_id_frmlrio_rgion_atrbto then
                                1
                        when  upper(e.id_frmlrio_rgion_item) like upper(p_item) then
                                1
                        else
                                0
                    end
               and
               1 = case
                        when e.fla = v_fla  then
                            1
                        when upper(e.id_frmlrio_rgion_item) like upper(p_item) then
                                1
                    else
                            0
                    end ;

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

    --Funcion para generar el json con los valores de calculo interes y descuento de una declaración
  --FDCL170
      function fnc_cl_valor_concepto(p_cdgo_clnte                  in  number,
                                    p_id_dclrcion_vgncia_frmlrio   in number,
                                    p_idntfccion                   in varchar2,
                                    p_id_dclrcion_crrccion         in number,
                                    p_id_sjto_tpo                  in number default null,
                                    p_cdgo_sncion_tpo              in varchar2 default null,
                                    p_cdgo_dclrcion_uso            in varchar2 default null,
                                    p_id_dclrcion_incial           in number default null,
                                    p_impsto_crgo                  in number default null,
                                    p_ingrsos_brtos                in number default null,
                                    p_saldo_favor                  in number default null,
                                    p_fcha_pryccion                in varchar2,
                                    p_vlor_ttal                    in number default 0,
                                    p_json                         in clob default null)
      return clob as

     /*Objeto que contiene los calculos de cada concepto o item, Ejemplo de los calculos
       calculo interes, calculo descuento capita, calculo descuento interes, calculo sanción.
     */

        v_json_obj JSON_OBJECT_T;
        v_json_array JSON_ARRAY_T   := JSON_ARRAY_T(); --Array donde se almacena los obejtos  v_json_obj
        v_json_sancion JSON_ARRAY_T := JSON_ARRAY_T();

        v_concepto JSON_OBJECT_T    := JSON_OBJECT_T(); --Obejto que contiene el v_json_array.

        v_vlor_interes          number := 0; --contien el calculo de interes
        v_vlor_dscnto_cptal     number := 0; --contien el calculo de descuento capital
        v_vlor_dscnto_intres    number := 0; --contien el calculo de descuento interes
        vlro_sncion             number := 0; --Contiene el calculo sanción industria y comercio
        vlro_concepto           number := 0;
        v_vlor_sncion           number := 0;
        v_vlor_sncion_neto      number := 0;
        V_VLOR_DSCNTO_SNCION    number := 0;
        v_nmro_cnsctvo_anterior number := 0;
        v_vlor_ttal             number := p_vlor_ttal;

        v_prcdmnto   varchar2(200) := 'pkg_gi_declaraciones_funciones_2.fnc_cl_valor_concepto';
        v_nl         number;
      begin
        v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_prcdmnto);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'Proceso iniciado pkg_gi_declaraciones_funciones_2.fnc_cl_valor_concepto', 1);
    --Se extrae la información del p_json para procesar los calculos de los item
            pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'p_id_sjto_tpo => '||p_id_sjto_tpo, 6);
            pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'p_impsto_crgo => '||p_impsto_crgo, 6);
            pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'p_ingrsos_brtos => '||p_ingrsos_brtos, 6);
            pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'p_saldo_favor => '||p_saldo_favor, 6);
            pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'p_vlor_ttal => '||p_vlor_ttal, 6);

        if  p_id_dclrcion_crrccion > 0 then
            select a.nmro_cnsctvo
            into  v_nmro_cnsctvo_anterior
            from gi_g_declaraciones a
            where a.id_dclrcion = p_id_dclrcion_crrccion;
        else
            v_nmro_cnsctvo_anterior := 0;
        end if;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, ' p_id_dclrcion_crrccion => '||p_id_dclrcion_crrccion, 6);

        for c_conceptos in (select *
                            from json_table( p_json, '$.items[*]'
                                            columns (
                                            nmbre     VARCHAR2(100)  path '$.nmbreItem1',
                                            concepto  VARCHAR2(1000) PATH '$.item1',
                                            valor NUMBER PATH '$.valor1',
                                            orden NUMBER PATH '$.orden1',

                                            nmbre2     VARCHAR2(100)  path  '$.nmbreItem2',
                                            concepto2  VARCHAR2(1000) PATH '$.item2',
                                            valor2     NUMBER PATH '$.valor2',
                                            orden2     NUMBER PATH '$.orden2',

                                            nmbre3     VARCHAR2(100)  path  '$.nmbreItem3',
                                            concepto3  VARCHAR2(1000) PATH '$.item3',
                                            valor3 NUMBER PATH '$.valor3',
                                            orden3 NUMBER PATH '$.orden3',

                                            nmbre4     VARCHAR2(100)  path  '$.nmbreItem4',
                                            concepto4  VARCHAR2(1000) PATH '$.item4',
                                            valor4 NUMBER PATH '$.valor4',
                                            orden4 NUMBER PATH '$.orden4'))) loop

                        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'c_conceptos.valor => '||c_conceptos.valor, 6);

                        select  sum(a.vlor_dscnto)
                        into    v_vlor_dscnto_cptal
                        from    table(pkg_gi_declaraciones_funciones_2.fnc_co_valor_descuento		   (
                                                                            p_id_dclrcion_vgncia_frmlrio    =>  p_id_dclrcion_vgncia_frmlrio,-- p_id_dclrcion_vgncia_frmlrio,
                                                                            p_id_dclrcion_crrccion          =>  p_id_dclrcion_incial,
                                                                            --p_item_cncpto                 =>  'RGN1012ATR4778FLAX',
                                                                            p_item                          =>  c_conceptos.nmbre,
                                                                            p_vlor_cncpto                   =>  c_conceptos.valor,
                                                                            p_idntfccion                    =>  p_idntfccion,
                                                                            p_fcha_pryccion                 =>  p_fcha_pryccion))  a ;

                        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'v_vlor_dscnto_cptal => '||v_vlor_dscnto_cptal, 6);

                     --   dbms_output.put_line('c_conceptos.concepto: '||c_conceptos.concepto);

                       --   calculo de interes
                       v_vlor_interes := pkg_gi_declaraciones_funciones.fnc_co_cncpto_intrs_vlddo(
                                                            p_id_dclrcion_vgncia_frmlrio   => p_id_dclrcion_vgncia_frmlrio,
                                                            p_item_acto_cncpto             => null,--'RGN1012ATR4778FLAX',
                                                            p_item                         => c_conceptos.nmbre, --c_conceptos.concepto,
                                                            p_vlor_acto_cncpto             => (c_conceptos.valor - nvl(v_vlor_dscnto_cptal,0)),--c_conceptos.valor,--
                                                            p_dclrcion_uso                 => p_cdgo_dclrcion_uso,
                                                            p_id_dclrcion_antrior          => v_nmro_cnsctvo_anterior,
                                                            p_idntfccion                   => p_idntfccion,
                                                            p_id_sjto_tpo                  => p_id_sjto_tpo,
                                                            p_fcha_pryccion                => p_fcha_pryccion,
                                                            p_vlor_ttal                    => v_vlor_ttal
                                                            );

                       pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'v_vlor_interes => '||v_vlor_interes, 6);
                --  DBMS_OUTPUT.PUT_LINE('Calculo interes concepto '||c_conceptos.concepto||' :'||v_vlor_interes);



                     --   dbms_output.put_line('v_vlor_dscnto_cptal: '||v_vlor_dscnto_cptal);
                     --   dbms_output.put_line('c_conceptos.valor: '||c_conceptos.valor);


                        select  sum(a.vlor_dscnto)
                        into    v_vlor_dscnto_intres
                        from    table(pkg_gi_declaraciones_funciones_2.fnc_co_valor_descuento		   (
                                                                            p_id_dclrcion_vgncia_frmlrio    =>  p_id_dclrcion_vgncia_frmlrio,-- p_id_dclrcion_vgncia_frmlrio,
                                                                            p_id_dclrcion_crrccion          =>  p_id_dclrcion_incial,
                                                                            --p_item_cncpto                 =>  'RGN1012ATR4778FLAX',
                                                                            p_item                          =>  c_conceptos.nmbre2,
                                                                            p_vlor_cncpto                   =>  v_vlor_interes,
                                                                            p_idntfccion                    =>  p_idntfccion,
                                                                            p_fcha_pryccion                 =>  p_fcha_pryccion))  a ;
                        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'v_vlor_dscnto_intres => '||v_vlor_dscnto_intres, 6);
                      --  dbms_output.put_line('v_vlor_dscnto_intres: '||v_vlor_dscnto_intres);
                          v_json_obj := JSON_OBJECT_T();
                          v_json_obj.PUT('nmbreItem1',  c_conceptos.nmbre);
                          v_json_obj.PUT('item1',       c_conceptos.concepto);
                          v_json_obj.PUT('valor1',      c_conceptos.valor);
                          v_json_obj.PUT('orden1',      c_conceptos.orden);

                          v_json_obj.PUT('nmbreItem2',  c_conceptos.nmbre2);
                          v_json_obj.PUT('item2',       c_conceptos.concepto2);
                          v_json_obj.PUT('valor2',      nvl(v_vlor_interes,0));
                          v_json_obj.PUT('orden2',      c_conceptos.orden);

                          v_json_obj.PUT('nmbreItem3',  c_conceptos.nmbre3);
                          v_json_obj.PUT('item3',       c_conceptos.concepto3);
                          v_json_obj.PUT('valor3',      nvl(v_vlor_dscnto_cptal,0));
                          v_json_obj.PUT('orden3',      c_conceptos.orden);

                          v_json_obj.PUT('nmbreItem4',  c_conceptos.nmbre4);
                          v_json_obj.PUT('item4',       c_conceptos.concepto4);
                          v_json_obj.PUT('valor4',      nvl(v_vlor_dscnto_intres,0));
                          v_json_obj.PUT('orden4',      c_conceptos.orden4);

                          v_json_array.APPEND(v_json_obj);


        end loop;

       -- v_json_array.APPEND(v_json_obj);
        v_concepto.put('CONCEPTO', JSON_ARRAY_T(v_json_array));


    -- insert into muerto (v_001,c_001,t_001)values('JSON concepto: ', v_concepto.to_clob ,sysdate); commit;

        for c_sancion in (select *
                            from json_table( p_json, '$.sancion[*]'
                                            columns (

                                            nmbre     VARCHAR2(100)  path '$.nmbreItem1',
                                            concepto  VARCHAR2(1000) PATH '$.item1',
                                            valor NUMBER PATH '$.valor1',
                                            orden NUMBER PATH '$.orden1',

                                            nmbre2     VARCHAR2(100)  path '$.nmbreItem2',
                                            concepto2  VARCHAR2(1000) PATH '$.item2',
                                            valor2 NUMBER PATH '$.valor2',
                                            orden2 NUMBER PATH '$.orden2',

                                            nmbre3     VARCHAR2(100)  path '$.nmbreItem3',
                                            concepto3  VARCHAR2(1000) PATH '$.item3',
                                            valor3 NUMBER PATH '$.valor3',
                                            orden3 NUMBER PATH '$.orden3',

                                            nmbre4     VARCHAR2(100)  path '$.nmbreItem4',
                                            concepto4  VARCHAR2(1000) PATH '$.item4',
                                            valor4 NUMBER PATH '$.valor4',
                                            orden4 NUMBER PATH '$.orden4',

                                            nmbre5     VARCHAR2(100)  path '$.nmbreItem5',
                                            concepto5  VARCHAR2(1000) PATH '$.item5',
                                            valor5 NUMBER PATH '$.valor5',
                                            orden5 NUMBER PATH '$.orden5',

                                            nmbre6     VARCHAR2(100)  path '$.nmbreItem6',
                                            concepto6  VARCHAR2(1000) PATH '$.item6',
                                            valor6 NUMBER PATH '$.valor6',
                                            orden6 NUMBER PATH '$.orden6'))) loop


                         -- contador := contador + 1 ;


                   --  DBMS_OUTPUT.PUT_LINE('concepto '||c_conceptos.concepto ||'---'||c_conceptos.valor||'--'|| c_conceptos.orden);
                        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'Antes de antrar a sancón sugerida => '||c_sancion.concepto, 6);

                     if   c_sancion.concepto = 'SANCION_SUGERIDA'  then

                   --  dbms_output.put_line('Entro en if: ');
                      select  pkg_gi_declaraciones_funciones_2.fnc_co_valor_sancion(
                                                            p_cdgo_clnte                   => p_cdgo_clnte,
                                                            p_id_dclrcion_vgncia_frmlrio   => p_id_dclrcion_vgncia_frmlrio,
                                                            p_idntfccion                   => p_idntfccion,
                                                            p_id_sjto_tpo                  => p_id_sjto_tpo,
                                                            p_fcha_prsntcion               => p_fcha_pryccion,
                                                            p_cdgo_sncion_tpo              => p_cdgo_sncion_tpo, --'EXT',
                                                            p_cdgo_dclrcion_uso            => p_cdgo_dclrcion_uso, --'DIN',
                                                            p_id_dclrcion_incial           => p_id_dclrcion_incial,
                                                            p_impsto_crgo                  => v_vlor_ttal,--c_sancion.valor4,
                                                            p_ingrsos_brtos                => v_vlor_ttal,
                                                            p_saldo_favor                  => p_saldo_favor
                                                       ) as sancion
                        into v_vlor_sncion
                        from dual;

                        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'Entro de antrar a sancón sugerida v_vlor_sncion => '||v_vlor_sncion, 6);

                        v_vlor_sncion_neto := pkg_gn_generalidades.fnc_ca_expresion(p_vlor      =>  v_vlor_sncion,
                                                                               p_expresion => 'round(:vlor,-3)');

                        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'Sanción sugerida c_sancion.valor6 => '||c_sancion.valor6, 6);
                        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'Sanción sugerida c_sancion.valor5 => '||c_sancion.valor5, 6);

                        v_vlor_sncion   := v_vlor_sncion_neto ;

                        --v_vlor_sncion   := v_vlor_sncion_neto ;
                        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'Sanción sugerida v_vlor_sncion => '||v_vlor_sncion, 6);


                        select  sum(a.vlor_dscnto)
                        into    v_vlor_dscnto_sncion
                        from    table(pkg_gi_declaraciones_funciones_2.fnc_co_valor_descuento		   (
                                                                p_id_dclrcion_vgncia_frmlrio    =>  p_id_dclrcion_vgncia_frmlrio,-- p_id_dclrcion_vgncia_frmlrio,
                                                                p_id_dclrcion_crrccion          =>  p_id_dclrcion_incial,
                                                                --p_item_cncpto                 =>  'RGN1012ATR4778FLAX',
                                                                p_item                          =>  c_sancion.nmbre, --'VALOR_CONCEPTO_SANCION',
                                                                p_vlor_cncpto                   =>  case
                                                                                                        when v_vlor_sncion_neto - c_sancion.valor5 < 0 then
                                                                                                            0
                                                                                                        else
                                                                                                            v_vlor_sncion_neto - c_sancion.valor5
                                                                                                    end   ,  --v_vlor_sncion,
                                                                p_idntfccion                    =>  p_idntfccion,
                                                                p_fcha_pryccion                 =>  p_fcha_pryccion))  a ;

                            pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'SUGERIDA v_vlor_dscnto_sncion=> '||v_vlor_dscnto_sncion, 6);
                            if (v_vlor_dscnto_sncion < 0) then
                                v_vlor_dscnto_sncion := 0;
                             end if;

                    else
                             v_vlor_dscnto_sncion := 0;

                  --          dbms_output.put_line('Entro en else : ');
                             pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'Sancón manual c_sancion.valor =>  '||c_sancion.valor, 6);
                             pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'Sancón manual c_sancion.valor5 =>  '||c_sancion.valor5, 6);
                             pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'Sancón manual c_sancion.valor6 =>  '||c_sancion.valor6, 6);

                             v_vlor_sncion_neto := pkg_gn_generalidades.fnc_ca_expresion(p_vlor      =>  c_sancion.valor,
                                                                               p_expresion => 'round(:vlor,-3)');

                             pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'Valor manual v_vlor_sncion_neto => '||v_vlor_sncion_neto, 6);


                            -- v_vlor_sncion      := c_sancion.valor;
                             v_vlor_sncion      := v_vlor_sncion_neto - c_sancion.valor5;

                             pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'VALOR SANCION MANUAL MENOS  c_sancion.valor5=>  '||v_vlor_sncion, 6);
                             if (v_vlor_sncion < 0) then
                                v_vlor_sncion:= 0;
                             end if;
                            -- v_vlor_sncion_neto :=    v_vlor_sncion;

                            select  sum(a.vlor_dscnto)
                            into    v_vlor_dscnto_sncion
                            from    table(pkg_gi_declaraciones_funciones_2.fnc_co_valor_descuento		   (
                                                                    p_id_dclrcion_vgncia_frmlrio    =>  p_id_dclrcion_vgncia_frmlrio,-- p_id_dclrcion_vgncia_frmlrio,
                                                                    p_id_dclrcion_crrccion          =>  p_id_dclrcion_incial,
                                                                    --p_item_cncpto                 =>  'RGN1012ATR4778FLAX',
                                                                    --p_item                          =>  c_sancion.nmbre, --'VALOR_CONCEPTO_SANCION',
                                                                    p_item                          =>  'VALOR_CONCEPTO_SANCION',
                                                                    p_vlor_cncpto                   =>  v_vlor_sncion,
                                                                    p_idntfccion                    =>  p_idntfccion,
                                                                    p_fcha_pryccion                 =>  p_fcha_pryccion))  a ;
                           pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'Valor descuensto sancón manual => '||v_vlor_dscnto_sncion, 6);

                    end if;
                           pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'valor1 => '||v_vlor_sncion, 6);
                           pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'valor2 => '||v_vlor_dscnto_sncion, 6);
                           pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_prcdmnto, v_nl, 'valor3 => '||v_vlor_sncion_neto, 6);
                    --   dbms_output.put_line('v_vlor_sncion: '||v_vlor_sncion);
                    --    dbms_output.put_line('v_vlor_dscnto_sncion: '||v_vlor_dscnto_sncion);
                         v_json_obj := JSON_OBJECT_T();

                          v_json_obj.PUT('nmbreItem1',  c_sancion.nmbre);
                          v_json_obj.PUT('item1',  c_sancion.concepto);
                          v_json_obj.PUT('valor1', v_vlor_sncion);
                          v_json_obj.PUT('orden1', c_sancion.orden);

                          v_json_obj.PUT('nmbreItem2',  c_sancion.nmbre2);
                          v_json_obj.PUT('item2',  c_sancion.concepto2);
                          v_json_obj.PUT('valor2', nvl(v_vlor_dscnto_sncion,0));
                          v_json_obj.PUT('orden2', c_sancion.orden);

                          v_json_obj.PUT('nmbreItem3',  c_sancion.nmbre6);
                          v_json_obj.PUT('item3',  c_sancion.concepto6);
                          v_json_obj.PUT('valor3', nvl(v_vlor_sncion_neto,0));
                          v_json_obj.PUT('orden3', c_sancion.orden);

                         /* v_json_obj.PUT('nmbreItem4',  c_conceptos.nmbre4);
                          v_json_obj.PUT('item4',  c_conceptos.concepto4);
                          v_json_obj.PUT('valor4', nvl(v_vlor_dscnto_intres,0));
                          v_json_obj.PUT('orden4', c_conceptos.orden);
                          v_json_sancion.APPEND(v_json_obj);  */

                          v_json_sancion.APPEND(v_json_obj);

        end loop;


            v_concepto.put('SANCION', JSON_ARRAY_T(v_json_sancion));


      -- v_concepto.TO_CLOB();
      return v_concepto.to_clob;
      end fnc_cl_valor_concepto;

end pkg_gi_declaraciones_funciones_2;
/

