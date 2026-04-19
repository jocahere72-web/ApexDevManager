
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_AP_DECL_FIRMADAS_SIN_PAGO" (p_id_pgdor_dcmnto number) is

  cursor c1 is
    select *
      from (select i.idntfccion_sjto NIT,
                   P.NMBRE_RZON_SCIAL,
                   d.vgncia,
                   f.dscrpcion periodo,
                   d.nmro_cnsctvo,
                   td.CDGO_FRMLRIO,
                   JSON_VALUE(e.rspsta, '$.request.status') AS request_status,
                   JSON_VALUE(e.rspsta, '$.income.status') AS income_status,
                   JSON_VALUE(e.rspsta, '$.income.signs') AS total_firmas,
                   JSON_VALUE(e.rspsta, '$.income.numberSigns') AS numero_firmas,
                   td.id_pgdor_dcmnto,
                   td.id_orgen id_dclrcion,
                   td.fcha_rgstro,
                   pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(p_id_dclrcion_vgncia_frmlrio => d.id_dclrcion_vgncia_frmlrio,
                                                                  p_idntfccion                 => i.idntfccion_sjto) fcha_mxma_prsntcion,

                   de.nmro_cnsctvo otra_dlcrcion,
                   trunc(d.fcha_prsntcion_pryctda) fcha_prsntcion_pryctda
              from v_re_g_pagadores_documento td
              join df_c_impuestos b
                on td.id_impsto = b.id_impsto
              join re_g_pagadres_dcmnto_rspsta e
                on e.id_pgdor_dcmnto = td.id_pgdor_dcmnto
              join gi_g_declaraciones d
                on d.id_dclrcion = td.id_orgen
               and d.cdgo_dclrcion_estdo not in ('APL')
              join v_si_i_sujetos_impuesto i
                on i.id_sjto_impsto = d.Id_Sjto_Impsto
              join Si_i_Personas P
                on P.id_sjto_impsto = d.Id_Sjto_Impsto
              join df_i_periodos f
                on f.id_prdo = d.id_prdo
              left join gi_g_declaraciones de
                on de.id_sjto_impsto = d.id_sjto_impsto
               and de.id_dclrcion_vgncia_frmlrio =
                   d.id_dclrcion_vgncia_frmlrio
               and de.cdgo_dclrcion_estdo = 'APL'
               and (de.indcdor_mgrdo <> 'C' or de.indcdor_mgrdo is null)
             where td.indcdor_estdo_trnsccion in ('PE')
               and td.request_id is not null
               and td.cdgo_orgn_tpo = 'DL'
               and td.id_prvdor = 1
               and (td.id_pgdor_dcmnto = p_id_pgdor_dcmnto or
                   p_id_pgdor_dcmnto is null)
               and trunc(d.fcha_prsntcion_pryctda) < (trunc(sysdate) - 1) --Dos dias se esperan para tomarla como pagada
               and JSON_VALUE(e.rspsta, '$.request.status') = 'PENDING'
               and td.cdgo_frmlrio not in ('RETEICA', 'SELF_RETENTIONS')
               and JSON_VALUE(e.rspsta, '$.income.status') = 'WITHOUT_PAY'
               and td.cdgo_frmlrio = 'ICA_MONTERIA'
               and td.id_pgdor_dcmnto =
                   (select max(c.id_pgdor_dcmnto)
                      from re_g_pagadores_documento c
                     where c.id_orgen = td.id_orgen
                       and c.cdgo_orgn_tpo = td.cdgo_orgn_tpo)) j
     where j.otra_dlcrcion is null
       and j.TOTAL_FIRMAS = j.NUMERO_FIRMAS;

  v_o_cdgo_rspsta  number;
  v_o_mnsje_rspsta varchar2(500);
begin

  for r1 in c1 loop
    update re_g_pagadores_documento a
       set a.indcdor_estdo_trnsccion = 'AP'
     where a.id_pgdor_dcmnto = r1.id_pgdor_dcmnto;

    update gi_g_declaraciones a
       set a.vlor_pago              = 0,
           a.fcha_prsntcion_pryctda = r1.fcha_prsntcion_pryctda
     where a.id_dclrcion = r1.id_dclrcion;

    update gi_g_declaraciones_detalle a
       set a.vlor = '0', a.vlor_dsplay = '0'
     where a.id_dclrcion = r1.id_dclrcion
       and a.id_frmlrio_rgion_atrbto = 4795; --OJO CON EL ITEM DEL VALOR A PAGAR

    commit;

    jl_ap_pse_aprobados(p_id_pgdor_dcmnto => r1.id_pgdor_dcmnto,
                        o_cdgo_rspsta     => v_o_cdgo_rspsta,
                        o_mnsje_rspsta    => v_o_mnsje_rspsta);
    sitpr001(p_txto   => 'Aplicada declaracion sin pago: ' ||
                         r1.nmro_cnsctvo,
             p_archvo => 'APLICACION_DECLARACIONES_SIN_PAGO_' ||
                         TO_CHAR(SYSDATE, 'YYYYMMDD') || '.txt');

    dbms_output.put_line(r1.id_pgdor_dcmnto || ' rspsta: ' ||
                         v_o_cdgo_rspsta || ' ' || v_o_mnsje_rspsta);

  end loop;

end JL_AP_DECL_FIRMADAS_SIN_PAGO;
/

