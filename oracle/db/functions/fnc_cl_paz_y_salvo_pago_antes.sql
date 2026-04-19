
  CREATE OR REPLACE EDITIONABLE FUNCTION "FNC_CL_PAZ_Y_SALVO_PAGO_ANTES" (p_xml    clob,
                                                         p_vgncia number)
  return varchar2 is
  -- !! -------------------------------------------------------------------- !! --
  -- !! Funcion para calcular si esta a paz y salvo con vigencias anteriores !! --
  -- !! y pagadas antes del 31 de diciembre de la vigencia anterior          !! --
  -- !! -------------------------------------------------------------------- !! --
  v_vgncia_actual       number;
  v_sldo_mvmntos        number;
  v_fcha_mxma           date;
  v_exist               number;
  v_fcha_rgstro         number;
  v_fcha_rgstro_antrior number;
  v_no_ortga_dscnto     number;
  v_id_rcdo             number;

begin

  v_vgncia_actual := p_vgncia;
  begin

    -- Valida si es predio NUEVO
    select extract(year from fcha_rgstro)
      into v_fcha_rgstro
      from si_i_sujetos_impuesto
     where id_sjto_impsto = json_value(p_xml, '$.P_ID_SJTO_IMPSTO');

    if (v_fcha_rgstro = v_vgncia_actual) then

      begin
        select nvl(sum(vlor_sldo_cptal + vlor_intres), 0)
          into v_sldo_mvmntos
          from v_gf_g_cartera_x_vigencia a
         where a.cdgo_clnte = json_value(p_xml, '$.P_CDGO_CLNTE')
           and a.id_impsto = json_value(p_xml, '$.P_ID_IMPSTO')
           and a.id_impsto_sbmpsto =
               json_value(p_xml, '$.P_ID_IMPSTO_SBMPSTO')
           and a.id_sjto_impsto = json_value(p_xml, '$.P_ID_SJTO_IMPSTO')
           and a.cdgo_mvnt_fncro_estdo in ('NO', 'CN')
           and a.vgncia < v_vgncia_actual;
      end;

      if v_sldo_mvmntos = 0 then
        begin

          select max(fcha_rcdo)
            into v_fcha_mxma
            from v_re_g_recaudos a
           where a.cdgo_clnte = json_value(p_xml, '$.P_CDGO_CLNTE')
             and a.id_impsto = json_value(p_xml, '$.P_ID_IMPSTO')
             and a.id_impsto_sbmpsto =
                 json_value(p_xml, '$.P_ID_IMPSTO_SBMPSTO')
             and a.id_sjto_impsto = json_value(p_xml, '$.P_ID_SJTO_IMPSTO')
             and cdgo_rcdo_estdo = 'AP'
             and extract(year from a.fcha_rcdo) <= v_vgncia_actual;

          if ((trunc(v_fcha_mxma) <
             to_date('01/01/' || v_vgncia_actual, 'dd/mm/yyyy')) or
             v_fcha_mxma is null) then
            return 'S';
          else
            --
            select r.id_rcdo
              into v_id_rcdo
              from v_re_g_recaudos r
             where r.cdgo_clnte = json_value(p_xml, '$.P_CDGO_CLNTE')
               and r.id_impsto = json_value(p_xml, '$.P_ID_IMPSTO')
               and r.id_impsto_sbmpsto =
                   json_value(p_xml, '$.P_ID_IMPSTO_SBMPSTO')
               and r.id_sjto_impsto =
                   json_value(p_xml, '$.P_ID_SJTO_IMPSTO')
               and r.cdgo_rcdo_estdo = 'AP'
               and trunc(r.fcha_rcdo) = trunc(v_fcha_mxma);

            for vigencias in (select d.vgncia
                                from v_re_g_recaudos_detalle d
                               where d.id_rcdo = v_id_rcdo
                               group by d.vgncia
                               order by d.vgncia) loop

              if (vigencias.vgncia <> v_vgncia_actual) then
                return 'N';
              else
                return 'S';
              end if;

            end loop;

            --
            -- return 'N';
          end if;

        exception
          when others then
            return 'N';
        end;
      else
        return 'N';
      end if;
      --termina validacion predio nuevo
    else

      begin
        select nvl(sum(vlor_sldo_cptal + vlor_intres), 0)
          into v_sldo_mvmntos
          from v_gf_g_cartera_x_vigencia a
         where a.cdgo_clnte = json_value(p_xml, '$.P_CDGO_CLNTE')
           and a.id_impsto = json_value(p_xml, '$.P_ID_IMPSTO')
           and a.id_impsto_sbmpsto =
               json_value(p_xml, '$.P_ID_IMPSTO_SBMPSTO')
           and a.id_sjto_impsto = json_value(p_xml, '$.P_ID_SJTO_IMPSTO')
           and a.cdgo_mvnt_fncro_estdo in ('NO', 'CN')
           and a.vgncia < v_vgncia_actual;

        if v_sldo_mvmntos = 0 then
          begin

            select max(fcha_rcdo)
              into v_fcha_mxma
              from v_re_g_recaudos a
             where a.cdgo_clnte = json_value(p_xml, '$.P_CDGO_CLNTE')
               and a.id_impsto = json_value(p_xml, '$.P_ID_IMPSTO')
               and a.id_impsto_sbmpsto =
                   json_value(p_xml, '$.P_ID_IMPSTO_SBMPSTO')
               and a.id_sjto_impsto =
                   json_value(p_xml, '$.P_ID_SJTO_IMPSTO')
               and cdgo_rcdo_estdo = 'AP'
               and extract(year from a.fcha_rcdo) <= v_vgncia_actual;

            if ((trunc(v_fcha_mxma) <
               to_date('01/01/' || v_vgncia_actual, 'dd/mm/yyyy')) or
               v_fcha_mxma is null) then
              return 'S';
            else
              --
              select r.id_rcdo
                into v_id_rcdo
                from v_re_g_recaudos r
               where r.cdgo_clnte = json_value(p_xml, '$.P_CDGO_CLNTE')
                 and r.id_impsto = json_value(p_xml, '$.P_ID_IMPSTO')
                 and r.id_impsto_sbmpsto =
                     json_value(p_xml, '$.P_ID_IMPSTO_SBMPSTO')
                 and r.id_sjto_impsto =
                     json_value(p_xml, '$.P_ID_SJTO_IMPSTO')
                 and r.cdgo_rcdo_estdo = 'AP'
                 and trunc(r.fcha_rcdo) = trunc(v_fcha_mxma);

              for vigencias in (select d.vgncia
                                  from v_re_g_recaudos_detalle d
                                 where d.id_rcdo = v_id_rcdo
                                 group by d.vgncia
                                 order by d.vgncia) loop

                if (vigencias.vgncia <> v_vgncia_actual) then
                  return 'N';
                else
                  return 'S';
                end if;

              end loop;

              --
              -- return 'N';
            end if;

          exception
            when others then
              return 'N';
          end;
        else
          return 'N';
        end if;
      exception
        when others then
          return 'N';
      end;
    end if;
  exception
    when others then
      return 'N';
  end;

end fnc_cl_paz_y_salvo_pago_antes;
/

