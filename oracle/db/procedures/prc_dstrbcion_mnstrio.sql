
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_DSTRBCION_MNSTRIO" (p_vgncia in number,
                                                  P_ARCHVO in varchar2) is

  type tab_infrmcion_mnstrio is table of GI_G_INFRMCION_MNSTRIO_TMP%rowtype;
  v_infrmcion_mnstrio tab_infrmcion_mnstrio;
  n_sql               number;

  v_cont           number := 0;
  v_dscrpcion_mrca df_s_vehiculos_marca.dscrpcion_vhclo_mrca%type;
  v_id_mrca        df_s_vehiculos_marca.cdgo_vhclo_mrca%type;
  v_dscrpcion_lna  df_s_vehiculos_linea.dscrpcion_vhclo_lnea%type;
  v_id_lna         df_s_vehiculos_linea.id_vhclo_lnea%type;

  v_cdgo_mrca    varchar2(1000);
  v_cdgo_lnea    number(15);
  v_id_clase     number(15);
  v_id_grpo      number(15);
  v_cldrje       number(15, 2);
  v_cpcdad_dsde  number;
  v_cpcdad_hsta  number;
  v_nmtcnco_grpo varchar2(10);
  v_exste_mrca   boolean;
  v_exste_lna    boolean;
  v_exste_grpo   boolean;

  v_conta           number;
  v_cntdor          number;
  v_mdlo            number(4);
  v_vlor_avluo      number(16, 2);
  v_vgncia          number(4);
  o_cdgo_rspsta     number;
  o_mnsje_rspsta    varchar2(1000);
  v_grpo            varchar2(80);
  v_mlje            number;
  v_archvo          varchar2(1000);
  v_cdgo_vhclo_mrca varchar2(1000);

  cursor c_marca(r_marca varchar2) is
    select a.cdgo_vhclo_mrca
      from df_s_vehiculos_marca a
     where upper(trim(a.dscrpcion_vhclo_mrca)) = upper(trim(r_marca));

  cursor c_linea(r_marca varchar2, r_linea varchar2) is
    select a.id_vhclo_lnea
      from df_s_vehiculos_linea a
     where a.cdgo_vhclo_mrca = r_marca
       and upper(trim(a.dscrpcion_vhclo_lnea)) =
           upper(nvl(trim(r_linea), '9999'))
     order by a.id_vhclo_lnea desc
     FETCH FIRST 1 ROW ONLY;

  cursor c_grupo(r_marca         varchar2,
                 r_linea         varchar2,
                 r_vgncia        number,
                 r_id_vhclo_clse number,
                 r_cilindraje    in number) is
    select *
      from df_s_vehiculos_grupo gr
     where gr.cdgo_vhclo_mrca = r_marca
       and gr.id_vhclo_lnea = r_linea
       and gr.vgncia = r_vgncia
       and gr.id_vhclo_clse_ctgria = r_id_vhclo_clse
       and r_cilindraje between gr.clndrje_dsde and gr.clndrje_hsta;

  cursor c_clase(r_clase varchar2, r_vgncia number) is
    select *
      from df_s_vehiculos_clase_ctgria cl
     where cl.vgncia = r_vgncia
       and cl.cdgo_vhclo_clse = r_clase;

begin
  sitpr001('Entrando a prc_dstrbcion_mnstrio', P_ARCHVO);

  select a.*
    bulk collect
    into v_infrmcion_mnstrio
    from GI_G_INFRMCION_MNSTRIO_TMP a
   WHERE A.INDCDOR_RGSTRO IS NULL;

  n_sql            := 0;
  v_dscrpcion_mrca := null;
  v_dscrpcion_lna  := null;
  v_cldrje         := 0;
  v_cpcdad_dsde    := 0;
  v_cpcdad_hsta    := 0;
  v_conta          := 0;

  for i in v_infrmcion_mnstrio.first .. v_infrmcion_mnstrio.count loop

    v_cdgo_mrca := TO_CHAR(SYSDATE, 'YYYY') || SQ_DF_MARCAS.NEXTVAL;
    v_cdgo_lnea := 2000000 + SQ_DF_LINEA.NEXTVAL;
    v_conta     := v_conta + 1;
    sitpr001('Entrando a r1 ' || v_infrmcion_mnstrio(i).info_cnsctvo,
             P_ARCHVO);

    v_dscrpcion_mrca := v_infrmcion_mnstrio(i).marca;
    v_dscrpcion_lna  := v_infrmcion_mnstrio(i).linea;
    v_cldrje         := v_infrmcion_mnstrio(i).cilindraje;
    v_cpcdad_dsde    := to_number(replace(v_infrmcion_mnstrio(i).pasajeros,
                                          ',',
                                          '.'));
    v_cpcdad_hsta    := to_number(replace(v_infrmcion_mnstrio(i).tonelaje,
                                          ',',
                                          '.'));

    --- v_id_mrca      := null;
    -- v_cldrje       := 0;
    --  v_id_lna       := 0;
    v_id_clase     := 0;
    v_id_grpo      := 0;
    v_nmtcnco_grpo := null;

    v_exste_mrca := false;
    v_exste_lna  := false;
    v_exste_grpo := false;

    v_vgncia := p_vgncia;
    /* marca de vehiculos*/
    for r_marca in c_marca(v_infrmcion_mnstrio(i).marca) loop
      sitpr001('Entrando a marcas existente ' || r_marca.cdgo_vhclo_mrca,
               P_ARCHVO);
      v_exste_mrca := true;
      v_cdgo_mrca  := r_marca.cdgo_vhclo_mrca;
    end loop;

    if not v_exste_mrca then
      sitpr001('Entrando a marcas no existe ' || v_cdgo_mrca || '-' ||
               v_dscrpcion_mrca,
               P_ARCHVO);
      begin
        insert into df_s_vehiculos_marca
          (cdgo_vhclo_mrca, dscrpcion_vhclo_mrca, mnstrio)
        values
          (v_cdgo_mrca, v_dscrpcion_mrca, 'S')
        returning cdgo_vhclo_mrca into v_cdgo_mrca;
        n_sql := n_sql + sql%rowcount;
        if n_sql > 0 then
          sitpr001('Se inserta marca nueva ' || v_cdgo_mrca || '-' ||
                   v_dscrpcion_mrca,
                   P_ARCHVO);
        end if;
      exception
        when others then
          v_archvo := 'Error en insert de marca ' || sqlerrm;
          sitpr001('Error en insert de marca ' || sqlerrm, P_ARCHVO);
      end;
    end if;

    /* linea de vehiculos */
    for r_linea in c_linea(v_cdgo_mrca, v_infrmcion_mnstrio(i).linea) loop
      sitpr001('Entrando a linea existente ' || v_infrmcion_mnstrio(i).linea,
               P_ARCHVO);
      v_exste_lna := true;
      v_id_lna    := r_linea.id_vhclo_lnea;
    end loop;

    if not v_exste_lna then
      sitpr001('Entrando no existe la linea ' || v_cdgo_mrca || '' ||
               v_cdgo_lnea,
               P_ARCHVO);
      begin
        insert into df_s_vehiculos_linea
          (cdgo_lnea,
           cdgo_vhclo_mrca,
           dscrpcion_vhclo_lnea,
           mnstrio,
           cdgo_lnea_tax)
        values
          (v_cdgo_lnea, v_cdgo_mrca, v_dscrpcion_lna, 'S', v_cdgo_lnea)
        returning cdgo_lnea into v_cdgo_lnea;
        n_sql := n_sql + sql%rowcount;
        if n_sql > 0 then
          sitpr001('Se inserta linea nueva ' || v_cdgo_lnea || '-' ||
                   v_dscrpcion_lna || '-' || v_id_mrca || '-' || p_vgncia,
                   P_ARCHVO);
        end if;
      exception
        when others then
          v_archvo := 'Error en insert de linea ' || sqlerrm;
          sitpr001('Error en insert de linea ' || sqlerrm, P_ARCHVO);
      end;
    else
      v_cdgo_lnea := v_id_lna;
    end if;

    /*  crear un cursor para la clase */
    for r_clase in c_clase(v_infrmcion_mnstrio(i).clase, v_vgncia - 1) loop
      v_id_clase := r_clase.id_vhclo_clse_ctgria;
    end loop;
    v_nmtcnco_grpo := null;
    --c_grupo(r_marca varchar2,r_linea varchar2,r_vgncia number,r_id_vhclo_clse number, r_cilindraje in number)
    for r_grupo in c_grupo(v_cdgo_mrca,
                           v_cdgo_lnea,
                           v_vgncia - 1,
                           v_id_clase,
                           v_cldrje) loop
      v_exste_grpo   := true;
      v_nmtcnco_grpo := r_grupo.cdgo_grpo_tax;
      v_id_grpo      := r_grupo.grpo;
    end loop;

    /*  crear un cursor para la clase 2023 */
    for r_clase in c_clase(v_infrmcion_mnstrio(i).clase, v_vgncia) loop
      v_id_clase := r_clase.id_vhclo_clse_ctgria;
    end loop;

    begin
      insert into df_s_vehiculos_grupo
        (vgncia,
         id_vhclo_clse_ctgria,
         cdgo_vhclo_mrca,
         id_vhclo_lnea,
         clndrje_dsde,
         clndrje_hsta,
         cpcdad_dsde,
         cpcdad_hsta,
         cdgo_vhclo_srvcio,
         cdgo_vhclo_oprcion,
         cdgo_vhclo_crrcria,
         grpo,
         cdgo_grpo_tax)
      values
        (p_vgncia,
         v_id_clase,
         v_cdgo_mrca,
         v_cdgo_lnea,
         v_cldrje,
         v_cldrje,
         v_cpcdad_dsde,
         v_cpcdad_hsta,
         '01',
         '1',
         '001',
         v_id_grpo,
         v_nmtcnco_grpo)
      returning id_vhclo_grpo, id_vhclo_lnea, cdgo_grpo_tax into v_id_grpo, v_cdgo_lnea, v_nmtcnco_grpo;
      n_sql := n_sql + sql%rowcount;
      if n_sql > 0 then
        sitpr001('Se inserta grupo nuevo' || v_id_grpo || '-' ||
                 v_nmtcnco_grpo,
                 P_ARCHVO);

        if not v_exste_grpo then
          v_nmtcnco_grpo := v_id_grpo;
        end if;

        update df_s_vehiculos_grupo ui
           set ui.grpo = v_id_grpo, ui.cdgo_grpo_tax = v_nmtcnco_grpo
         where ui.id_vhclo_grpo = v_id_grpo;

      end if;
    exception
      when others then
        v_archvo := 'Error en insert de grupo' || sqlerrm;
        sitpr001('Error en insert de grupo ' || v_infrmcion_mnstrio(i).info_cnsctvo ||
                 sqlerrm,
                 P_ARCHVO);
    end;

    v_grpo   := v_id_grpo;
    v_cntdor := 1;
    v_mdlo   := v_vgncia - 25;
    while v_cntdor <= 25 loop
      v_vlor_avluo := 0;

      if v_cntdor = 1 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO1, 0);
      elsif v_cntdor = 2 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO2, 0);
      elsif v_cntdor = 3 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO3, 0);
      elsif v_cntdor = 4 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO4, 0);
      elsif v_cntdor = 5 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO5, 0);
      elsif v_cntdor = 6 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO6, 0);
      elsif v_cntdor = 7 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO7, 0);
      elsif v_cntdor = 8 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO8, 0);
      elsif v_cntdor = 9 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO9, 0);
      elsif v_cntdor = 10 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO10, 0);
      elsif v_cntdor = 11 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO11, 0);
      elsif v_cntdor = 12 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO12, 0);
      elsif v_cntdor = 13 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO13, 0);
      elsif v_cntdor = 14 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO14, 0);
      elsif v_cntdor = 15 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO15, 0);
      elsif v_cntdor = 16 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO16, 0);
      elsif v_cntdor = 17 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO17, 0);
      elsif v_cntdor = 18 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO18, 0);
      elsif v_cntdor = 19 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO19, 0);
      elsif v_cntdor = 20 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO20, 0);
      elsif v_cntdor = 21 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO21, 0);
      elsif v_cntdor = 22 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO22, 0);
      elsif v_cntdor = 23 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO23, 0);
      elsif v_cntdor = 24 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO24, 0);
      elsif v_cntdor = 25 then
        v_vlor_avluo := nvl(v_infrmcion_mnstrio(i).ANO25, 0);
      end if;

      if v_vlor_avluo > 0 then
        v_mlje := v_vlor_avluo;
        /*sitpr001('insert de avaluo' || v_mdlo || '-' || v_grpo || '-' ||
        v_vlor_avluo,
        P_ARCHVO);*/
        insert into df_s_vehiculos_avaluo
          (mdlo, grpo, vlor_avluo, mlje, vgncia)
        values
          (v_mdlo, v_grpo, (v_vlor_avluo * 1000), v_mlje, p_vgncia);
      end if;

      v_cntdor := v_cntdor + 1;
      v_mdlo   := v_mdlo + 1;
    end loop;

    sitpr001('Finalizo avaluos, actualizando registro procesado ' ||
             v_grpo || ' - ' || v_nmtcnco_grpo,
             P_ARCHVO);

    begin
      update GI_G_INFRMCION_MNSTRIO_TMP l
         set l.indcdor_rgstro = 'S',
             l.cdgo_crga      = v_nmtcnco_grpo,
             l.id_prcso_crga  = v_grpo
       where l.info_cnsctvo = v_infrmcion_mnstrio(i).info_cnsctvo;
    exception
      when others then
        v_archvo := 'Error en actualizar lista de ministerio' || sqlerrm;
        sitpr001('Error en actualizar lista de ministerio' || sqlerrm,
                 P_ARCHVO);
    end;

    if v_conta / 100 = trunc(v_conta / 100) then
      v_archvo := 'Se ha registrado ' || v_conta;
      sitpr001('Se ha registrado ' || v_conta, P_ARCHVO);
      commit;
    end if;
  end loop;
  sitpr001('Se ha registrado total' || v_conta, P_ARCHVO);
  commit;
end;
/

