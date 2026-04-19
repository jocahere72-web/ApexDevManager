
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_CORRECION_DECLARACIONES_SGI" (p_nmro_cnsctvo in number,
                                                             p_mnsje        out varchar2) is

  cursor c1 is
    select a.id_dclrcion,
           a.id_impsto,
           a.id_impsto_sbmpsto,
           a.id_sjto_impsto,
           a.vgncia,
           a.id_prdo
      from gi_g_declaraciones a
      join gi_d_dclrcnes_vgncias_frmlr f
        on f.id_dclrcion_vgncia_frmlrio = a.id_dclrcion_vgncia_frmlrio
     where a.nmro_cnsctvo = p_nmro_cnsctvo
       and a.cdgo_dclrcion_estdo in ('PSR', 'APL')
       and f.id_frmlrio <> 764;

  cursor c2(r_id_mvmnto_fncro number) is
    select *
      from v_gf_g_movimientos_detalle d
     where d.id_mvmnto_fncro = r_id_mvmnto_fncro
       and d.cdgo_mvmnto_orgn_dtlle = 'LQ'
       and d.cdgo_mvmnto_tpo = 'IN';

  v_id_mvmnto_fncro number;
  v_vlor_sldo_cptal number;

begin
  p_mnsje := 'No se encontró la declaración';

  for r1 in c1 loop
    dbms_output.put_line('Se encontró la declaración: ' || r1.id_dclrcion);

    begin
      select a.id_mvmnto_fncro
        into v_id_mvmnto_fncro
        from gf_g_movimientos_financiero a
       where a.id_orgen = r1.id_dclrcion;

      v_vlor_sldo_cptal := null;

      select v.vlor_sldo_cptal
        into v_vlor_sldo_cptal
        from v_gf_g_cartera_x_vigencia v
       where v.id_sjto_impsto = r1.id_sjto_impsto
         and v.id_impsto = r1.id_impsto
         and v.id_impsto_sbmpsto = r1.id_impsto_sbmpsto
         and v.vgncia = r1.vgncia
         and v.id_prdo = r1.id_prdo;

      dbms_output.put_line('Saldo en cartera: ' || v_vlor_sldo_cptal);

      if v_vlor_sldo_cptal = 0 then
        p_mnsje := 'No prensenta cartera en el periodo';
        exit;
      else
        for r2 in c2(v_id_mvmnto_fncro) loop
          if r2.cdgo_cncpto = '2032' then
            dbms_output.put_line('Actualizo la sanción = ' ||
                                 v_vlor_sldo_cptal);
            update gf_g_movimientos_detalle d
               set d.vlor_dbe = v_vlor_sldo_cptal
             where d.id_mvmnto_dtlle = r2.id_mvmnto_dtlle;
          else
            update gf_g_movimientos_detalle d
               set d.vlor_dbe = 0
             where d.id_mvmnto_dtlle = r2.id_mvmnto_dtlle;
          end if;
        end loop;
      end if;

      pkg_gf_movimientos_financiero.prc_ac_concepto_consolidado(23001,
                                                                r1.id_sjto_impsto);

      p_mnsje := 'Proceso Exitoso';

    exception
      when no_data_found then
        dbms_output.put_line('No sé encontró el movimiento financiero o cartera');
        p_mnsje := 'No sé encontraron datos';
        exit;
      when others then
        dbms_output.put_line('Error: ' || SQLERRM);
        p_mnsje := 'Error ' || SQLERRM;
        exit;
    end;

  end loop;

end temp_correcion_declaraciones_SGI;
/

