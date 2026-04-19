
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_VLDA_DLCRCNES_PLACE" is

  cursor c1 is
    select td.id_pgdor_dcmnto,
           td.cdgo_frmlrio,
           d.id_sjto_impsto,
           d.nmro_cnsctvo,
           d.cdgo_dclrcion_estdo,
           json_value(e.rspsta, '$.request.status') as request_status,
           json_value(e.rspsta, '$.payment.status') as payment_status,
           json_value(e.rspsta, '$.income.status') as income_status,
           json_value(e.rspsta, '$.income.signs') as total_firmas,
           json_value(e.rspsta, '$.income.numberSigns') as numero_firmas,
           (select count(*)
              from gi_g_declaraciones a
             where a.id_sjto_impsto = d.id_sjto_impsto
               and a.id_dclrcion_vgncia_frmlrio =
                   d.id_dclrcion_vgncia_frmlrio
               and (a.indcdor_mgrdo <> 'C' or a.indcdor_mgrdo is null)
               and a.cdgo_dclrcion_estdo = 'APL') declaraciones
      from v_re_g_pagadores_documento td
      join df_c_impuestos b
        on td.id_impsto = b.id_impsto
      join re_g_pagadres_dcmnto_rspsta e
        on e.id_pgdor_dcmnto = td.id_pgdor_dcmnto
      join gi_g_declaraciones d
        on d.id_dclrcion = td.id_orgen
     where td.indcdor_estdo_trnsccion in ('PE')
       and td.request_id is not null
       and td.cdgo_orgn_tpo = 'DL'
       and td.id_prvdor = 1
       and trunc(d.fcha_prsntcion_pryctda) < trunc(sysdate)
       and td.id_pgdor_dcmnto =
           (select max(c.id_pgdor_dcmnto)
              from re_g_pagadores_documento c
             where c.id_orgen = td.id_orgen
               and c.cdgo_orgn_tpo = td.cdgo_orgn_tpo)
     order by td.id_pgdor_dcmnto;
begin
  --Marcar como fallidas
  for r1 in c1 loop
    if r1.cdgo_dclrcion_estdo = 'APL' or r1.income_status = 'PENDING_SIGN' or
       r1.cdgo_frmlrio <> 'ICA_MONTERIA' then
      --declaración aplicada, pendiente de firma o de retenciones o autorretenciones se marca como fallida
      update re_g_pagadores_documento a
         set a.indcdor_estdo_trnsccion = 'FA'
       where a.id_pgdor_dcmnto = r1.id_pgdor_dcmnto;
    elsif r1.income_status = 'WITHOUT_PAY' and
          (r1.total_firmas > r1.numero_firmas) then
      --Declaracion con firmas pendientes
      update re_g_pagadores_documento a
         set a.indcdor_estdo_trnsccion = 'FA'
       where a.id_pgdor_dcmnto = r1.id_pgdor_dcmnto;
    elsif r1.income_status = 'WITHOUT_PAY' and
          (r1.total_firmas = r1.numero_firmas) and r1.declaraciones > 0 then
      --Ya presenta declaraciones en ese periodo
      update re_g_pagadores_documento a
         set a.indcdor_estdo_trnsccion = 'FA'
       where a.id_pgdor_dcmnto = r1.id_pgdor_dcmnto;
    end if;
  end loop;

  --Marca como fallidas las declaraciones que tiene un intento de pago posterior
  update re_g_pagadores_documento a
     set A.INDCDOR_ESTDO_TRNSCCION = 'FA'
   where a.id_pgdor_dcmnto in
         (select td.id_pgdor_dcmnto
            from v_re_g_pagadores_documento td
            join df_c_impuestos b
              on td.id_impsto = b.id_impsto
            LEFT join re_g_pagadres_dcmnto_rspsta e
              on e.id_pgdor_dcmnto = td.id_pgdor_dcmnto
            join gi_g_declaraciones d
              on d.id_dclrcion = td.id_orgen
           where td.indcdor_estdo_trnsccion in ('IN', 'PE')
             and td.request_id is not null
             and td.cdgo_orgn_tpo = 'DL'
             and td.id_prvdor = 1
             and trunc(d.fcha_prsntcion_pryctda) < trunc(sysdate)
             and td.id_pgdor_dcmnto <
                 (select max(c.id_pgdor_dcmnto)
                    from re_g_pagadores_documento c
                   where c.id_orgen = td.id_orgen
                     and c.cdgo_orgn_tpo = td.cdgo_orgn_tpo));
  commit;

end jl_vlda_dlcrcnes_place;
/

