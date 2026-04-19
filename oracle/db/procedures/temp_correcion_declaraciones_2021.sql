
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_CORRECION_DECLARACIONES_2021" (p_nmro_cnsctvo in number, p_mnsje out varchar2) is

  cursor c1 is
    select a.id_dclrcion,
           d.id_frmlrio_rgion_atrbto,
           a.nmro_cnsctvo,
           a.id_sjto_impsto,
           a.vgncia,
           a.id_prdo,
           to_number(b.vlor) vlor,
           e.vlor_ttal,
           e.id_lqdcion,
           a.fcha_aplccion
      from gi_g_declaraciones a
      join gi_g_declaraciones_detalle b
        on a.id_dclrcion = b.id_dclrcion
      join gi_d_formularios_region c
        on c.id_frmlrio_rgion = b.id_frmlrio_rgion
      join gi_d_frmlrios_rgion_atrbto d
        on d.id_frmlrio_rgion = c.id_frmlrio_rgion
       and d.id_frmlrio_rgion_atrbto = b.id_frmlrio_rgion_atrbto
      join gi_g_liquidaciones e
        on e.id_lqdcion = a.id_lqdcion
     where d.actvo = 'S'
       and d.id_frmlrio_rgion_atrbto = 4775
       and c.id_frmlrio = 764
       and a.cdgo_dclrcion_estdo in ('PRS', 'APL')
       and a.nmro_cnsctvo = p_nmro_cnsctvo;

  cursor c2(r_id_frmlrio_rgion_atrbto number) is
    select to_number(b.vlor) vlor
      from gi_g_declaraciones a
      join gi_g_declaraciones_detalle b
        on a.id_dclrcion = b.id_dclrcion
      join gi_d_formularios_region c
        on c.id_frmlrio_rgion = b.id_frmlrio_rgion
      join gi_d_frmlrios_rgion_atrbto d
        on d.id_frmlrio_rgion = c.id_frmlrio_rgion
       and d.id_frmlrio_rgion_atrbto = b.id_frmlrio_rgion_atrbto
     where d.actvo = 'S'
       and d.id_frmlrio_rgion_atrbto = r_id_frmlrio_rgion_atrbto
       and c.id_frmlrio = 764
       and a.cdgo_dclrcion_estdo in ('PRS', 'APL')
       and a.nmro_cnsctvo = p_nmro_cnsctvo
     order by c.orden, d.orden;

  cursor c3(r_id_lqdcion number) is
    select * from v_gi_g_liquidaciones_concepto c where c.id_lqdcion = r_id_lqdcion;

  cursor c4(r_id_mvmnto_fncro number) is
    select *
      from gf_g_movimientos_detalle d
     where d.id_mvmnto_fncro = r_id_mvmnto_fncro
       and d.cdgo_mvmnto_orgn = 'LQ'
       and d.cdgo_mvmnto_tpo = 'IN'
       and d.vlor_dbe > 0;

  v_ica               number;
  v_ayt               number;
  v_sbom              number;
  v_retenciones       number;
  v_anticipo_anterior number;
  v_anticipo          number;
  v_sancion           number;
  v_exenciones        number;
  v_sldo_fvor         number;

  v_prcntje_ica    number(7, 5);
  v_prcntje_ayt    number(7, 5);
  v_prcntje_sbom   number(7, 5);
  v_prcntje_sncion number(7, 5);

  v_id_mvmnto_fncro number;

  v_pgdo_cptal  number;
  v_pgdo_intres number;

  v_id_rdcdo number;

  v_id_impsto_acto_cncpto number;
  v_fcha_vncmnto          date;
begin
  p_mnsje := 'No se encontro la declaracion';
  for declaracion in c1 loop
    p_mnsje := 'Declaracion id: ' || declaracion.id_dclrcion;

    if declaracion.vlor_ttal <> declaracion.vlor then
      --Buscamos el concepto de ica
      for conceptos in c2(4720) loop
        v_ica := conceptos.vlor;
        --dbms_output.put_line('Ica: ' || v_ica);
      end loop;

      for conceptos in c2(4721) loop
        v_ayt := conceptos.vlor;
        --dbms_output.put_line('Avisos y Tableros: ' || v_ayt);
      end loop;

      for conceptos in c2(4733) loop
        v_sbom := conceptos.vlor;
        --dbms_output.put_line('Bomberil: ' || v_sbom);
      end loop;

      for conceptos in c2(4757) loop
        v_retenciones := conceptos.vlor;
        --dbms_output.put_line('Retenciones: ' || v_retenciones);
      end loop;

      for conceptos in c2(4759) loop
        v_anticipo_anterior := conceptos.vlor;
        --dbms_output.put_line('Anticipo Anterior: ' || v_anticipo_anterior);
      end loop;

      for conceptos in c2(4760) loop
        v_anticipo := conceptos.vlor;
        --dbms_output.put_line('Anticipo: ' || v_anticipo);
      end loop;

      for conceptos in c2(4767) loop
        v_sancion := conceptos.vlor;
        --dbms_output.put_line('Sancion: ' || v_sancion);
      end loop;

      for conceptos in c2(4756) loop
        v_exenciones := conceptos.vlor;
        --dbms_output.put_line('Exenciones: ' || v_exenciones);
      end loop;

      for conceptos in c2(4773) loop
        v_sldo_fvor := conceptos.vlor;
        --dbms_output.put_line('Saldo a Favor: ' || v_sldo_fvor);
      end loop;

      --calcular el ica nuevo
      v_ica := ((v_ica - v_retenciones) - v_exenciones) - v_sldo_fvor;

      if v_ica < v_anticipo_anterior then
        v_anticipo_anterior := v_anticipo_anterior - v_ica;
        v_ica               := 0;
      else
        v_ica               := v_ica - v_anticipo_anterior;
        v_anticipo_anterior := 0;
      end if;

      -- --dbms_output.put_line('Ica Definitivo: ' || v_ica);
      --dbms_output.put_line('Saldo del anticipo: ' || v_anticipo_anterior);

      --calculo del anticipo
      if v_anticipo < v_anticipo_anterior then
        v_anticipo_anterior := v_anticipo_anterior - v_anticipo;
        v_anticipo          := 0;
      else
        v_anticipo          := v_anticipo - v_anticipo_anterior;
        v_anticipo_anterior := 0;
      end if;

      --dbms_output.put_line('Saldo del anticipo anterior luego de restar anticipo actual: ' ||v_anticipo_anterior);

      --validamos si el anticipo cubre los demas conceptos

      if (v_anticipo_anterior > (v_ica + v_ayt + v_sbom + v_sancion)) then
        --el anticipo cubre todos los conceptos
        v_ayt               := 0;
        v_sbom              := 0;
        v_sancion           := 0;
        v_anticipo_anterior := v_anticipo_anterior - (v_ayt - v_sbom - v_sancion);
      else
        -- no cubre la totalidad, se aplica proporcional
        if v_ica + v_ayt + v_sbom + v_sancion > 0 then
          v_prcntje_ica    := v_ica / (v_ica + v_ayt + v_sbom + v_sancion);
          v_prcntje_ayt    := v_ayt / (v_ica + v_ayt + v_sbom + v_sancion);
          v_prcntje_sbom   := v_sbom / (v_ica + v_ayt + v_sbom + v_sancion);
          v_prcntje_sncion := v_sancion / (v_ica + v_ayt + v_sbom + v_sancion);
        else
          v_prcntje_ica    := 0;
          v_prcntje_ayt    := 0;
          v_prcntje_sbom   := 0;
          v_prcntje_sncion := 0;
        end if;
        v_ica  := v_ica - round(v_anticipo_anterior * v_prcntje_ica, -3);
        v_ayt  := v_ayt - round(v_anticipo_anterior * v_prcntje_ayt, -3);
        v_sbom := v_sbom - round(v_anticipo_anterior * v_prcntje_sbom, -3);

        if v_sancion > 0 then
          if v_anticipo_anterior > 0 then
            v_sancion := ((v_anticipo_anterior - v_ica) - v_ayt) - v_sbom;
          else
            v_sancion := v_sancion - round(v_anticipo_anterior * v_prcntje_sncion, -3);
          end if;
        end if;
        v_anticipo_anterior := 0;
      end if;

      --dbms_output.put_line('Ica Definitivo: ' || v_ica);
      --dbms_output.put_line('Avisos y Tableros definitivo: ' || v_ayt);
      --dbms_output.put_line('Sobretasa Definitivo: ' || v_sbom);
      --dbms_output.put_line('Sancion Definitiva: ' || v_sancion);
      --dbms_output.put_line('Anticipo Actual: ' || v_anticipo);

      --dbms_output.put_line('Saldo a cargo definitivo: ' || (v_ica + v_ayt + v_sbom + v_sancion + v_anticipo));

      --Procedemos a actualizar la liquidacion
      --001 ICA
      --002 AYT
      --003 SBOM
      --004 SAN
      --2057 ANTICIPO
      p_mnsje := null;
      for r3 in c3(declaracion.id_lqdcion) loop
        if r3.cdgo_cncpto = '2057' then
          p_mnsje := 'S';
        end if;
      end loop;

      --Validamos que exista el concepto de anticipo

      if p_mnsje is null then
        --dbms_output.put_line('No existe registro de anticipo en la declaracion: ' || v_anticipo);
        --Buscamos el acto concepto
        select d.id_impsto_acto_cncpto, d.fcha_vncmnto
          into v_id_impsto_acto_cncpto, v_fcha_vncmnto
          from df_i_impuestos_acto_concepto d
         where d.cdgo_clnte = 23001
           and d.vgncia = declaracion.vgncia
           and d.id_prdo = declaracion.id_prdo
           and d.id_cncpto = 659;

        --Buscamos el movimiento financiero
        select f.id_mvmnto_fncro
          into v_id_mvmnto_fncro
          from gf_g_movimientos_financiero f
         where f.id_sjto_impsto = declaracion.id_sjto_impsto
           and f.cdgo_mvmnto_orgn = 'DL'
           and f.id_orgen = declaracion.id_dclrcion;

        --crea el concepto de liquidacion del anticipo
        insert into gi_g_liquidaciones_concepto
          (id_lqdcion_cncpto,
           id_lqdcion,
           id_impsto_acto_cncpto,
           vlor_lqddo,
           vlor_clcldo,
           trfa,
           bse_cncpto,
           txto_trfa,
           vlor_intres,
           indcdor_lmta_impsto,
           fcha_vncmnto)
        values
          (sq_gi_g_liquidaciones_concepto.nextval,
           declaracion.id_lqdcion,
           v_id_impsto_acto_cncpto,
           0,
           0,
           1000,
           0,
           '1000/1000',
           0,
           'N',
           v_fcha_vncmnto);

        --crea el concepto de cartera del anticipo
        insert into gf_g_movimientos_detalle
          (id_mvmnto_fncro,
           cdgo_mvmnto_orgn,
           id_orgen,
           cdgo_mvmnto_tpo,
           vgncia,
           id_prdo,
           cdgo_prdcdad,
           fcha_mvmnto,
           id_cncpto,
           id_cncpto_csdo,
           vlor_dbe,
           vlor_hber,
           actvo,
           gnra_intres_mra,
           fcha_vncmnto,
           id_impsto_acto_cncpto)
        values
          (v_id_mvmnto_fncro,
           'LQ',
           declaracion.id_lqdcion,
           'IN',
           declaracion.vgncia,
           declaracion.id_prdo,
           'ANU',
           declaracion.fcha_aplccion,
           659,
           659,
           0,
           0,
           'S',
           'S',
           v_fcha_vncmnto,
           v_id_impsto_acto_cncpto);
      end if;

      p_mnsje := null;
      for r3 in c3(declaracion.id_lqdcion) loop
        p_mnsje := 'Encontro la liquidacion de esta declaracion';
        if r3.cdgo_cncpto = '001' then
          update gi_g_liquidaciones_concepto c
             set c.vlor_lqddo = v_ica, c.vlor_clcldo = v_ica, c.bse_cncpto = v_ica
           where c.id_lqdcion_cncpto = r3.id_lqdcion_cncpto;

          update gf_g_movimientos_detalle d
             set d.vlor_dbe = v_ica
           where d.id_orgen = declaracion.id_lqdcion
             and d.id_impsto_acto_cncpto = r3.id_impsto_acto_cncpto
             and d.id_cncpto = r3.id_cncpto
             and d.cdgo_mvmnto_tpo = 'IN'
             and d.cdgo_mvmnto_orgn = 'LQ'
          returning d.id_mvmnto_fncro into v_id_mvmnto_fncro;

        elsif r3.cdgo_cncpto = '002' then

          update gi_g_liquidaciones_concepto c
             set c.vlor_lqddo = v_ayt, c.vlor_clcldo = v_ayt, c.bse_cncpto = v_ayt
           where c.id_lqdcion_cncpto = r3.id_lqdcion_cncpto;

          update gf_g_movimientos_detalle d
             set d.vlor_dbe = v_ayt
           where d.id_orgen = declaracion.id_lqdcion
             and d.id_impsto_acto_cncpto = r3.id_impsto_acto_cncpto
             and d.id_cncpto = r3.id_cncpto
             and d.cdgo_mvmnto_tpo = 'IN'
             and d.cdgo_mvmnto_orgn = 'LQ';

        elsif r3.cdgo_cncpto = '003' then

          update gi_g_liquidaciones_concepto c
             set c.vlor_lqddo = v_sbom, c.vlor_clcldo = v_sbom, c.bse_cncpto = v_sbom
           where c.id_lqdcion_cncpto = r3.id_lqdcion_cncpto;

          update gf_g_movimientos_detalle d
             set d.vlor_dbe = v_sbom
           where d.id_orgen = declaracion.id_lqdcion
             and d.id_impsto_acto_cncpto = r3.id_impsto_acto_cncpto
             and d.id_cncpto = r3.id_cncpto
             and d.cdgo_mvmnto_tpo = 'IN'
             and d.cdgo_mvmnto_orgn = 'LQ';
        elsif r3.cdgo_cncpto = '004' then

          update gi_g_liquidaciones_concepto c
             set c.vlor_lqddo = v_sancion, c.vlor_clcldo = v_sancion, c.bse_cncpto = v_sancion
           where c.id_lqdcion_cncpto = r3.id_lqdcion_cncpto;

          update gf_g_movimientos_detalle d
             set d.vlor_dbe = v_sancion
           where d.id_orgen = declaracion.id_lqdcion
             and d.id_impsto_acto_cncpto = r3.id_impsto_acto_cncpto
             and d.id_cncpto = r3.id_cncpto
             and d.cdgo_mvmnto_tpo = 'IN'
             and d.cdgo_mvmnto_orgn = 'LQ';

        elsif r3.cdgo_cncpto = '2057' then

          update gi_g_liquidaciones_concepto c
             set c.vlor_lqddo = v_anticipo, c.vlor_clcldo = v_anticipo, c.bse_cncpto = v_anticipo
           where c.id_lqdcion_cncpto = r3.id_lqdcion_cncpto;

          update gf_g_movimientos_detalle d
             set d.vlor_dbe = v_anticipo
           where d.id_orgen = declaracion.id_lqdcion
             and d.id_impsto_acto_cncpto = r3.id_impsto_acto_cncpto
             and d.id_cncpto = r3.id_cncpto
             and d.cdgo_mvmnto_tpo = 'IN'
             and d.cdgo_mvmnto_orgn = 'LQ';

        end if;
      end loop;

      if p_mnsje is null then
        p_mnsje := 'No Encontro la liquidacion de esta declaracion';
      else

        --calculamos el valor pagado a capital e interes
        select nvl(sum(d.vlor_hber), 0)
          into v_pgdo_cptal
          from gf_g_movimientos_detalle d
         where d.id_mvmnto_fncro = v_id_mvmnto_fncro
           and d.cdgo_mvmnto_orgn = 'RE'
           and d.cdgo_mvmnto_tpo = 'PC';

        select nvl(sum(d.vlor_hber), 0)
          into v_pgdo_intres
          from gf_g_movimientos_detalle d
         where d.id_mvmnto_fncro = v_id_mvmnto_fncro
           and d.cdgo_mvmnto_orgn = 'RE'
           and d.cdgo_mvmnto_tpo = 'PI';

        --dbms_output.put_line('Pagado Capital: ' || v_pgdo_cptal);
        --dbms_output.put_line('Pagado Interes: ' || v_pgdo_intres);

        if v_pgdo_cptal > 0 then
          --Borrar los registros de pagos

          delete from gf_g_movimientos_detalle d
           where d.id_mvmnto_fncro = v_id_mvmnto_fncro
             and d.cdgo_mvmnto_orgn = 'RE'
             and d.cdgo_mvmnto_tpo = 'PC'
          returning min(d.id_orgen) into v_id_rdcdo;

          --dbms_output.put_line('Borrado aplicacion del recaudo, id_rdcdo: ' || v_id_rdcdo);

          if v_pgdo_cptal >= (v_ica + v_ayt + v_sbom + v_sancion + v_anticipo) then
            --Aplica pago total
            --dbms_output.put_line('Aplica pago total');
            for r4 in c4(v_id_mvmnto_fncro) loop
              insert into gf_g_movimientos_detalle
                (id_mvmnto_fncro,
                 cdgo_mvmnto_orgn,
                 id_orgen, --ID RECAUDO ????
                 cdgo_mvmnto_tpo,
                 vgncia,
                 id_prdo,
                 cdgo_prdcdad,
                 fcha_mvmnto,
                 id_cncpto,
                 id_cncpto_csdo,
                 vlor_dbe,
                 vlor_hber,
                 actvo,
                 gnra_intres_mra,
                 fcha_vncmnto,
                 id_impsto_acto_cncpto)
              values
                (v_id_mvmnto_fncro,
                 'RE',
                 v_id_rdcdo,
                 'PC',
                 r4.vgncia,
                 r4.id_prdo,
                 r4.cdgo_prdcdad,
                 declaracion.fcha_aplccion,
                 r4.id_cncpto,
                 r4.id_cncpto_csdo,
                 0,
                 r4.vlor_dbe,
                 r4.actvo,
                 'N',
                 r4.fcha_vncmnto,
                 r4.id_impsto_acto_cncpto);
            end loop;
          else
            --dbms_output.put_line('Aplica pago parcial');
            null;
          end if;
        else
          p_mnsje := 'No hay valor pagado, no se modifica cartera';
        end if;

        --borramos la aplicacion del recaudo

        pkg_gf_movimientos_financiero.prc_ac_concepto_consolidado(23001, declaracion.id_sjto_impsto);

        update gi_g_liquidaciones c
           set c.vlor_ttal =
               (v_ica + v_ayt + v_sbom + v_sancion + v_anticipo)
         where c.id_lqdcion = declaracion.id_lqdcion;

        p_mnsje := 'Aplicacion Exitosa';
      end if;

    else
      p_mnsje := 'La declaracion no presenta diferencias de liquidacion vs declaracion';
    end if;
  end loop;

end temp_correcion_declaraciones_2021;
/

