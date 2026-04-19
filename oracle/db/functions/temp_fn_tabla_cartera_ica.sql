
  CREATE OR REPLACE EDITIONABLE FUNCTION "TEMP_FN_TABLA_CARTERA_ICA" (p_cdgo_clnte        number,
                                                     p_id_impsto         number,
                                                     p_id_impsto_sbmpsto number,
                                                     p_id_sjto_impsto    number,
                                                     p_vgncia_dsde       number,
                                                     p_tpo_slda          varchar2) return varchar2 is

  cursor c1 is
    select v.vgncia,
           v.id_sjto_impsto,
           v.vlor_sldo_cptal capital,
           v.vlor_intres interes,
           v.vlor_sldo_cptal + v.vlor_intres total
      from v_gf_g_cartera_x_vigencia v
      join v_si_i_sujetos_impuesto s
        on s.cdgo_clnte = v.cdgo_clnte
       and s.id_impsto = v.id_impsto
       and v.id_sjto_impsto = s.id_sjto_impsto
      join si_i_personas r
        on r.id_sjto_impsto = s.id_sjto_impsto
     where v.cdgo_clnte = p_cdgo_clnte
       and v.id_impsto = p_id_impsto
       and v.id_impsto_sbmpsto = p_id_impsto_sbmpsto
       and v.id_sjto_impsto = p_id_sjto_impsto
       and v.cdgo_mvnt_fncro_estdo = 'NO'
       and v.vlor_sldo_cptal > 0
       and s.id_sjto_estdo = 1
       and v.vgncia >= p_vgncia_dsde
     order by v.vgncia;

  cursor c2(r_vgncia number) is
    select a.nmro_cnsctvo
      from gi_g_declaraciones a
     where a.cdgo_clnte = p_cdgo_clnte
       and a.id_impsto = p_id_impsto
       and a.id_impsto_sbmpsto = p_id_impsto_sbmpsto
       and a.id_sjto_impsto = p_id_sjto_impsto
       and a.cdgo_dclrcion_estdo in ('APL', 'PRS')
       and a.vgncia = r_vgncia
       and a.id_dclrcion = (select max(b.id_dclrcion)
                              from gi_g_declaraciones b
                             where b.cdgo_clnte = p_cdgo_clnte
                               and b.id_impsto = p_id_impsto
                               and b.id_impsto_sbmpsto = p_id_impsto_sbmpsto
                               and b.id_sjto_impsto = p_id_sjto_impsto
                               and b.vgncia = r_vgncia
                               and b.cdgo_dclrcion_estdo in ('APL', 'PRS'));

  v_nmro_dcmnto number;

  v_tabla varchar2(4000);
begin

  if p_tpo_slda = 'T' then

    v_tabla := 'Vigencia    Formulario        Capital        Interes          Saldo';

    for r1 in c1 loop
      v_nmro_dcmnto := null;
      for r2 in c2(r1.vgncia) loop
        v_nmro_dcmnto := r2.nmro_cnsctvo;
      end loop;

      if v_nmro_dcmnto is not null then
        --creo la tabla
        v_tabla := v_tabla || chr(13) || rpad(r1.vgncia, 9, ' ');
        v_tabla := v_tabla || lpad(v_nmro_dcmnto, 13, ' ');
        v_tabla := v_tabla || lpad(trim(to_char(r1.capital, '999,999,999,999')), 15, ' ');
        v_tabla := v_tabla || lpad(trim(to_char(r1.interes, '999,999,999,999')), 15, ' ');
        v_tabla := v_tabla || lpad(trim(to_char(r1.total, '999,999,999,999')), 15, ' ');
      else
        --sitpr001('No se encontro declaración: ' || r1.id_sjto_impsto, 'Tabla_ica.txt');
        continue;
      end if;
    end loop;
  elsif p_tpo_slda = 'H' then
    v_tabla := '<table style="border-collapse: collapse; width: 100%; height: 36px;" border="1"><tbody>';
    v_tabla := v_tabla || '<tr >
                            <td style="width: 20%; height: 18px; text-align: center;"><strong>Vigencia</strong></td>
                            <td style="width: 20%; height: 18px; text-align: center;"><strong>Formulario</strong></td>
                            <td style="width: 20%; height: 18px; text-align: center;"><strong>Capital</strong></td>
                            <td style="width: 20%; height: 18px; text-align: center;"><strong>Interes</strong></td>
                            <td style="width: 20%; height: 18px; text-align: center;"><strong>Saldo</strong></td>
                          </tr>';

    for r1 in c1 loop
      v_nmro_dcmnto := null;
      for r2 in c2(r1.vgncia) loop
        v_nmro_dcmnto := r2.nmro_cnsctvo;
      end loop;

      if v_nmro_dcmnto is not null then
        --creo la tabla

        v_tabla := v_tabla || '<tr>';
        v_tabla := v_tabla || '<td style="width: 20%;text-align: center;">' || r1.vgncia || '</td>';
        v_tabla := v_tabla || '<td style="width: 20%;text-align: center;">' || v_nmro_dcmnto || '</td>';
        v_tabla := v_tabla || '<td style="width: 20%;text-align: right;">' ||
                   trim(to_char(r1.capital, '999,999,999,999')) || '</td>';
        v_tabla := v_tabla || '<td style="width: 20%;text-align: right;">' ||
                   trim(to_char(r1.interes, '999,999,999,999')) || '</td>';
        v_tabla := v_tabla || '<td style="width: 20%;text-align: right;">' ||
                   trim(to_char(r1.total, '999,999,999,999')) || '</td>';
        v_tabla := v_tabla || '</tr>';

      else
        --sitpr001('No se encontro declaración: ' || r1.id_sjto_impsto, 'Tabla_ica.txt');
        continue;
      end if;
    end loop;

    v_tabla := v_tabla || '</tbody></table>';
  end if;
  return(v_tabla);
end temp_fn_tabla_cartera_ica;
/

