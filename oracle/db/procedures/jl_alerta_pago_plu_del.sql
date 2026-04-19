
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_ALERTA_PAGO_PLU_DEL" (p_mntos number) is

  cursor c1 is
    select a.id_rcdo, b.cdgo_clnte
      from re_g_recaudos a
      join re_g_documentos b
        on b.id_dcmnto = a.id_orgen
     where a.cdgo_rcdo_estdo = 'AP'
       and a.cdgo_rcdo_orgn_tpo = 'DC'
       and b.id_impsto in (230013, 230019)
       and b.id_impsto_sbmpsto in (2300199, 23001157)
       and a.fcha_apliccion >=
           systimestamp - numtodsinterval(p_mntos, 'MINUTE')
     order by a.id_rcdo;

  cursor c2 is
    select a.id_usrio
      from v_sg_g_usuarios a
      join sg_g_perfiles_usuario b
        on b.id_usrio = a.id_usrio
      join sg_g_perfiles c
        on c.id_prfil = b.id_prfil
     where a.id_fncnrio is not null
       and a.actvo = 'S'
       and c.nmbre_prfil = 'DELINEACION PLUSVALIA'
       and trunc(sysdate) <= trunc(a.fcha_exprcion);

  p_json_prmtros clob;
begin

  for r1 in c1 loop
    for r2 in c2 loop

      p_json_prmtros := '{ "id_rcdo" : ' || r1.id_rcdo || ',
                            "id_usrio " : ' ||
                        r2.id_usrio || '}';

      pkg_ma_envios.prc_co_envio_programado(p_cdgo_clnte   => r1.cdgo_clnte,
                                            p_idntfcdor    => 'notificaPagoPLUDEL',
                                            p_json_prmtros => p_json_prmtros);
    end loop;
  end loop;
end jl_alerta_pago_plu_del;
/

