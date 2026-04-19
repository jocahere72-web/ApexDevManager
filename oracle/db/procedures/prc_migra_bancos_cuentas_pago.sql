
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_MIGRA_BANCOS_CUENTAS_PAGO" (p_id_entdad         in  number
                                                        , p_cdgo_clnte        in  number) is

cursor c1 is
  SELECT m.clmna4
    FROM migra.mg_g_intermedia_recaudo m
   WHERE m.cdgo_clnte = p_cdgo_clnte and
         m.id_entdad  = p_id_entdad and
         NOT EXISTS (SELECT 'X'
                       FROM DF_C_BANCOS B
                      WHERE B.CDGO_BNCO = m.clmna4)
  GROUP BY m.clmna4
  order by m.clmna4;

cursor c2 is
  select a.*,
         (select x.id_bnco from DF_C_BANCOS x WHERE nvl(x.CDGO_BNCO,'null') = nvl(a.clmna4,'null')) id_bnco
  from (
        SELECT m.clmna4, m.clmna5
          FROM migra.mg_g_intermedia_recaudo m
         WHERE m.cdgo_clnte = p_cdgo_clnte and
               m.id_entdad  = p_id_entdad and
               NOT EXISTS (SELECT 'X'
                             FROM (select c.nmro_cnta,
                                          (select d.cdgo_bnco from DF_C_BANCOS d where d.id_bnco = c.id_bnco) CDGO_BNCO
                                     from DF_C_BANCOS_CUENTA c
                                   ) b
                            WHERE B.CDGO_BNCO = m.clmna4 and
                                  b.nmro_cnta = m.clmna5)
        GROUP BY m.clmna4, m.clmna5) a
  order by a.clmna4, a.clmna5;

v_id_bnco       DF_C_BANCOS.id_bnco%type;
v_nmbre_bnco    DF_C_BANCOS.nmbre_bnco%type;
v_nmro_cnta     DF_C_BANCOS_CUENTA.NMRO_CNTA%type;

begin

  for r1 in c1 loop

    if r1.clmna4 is not null then
      v_nmbre_bnco :=  'Banco No Definido: '||r1.clmna4;

      begin
        insert into DF_C_BANCOS
              (cdgo_clnte, nmbre_bnco, rcddor, cdgo_bnco)
        values(p_cdgo_clnte, v_nmbre_bnco, 'N', r1.clmna4);
      end;
    end if;
  end loop;

  for r2 in c2 loop

    v_id_bnco := r2.id_bnco;

    if r2.clmna5 is null then
      v_nmro_cnta := 'Cuenta No Definida';
    else
      v_nmro_cnta := r2.clmna5;
    end if;

    begin
      insert into DF_C_BANCOS_CUENTA
            (id_bnco, nmro_cnta, indcdor_cnta_ws)
      values(v_id_bnco, v_nmro_cnta, 'N');
    end;
  end loop;

  commit;
end PRC_MIGRA_BANCOS_CUENTAS_PAGO;

/

