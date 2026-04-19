
  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PKG_WS_RESOLUCION_PREDIO" as

    /*
    Paquete que registra resoluciones suministradas a traves del servicio web expuesto por el proveedor CatastoPro
    Fecha Creación 20/02/2026
    Autor D. Baldovino
    Requrimiento 0028766: INTEGRACION CATASTOPRO (CATASTRO)
    */

    /*Funcion que consulta el valor de propiedad del servicio web*/
    function fnc_ob_propiedad_provedor(p_cdgo_clnte         in number,
                                       p_id_impsto          in number default null,
                                       p_id_impsto_sbmpsto  in number default null,
                                       p_id_prvdor          in number,
                                       p_cdgo_prpdad        in varchar2)
    return varchar2
    as
        v_vlor varchar2(4000);
    begin

      begin
            select v.vlor
              into v_vlor
              from ws_d_provedor_propiedades p
              join ws_d_prvdor_prpddes_impsto v on v.id_prvdor_prpdde = p.id_prvdor_prpdde
             where v.cdgo_clnte  = p_cdgo_clnte
               and p.id_prvdor = p_id_prvdor
               and (p_id_impsto is null or v.id_impsto = p_id_impsto )
               and (p_id_impsto_sbmpsto is null or v.id_impsto_sbmpsto = p_id_impsto_sbmpsto )
               and p.cdgo_prpdad = p_cdgo_prpdad
			   fetch first 1 row only;
        exception
            when others then
                v_vlor := null;
        end;

        return v_vlor;

    end fnc_ob_propiedad_provedor;

    /*UP que consulta resoluciones por lote (Rango de fecha) expuestas en el servicio WEB.*/
	procedure prc_co_resolucion_lte_ws(p_cdgo_clnte      in varchar2,
									   p_id_prvdor       in number,
									   p_llave			 in varchar2,
									   p_fcha_ini		 in varchar2,
									   p_fcha_fin	 	 in varchar2,
									   p_cdgo_dpto	 	 in varchar2,
									   p_cdgo_mncpio	 in varchar2,
									   o_mnsje_rspsta    out varchar2,
									   o_cdgo_rspsta     out number,
									   o_json_rspsta     out clob)
    as
		v_nmbre_up        varchar2(200) := 'pkg_ws_resolucion_predio.prc_co_resolucion_lte_ws';
		v_nvel            number;
		v_cdgo_rspsta     number;
		v_mnsje_rspsta    varchar2(4000);
		v_resp            clob;
		excpcion_prsnlzda exception;
		v_error_ws        varchar2(4000);
        v_url             ws_d_provedores_api.url%type;
        v_cdgo_mnjdor     ws_d_provedores_api.cdgo_mnjdor%type;
	begin

		o_cdgo_rspsta := 0;
		o_mnsje_rspsta := 'OK';

		-- Determinamos el nivel del Log de la UPv
		v_nvel := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);
		pkg_sg_log.prc_rg_log(p_cdgo_clnte,null,v_nmbre_up,v_nvel,'Entrando ' || systimestamp,1);

		--Obtener URL para obtener lote de resoluciones
		begin
		  select p.url, p.cdgo_mnjdor
			into v_url, v_cdgo_mnjdor
			from ws_d_provedores_api p
		   where p.id_prvdor = p_id_prvdor
			 and p.cdgo_api = 'RSLC';
		exception
		  when others then
			raise excpcion_prsnlzda;
		end;

		-- Limpiar cabeceras
		APEX_WEB_SERVICE.g_request_headers.delete();

		-- Setear las cabeceras que se envian
		--APEX_WEB_SERVICE.g_request_headers(1).name := 'Content-Type'; --'Content-Type';
		--APEX_WEB_SERVICE.g_request_headers(1).value := 'application/json'; --'text/xml';

		--Se consulta valor de la propiedad Llave
		--v_llave := fnc_ob_propiedad_provedor(p_cdgo_clnte, null,null, p_id_prvdor, 'LLVE');

		v_url:= replace(v_url,'[LLAVE]',p_llave);
		v_url:= replace(v_url,'[FCHA_INCIO]',p_fcha_ini);
		v_url:= replace(v_url,'[FCHA_FIN]',p_fcha_fin);
		v_url:= replace(v_url,'[CDGO_MNCPIO]',p_cdgo_mncpio);
		v_url:= replace(v_url,'[CDGO_DPTO]',p_cdgo_dpto);

		/*
		dbms_output.put_line('p_nmbre_prpdad: '||p_nmbre_prpdad);
		dbms_output.put_line('p_vlor_prpdad: '||p_vlor_prpdad);
		dbms_output.put_line('p_url: '||p_url);
		dbms_output.put_line('p_cdgo_mnjdor: '||p_cdgo_mnjdor);
		dbms_output.put_line('p_body: '||p_body);
		dbms_output.put_line('l_wallet.wallet_path: '||l_wallet.wallet_path);
		dbms_output.put_line('l_wallet.wallet_pwd: '||l_wallet.wallet_pwd);
		*/
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,null,v_nmbre_up,v_nvel,'---> v_url ' || v_url,1);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,null,v_nmbre_up,v_nvel,'---> v_cdgo_mnjdor ' || v_cdgo_mnjdor,1);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,null,v_nmbre_up,v_nvel,'---> p_fcha_ini ' || p_fcha_ini,1);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,null,v_nmbre_up,v_nvel,'---> p_fcha_fin ' || p_fcha_fin,1);
		-- Llamado al webservice
		begin

			v_resp := APEX_WEB_SERVICE.MAKE_REST_REQUEST( p_url              => v_url,
                                                        p_http_method      => v_cdgo_mnjdor,
                                                        p_wallet_path      => l_wallet.wallet_path,
                                                        p_wallet_pwd       => l_wallet.wallet_pwd

														   );

		  pkg_sg_log.prc_rg_log(p_cdgo_clnte,null,v_nmbre_up,v_nvel,'Respuesta Obtenida ' || v_resp,1);

		exception
		  when others then
			select utl_http.get_detailed_sqlerrm into v_error_ws from dual;

			v_error_ws := sqlerrm;
			pkg_sg_log.prc_rg_log(p_cdgo_clnte,null,v_nmbre_up,v_nvel,'Error en Llamado al webservice--> ' ||v_error_ws,1);
			pkg_sg_log.prc_rg_log(p_cdgo_clnte,null,v_nmbre_up,v_nvel,'Error en Llamado al webservice(sqlerrm)--> ' ||sqlerrm,1);

			--dbms_output.put_line('sqlerrm '||sqlerrm);
			o_cdgo_rspsta  := 10;
			o_mnsje_rspsta := o_cdgo_rspsta || ' - Llamado al webservice: ' ||
							  v_error_ws;
			return;
		end;

		if v_resp is null then
		  pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,'Respuest webservice is null ',1);
		  raise excpcion_prsnlzda;
		end if;

		o_json_rspsta := v_resp;
		pkg_sg_log.prc_rg_log(p_cdgo_clnte,null,v_nmbre_up,v_nvel,'Saliendo '|| systimestamp,1);

  exception
    when excpcion_prsnlzda then
      o_cdgo_rspsta  := 40; -- Cambiado
      o_mnsje_rspsta := o_cdgo_rspsta ||
                        ' - No se logra obtener una respuesta del servicio.';
      pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,o_mnsje_rspsta ,1);
    when others then
      o_cdgo_rspsta  := 50;
      o_mnsje_rspsta := o_cdgo_rspsta ||
                        ' - Error al intentar consumir el servicio para conocer estado de la transacci?n. ' ||
                        sqlerrm;
	  pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,o_mnsje_rspsta ,1);

  end prc_co_resolucion_lte_ws;

    /*UP que consulta resoluciones puntuales expuestas en el servicio WEB.*/
	procedure prc_co_resolucion_ws(p_cdgo_clnte      in varchar2,
                                   p_id_prvdor       in number,
								   p_llave			 in varchar2,
								   p_rslcion		 in varchar2,
								   p_anio_rslcion	 in varchar2,
								   p_cdgo_dpto	 	 in varchar2,
								   p_cdgo_mncpio	 in varchar2,
								   o_mnsje_rspsta    out varchar2,
								   o_cdgo_rspsta     out number,
								   o_json_rspsta     out clob) as

		v_nmbre_up        varchar2(200) := 'pkg_ws_resolucion_predio.prc_co_resolucion_ws';
		v_nvel            number;
		v_cdgo_rspsta     number;
		v_mnsje_rspsta    varchar2(4000);
		v_resp            clob;
		excpcion_prsnlzda exception;
		v_error_ws        varchar2(4000);
        v_url             ws_d_provedores_api.url%type;
        v_cdgo_mnjdor     ws_d_provedores_api.cdgo_mnjdor%type;
	begin

		o_cdgo_rspsta := 0;
		o_mnsje_rspsta := 'OK';

		-- Determinamos el nivel del Log de la UPv
		v_nvel := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);
		pkg_sg_log.prc_rg_log(p_cdgo_clnte,null,v_nmbre_up,v_nvel,'Entrando ' || systimestamp,1);

		--Obtener URL para obtener lote de resoluciones
		begin
		  select p.url, p.cdgo_mnjdor
			into v_url, v_cdgo_mnjdor
			from ws_d_provedores_api p
		   where p.id_prvdor = p_id_prvdor
			 and p.cdgo_api = 'DTO';
		exception
		  when others then
			raise excpcion_prsnlzda;
		end;

		-- Limpiar cabeceras
		APEX_WEB_SERVICE.g_request_headers.delete();

		-- Setear las cabeceras que se envian
		--APEX_WEB_SERVICE.g_request_headers(1).name := 'Content-Type'; --'Content-Type';
		--APEX_WEB_SERVICE.g_request_headers(1).value := 'application/json'; --'text/xml';

		--Se consulta valor de la propiedad Llave
		--v_llave := fnc_ob_propiedad_provedor(p_cdgo_clnte, null,null, p_id_prvdor, 'LLVE');

		v_url:= replace(v_url,'[LLAVE]',p_llave);
		v_url:= replace(v_url,'[RSLCION]',p_rslcion);
		v_url:= replace(v_url,'[ANIO_RSLCION]',p_anio_rslcion);
		v_url:= replace(v_url,'[CDGO_MNCPIO]',p_cdgo_mncpio);
		v_url:= replace(v_url,'[CDGO_DPTO]',p_cdgo_dpto);

		/*
		dbms_output.put_line('p_nmbre_prpdad: '||p_nmbre_prpdad);
		dbms_output.put_line('p_vlor_prpdad: '||p_vlor_prpdad);
		dbms_output.put_line('p_url: '||p_url);
		dbms_output.put_line('p_cdgo_mnjdor: '||p_cdgo_mnjdor);
		dbms_output.put_line('p_body: '||p_body);
		dbms_output.put_line('l_wallet.wallet_path: '||l_wallet.wallet_path);
		dbms_output.put_line('l_wallet.wallet_pwd: '||l_wallet.wallet_pwd);
		*/

		-- Llamado al webservice
		begin

			v_resp := APEX_WEB_SERVICE.MAKE_REST_REQUEST( p_url              => v_url,
                                                        p_http_method      => v_cdgo_mnjdor,
                                                        p_wallet_path      => l_wallet.wallet_path,
                                                        p_wallet_pwd       => l_wallet.wallet_pwd

														   );

		  pkg_sg_log.prc_rg_log(p_cdgo_clnte,null,v_nmbre_up,v_nvel,'Respuesta Obtenida ' || v_resp,1);

		exception
		  when others then
			select utl_http.get_detailed_sqlerrm into v_error_ws from dual;

			v_error_ws := sqlerrm;
			pkg_sg_log.prc_rg_log(p_cdgo_clnte,null,v_nmbre_up,v_nvel,'Error en Llamado al webservice--> ' ||v_error_ws,1);
			pkg_sg_log.prc_rg_log(p_cdgo_clnte,null,v_nmbre_up,v_nvel,'Error en Llamado al webservice(sqlerrm)--> ' ||sqlerrm,1);

			--dbms_output.put_line('sqlerrm '||sqlerrm);
			o_cdgo_rspsta  := 10;
			o_mnsje_rspsta := o_cdgo_rspsta || ' - Llamado al webservice: ' ||
							  v_error_ws;
			return;
		end;

		if v_resp is null then
		  pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,'Respuest webservice is null ',1);
		  raise excpcion_prsnlzda;
		end if;

		o_json_rspsta := v_resp;
		pkg_sg_log.prc_rg_log(p_cdgo_clnte,null,v_nmbre_up,v_nvel,'Saliendo '|| systimestamp,1);

  exception
    when excpcion_prsnlzda then
      o_cdgo_rspsta  := 40; -- Cambiado
      o_mnsje_rspsta := o_cdgo_rspsta ||
                        ' - No se logra obtener una respuesta del servicio.';
      pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,o_mnsje_rspsta ,1);
    when others then
      o_cdgo_rspsta  := 50;
      o_mnsje_rspsta := o_cdgo_rspsta ||
                        ' - Error al intentar consumir el servicio para conocer estado de la transacci?n. ' ||
                        sqlerrm;
	  pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,o_mnsje_rspsta ,1);

  end prc_co_resolucion_ws;

    /*UP que consulta pdf de resolució puntual expuestas en el servicio WEB.*/
	procedure prc_co_pdf_resolucion_ws(p_cdgo_clnte      in varchar2,
									   p_id_prvdor       in number,
									   p_llave			 in varchar2,
									   p_rslcion		 in varchar2,
									   p_anio_rslcion	 in varchar2,
									   p_cdgo_dpto	 	 in varchar2,
									   p_cdgo_mncpio	 in varchar2,
									   o_mnsje_rspsta    out varchar2,
									   o_cdgo_rspsta     out number,
									   o_json_rspsta     out clob) as

		v_nmbre_up        varchar2(200) := 'pkg_ws_resolucion_predio.prc_co_pdf_resolucion_ws';
		v_nvel            number;
		v_cdgo_rspsta     number;
		v_mnsje_rspsta    varchar2(4000);
		v_resp            clob;
		excpcion_prsnlzda exception;
		v_error_ws        varchar2(4000);
        v_url             ws_d_provedores_api.url%type;
        v_cdgo_mnjdor     ws_d_provedores_api.cdgo_mnjdor%type;
	begin

		o_cdgo_rspsta := 0;
		o_mnsje_rspsta := 'OK';

		-- Determinamos el nivel del Log de la UPv
		v_nvel := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);
		pkg_sg_log.prc_rg_log(p_cdgo_clnte,null,v_nmbre_up,v_nvel,'Entrando ' || systimestamp,1);

		--Obtener URL para obtener lote de resoluciones
		begin
		  select p.url, p.cdgo_mnjdor
			into v_url, v_cdgo_mnjdor
			from ws_d_provedores_api p
		   where p.id_prvdor = p_id_prvdor
			 and p.cdgo_api = 'PDF';
		exception
		  when others then
			raise excpcion_prsnlzda;
		end;

		-- Limpiar cabeceras
		APEX_WEB_SERVICE.g_request_headers.delete();

		-- Setear las cabeceras que se envian
		--APEX_WEB_SERVICE.g_request_headers(1).name := 'Content-Type'; --'Content-Type';
		--APEX_WEB_SERVICE.g_request_headers(1).value := 'application/json'; --'text/xml';

		--Se consulta valor de la propiedad Llave
		--v_llave := fnc_ob_propiedad_provedor(p_cdgo_clnte, null,null, p_id_prvdor, 'LLVE');

		v_url:= replace(v_url,'[LLAVE]',p_llave);
		v_url:= replace(v_url,'[RSLCION]',p_rslcion);
		v_url:= replace(v_url,'[ANIO_RSLCION]',p_anio_rslcion);
		v_url:= replace(v_url,'[CDGO_MNCPIO]',p_cdgo_mncpio);
		v_url:= replace(v_url,'[CDGO_DPTO]',p_cdgo_dpto);

		/*
		dbms_output.put_line('p_nmbre_prpdad: '||p_nmbre_prpdad);
		dbms_output.put_line('p_vlor_prpdad: '||p_vlor_prpdad);
		dbms_output.put_line('p_url: '||p_url);
		dbms_output.put_line('p_cdgo_mnjdor: '||p_cdgo_mnjdor);
		dbms_output.put_line('p_body: '||p_body);
		dbms_output.put_line('l_wallet.wallet_path: '||l_wallet.wallet_path);
		dbms_output.put_line('l_wallet.wallet_pwd: '||l_wallet.wallet_pwd);
		*/

		-- Llamado al webservice
		begin

			v_resp := APEX_WEB_SERVICE.MAKE_REST_REQUEST( p_url              => v_url,
                                                        p_http_method      => v_cdgo_mnjdor,
                                                        p_wallet_path      => l_wallet.wallet_path,
                                                        p_wallet_pwd       => l_wallet.wallet_pwd

														   );

		  pkg_sg_log.prc_rg_log(p_cdgo_clnte,null,v_nmbre_up,v_nvel,'Respuesta Obtenida ' || v_resp,1);

		exception
		  when others then
			select utl_http.get_detailed_sqlerrm into v_error_ws from dual;

			v_error_ws := sqlerrm;
			pkg_sg_log.prc_rg_log(p_cdgo_clnte,null,v_nmbre_up,v_nvel,'Error en Llamado al webservice--> ' ||v_error_ws,1);
			pkg_sg_log.prc_rg_log(p_cdgo_clnte,null,v_nmbre_up,v_nvel,'Error en Llamado al webservice(sqlerrm)--> ' ||sqlerrm,1);

			--dbms_output.put_line('sqlerrm '||sqlerrm);
			o_cdgo_rspsta  := 10;
			o_mnsje_rspsta := o_cdgo_rspsta || ' - Llamado al webservice: ' ||
							  v_error_ws;
			return;
		end;

		if v_resp is null then
		  pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,'Respuest webservice is null ',1);
		  raise excpcion_prsnlzda;
		end if;

		o_json_rspsta := v_resp;
		pkg_sg_log.prc_rg_log(p_cdgo_clnte,null,v_nmbre_up,v_nvel,'Saliendo '|| systimestamp,1);

  exception
    when excpcion_prsnlzda then
      o_cdgo_rspsta  := 40; -- Cambiado
      o_mnsje_rspsta := o_cdgo_rspsta ||
                        ' - No se logra obtener una respuesta del servicio.';
      pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,o_mnsje_rspsta ,1);
    when others then
      o_cdgo_rspsta  := 50;
      o_mnsje_rspsta := o_cdgo_rspsta ||
                        ' - Error al intentar consumir el servicio para conocer estado de la transacci?n. ' ||
                        sqlerrm;
	  pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,o_mnsje_rspsta ,1);

  end prc_co_pdf_resolucion_ws;


    /*UP que registra resoluciones capturadas del servicio en tabla de resoluciones CatastroPRO*/
	procedure prc_rg_resolucion_msvo(p_cdgo_clnte	        in number,
                                     p_id_impsto            in number,
                                     p_id_impsto_sbmpsto    in number) as

	v_nvel               	number;
    v_nmbre_up          	sg_d_configuraciones_log.nmbre_up%type := 'pkg_ws_resolucion_predio.prc_rg_resolucion_msvo';
	v_mnsje_rspsta 			varchar2(400);
	v_cdgo_rspsta			number;
	v_id_prvdor				number;
	v_username				varchar2(20);
	v_password				varchar2(20);
    v_json_token            clob;
	v_token					clob;
	v_json_rspsta			clob;

	v_llave					varchar2(100);
	v_fcha					varchar2(8);
	v_dias_vncdos			number;
	v_json_lte				clob;
	v_json_rslcion			clob;
	v_json_pdf				clob;
	v_id_rslcion_CtstoPro	number;

  begin

	--Determinamos el Nivel del Log de la UP
	v_nvel := pkg_sg_log.fnc_ca_nivel_log( p_cdgo_clnte , null , v_nmbre_up );
	v_mnsje_rspsta := 'Entrando ' || systimestamp;
	pkg_sg_log.prc_rg_log( p_cdgo_clnte , null , v_nmbre_up, v_nvel , v_mnsje_rspsta , 1 );

	--- Consultar datos parametros para la conexion
	-- Se busca el proveedor
	begin
		select id_prvdor
		into   v_id_prvdor
		from   ws_d_provedores
		where  cdgo_prvdor = 'CAT'; -- Codigo parametrizado del proveedor

	exception
		when others then
			rollback;
			v_cdgo_rspsta := 10;
			v_mnsje_rspsta := 'No. '||v_cdgo_rspsta||'. Error al consultar - proveedor codigo: CAT - '||sqlerrm;
			pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
			return;
	end;

	-- Obtenemos propiedades
	begin
		v_llave := fnc_ob_propiedad_provedor(p_cdgo_clnte, null,null, v_id_prvdor, 'LLVE');
	exception
		when others then
			v_cdgo_rspsta := 20;
			v_mnsje_rspsta := 'No. '||v_cdgo_rspsta||' - Falta parametrizacion para la llave ';
			pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
			return;
	end;

    v_mnsje_rspsta := 'Llave Capturado: ' ||v_llave;
    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);

	-- Consultar días vencidos
	begin
		v_dias_vncdos := pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte                => p_cdgo_clnte,
																		 p_cdgo_dfncion_clnte_ctgria => 'RSL',
																		 p_cdgo_dfncion_clnte        => 'CAT');
	exception
		when others then
			v_cdgo_rspsta := 20;
			v_mnsje_rspsta := 'No. '||v_cdgo_rspsta||' - Falta parametrizacion de días vencidos por consultar en parametrización del cliente.';
			pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
			return;
	end;

	--calcular rango de fecha a consultar
	begin
		v_fcha := to_char((sysdate - v_dias_vncdos),'YYYYMMDD');
	exception
		when others then
			v_cdgo_rspsta := 30;
			v_mnsje_rspsta := 'No. '||v_cdgo_rspsta||' - Error al calcular rango de fecha porconsultar ';
			pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
			return;
	end;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,'Antes de llamar UP prc_co_resolucion_lte_ws' ,1);
	--Consultar lote de resoluciones
	begin
		pkg_ws_resolucion_predio.prc_co_resolucion_lte_ws(p_cdgo_clnte      => p_cdgo_clnte,
														   p_id_prvdor      => v_id_prvdor,
														   p_llave			=> v_llave,
														   p_fcha_ini		=> v_fcha,
														   p_fcha_fin	 	=> v_fcha,
														   p_cdgo_dpto	 	=> substr(p_cdgo_clnte,1,2),
														   p_cdgo_mncpio	=> substr(p_cdgo_clnte,3,3),
														   o_mnsje_rspsta   => v_mnsje_rspsta,
														   o_cdgo_rspsta    => v_cdgo_rspsta,
														   o_json_rspsta    => v_json_lte);

			if v_cdgo_rspsta > 0 then
				v_cdgo_rspsta := 40;
				v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Error al consultar lote de resoluciones ' || v_mnsje_rspsta;
				pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
				return;
			end if;

		/* Ejemplo de Respuesta.
		{
			"RESOLUCIONES": [
				{
					"NResolucion": 6344,
					"AnoResolucion": 2025,
					"FechaFirmeza": "20260216",
					"ClaseTramite": "Mutación de Segunda"
				},
				{
					"NResolucion": 6353,
					"AnoResolucion": 2025,
					"FechaFirmeza": "20260216",
					"ClaseTramite": "Mutación de Quinta"
				}
			]
		}
		*/
	exception
		when others then
		v_cdgo_rspsta := 50;
		v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Error al consultar lote de resoluciones.' || sqlerrm;
		pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
		return;
	end;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,'despues de llamar UP prc_co_resolucion_lte_ws' ,1);

	--Validar que hayan resoluciones por procesar.
	if v_json_lte is null or dbms_lob.getlength(v_json_lte) < 27 then
		v_cdgo_rspsta := 60;
		v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '.JSON no tiene resoluciones para procesar';
		pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
		return;
	else

		begin
			--Se inserta en tabla de lote
			insert into si_g_resolucion_catastopro (json_CtstoPro)
				 values (v_json_lte) returning id_rslcion_CtstoPro into v_id_rslcion_CtstoPro;
		exception
			when others then
			v_cdgo_rspsta := 70;
			v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '.Error al insertar json lote en la tabla si_g_resolucion_catastopro';
			pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
			return;
		end;

		--Se recorre la repuesta --> lote de resoluciones.
		for c_lte in (select NResolucion, AnoResolucion, FechaFirmeza, ClaseTramite
					  from json_table(v_json_lte, '$.RESOLUCIONES[*]' columns (
																NResolucion 	varchar2 path '$.NResolucion',
																AnoResolucion 	varchar2 path '$.AnoResolucion',
																FechaFirmeza 	varchar2 path '$.FechaFirmeza',
																ClaseTramite 	varchar2 path '$.ClaseTramite')
															  )) loop


			-- Recorrer UP puntual para consultar data de resoluciones.
			begin
				pkg_ws_resolucion_predio.prc_co_resolucion_ws(p_cdgo_clnte      => p_cdgo_clnte,
															   p_id_prvdor      => v_id_prvdor,
															   p_llave			=> v_llave,
															   p_rslcion		=> c_lte.NResolucion,
															   p_anio_rslcion	=> c_lte.AnoResolucion,
															   p_cdgo_dpto	 	=> substr(p_cdgo_clnte,1,2),
															   p_cdgo_mncpio	=> substr(p_cdgo_clnte,3,3),
															   o_mnsje_rspsta   => v_mnsje_rspsta,
															   o_cdgo_rspsta    => v_cdgo_rspsta,
															   o_json_rspsta    => v_json_rslcion);

					if v_cdgo_rspsta > 0 then
						v_cdgo_rspsta := 80;
						v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Error al consultar data de resolución ' ||c_lte.NResolucion || 'msj: '|| v_mnsje_rspsta;
						pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);

						--Registrar en tabla traza.
						insert into si_g_rslcion_ctstrpro_trza (id_rslcion_ctstopro,rslcion,json_trmte,obsrvcion)
						values (v_id_rslcion_CtstoPro, c_lte.NResolucion, v_json_rslcion,v_mnsje_rspsta );
						commit;
						continue;

					end if;

			exception
				when others then
				v_cdgo_rspsta := 90;
				v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Error al consultar data de resolución ' ||c_lte.NResolucion || sqlerrm;
				pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);

				--Registrar en tabla traza.
				insert into si_g_rslcion_ctstrpro_trza (id_rslcion_ctstopro,rslcion,json_trmte,obsrvcion)
				values (v_id_rslcion_CtstoPro, c_lte.NResolucion, v_json_rslcion,v_mnsje_rspsta );
				commit;
				continue;

			end;

			--Consultar PDF de la resolución
			begin
				pkg_ws_resolucion_predio.prc_co_pdf_resolucion_ws(p_cdgo_clnte      => p_cdgo_clnte,
																   p_id_prvdor      => v_id_prvdor,
																   p_llave			=> v_llave,
																   p_rslcion		=> c_lte.NResolucion,
																   p_anio_rslcion	=> c_lte.AnoResolucion,
																   p_cdgo_dpto	 	=> substr(p_cdgo_clnte,1,2),
																   p_cdgo_mncpio	=> substr(p_cdgo_clnte,3,3),
																   o_mnsje_rspsta   => v_mnsje_rspsta,
																   o_cdgo_rspsta    => v_cdgo_rspsta,
																   o_json_rspsta    => v_json_pdf);

					if v_cdgo_rspsta > 0 then
						v_cdgo_rspsta := 100;
						v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Error al consultar PDF de resolución ' ||c_lte.NResolucion || 'msj: '|| v_mnsje_rspsta;
						pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);

						--Registrar en tabla traza.
						insert into si_g_rslcion_ctstrpro_trza (id_rslcion_ctstopro,rslcion,json_trmte,obsrvcion)
						values (v_id_rslcion_CtstoPro, c_lte.NResolucion, v_json_pdf,v_mnsje_rspsta );
						commit;
						continue;

					end if;

			exception
				when others then
				v_cdgo_rspsta := 110;
				v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Error al consultar PDF de resolución ' ||c_lte.NResolucion || sqlerrm;
				pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);

				--Registrar en tabla traza.
				insert into si_g_rslcion_ctstrpro_trza (id_rslcion_ctstopro,rslcion,json_trmte,obsrvcion)
				values (v_id_rslcion_CtstoPro, c_lte.NResolucion, v_json_rslcion,v_mnsje_rspsta );
				commit;
				continue;

			end;

			-- Si se logra obtener respuesta exitosa data y PDF de la resolución.
			if v_json_rslcion is not null or v_json_pdf is not null then

				begin
					--Se registra en tablas data consultada
					pkg_ws_resolucion_predio.prc_rg_resolucion_catastroPro(p_cdgo_clnte	            => p_cdgo_clnte,
																		   p_rslcion                => c_lte.NResolucion,
                                                                           p_json_rslcion           => v_json_rslcion,
																		   p_json_pdf		        => v_json_pdf,
                                                                           p_id_rslcion_ctstopro    => v_id_rslcion_ctstopro,
																		   o_mnsje_rspsta           => v_mnsje_rspsta,
																		   o_cdgo_rspsta            => v_cdgo_rspsta);

					if v_cdgo_rspsta <> 0  then
						v_cdgo_rspsta := 120;
						v_mnsje_rspsta := 'No. '||v_cdgo_rspsta|| '. Error al registrar data de resolución ' ||v_mnsje_rspsta;
						pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);

                        begin
						--Registrar en tabla traza.
						insert into si_g_rslcion_ctstrpro_trza (id_rslcion_ctstopro,rslcion,json_trmte,obsrvcion)
						values (v_id_rslcion_CtstoPro, c_lte.NResolucion, v_json_rslcion,v_mnsje_rspsta );
                        commit;

                        exception
                            when others then
                            v_cdgo_rspsta := 130;
                            v_mnsje_rspsta := 'No. '||v_cdgo_rspsta|| '. ---> Error al registrar data en si_g_rslcion_ctstrpro_trza ' ||sqlerrm;
                            pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
                        end;


						continue;

					end if;

				exception
					when others then
					v_cdgo_rspsta := 140;
					v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Error al llamar UP  prc_rg_resolucion_catastroPro - ' || sqlerrm;
					pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);

					--Registrar en tabla traza.
					insert into si_g_rslcion_ctstrpro_trza (id_rslcion_ctstopro,rslcion,json_trmte,obsrvcion)
					values (v_id_rslcion_CtstoPro, c_lte.NResolucion, v_json_rslcion,v_mnsje_rspsta );
					commit;
					continue;

				end;

			else
				v_cdgo_rspsta := 150;
				v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Json capturado de data/PDF del WS está null - ';
				pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);

				--Registrar en tabla traza.
				insert into si_g_rslcion_ctstrpro_trza (id_rslcion_ctstopro,rslcion,json_trmte,obsrvcion)
				values (v_id_rslcion_CtstoPro, c_lte.NResolucion, v_json_rslcion,v_mnsje_rspsta );
				commit;
				continue;

			end if; -- Si v_json_rslcion o v_json_pdf no es nulo

		end loop;

        --Se recorren las resoluciones a registrar en tabla de IGAC
        for c_data in (select distinct rslcion, rdccion
                         from si_g_resolucion_ctstopro_dtlle
                        where id_rslcion_ctstopro = v_id_rslcion_ctstopro) loop

            begin
                pkg_ws_resolucion_predio.prc_rg_resolucion_igac(  p_cdgo_clnte    		=> p_cdgo_clnte
                                                                , p_rslcion         	=> c_data.rslcion--(v_NumeroResolucion||v_AnoResolucion)
                                                                , p_rdccion         	=> c_data.rdccion --(v_NumeroRadicado||v_AnoRadicacion)
                                                                , p_id_rslcion_ctstopro => v_id_rslcion_ctstopro
                                                                , o_cdgo_rspsta   		=> v_cdgo_rspsta
                                                                , o_mnsje_rspsta  		=> v_mnsje_rspsta );

                if v_cdgo_rspsta <> 0  then
                    rollback;
                    v_cdgo_rspsta := 160;
                    v_mnsje_rspsta := 'No. '||v_cdgo_rspsta|| '. Error al registrar data de prc_rg_resolucion_igac ' ||v_mnsje_rspsta;
                    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);

                    --v_error := 1;
                    insert into si_g_rslcion_ctstrpro_trza (id_rslcion_ctstopro,rslcion,json_trmte,obsrvcion)
                    values (v_id_rslcion_CtstoPro, c_data.rslcion, v_json_rslcion,v_mnsje_rspsta );
                    commit;

                    continue;
                else
                    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,'----->>>>>> RESOLCUIÓN REGISTRADA EN TABLA IGAC ' || c_data.rslcion,1);
                    commit; -- Se confirma la resolcuión registrada.
                end if;

            exception
                when others then
                rollback;
                v_cdgo_rspsta := 170;
                v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Error al llamar UP  prc_rg_resolucion_igac - ' || sqlerrm;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);

                insert into si_g_rslcion_ctstrpro_trza (id_rslcion_ctstopro,rslcion,json_trmte,obsrvcion)
                values (v_id_rslcion_CtstoPro, c_data.rslcion, v_json_rslcion,v_mnsje_rspsta );
                commit;
                continue;

            end;

        end loop; --Se recorren las resoluciones a registrar en tabla de IGAC

        --Se actualiza estado a procesado en la tabla si_g_resolucion_catastopro
        update si_g_resolucion_catastopro
        set indcdor_prcsdo = 'S'
        where id_rslcion_ctstopro = v_id_rslcion_ctstopro;

        /*--Se aplican las resoluciones
        begin
            pkg_ws_resolucion_predio.prc_ap_resolucion(p_cdgo_clnte            => p_cdgo_clnte,
                                                        p_id_impsto            => p_id_impsto,
                                                        p_id_impsto_sbmpsto    => p_id_impsto_sbmpsto,
                                                        p_id_rslcion_ctstopro  => v_id_rslcion_ctstopro);
        exception
            when others then
            v_cdgo_rspsta := 180;
            v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Error al llamar UP  prc_ap_resolucion - ' || sqlerrm;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);

        end; */
    end if; --fin --Validar que hayan resoluciones por procesar.

    commit;

    v_mnsje_rspsta := 'Saliendo '|| systimestamp;
	pkg_sg_log.prc_rg_log( p_cdgo_clnte , null , v_nmbre_up, v_nvel , v_mnsje_rspsta , 1 );

  exception
	when others then
	v_cdgo_rspsta := 999;
	v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Exception no controlada - ' || sqlerrm;
	pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
	return;

  end prc_rg_resolucion_msvo;


    /*Consultar BLOB de sistemas externos para guardar docuemnto en disco*/
    procedure prc_co_adjntos_sstma_extrno ( p_cdgo_clnte  number,
                                            p_url           varchar2,
                                            o_blob          out blob,
                                            o_cdgo_rspsta out number,
                                            o_mnsje_rspsta  out varchar2
                                          )
    as
        v_nmbre_up    varchar2(200) := 'pkg_ws_resolucion_predio.prc_co_adjntos_sstma_extrno' ;
        v_nvel          number;
        v_url     varchar2(500);
        v_http_method   varchar2(10);
        --l_wallet        apex_190100.wwv_flow_security.t_wallet := apex_190100.wwv_flow_security.get_wallet;
        v_count         number := 0;
        v_blob          blob;
        v_tmno_blob     number := 0;
        v_status        varchar2(100);
        v_sqlerrm       varchar2(2000);
        v_error_ws      varchar2(2000);
    begin

        o_cdgo_rspsta := 0;
        -- Determinamos el nivel del Log de la UPv
        v_nvel := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nvel, 'Entrando - url: '||p_url, 1);

        v_http_method := 'GET';

        -- Limpiar cabeceras
        APEX_WEB_SERVICE.g_request_headers.delete();

        v_count := v_count + 1;
        APEX_WEB_SERVICE.g_request_headers(v_count).name := 'Content-Type';
        APEX_WEB_SERVICE.g_request_headers(v_count).value := 'application/json';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nvel, 'antes del llamado', 1);

        -- Llamado al webservice de PlaceToPay
        begin
            v_blob := APEX_WEB_SERVICE.MAKE_REST_REQUEST_B( p_url              => p_url,
                                                            p_http_method      => v_http_method,
                                                            p_wallet_path      => l_wallet.wallet_path,
                                                            p_wallet_pwd       => l_wallet.wallet_pwd

                                                           );

           -- insert into muerto (n_001,b_001) values (10101010,v_blob); commit;

        exception
            when others then
                select utl_http.get_detailed_sqlerrm into v_error_ws from dual;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nvel, 'error_ws: '||v_error_ws, 1);

                v_error_ws := sqlerrm;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nvel, 'error_sqlerrm: '||v_error_ws, 1);
        end;

        v_status    := apex_web_service.g_status_code;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nvel, 'v_status: '||v_status, 1);

        v_tmno_blob := dbms_lob.getlength(v_blob);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nvel, 'v_tmno_blob: '||v_tmno_blob, 1);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nvel, 'v_status: '||v_status, 1);
        -- insert into muerto (n_001, v_001,n_002, b_001 ) values(1, 'v_status: '||v_status, v_tmno_blob,v_blob); commit;

   /*     if v_status = 200 and v_tmno_blob > 5 then
            o_blob := v_blob;
        end if; */

        if v_status = 200 and v_tmno_blob > 500 then
            o_blob := v_blob;
        else
            o_cdgo_rspsta := 10;
            o_mnsje_rspsta := 'El archivo está vacio';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nvel, o_cdgo_rspsta||' - '||o_mnsje_rspsta, 1);
            o_blob := null;
        end if;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nvel, 'Saliendo', 1);
        exception
            when others then
                o_cdgo_rspsta := 100;
                o_mnsje_rspsta := sqlerrm;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nvel, o_cdgo_rspsta||' - '||o_mnsje_rspsta, 1);

    end prc_co_adjntos_sstma_extrno;

	/*Registrar en tabla y en Disco PDF de la resolución*/
	procedure prc_rg_resolucion_pdf(p_cdgo_clnte				in number,
									p_json_pdf					in clob,
									p_rslcion					in varchar2,
									o_mnsje_rspsta				out varchar2,
									o_cdgo_rspsta				out number,
									o_id_rsl_adjnto				out number)
	as

		v_nmbre_up        	varchar2(200) := 'pkg_ws_resolucion_predio.prc_rg_resolucion_pdf';
		v_nvel            	number;
		v_cdgo_rspsta     	number;
		v_mnsje_rspsta    	varchar2(4000);

		v_urlDocumento		varchar2(500);
		v_archvo_blob		blob;
		v_nmbre_archvo		varchar2(500);
		v_file_name			varchar2(500);
		v_directorio		constant varchar2(20)	:= 'TS_RESOLUCIONES';
        v_file_bfile        bfile;

	begin

        o_cdgo_rspsta := 0;
        -- Determinamos el nivel del Log de la UPv
        v_nvel := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nvel, 'Entrando', 1);

		-- 1. Validar que el p_json_pdf no sea null
		if p_json_pdf is not null then

			--Extraer la url del PDF
			begin
				select  UrlResolucion
				into    v_urlDocumento
				from    json_table(p_json_pdf, '$.TUrlResolucion[*]' columns (UrlResolucion varchar2(500) path '$.UrlResolucion')) ;
			exception
				when others then
					o_cdgo_rspsta := 10;
					o_mnsje_rspsta := 'No. '||o_cdgo_rspsta||' - No se pudo extraer url de la resolución';
					pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_nmbre_up,  v_nvel, 'Cod Respuesta: ' || o_mnsje_rspsta, 1);
					return;
			end;

		else
			o_cdgo_rspsta := 20;
			o_mnsje_rspsta := 'No. '||o_cdgo_rspsta||' - el p_json_pdf es nulo ';
			pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_nmbre_up,  v_nvel, 'Cod Respuesta: ' || o_mnsje_rspsta, 1);
			return;

		end if;

		--- 2. Consultar el documento dado en la URL
		begin
			pkg_ws_resolucion_predio.prc_co_adjntos_sstma_extrno (p_cdgo_clnte   => p_cdgo_clnte,
																  p_url          => v_urlDocumento,
																  o_blob         => v_archvo_blob,
																  o_cdgo_rspsta  => v_cdgo_rspsta,
																  o_mnsje_rspsta => v_mnsje_rspsta );

			pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_nmbre_up,  v_nvel, 'Encontró el archivo: ' || v_urlDocumento, 1);

			-- Interrumpir proceso si el documento está corrupto.
			if v_archvo_blob is null then
				o_cdgo_rspsta := 30;
				o_mnsje_rspsta := 'El documento está corrupto';
				pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_nmbre_up,  v_nvel,  o_mnsje_rspsta, 1);
				return;
			end if;

		exception
			when others then
				o_cdgo_rspsta := 40;
				o_mnsje_rspsta := '. Error al consultar el documento de la resolución: '|| p_rslcion;
				pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_nmbre_up,  v_nvel, o_cdgo_rspsta || o_mnsje_rspsta, 1);
				return;
		end;

		begin
			--- 3. Extraer nombre del PDF de la url consultada.
			v_nmbre_archvo := substr(v_urlDocumento,(instr(v_urlDocumento,'/',-1))+1);

			--- 4. Nombre del documento.
			v_file_name  := 'RESOLUCION_CATATROPRO_'||p_rslcion||'_'||v_nmbre_archvo ;  -- Nombre del archivo pdf

		exception
			when others then
				o_cdgo_rspsta := 50;
				o_mnsje_rspsta := '. Error al construir nombre del archivo para la resolución: '|| p_rslcion;
				pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_nmbre_up,  v_nvel, o_cdgo_rspsta || o_mnsje_rspsta, 1);
				return;
		end;

		-- 5. Registrar en Disco PDF.
		begin
			pkg_gd_utilidades.prc_rg_dcmnto_dsco (p_blob          => v_archvo_blob
												  , p_directorio    => v_directorio
												  , p_nmbre_archvo  => v_file_name
												  , o_cdgo_rspsta   => v_cdgo_rspsta
												  , o_mnsje_rspsta  => v_mnsje_rspsta);
			if v_cdgo_rspsta <> 0 then
				v_cdgo_rspsta  := 60;
				v_mnsje_rspsta := 'No. ' || v_cdgo_rspsta ||' Error al guardar en disco el PDF de la resolución: ' || p_rslcion;
				pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nvel, v_mnsje_rspsta, 1);
				return;
			end if;

		exception
			when others then
			v_cdgo_rspsta  := 70;
			v_mnsje_rspsta := 'No. ' || v_cdgo_rspsta ||' Error al guardar en disco el PDF de la resolución: ' || p_rslcion || ' - ' || sqlerrm;
			pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nvel, v_mnsje_rspsta, 1);
			return;
		end;

		--- 6. Asignacion del ruta del archivo
		v_file_bfile := bfilename(v_directorio, v_file_name);

		begin
		 -- 7. Se insertan los adjuntos
			 begin
				insert into si_g_resoluciones_adjunto(
														file_name,
														file_mimetype,
														file_bfile)
												values(
														v_file_name,
														'application/pdf',
														v_file_bfile)
												returning id_rsl_adjnto into o_id_rsl_adjnto;

			exception
				when others then
					v_cdgo_rspsta  := 70;
					v_mnsje_rspsta := 'No. ' || v_cdgo_rspsta ||'Error al guardar en tabla el PDF de la resolución: ' || p_rslcion || ' - ' || sqlerrm;
					pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nvel, v_mnsje_rspsta, 1);
					return;
			end; -- Fin Se insertan los adjuntos

		exception
			when others then
			v_cdgo_rspsta  := 80;
			v_mnsje_rspsta := 'No. ' || v_cdgo_rspsta ||'Error al guardar registro en tabla de adjuntos la resolución: ' || p_rslcion || ' - ' || sqlerrm;
			pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nvel, v_mnsje_rspsta, 1);
			return;
		end;

	pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nvel, 'Saliendo', 1);

    exception
		when others then
		v_cdgo_rspsta  := 100;
		v_mnsje_rspsta := 'No. ' || v_cdgo_rspsta ||' exceptión no controlada al registrar PDF resolución: ' || p_rslcion || ' - ' || sqlerrm;
		pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nvel, v_mnsje_rspsta, 1);
		return;
	end prc_rg_resolucion_pdf;


   /*UP que registra resoluciones capturadas del servicio en tabla de resoluciones puntual*/
	procedure prc_rg_resolucion_catastroPro(p_cdgo_clnte	  		in number,
											p_rslcion		  		in varchar2,
											p_json_rslcion	  		in clob,
											p_json_pdf        		in clob,
											p_id_rslcion_ctstopro	in number,
											o_mnsje_rspsta    		out varchar2,
											o_cdgo_rspsta     		out number
											) as

	v_nvel               	number;
    v_nmbre_up          	sg_d_configuraciones_log.nmbre_up%type := 'pkg_ws_resolucion_predio.prc_rg_resolucion_catastroPro';
	v_mnsje_rspsta 			varchar2(400);
	v_cdgo_rspsta			number;
	v_id_rslcion_rltix		number;
	v_cntdad_trmtes			number;
	v_json_trmte			clob;
    v_json_rspnsble         clob;
    v_cntdad_vgncias        number;
    v_inx                   number;

	/*v_Area_de_terreno 		si_g_resolucion_ctstopro_dtlle.area_trrno%type;
	v_Area_de_construccion 	si_g_resolucion_ctstopro_dtlle.area_cnstrda%type;
	v_Departamento 			si_g_resolucion_ctstopro_dtlle.cdgo_dprtmnto%type;
	v_Municipio				si_g_resolucion_ctstopro_dtlle.cdgo_mncpio%type;
	v_NPN					si_g_resolucion_ctstopro_dtlle.rfrncia_igac%type;
	v_Direccion 			si_g_resolucion_ctstopro_dtlle.drccion%type;
	v_Destino_economico 	si_g_resolucion_ctstopro_dtlle.dstno_ecnmco%type;
	v_nmro_prdial_antrior 	si_g_resolucion_ctstopro_dtlle.nmro_prdial_antrior%type;
	v_nupre 				si_g_resolucion_ctstopro_dtlle.npre%type;
	v_mtrcla_inmblria 		si_g_resolucion_ctstopro_dtlle.mtrcla_inmblria%type;
	v_cdgo_estrto 			si_g_resolucion_ctstopro_dtlle.cdgo_estrto%type;
    v_EstadoPredio          varchar2(1);*/

	v_TipoTramite			si_g_resolucion_ctstopro_dtlle.tpo_trmte%type;
	v_clse_mtcion 			si_g_resolucion_ctstopro_dtlle.clse_mtcion%type;
	v_NumeroRadicado 		si_g_resolucion_ctstopro_dtlle.rdccion%type;
	v_NumeroResolucion 		si_g_resolucion_ctstopro_dtlle.rslcion%type;

    v_vgncia_actual         number := pkg_gn_generalidades.fnc_cl_defniciones_cliente( p_cdgo_clnte => p_cdgo_clnte
                                                                                    , p_cdgo_dfncion_clnte_ctgria => 'LQP'
                                                                                    , p_cdgo_dfncion_clnte => 'VGN' );
    v_cnto                  number := 0;
    v_error                 number := 0;
	v_FechaFirmeza			varchar2(8);
	v_AnoResolucion			varchar2(4);
	v_AnoRadicacion			varchar2(4);
	v_Norte					si_i_predios.lttud%type;
	v_Este					si_i_predios.lngtud%type;
	v_id_rsl_adjnto			number;

    v_AnioActualizacionCatastral    varchar2(1);
    v_Vigencia              varchar2(10);
    v_Avaluo                number;
    v_Decreto               varchar2(50);

    v_id_prcso_crga_t1      et_g_procesos_carga.id_prcso_crga%type;
    v_id_prcso_crga_pdre_t1 et_g_procesos_carga.id_prcso_crga_pdre%type;
    v_id_prcso_intrmdia_t1  et_g_procesos_intermedia.id_prcso_intrmdia%type;
    v_id_prcso_crga_t2      et_g_procesos_carga.id_prcso_crga%type;
    v_id_prcso_crga_pdre_t2 et_g_procesos_carga.id_prcso_crga_pdre%type;
    v_id_prcso_intrmdia_t2  et_g_procesos_intermedia.id_prcso_intrmdia%type;
    v_id_prcso_crga_t3      et_g_procesos_carga.id_prcso_crga%type;
    v_id_prcso_crga_pdre_t3 et_g_procesos_carga.id_prcso_crga_pdre%type;
    v_id_prcso_intrmdia_t3  et_g_procesos_intermedia.id_prcso_intrmdia%type;


    begin

	--Determinamos el Nivel del Log de la UP
	v_nvel := pkg_sg_log.fnc_ca_nivel_log( p_cdgo_clnte , null , v_nmbre_up );
	v_mnsje_rspsta := 'Entrando ' || systimestamp;
	pkg_sg_log.prc_rg_log( p_cdgo_clnte , null , v_nmbre_up, v_nvel , v_mnsje_rspsta , 1 );

    -- Se consultan valores de carga del archivo ETL FIJO.
    /*De acuerdo al proceso en SMART, está desarrollado para aplicar solo resoluciones que vienen de un proceso ETL,
    debido a nuevo proceso donde las resoluciones se registran de sistema externo (Integración por web service)
    Se cargó un archivo fijo para respetar valor requerio (Todo procedo de resolución amarrado a un proceso ETL)
    El dato es fijo para todos las resoluciones que vengan del mismo web services (CATASTROPRO)
    */
    begin
        select a.id_prcso_crga, a.id_prcso_crga id_prcso_crga_pdre, b.id_prcso_intrmdia
        into v_id_prcso_crga_t1, v_id_prcso_crga_pdre_t1, v_id_prcso_intrmdia_t1
        from et_g_procesos_carga a
        join et_g_procesos_intermedia b on a.id_prcso_crga = b.id_prcso_crga
        where file_name = 'RESOLUCIONES_CATASTROPRO_FIJO.txt'
        order by 3 desc
        fetch first 1 row only
        ;

        /*select a.id_prcso_crga, a.id_prcso_crga_pdre, b.id_prcso_intrmdia
        into v_id_prcso_crga_t2, v_id_prcso_crga_pdre_t2, v_id_prcso_intrmdia_t2
        from et_g_procesos_carga a
        join et_g_procesos_intermedia b on a.id_prcso_crga = b.id_prcso_crga
        where file_name = 'R2-RESOLUCIONES_CATASTROPRO_FIJO.txt'
        order by 3 desc
        fetch first 1 row only
        ;

        select a.id_prcso_crga, a.id_prcso_crga_pdre, b.id_prcso_intrmdia
        into v_id_prcso_crga_t3, v_id_prcso_crga_pdre_t3, v_id_prcso_intrmdia_t3
        from et_g_procesos_carga a
        join et_g_procesos_intermedia b on a.id_prcso_crga = b.id_prcso_crga
        where file_name = 'R3-RESOLUCIONES_CATASTROPRO_FIJO.txt'
        order by 3 desc
        fetch first 1 row only
        ;*/
    exception
        when others then
            v_cdgo_rspsta := 1;
            v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Error al consultar proceso RESOLUCIONES_CATASTROPRO_FIJO, debe cargar archivo en proceso ETL ' || sqlerrm;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
            return;
    end;

		begin
			--Se registra el adjunto.
			pkg_ws_resolucion_predio.prc_rg_resolucion_pdf(p_cdgo_clnte				=> p_cdgo_clnte,
														p_json_pdf					=> p_json_pdf,
														p_rslcion					=> p_rslcion,
														o_mnsje_rspsta				=> v_mnsje_rspsta,
														o_cdgo_rspsta				=> v_cdgo_rspsta,
														o_id_rsl_adjnto				=> v_id_rsl_adjnto);

			if v_cdgo_rspsta <> 0 then
				v_cdgo_rspsta := 10;
				v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Error al registrar PDF.- p_rslcion: ' ||p_rslcion;
				pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
				return;
			end if;

		exception
			when others then
			v_cdgo_rspsta := 20;
			v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Error al registrar PDF.- p_rslcion: ' ||p_rslcion || ' - ' || sqlerrm;
			pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
			return;
		end;

		--1. homologar Tipo tramite, mutación.
		begin
			select b.cdgo_trmte_tpo, b.cdgo_mtcion_clse, a.AnoRadicacion, a.NumeroRadicado, a.AnoResolucion, a.NumeroResolucion, a.FechaFirmeza
			into v_TipoTramite, v_clse_mtcion, v_AnoRadicacion, v_NumeroRadicado, v_AnoResolucion, v_NumeroResolucion, v_FechaFirmeza
			from json_table(p_json_rslcion, '$.RESOLUCION[*]' columns (
												FechaFirmeza varchar(10) path '$.FechaFirmeza',
												NombreTipoTramite varchar2(50) path '$.ClaseTramite',
												NumeroRadicado varchar2(50) path '$.NRadicacion',
                                                AnoRadicacion varchar2(50) path '$.AnoRadicacion',
												NumeroResolucion varchar2(50) path '$.NResolucion',
                                                AnoResolucion varchar2(50) path '$.AnoResolucion')) a
			left join df_s_hmlgcnes_trmte_ctstropro b on b.dscrpcion_trmte_ctstropro = a.NombreTipoTramite;
		exception
			when others then
				--rollback;
				v_cdgo_rspsta := 30;
				v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Error al homologar tipo de tramite.- ' || sqlerrm;
				pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
				return;
				/*
				begin
					insert into si_g_rslcion_rltix_dtll_trza (id_rslcion_rltix,json_trmte,obsrvcion)
					values (v_id_rslcion_rltix,v_json_trmte,v_mnsje_rspsta);
				exception
					when others then
					v_cdgo_rspsta := 85;
					v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Error al insertar traza.- ' || sqlerrm;
					pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
				end;
				commit;
				continue;*/
		end;

		if v_TipoTramite is null or v_clse_mtcion is null then
				v_cdgo_rspsta := 40;
				v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. No exite homologación para el tipo de tramite. N° Resolución: ' || v_NumeroResolucion;
				pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
				return;
		end if;

		--2. Extraer información del predio
		for c_pdrios in (select a.InscripcionCatastral
						  , a.NumeroPredial
						  , a.VigenciaFiscal
						  , a.Destino_economico
						  , a.Area_de_terreno
						  , a.Area_de_construccion
						  , (a.CodigoORIP || '-' || a.Matricula) mtrcla_inmblria
						  , a.EstadoPredio
						  , a.Avaluo
						  , b.Direccion
						  from json_table(p_json_rslcion, '$.PREDIO[*]' columns (
														InscripcionCatastral varchar2(8) path '$.InscripcionCatastral',
														NumeroPredial varchar2(50) path '$.NumeroPredial',
														VigenciaFiscal varchar2(8) path '$.VigenciaFiscal',
														Destino_economico varchar2(30) path '$.DestinoEconomico',
														Area_de_terreno number path '$.AreaT',
														Area_de_construccion number path '$.AreaC',
														CodigoORIP varchar2(50) path '$.CodigoORIP',
														Matricula varchar2(50) path '$.Matricula',
														EstadoPredio    varchar2(1) path '$.CancelaInscribe',
														Avaluo          number path '$.Avaluo'
														)) a
						join json_table(p_json_rslcion, '$.DIRECCION[*]' columns (
														Direccion varchar2(500) path '$.Direccion',
														NumeroPredial varchar2(50) path '$.NumeroPredial',
														EstadoPredio varchar2(1) path '$.CancelaInscribe'
														)) b on a.NumeroPredial = b.NumeroPredial and a.EstadoPredio = b.EstadoPredio)
		loop

			v_vgncia_actual := pkg_gn_generalidades.fnc_cl_defniciones_cliente( p_cdgo_clnte => p_cdgo_clnte
																			, p_cdgo_dfncion_clnte_ctgria => 'LQP'
																			, p_cdgo_dfncion_clnte => 'VGN' );


            begin
                --Capturar información de georeferencial
                select Norte,Este
                into v_Norte, v_Este
                from json_table(
                        p_json_rslcion,
                        '$.LOCALIZACION_GEOGRAFICA[*]'
                        columns (
                            NumeroPredial 		varchar2(50) path '$.NumeroPredial',
                            EstadoPredio 		varchar2(1) path '$.CancelaInscribe',
                            Norte 				varchar2(500) path '$.Norte',
                            Este  				varchar2(500) path '$.Este'
                        )
                     ) a
                where a.NumeroPredial = c_pdrios.NumeroPredial and a.EstadoPredio = c_pdrios.EstadoPredio;

            exception
                when others then
                    v_Norte := null;
                    v_Este := null;
            end;

			v_cnto := v_cnto + 1;

			 begin
				select json_value(p_json_rslcion, '$.DECRETO.size()')
				into v_cntdad_vgncias
				from dual;

				select Decreto,Avaluo,Vigencia,AnioActualizacionCatastral
				into v_Decreto, v_Avaluo, v_Vigencia, v_AnioActualizacionCatastral
				from json_table(
						p_json_rslcion,
						'$.DECRETO[*]'
						columns (
							NumeroPredial 				varchar2(50) path '$.NumeroPredial',
							EstadoPredio 				varchar2(1) path '$.CancelaInscribe',
							Decreto 					varchar2(50) path '$.Decreto',
							AnioActualizacionCatastral  varchar2(1) path '$.AnioActualizacionCatastral',
							Avaluo          			number path '$.Avaluo',
							Vigencia 					varchar2(10) path '$.Vigencia'
						)
					 ) a
				where a.NumeroPredial = c_pdrios.NumeroPredial and a.EstadoPredio = c_pdrios.EstadoPredio;

				if v_cntdad_vgncias = 0 then
					v_vgncia_actual := v_vgncia_actual + 1;
				end if;

			exception
				when others then
				v_cntdad_vgncias := 0;
				v_vgncia_actual := v_vgncia_actual + 1;
			end;

			--v_mnsje_rspsta := '. Antes de recorrer responsables de ' || c_pdrios.nupre ;
			--pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);


				--3. Extraer información de los responsables.
				for c_rsponsble in
				(select trim(a.Nombre1 || ' ' || a.Nombre2 || ' ' || a.Apellido1 || ' ' || a.Apellido2) NombreCompleto
						, a.RazonSocial
						, a.DigitoVerificacion
						, (a.PorcentajeCopropiedad * 100) PorcentajeCopropiedad
						, a.TipoDocumento Tipo_de_documento
						, a.numero_de_documento
						, a.CancelaInscribe
						, to_char(row_number() over (order by a.numero_de_documento), 'FM000') nmro_orden_rspnsble
						, to_char(count(1) over (order by null), 'FM000') ttal_rgstro_rspnsble
						, row_number() over (order by a.numero_de_documento) nmro_orden_rspnsble_ln
					from json_table(
						p_json_rslcion,'$.PROPIETARIO[*]' columns (
								NumeroPredial 			varchar2(50) path '$.NumeroPredial',
								CancelaInscribe 		varchar2(1) path '$.CancelaInscribe',
								Nombre1 				varchar2(100) path '$.Nombre1',
								Nombre2 				varchar2(100) path '$.Nombre2',
								Apellido1 				varchar2(100) path '$.Apellido1',
								Apellido2 				varchar2(100) path '$.Apellido2',
								RazonSocial 			varchar2(200) path '$.RazonSocial',
								TipoDocumento 			varchar2(1) path '$.TipoDocumento',
								numero_de_documento 	varchar2(100) path '$.NumeroDocumento',
								DigitoVerificacion 		varchar2(200) path '$.DigitoVerificacion',
								PorcentajeCopropiedad 	number(5,5) path '$.PorcentajeCopropiedad'
						)
					 ) a
                     where a.NumeroPredial = c_pdrios.NumeroPredial and a.CancelaInscribe = c_pdrios.EstadoPredio
                     order by PorcentajeCopropiedad desc
				) loop

					--Insertar en T1
					begin

						insert into si_g_resolucion_ctstopro_dtlle
						(id_rslcion_ctstopro, json_trmte
						, id_prcso_crga, id_prcso_intrmdia, nmero_lnea, cdgo_dprtmnto, cdgo_mncpio
						, rslcion, rdccion, tpo_trmte, clse_mtcion, rfrncia_igac
						, cncla_inscrbe, tpo_rgstro, nmro_orden, ttal_rgstro, nmbre_prptrio
						, estdo_cvil, tpo_dcmnto, nmro_dcmnto, drccion--, cmna
						, dstno_ecnmco, area_trrno, area_cnstrda, avluo_ctstral, vgncia_igac
						/*, nmro_prdial_antrior*/, id_prcso_crga_pdre
						/*, cdgo_estrto*/, mtrcla_inmblria
                        , lttud ,lngtud
						, prcntje_prtcpcion, dgto_vrfccion
						, Inscrpcion_Ctstral,Vgncia_Fscal
						, id_rsl_adjnto, Fcha_Frmza)
						values
						(p_id_rslcion_ctstopro, p_json_rslcion
						, v_id_prcso_crga_t1, v_id_prcso_intrmdia_t1, c_rsponsble.nmro_orden_rspnsble_ln, substr(p_cdgo_clnte,1,2), substr(p_cdgo_clnte,3,3)
						, (v_NumeroResolucion||v_AnoResolucion), (v_NumeroRadicado||v_AnoRadicacion), v_TipoTramite, v_clse_mtcion, c_pdrios.NumeroPredial
						, c_pdrios.EstadoPredio, 1, c_rsponsble.nmro_orden_rspnsble,c_rsponsble.ttal_rgstro_rspnsble, nvl(c_rsponsble.RazonSocial,c_rsponsble.NombreCompleto)
						, 0 , c_rsponsble.Tipo_de_documento, c_rsponsble.Numero_de_documento, c_pdrios.Direccion--, v_CMNA
						, c_pdrios.Destino_economico, c_pdrios.Area_de_terreno, c_pdrios.Area_de_construccion,c_pdrios.Avaluo, ('0101'||v_AnoResolucion)
						/*, c_pdrios.nmro_prdial_antrior*/, v_id_prcso_crga_pdre_t1
						/*, c_pdrios.cdgo_estrto*/ , c_pdrios.mtrcla_inmblria
                        , v_Norte, v_Este
						, c_rsponsble.PorcentajeCopropiedad,c_rsponsble.DigitoVerificacion
						, c_pdrios.InscripcionCatastral, c_pdrios.VigenciaFiscal
						, v_id_rsl_adjnto, v_FechaFirmeza);

					exception
						when others then
							rollback;
							v_cdgo_rspsta := 50;
							v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Error al insertar data T1.- ' || sqlerrm;
							pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
							v_error := 1;


							begin
                                insert into si_g_rslcion_ctstrpro_trza (id_rslcion_ctstopro,json_trmte,obsrvcion)
                                values (p_id_rslcion_ctstopro,v_json_trmte,v_mnsje_rspsta);
                            exception
                                when others then
                                v_cdgo_rspsta := 125;
                                v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Error al insertar traza.- ' || sqlerrm;
                                pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
                            end;
                            commit;

                            return;
					end;

				end loop;

                    --Información de tipo 2
                        begin

                            insert into si_g_resolucion_ctstopro_dtlle
                            (id_rslcion_ctstopro, json_trmte
                            , id_prcso_crga, id_prcso_intrmdia, nmero_lnea, cdgo_dprtmnto, cdgo_mncpio
                            , rslcion, rdccion, tpo_trmte, clse_mtcion, rfrncia_igac
                            , cncla_inscrbe, tpo_rgstro, nmro_orden, ttal_rgstro--, nmbre_prptrio
                            , estdo_cvil/*, tpo_dcmnto, nmro_dcmnto*/, drccion--, cmna
                            , dstno_ecnmco, area_trrno, area_cnstrda, avluo_ctstral, vgncia_igac
                            /*, nmro_prdial_antrior*/, id_prcso_crga_pdre
                            /*, cdgo_estrto*/, mtrcla_inmblria
							, lttud ,lngtud
							, Inscrpcion_Ctstral,Vgncia_Fscal
							, id_rsl_adjnto, Fcha_Frmza)
                            values
                            (p_id_rslcion_ctstopro, p_json_rslcion
                            , v_id_prcso_crga_t1, v_id_prcso_intrmdia_t1, 1, substr(p_cdgo_clnte,1,2), substr(p_cdgo_clnte,3,3)
                            , (v_NumeroResolucion||v_AnoResolucion), (v_NumeroRadicado||v_AnoRadicacion), v_TipoTramite, v_clse_mtcion, c_pdrios.NumeroPredial
                            , c_pdrios.EstadoPredio, 2, '001', '001' --, c_rsponsble.Nombre
                            ,' '/* c_rsponsble.Tipo_de_documento, c_rsponsble.Numero_de_documento*/, c_pdrios.Direccion--, v_CMNA
                            , c_pdrios.Destino_economico, c_pdrios.Area_de_terreno, c_pdrios.Area_de_construccion,c_pdrios.Avaluo, ('0101'||v_AnoResolucion)
                            /*, c_pdrios.nmro_prdial_antrior*/, v_id_prcso_crga_pdre_t1
                            /*, c_pdrios.cdgo_estrto*/, c_pdrios.mtrcla_inmblria
							, v_Norte, v_Este
							, c_pdrios.InscripcionCatastral, c_pdrios.VigenciaFiscal
							, v_id_rsl_adjnto, v_FechaFirmeza);

                        exception
                            when others then
                                rollback;
                                v_cdgo_rspsta := 60;
                                v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Error al insertar data T2.- ' || sqlerrm;
                                pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
                                v_error := 1;

                                begin
                                    insert into si_g_rslcion_ctstrpro_trza (id_rslcion_ctstopro,json_trmte,obsrvcion)
                                    values (p_id_rslcion_ctstopro,v_json_trmte,v_mnsje_rspsta);
                                exception
                                    when others then
                                    v_cdgo_rspsta := 125;
                                    v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Error al insertar traza.- ' || sqlerrm;
                                    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
                                end;
                                commit;
                                return;
                        end;

                    --3. Información de las vigencias fiscales.
                        for c_rvgncia in
                        (select case when a.Decreto is null then 'ACT. CATASTRAL ' else 'DECRETO ' || a.Decreto end Decreto
                                , a.Vigencia
                                , a.Avaluo
                                , substr(a.Vigencia,7,4) annio
								, a.AnioActualizacionCatastral
                                , to_char(row_number() over (order by substr(a.Vigencia,7,4) desc), 'FM000') nmro_orden_vgncia
                                , to_char(count(1) over (order by null), 'FM000') ttal_rgstro_vgncia
                                , row_number() over (order by substr(a.Vigencia,7,4) desc) nmro_orden_vgncia_ln
                         from
                         json_table(
                                p_json_rslcion,
                                '$.DECRETO[*]'
                                columns (
                                    NumeroPredial 				varchar2(50) path '$.NumeroPredial',
                                    EstadoPredio 				varchar2(1) path '$.CancelaInscribe',
									Decreto 					varchar2(50) path '$.Decreto',
                                    AnioActualizacionCatastral  varchar2(1) path '$.AnioActualizacionCatastral',
									Avaluo          			number path '$.Avaluo',
									Vigencia 					varchar2(10) path '$.Vigencia'
                                )
                            ) a
                    where a.NumeroPredial = c_pdrios.NumeroPredial

                    /*(v_json_trmte,'$.Reporte.VigenciasFiscales[*]' columns(
                                                        Decreto varchar2(100) path '$.Decreto',
                                                        annio varchar2(4) path '$.Año',
                                                        Avaluo varchar2(50) path '$.Avaluo'
                                        )) a */
                        ) loop
                        --Insertar en T3
                            begin

                                insert into si_g_resolucion_ctstopro_dtlle
                                (id_rslcion_ctstopro, json_trmte
                                , id_prcso_crga, id_prcso_intrmdia, nmero_lnea, cdgo_dprtmnto, cdgo_mncpio
                                , rslcion, rdccion, tpo_trmte, clse_mtcion, rfrncia_igac
                                , cncla_inscrbe, tpo_rgstro, nmro_orden, ttal_rgstro/*, nmbre_prptrio*/
                                , estdo_cvil/*, tpo_dcmnto, nmro_dcmnto*/, drccion--, cmna
                                , dstno_ecnmco, area_trrno, area_cnstrda, avluo_ctstral, vgncia_igac
                                /*, nmro_prdial_antrior*/, id_prcso_crga_pdre
                                /*, cdgo_estrto*/, mtrcla_inmblria
                                , lttud ,lngtud
                                , decrtos
								, anio_actlzcion_ctstral
								, Inscrpcion_Ctstral, Vgncia_Fscal
								, id_rsl_adjnto, Fcha_Frmza)
                                values
                                (p_id_rslcion_ctstopro, p_json_rslcion
                                , v_id_prcso_crga_t1, v_id_prcso_intrmdia_t1,c_rvgncia.nmro_orden_vgncia_ln, substr(p_cdgo_clnte,1,2), substr(p_cdgo_clnte,3,3)
                                , (v_NumeroResolucion||v_AnoResolucion), (v_NumeroRadicado||v_AnoRadicacion), v_TipoTramite, v_clse_mtcion, c_pdrios.NumeroPredial
                                , 'I', 3, c_rvgncia.nmro_orden_vgncia,c_rvgncia.ttal_rgstro_vgncia/*, c_rvgncia.Nombre*/
                                ,' '/* c_rvgncia.Tipo_de_documento, c_rvgncia.Numero_de_documento*/, c_pdrios.Direccion--, v_CMNA
                                , c_pdrios.Destino_economico, c_pdrios.Area_de_terreno, c_pdrios.Area_de_construccion, c_rvgncia.Avaluo, ('0101'||c_rvgncia.annio)
                                /*, c_pdrios.nmro_prdial_antrior*/, v_id_prcso_crga_pdre_t1
                                /*, c_pdrios.cdgo_estrto*/, c_pdrios.mtrcla_inmblria
                                , v_Norte, v_Este
                                , ( c_rvgncia.Decreto ||' $' ||c_rvgncia.Avaluo || ' VIGENCIA FISCAL: ' || c_rvgncia.Vigencia )
                                , c_rvgncia.AnioActualizacionCatastral
								, c_pdrios.InscripcionCatastral, c_pdrios.VigenciaFiscal
								, v_id_rsl_adjnto, v_FechaFirmeza);

								--DECRETO 2410/2019           $17,951,000.00 VIGENCIA FISCAL: 01/01/2020
                                --ACT. CATASTRAL      $126,000,000.00 VIGENCIA FISCAL: 01/01/2013

                            exception
                                when others then
                                    rollback;
                                    v_cdgo_rspsta := 70;
                                    v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Error al insertar data T3.- ' || sqlerrm;
                                    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
                                    v_error := 1;

                                    begin
                                        insert into si_g_rslcion_ctstrpro_trza (id_rslcion_ctstopro,json_trmte,obsrvcion)
                                        values (p_id_rslcion_ctstopro,v_json_trmte,v_mnsje_rspsta);
                                    exception
                                        when others then
                                        v_cdgo_rspsta := 125;
                                        v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Error al insertar traza.- ' || sqlerrm;
                                        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
                                    end;
                                    commit;

                                    return;
                            end;

                        end loop; --fin t3

                end loop; --Fin de loop (Predios)

        commit; -- Confirmar registros de tabla catastropro

		v_mnsje_rspsta := 'Fin del tramite uno a uno.';
		pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);

		--Se presentaron errores en el registro del tramite
		if v_error > 0 then
			v_cdgo_rspsta := 80;
			v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Se presentó error durante el registro del tramite.';
			pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
			v_error := 1;
			return;

		else -- Se actualiza estado a procesado.

			update si_g_resolucion_ctstopro_dtlle
			   set indcdor_prcsdo = 'S'
			 where rslcion = v_NumeroResolucion
			   and rdccion = v_NumeroRadicado
			   and id_rslcion_ctstopro = p_id_rslcion_ctstopro;

		end if;


        o_mnsje_rspsta := 'Saliendo '|| systimestamp;
        pkg_sg_log.prc_rg_log( p_cdgo_clnte , null , v_nmbre_up, v_nvel , o_mnsje_rspsta , 1 );

    exception
        when others then
            v_cdgo_rspsta := 80;
			v_mnsje_rspsta := 'Exeption no controlada';
			pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
    end prc_rg_resolucion_catastroPro;

   /*UP que pobla tablas de resluciones IGAC, en base a la información almacenada en tabla de resoluciones CATASTROPRO*/
    procedure prc_rg_resolucion_igac( p_cdgo_clnte    		in  df_s_clientes.cdgo_clnte%type
                                    , p_rslcion         	in  si_g_resolucion_ctstopro_dtlle.rslcion%type
                                    , p_rdccion         	in  si_g_resolucion_ctstopro_dtlle.rdccion%type
                                    , p_id_rslcion_CtstoPro in  si_g_resolucion_ctstopro_dtlle.id_rslcion_CtstoPro%type
                                    , o_cdgo_rspsta   		out number
                                    , o_mnsje_rspsta  		out varchar2 )
    as

	    v_nvel              number;
        v_nmbre_up          sg_d_configuraciones_log.nmbre_up%type := 'pkg_ws_resolucion_predio.prc_rg_resolucion_igac';
		v_dcrtos            number;
		v_vgncia_actual     number;
		v_exste_mtrcla      number;
		v_exste_rspnsble    number;
		v_exste_dcrto       number;
		v_vgncia_t1         varchar2(10);
		v_avluo_ctstral_t1  number := 0;
		v_vgncia_t3         number;
        v_id_rslcion_igac_t1    number;
        v_existe_rslcion    number := 0;

	begin

        --Determinamos el Nivel del Log de la UP
        v_nvel := pkg_sg_log.fnc_ca_nivel_log( p_cdgo_clnte , null , v_nmbre_up );
        o_mnsje_rspsta := 'Entrando ' || systimestamp;
        pkg_sg_log.prc_rg_log( p_cdgo_clnte , null , v_nmbre_up, v_nvel , o_mnsje_rspsta , 1 );

		v_vgncia_actual := pkg_gn_generalidades.fnc_cl_defniciones_cliente( p_cdgo_clnte => p_cdgo_clnte
																			, p_cdgo_dfncion_clnte_ctgria => 'LQP'
																			, p_cdgo_dfncion_clnte => 'VGN' );


        --Consultar si la resolución ya está registrada en las tablas de IGAC.
        /*El cargue de resoluciones se registra actualmente por ETL, de capturar resoluciones
        en el servicio WEB que ya estén registradas por un proceso de ETL, no se debe volver
        a registrar en las tablas de IGAC.

        Se registra en tabla traza razón por la cual resoluciones capturadas
        en el servicio no se pueden registrar en tablas de resoluciones.*/

        --Consultar si la resolución a registrar ya existe en tablas.
        begin
            select 1
            into v_existe_rslcion
            from si_g_resolucion_igac_t1 a
            where a.rslcion = p_rslcion
            and a.rdccion = p_rdccion
            fetch first 1 row only;
        exception
            when no_data_found then
                null; --segir adelante, si no la encuentra, se debe registrar.
            when others then
                v_existe_rslcion := 1;
        end;

        if v_existe_rslcion > 0 then
            o_cdgo_rspsta  := 10;
			o_mnsje_rspsta := 'Resolución ya se encuentra registrada previamente por proceso ETL';
            pkg_sg_log.prc_rg_log( p_cdgo_clnte, null , v_nmbre_up, v_nvel , 'Resolución ' || p_rslcion || ' no se puede registrar porque ya existe.', 1 );
            -- Se registra en tabla traza.
            insert into si_g_rslcion_ctstrpro_trza (id_rslcion_ctstopro,rslcion,obsrvcion)
            values (p_id_rslcion_CtstoPro, p_rslcion,'Resolución ya se encuentra registrada previamente por proceso ETL' );

            return;
        end if;

        --Recorrer la resolución por registrar.
		for dcrtos in ( select /*+ RESULT_CACHE */
								*
						from    si_g_resolucion_ctstopro_dtlle a
						where   a.indcdor_prcsdo = 'N'
						and 	a.rslcion = p_rslcion
                        and     a.rdccion = p_rdccion
                        and     a.id_rslcion_CtstoPro = p_id_rslcion_CtstoPro
                        --and     a.rslcion = '3421'
						order by rfrncia_igac, to_number(a.nmro_orden)

					  )
		loop

		pkg_sg_log.prc_rg_log( p_cdgo_clnte, null , v_nmbre_up, v_nvel , 'FOR DE DECRETOS: '||dcrtos.rslcion||' - rfrncia_igac: '||dcrtos.rfrncia_igac , 1 );

			if dcrtos.tpo_rgstro = 1 then

				select  count(1)
				into v_exste_rspnsble
				from    si_g_resolucion_igac_t1
				where   /*id_prcso_crga  = dcrtos.id_prcso_crga
				and     */rslcion        = dcrtos.rslcion
				and     rdccion        = dcrtos.rdccion
				and     rfrncia_igac   = dcrtos.rfrncia_igac
				and     tpo_dcmnto     = dcrtos.tpo_dcmnto
				and      ltrim(nmro_dcmnto, '0')    =  ltrim(dcrtos.nmro_dcmnto, '0')
                and     cncla_inscrbe  = dcrtos.cncla_inscrbe;

				pkg_sg_log.prc_rg_log( p_cdgo_clnte, null , v_nmbre_up, v_nvel , 'v_exste_rspnsble: '||v_exste_rspnsble , 1 );

				if v_exste_rspnsble = 0 then
					-- Se consulta la máxima vigencia del predio
					begin
                        select  to_char(to_date(vgncia_igac,'dd/mm/yyyy'),'ddmmyyyy')  , avluo_ctstral
                        into    v_vgncia_t1, v_avluo_ctstral_t1
                        from    si_g_resolucion_ctstopro_dtlle
                        where   rslcion = dcrtos.rslcion
                        and     rdccion = dcrtos.rdccion
                        and     id_rslcion_ctstopro = p_id_rslcion_ctstopro
                        and     rfrncia_igac = dcrtos.rfrncia_igac
                        and     avluo_ctstral is not null
                        order by vgncia_igac desc
                        fetch first 1 row only;
                    exception
                        when others then
                            pkg_sg_log.prc_rg_log( p_cdgo_clnte, null , v_nmbre_up, v_nvel , 'Error al cosnultar vigencia T1: '||sqlerrm , 1 );
                            return;
                    end;

                    pkg_sg_log.prc_rg_log( p_cdgo_clnte, null , v_nmbre_up, v_nvel , 'Vigencia T1: '||v_vgncia_t1 , 1 );

					begin
						insert into si_g_resolucion_igac_t1
							(id_prcso_crga,
							id_prcso_intrmdia,
							nmero_lnea,
							cdgo_dprtmnto,
							cdgo_mncpio,
							rslcion,
							rdccion,
							tpo_trmte,
							clse_mtcion,
							rfrncia_igac,
							cncla_inscrbe,
							tpo_rgstro,
							nmro_orden,
							ttal_rgstro,
							nmbre_prptrio,
							estdo_cvil,
							tpo_dcmnto,
							nmro_dcmnto,
							drccion,
							cmna,
							dstno_ecnmco,
							area_trrno,
							area_cnstrda,
							avluo_ctstral,
							vgncia_igac,
							id_prcso_crga_pdre,
							prcntje_prtcpcion,
							fcha_frmza,
							lttud,
							lngtud,
                            nmro_prdial_antrior)
						values
							(dcrtos.id_prcso_crga,
							dcrtos.id_prcso_intrmdia,
							dcrtos.nmero_lnea,
							dcrtos.cdgo_dprtmnto,
							dcrtos.cdgo_mncpio,
							dcrtos.rslcion,
							dcrtos.rdccion,
							dcrtos.tpo_trmte,
							dcrtos.clse_mtcion,
							dcrtos.rfrncia_igac ,
							dcrtos.cncla_inscrbe, --decode(dcrtos.tpo_trmte,'CANCELACION','C', 'I'),
							1,
							dcrtos.nmro_orden,
							dcrtos.ttal_rgstro,
							substr(dcrtos.nmbre_prptrio,1,100), -- Máximo 100 caracteres
							dcrtos.estdo_cvil,
							dcrtos.tpo_dcmnto,
							dcrtos.nmro_dcmnto,
							dcrtos.drccion,
							dcrtos.cmna,
							dcrtos.dstno_ecnmco,
							dcrtos.area_trrno,
							dcrtos.area_cnstrda,
							v_avluo_ctstral_t1,--dcrtos.avluo_ctstral,
							v_vgncia_t1,--dcrtos.vgncia_igac,
							dcrtos.id_prcso_crga_pdre,
							dcrtos.prcntje_prtcpcion,
							to_date(dcrtos.fcha_frmza,'YYYYMMDD'),
							dcrtos.lttud,
							dcrtos.lngtud,
                            '000000000000000'
							) returning id_rslcion_igac_t1 into v_id_rslcion_igac_t1 ;

                            update si_g_resolucion_ctstopro_dtlle
                            set id_rslcion_igac_t1 = v_id_rslcion_igac_t1
                            where id_rslcion_CtstoPro_dtlle = dcrtos.id_rslcion_CtstoPro_dtlle;

					exception
						when others then
                        rollback;
							o_cdgo_rspsta  := 20;
							o_mnsje_rspsta := 'No fue posible registrar las resolución tipo 1 generado por el sistema.';
							pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
												p_id_impsto  => null,
												p_nmbre_up   => v_nmbre_up,
												p_nvel_log   => v_nvel,
												p_txto_log   => (o_mnsje_rspsta ||
																' Error: ' || sqlerrm),
												p_nvel_txto  => 1);
							return;
					end;
				end if;


			elsif dcrtos.tpo_rgstro = 2 then

				select  count(1) into v_exste_mtrcla
				from    si_g_resolucion_igac_t2
				where   /*id_prcso_crga = dcrtos.id_prcso_crga
				and */  rslcion = dcrtos.rslcion
				and     rdccion = dcrtos.rdccion
				and     rfrncia_igac = dcrtos.rfrncia_igac
                and     cncla_inscrbe  = dcrtos.cncla_inscrbe;

                pkg_sg_log.prc_rg_log( p_cdgo_clnte, null , v_nmbre_up, v_nvel , 'v_exste_mtrcla: '||v_exste_mtrcla , 1 );

				if v_exste_mtrcla = 0 then
					begin
						insert into si_g_resolucion_igac_t2
							(id_prcso_crga,
							id_prcso_intrmdia,
							nmero_lnea,
							cdgo_dprtmnto,
							cdgo_mncpio,
							rslcion,
							rdccion,
							tpo_trmte,
							clse_mtcion,
							rfrncia_igac,
							cncla_inscrbe,
							tpo_rgstro,
							nmro_orden,
							ttal_rgstro,
							mtrcla_inmblria,
							id_prcso_crga_pdre,
							inscrpcion_ctstral,
                            nmro_prdial_antrior)
						values
							(dcrtos.id_prcso_crga,
							dcrtos.id_prcso_intrmdia,
							dcrtos.nmero_lnea,
							dcrtos.cdgo_dprtmnto,
							dcrtos.cdgo_mncpio,
							dcrtos.rslcion,
							dcrtos.rdccion,
							dcrtos.tpo_trmte,
							dcrtos.clse_mtcion,
							dcrtos.rfrncia_igac,
							dcrtos.cncla_inscrbe,
							2,
							dcrtos.nmro_orden,
							dcrtos.ttal_rgstro,
							dcrtos.mtrcla_inmblria,
							dcrtos.id_prcso_crga_pdre,
							to_date(dcrtos.inscrpcion_ctstral,'YYYYMMDD'),
                            '               '
                            );

					exception
						when others then
                            rollback;
							o_cdgo_rspsta  := 40;
							o_mnsje_rspsta := 'No fue posible registrar la matriucla resolución tipo 2 generado por el sistema.'||sqlerrm;
							pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
												p_id_impsto  => null,
												p_nmbre_up   => v_nmbre_up,
												p_nvel_log   => v_nvel,
												p_txto_log   => (o_mnsje_rspsta ||
																' Error: ' || sqlerrm),
												p_nvel_txto  => 1);
							return;
					end;
				end if;

			else --tipo 3

				begin
					pkg_sg_log.prc_rg_log( p_cdgo_clnte, null , v_nmbre_up, v_nvel , 'dcrtos.vgncia_igac: '||dcrtos.vgncia_igac , 1 );

					begin
						select to_number(substr(dcrtos.vgncia_igac, -4 , length(dcrtos.vgncia_igac) ))
						into v_vgncia_t3 from dual;
					exception
						when others then
							begin
								select to_number(substr(dcrtos.vgncia_igac, 1 , 4 ))
								into v_vgncia_t3 from dual;
							exception
								when others then
									o_cdgo_rspsta  := 5;
									o_mnsje_rspsta := 'No fue posible extraer la vigencia del campo: '||dcrtos.vgncia_igac;
									pkg_sg_log.prc_rg_log(p_cdgo_clnte, null, v_nmbre_up, v_nvel, o_mnsje_rspsta, p_nvel_txto  => 3);
									return;
							end;
					end;
					pkg_sg_log.prc_rg_log( p_cdgo_clnte, null , v_nmbre_up, v_nvel , 'v_vgncia_t3: '||v_vgncia_t3 , 1 );


					select  count(1) into v_exste_dcrto
					from    si_g_resolucion_igac_t3
					where   /*id_prcso_crga = dcrtos.id_prcso_crga
					and     */rslcion = dcrtos.rslcion
					and     rdccion = dcrtos.rdccion
					and     rfrncia_igac = dcrtos.rfrncia_igac
					and     vgncia  = v_vgncia_t3;

					 pkg_sg_log.prc_rg_log( p_cdgo_clnte, null , v_nmbre_up, v_nvel , 'dcrtos.rfrncia_igac: '||dcrtos.rfrncia_igac , 1 );
					 pkg_sg_log.prc_rg_log( p_cdgo_clnte, null , v_nmbre_up, v_nvel , 'v_exste_dcrto: '||v_exste_dcrto , 1 );

					if v_exste_dcrto = 0 then

						insert into si_g_resolucion_igac_t3
							(id_prcso_crga,
							 id_prcso_intrmdia,
							 nmero_lnea,
							 cdgo_dprtmnto,
							 cdgo_mncpio,
							 rslcion,
							 rdccion,
							 tpo_trmte,
							 clse_mtcion,
							 rfrncia_igac,
							 cncla_inscrbe,
							 tpo_rgstro,
							 nmro_orden,
							 ttal_rgstro,
							 decrtos,
							 vgncia,
							 avluo_ctstral,
							 id_prcso_crga_pdre,
                             nmro_prdial_antrior)
						  values
							(dcrtos.id_prcso_crga,
							 dcrtos.id_prcso_intrmdia,
							 dcrtos.nmero_lnea,
							 dcrtos.cdgo_dprtmnto,
							 dcrtos.cdgo_mncpio,
							 dcrtos.rslcion,
							 dcrtos.rdccion,
							 dcrtos.tpo_trmte,
							 dcrtos.clse_mtcion,
							 dcrtos.rfrncia_igac,
							 dcrtos.cncla_inscrbe,
							 3,
							 dcrtos.nmro_orden,
							 dcrtos.ttal_rgstro,
							 dcrtos.decrtos,
							 v_vgncia_t3,
							 dcrtos.avluo_ctstral,
							 dcrtos.id_prcso_crga_pdre,
                             '000000000000000');
					end if;

				exception
					when others then
                        rollback;
						o_cdgo_rspsta  := 60;
						o_mnsje_rspsta := 'No fue posible registrar las resolución tipo 3 generado por el sistema. '||sqlerrm;
						pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
											p_id_impsto  => null,
											p_nmbre_up   => v_nmbre_up,
											p_nvel_log   => v_nvel,
											p_txto_log   => (o_mnsje_rspsta ||
															' Error: ' || sqlerrm),
											p_nvel_txto  => 1);
						return;
				end;

			end if; --Validacion de tipo de tramite.

			begin
				update si_g_resolucion_ctstopro_dtlle
				   set indcdor_prcsdo = 'S'
				 where id_rslcion_CtstoPro_dtlle = dcrtos.id_rslcion_CtstoPro_dtlle
				   and rslcion = dcrtos.rslcion
                   and rdccion = dcrtos.rdccion
                   and id_rslcion_ctstopro = dcrtos.id_rslcion_ctstopro;

			exception
				when others then
					o_cdgo_rspsta  := 80;
					o_mnsje_rspsta := 'No fue posible actualizar el estado de la resolución de catastropro. '||sqlerrm;
					pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
										p_id_impsto  => null,
										p_nmbre_up   => v_nmbre_up,
										p_nvel_log   => v_nvel,
										p_txto_log   => (o_mnsje_rspsta ||
														' Error: ' || sqlerrm),
										p_nvel_txto  => 1);
					return;
			end;

		end loop;

    o_mnsje_rspsta := 'Saliendo '|| systimestamp;
	pkg_sg_log.prc_rg_log( p_cdgo_clnte , null , v_nmbre_up, v_nvel , o_mnsje_rspsta , 1 );

	exception
		when others then
		o_cdgo_rspsta  := 100;
		o_mnsje_rspsta := 'Exception no controlada. '||sqlerrm;
		pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
							p_id_impsto  => null,
							p_nmbre_up   => v_nmbre_up,
							p_nvel_log   => v_nvel,
							p_txto_log   => (o_mnsje_rspsta ||
											' Error: ' || sqlerrm),
							p_nvel_txto  => 1);
		return;
	end prc_rg_resolucion_igac;

	procedure prc_vl_aplca_rslcion_mnal (p_cdgo_clnte       in number,
                                        p_rslcion           in si_g_resolucion_ctstopro_dtlle.rslcion%type,
                                        p_rdccion           in si_g_resolucion_ctstopro_dtlle.rdccion%type,
                                        p_clse_mtcion		in si_g_resolucion_igac_t1.clse_mtcion%type,
										p_tpo_trmte			in si_g_resolucion_igac_t1.tpo_trmte%type,
										o_mnsje_rspsta		out varchar2,
										o_aplcar_rslcion	out varchar2)

	as

    v_existe_rslcion		number;
    v_no_aplca_rslcion		number;
    v_nvel              number;
    v_nmbre_up          sg_d_configuraciones_log.nmbre_up%type := 'pkg_ws_resolucion_predio.prc_vl_aplca_rslcion_mnal';

	begin

    --Determinamos el Nivel del Log de la UP
    v_nvel := pkg_sg_log.fnc_ca_nivel_log( p_cdgo_clnte , null , v_nmbre_up );
    o_mnsje_rspsta := 'Entrando ' || systimestamp;
    pkg_sg_log.prc_rg_log( p_cdgo_clnte , null , v_nmbre_up, v_nvel , o_mnsje_rspsta , 1 );

    o_aplcar_rslcion := 'S';
    o_mnsje_rspsta	 := 'Ok';

    o_mnsje_rspsta := '$$$ p_clse_mtcion: ' || p_clse_mtcion;
    pkg_sg_log.prc_rg_log( p_cdgo_clnte , null , v_nmbre_up, v_nvel , o_mnsje_rspsta , 1 );

    o_mnsje_rspsta := '$$$ p_tpo_trmte: ' || p_tpo_trmte;
    pkg_sg_log.prc_rg_log( p_cdgo_clnte , null , v_nmbre_up, v_nvel , o_mnsje_rspsta , 1 );

  	-- Validaciones para no alicar resoluciones.

    --1. Si el tipo de tramite es insrcipción de predio 01 5 ,
    --o cancelacion de predio 04 7
    --se puede aplicar la resolución automaticamente
    if ( (p_clse_mtcion = '5' and p_tpo_trmte = '01') or (p_clse_mtcion = '7' and p_tpo_trmte = '04') ) then
        o_aplcar_rslcion := 'S';

        o_mnsje_rspsta := 'Dentro de validar si es inscripción o cancelacion de predio.  o_aplcar_rslcion: ' || o_aplcar_rslcion;
        pkg_sg_log.prc_rg_log( p_cdgo_clnte , null , v_nmbre_up, v_nvel , o_mnsje_rspsta , 1 );

		return;
    end if;

    o_mnsje_rspsta := 'Despues de validar si es inscripción o cancelacion de predio ' || systimestamp;
    pkg_sg_log.prc_rg_log( p_cdgo_clnte , null , v_nmbre_up, v_nvel , o_mnsje_rspsta , 1 );


	-- 2. Que el tipo de tramite no esté parametrizado como aplicación manual.
    select count(1)
      into v_no_aplca_rslcion
      from df_s_hmlgcnes_trmte_ctstropro a
     where actvo = 'S'
       and aplca_rslcion_mnal ='S'
       and cdgo_mtcion_clse = p_clse_mtcion
       and cdgo_trmte_tpo = p_tpo_trmte
    ;

    if v_no_aplca_rslcion > 0 then
        -- No se debe aplicar.
        o_mnsje_rspsta := 'De acuerdo con la regla de negocio, el tipo de tramite se debe aplicar manualmente.';
        o_aplcar_rslcion := 'N';
        return;

    end if;

	-- 3. Que no exista una resolución previa para el mismo predio que no haya sido aplicada.
	for c_rfrncias in (select distinct a.rfrncia_igac, substr(a.rslcion,-4) anoresolucion
                         from si_g_resolucion_ctstopro_dtlle a
                        where a.rslcion = p_rslcion
                          and a.rdccion = p_rdccion) loop
		begin
			-- Validar si existe resolución sin aplicar para mismo predio
			with resoluciones as (
			select j.rslcion             as Resolucion,
				   j.rdccion             as Redaccion,
				   j.nmro_prdial_antrior as Nro_Predial_Anterior,
				   j.rfrncia_igac        as Referencia_Igac,
				   j.dstno_ecnmco        as Destino_Economico,
				   j.avluo_ctstral       as Avaluo_Catastral,
				   j.cncla_inscrbe       as Cancela_Inscribe,
				   j.vgncia_igac         as Vigencia_Igac
			  from (select rslcion,
						   rdccion,
						   nmro_prdial_antrior,
						   rfrncia_igac,
						   dstno_ecnmco,
						   avluo_ctstral,
						   cncla_inscrbe,
						   vgncia_igac,
                           area_trrno,
                           area_cnstrda
					  from si_g_resolucion_igac_t1
					 where aplcda = 'N'
					   and nmro_orden = '001'
					   and cncla_inscrbe = 'C'
					 group by rslcion,
							  rdccion,
							  nmro_prdial_antrior,
							  rfrncia_igac,
							  dstno_ecnmco,
							  avluo_ctstral,
							  cncla_inscrbe,
							  vgncia_igac,
                              area_trrno,
                              area_cnstrda) k
			  full join (select rslcion,
								rdccion,
								nmro_prdial_antrior,
								rfrncia_igac,
								dstno_ecnmco,
								avluo_ctstral,
								cncla_inscrbe,
								vgncia_igac,
                                area_trrno,
                                area_cnstrda
						   from si_g_resolucion_igac_t1 a
						  where a.aplcda = 'N'
							and a.nmro_orden = '001'
							and a.cncla_inscrbe = 'I'
							and a.aplcda = 'N'
							and not exists (select 1
								   from si_g_resolucion_igac_t1 t
								  where t.rfrncia_igac = a.rfrncia_igac
									and t.id_rslcion_aplcda is null
									and t.vgncia_igac = a.vgncia_igac
									and t.rslcion like '%'||c_rfrncias.anoresolucion
									and t.rslcion < a.rslcion)
						  group by rslcion,
								   rdccion,
								   nmro_prdial_antrior,
								   rfrncia_igac,
								   dstno_ecnmco,
								   avluo_ctstral,
								   cncla_inscrbe,
								   vgncia_igac,
                                   area_trrno,
                                   area_cnstrda) j
				on k.rslcion = j.rslcion
			   and k.rdccion = j.rdccion
			 where k.dstno_ecnmco = j.dstno_ecnmco
			   and k.avluo_ctstral = j.avluo_ctstral
               and k.area_trrno = j.area_trrno
               and k.area_cnstrda = j.area_cnstrda
			   and k.rfrncia_igac = c_rfrncias.rfrncia_igac --'0103000001650002000000000'
			   and (j.rslcion like '%'||c_rfrncias.anoresolucion)
			order by to_number(j.rslcion))
			select count(1)
			into v_existe_rslcion
			from resoluciones
            where Resolucion = p_rslcion
            and Redaccion = p_rdccion
			;
		exception
			when others then
			o_mnsje_rspsta := 'Error al consultar si existe otra resolución por aplicar para la misma vigencia. Error: ' || sqlerrm;
			o_aplcar_rslcion := 'N';
			return;
		end;

		--Si no existe resoluciones aptas por aplicar
        -- Cero significa que la resoluci que se intenta aplicar no se va a poder aplicar porque exite otra resolución para la misma vigencia que aún no ha sido aplicada.
        -- O que la resolución por aplicar tuvo cambios en el avaluo o destino
		if v_existe_rslcion = 0 then
			-- No se debe aplicar.
			o_mnsje_rspsta := 'No se puede aplicar por existe una resolución sin aplicar y/o el trámite cambia destino, avaluo o áreas';
			o_aplcar_rslcion := 'N';
			return;

		end if;
    end loop;


    o_mnsje_rspsta := '----> o_aplcar_rslcion: ' || o_aplcar_rslcion;
    pkg_sg_log.prc_rg_log( p_cdgo_clnte , null , v_nmbre_up, v_nvel , o_mnsje_rspsta , 1 );

	end prc_vl_aplca_rslcion_mnal;

    /*UP que aplica masivamente resoluciones de capturadas del servicio de CATASTROPRO.*/
    procedure prc_ap_resolucion(p_cdgo_clnte            in number,
                                p_id_impsto             in number,
                                p_id_impsto_sbmpsto     in number,
								p_vgncia_actual	        in number,
                                p_id_usrio              in number default null)
    as

    v_nvel               	number;
    v_nmbre_up          	sg_d_configuraciones_log.nmbre_up%type := 'pkg_ws_resolucion_predio.prc_ap_resolucion';
	v_mnsje_rspsta 			varchar2(400);
	v_cdgo_rspsta			number;
    v_id_usrio              sg_g_usuarios.id_usrio%type;
	v_aplcar_rslcion		varchar2(1);

    begin
        --Determinamos el Nivel del Log de la UP
        v_nvel := pkg_sg_log.fnc_ca_nivel_log( p_cdgo_clnte , null , v_nmbre_up );
        v_mnsje_rspsta := 'Entrando ' || systimestamp;
        pkg_sg_log.prc_rg_log( p_cdgo_clnte , null , v_nmbre_up, v_nvel , v_mnsje_rspsta , 1 );

        if p_id_usrio is null then
            --Se consulta usuario general.
            begin
                select id_usrio
                into v_id_usrio
                from sg_g_usuarios
                where user_name = '1111111112';
            exception
                when others then
                v_id_usrio  := null;
            end;
        else
            v_id_usrio := p_id_usrio;
        end if;

        -- Se recorren resoluciones por aplicar.
        for c_rslcnes in (/*select distinct a.rslcion, a.rdccion, a.tpo_trmte, a.clse_mtcion--, a.rfrncia_igac,a.vgncia_igac, substr(a.rslcion,-4) anoresolucion
                            from si_g_resolucion_ctstopro_dtlle a
                            join si_g_resolucion_catastopro b on a.id_rslcion_ctstopro = b.id_rslcion_ctstopro
                            join si_g_resolucion_igac_t1 c on a.rslcion = c.rslcion and a.rdccion = c.rdccion
                           where a.aplcda = 'N'
                             and a.indcdor_prcsdo = 'S'
							 and a.tpo_rgstro = 1
							 and a.nmro_orden = '001'
							 and b.id_rslcion_ctstopro = p_id_rslcion_ctstopro*/
                            select distinct a.rslcion, a.rdccion, a.tpo_trmte, a.clse_mtcion--, a.rfrncia_igac,a.vgncia_igac, substr(a.rslcion,-4) anoresolucion
                            from  si_g_resolucion_igac_t1 a
                            where a.aplcda = 'N'
                            and a.rslcion like '%' ||p_vgncia_actual
                             and a.tpo_rgstro = 1
                             and a.nmro_orden = '001'
                             --and a.rslcion = '2402026'
                             )
        loop

			v_mnsje_rspsta := 'Se recorre N° Resolcuión: ' || c_rslcnes.rslcion
                                ||' c_rslcnes.tpo_trmte ' || c_rslcnes.tpo_trmte
                                ||' c_rslcnes.clse_mtcion  ' || c_rslcnes.clse_mtcion ;
			pkg_sg_log.prc_rg_log( p_cdgo_clnte , null , v_nmbre_up, v_nvel , v_mnsje_rspsta , 1 );

			begin
				--Se valida si la resolución se puede aplicar automaticamente
				pkg_ws_resolucion_predio.prc_vl_aplca_rslcion_mnal (p_cdgo_clnte        => p_cdgo_clnte,
                                                                    p_rslcion		    => c_rslcnes.rslcion,
																	p_rdccion		    => c_rslcnes.rdccion ,
																	p_clse_mtcion		=> c_rslcnes.clse_mtcion ,
																	p_tpo_trmte			=> c_rslcnes.tpo_trmte ,
																	o_mnsje_rspsta		=> v_mnsje_rspsta,
																	o_aplcar_rslcion	=> v_aplcar_rslcion);
			exception
				when others then
					v_cdgo_rspsta := 10;
					v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Error al consultar si la resolución se puede aplicar. N° Resolución [' ||c_rslcnes.rslcion || '] N° Radicación [' || c_rslcnes.rdccion || '] - ' || sqlerrm;
					pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
					v_aplcar_rslcion := 'N';
			end;

			if v_aplcar_rslcion = 'S' then

                v_mnsje_rspsta := 'Resolución se puede aplicar automaticamnete: N° Resolcuión: ' || c_rslcnes.rslcion;
                pkg_sg_log.prc_rg_log( p_cdgo_clnte , null , v_nmbre_up, v_nvel , v_mnsje_rspsta , 1 );

				-- Se aplican las resoluciones.
				begin
					pkg_si_resolucion_predio.prc_ap_resolucion( p_id_usrio          => v_id_usrio
															  , p_cdgo_clnte        => p_cdgo_clnte
															  , p_id_impsto         => p_id_impsto
															  , p_id_impsto_sbmpsto => p_id_impsto_sbmpsto
															  , p_rslcion           => c_rslcnes.rslcion
															  , p_rdccion           => c_rslcnes.rdccion
															  , o_cdgo_rspsta       => v_cdgo_rspsta
															  , o_mnsje_rspsta      => v_mnsje_rspsta );

					if v_cdgo_rspsta <> 0 then
						v_cdgo_rspsta := 20;
						v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Error al aplicar. N° Resolución [' ||c_rslcnes.rslcion || '] N° Radicación [' || c_rslcnes.rdccion || '] - ' ||v_mnsje_rspsta;
						pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);

                        -- Asegurar el id_rslcion_igac_t1 a las resoluciones aplicadas o que no se lograron aplicar.
                        -- Esto para llevar control si la resolución se aplica de manera manual, poder cambiar el estado en la tabla
                        -- si_g_reslcion_no_aplcda por aplicada.
                         begin
                            insert into si_g_reslcion_no_aplcda
                            (cdgo_clnte	,			id_impsto,				id_impsto_sbmpsto,
                            rslcion,				rdccion,
                            tpo_trmte,				clse_mtcion,
                            --vgncia_igac,
                            rslcion_aplcda,			obsrvcion_no_aplcda)
                            values
                            (p_cdgo_clnte,			p_id_impsto,			p_id_impsto_sbmpsto,
                            c_rslcnes.rslcion,		c_rslcnes.rdccion,
                            c_rslcnes.tpo_trmte,	c_rslcnes.clse_mtcion,
                            --c_rslcnes.vgncia_igac,
                            'N',					v_mnsje_rspsta);

                        exception
                            when others then
                            v_mnsje_rspsta := '1. No se pudo realizar insercción, está duplicado el registro. ' || sqlerrm;
                            pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
                        end;

                        /*for c_rslcnes_t1 in (select distinct a.id_rslcion_igac_t1--, a.rfrncia_igac,a.vgncia_igac, substr(a.rslcion,-4) anoresolucion
                                            from si_g_resolucion_ctstopro_dtlle a
                                            join si_g_resolucion_catastopro b on a.id_rslcion_ctstopro = b.id_rslcion_ctstopro
                                           where a.aplcda = 'N'
                                             and a.indcdor_prcsdo = 'S'
                                             and a.tpo_rgstro = 1
                                             and a.nmro_orden = '001'
                                             --and a.cncla_inscrbe = 'I'
                                             and a.rslcion    = c_rslcnes.rslcion
                                             and a.rdccion    = c_rslcnes.rdccion
                                             and a.id_rslcion_igac_t1 is not null
                                             and b.id_rslcion_ctstopro = p_id_rslcion_ctstopro)
                        loop */



                        --end loop;

                        continue;

					else

						update si_g_resolucion_ctstopro_dtlle
						set aplcda = 'S'
						where rslcion = c_rslcnes.rslcion
						and rdccion = c_rslcnes.rdccion;

                        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,'----->>>>>> RESOLCUIÓN APLICADA CON EXITO '||c_rslcnes.rslcion ,1);

					end if;

				exception
					when others then
					v_cdgo_rspsta := 30;
					v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Error al aplicar. N° Resolución [' ||c_rslcnes.rslcion || '] N° Radicación [' || c_rslcnes.rdccion || '] - ' || sqlerrm;
					pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);

                    begin
                        insert into si_g_reslcion_no_aplcda
                        (cdgo_clnte	,			id_impsto,				id_impsto_sbmpsto,
                        rslcion,				rdccion,
                        tpo_trmte,				clse_mtcion,
                        --vgncia_igac,
                        rslcion_aplcda,			obsrvcion_no_aplcda)
                        values
                        (p_cdgo_clnte,			p_id_impsto,			p_id_impsto_sbmpsto,
                        c_rslcnes.rslcion,		c_rslcnes.rdccion,
                        c_rslcnes.tpo_trmte,	c_rslcnes.clse_mtcion,
                        --c_rslcnes.vgncia_igac,
                        'N',					v_mnsje_rspsta);

                     exception
                        when others then
                        v_mnsje_rspsta := '2. No se pudo realizar insercción, está duplicado el registro. ' || sqlerrm;
                        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
                    end;

					continue;

				end;

			else -- Si no se puede aplicar las resoluciones automaticamente. se registra traza razón por la cual no se aplicó
                v_mnsje_rspsta := 'Resolución NO se puede aplicar automaticamnete: N° Resolcuión: ' || c_rslcnes.rslcion || '. ' || v_mnsje_rspsta;
                pkg_sg_log.prc_rg_log( p_cdgo_clnte , null , v_nmbre_up, v_nvel , v_mnsje_rspsta , 1 );

                begin
                    insert into si_g_reslcion_no_aplcda
                    (cdgo_clnte	,			id_impsto,				id_impsto_sbmpsto,
                    rslcion,				rdccion,
                    tpo_trmte,				clse_mtcion,
                    --vgncia_igac,
                    rslcion_aplcda,			obsrvcion_no_aplcda)
                    values
                    (p_cdgo_clnte,			p_id_impsto,			p_id_impsto_sbmpsto,
                    c_rslcnes.rslcion,		c_rslcnes.rdccion,
                    c_rslcnes.tpo_trmte,	c_rslcnes.clse_mtcion,
                    --c_rslcnes.vgncia_igac,
                    'N',					v_mnsje_rspsta);
                exception
                    when others then
                    v_mnsje_rspsta := '3. No se pudo realizar insercción, está duplicado el registro. ' || sqlerrm;
                    pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
                end;

			continue;

            end if;

        end loop;

        commit;

        v_mnsje_rspsta := 'Saliendo '|| systimestamp;
        pkg_sg_log.prc_rg_log( p_cdgo_clnte , null , v_nmbre_up, v_nvel , v_mnsje_rspsta , 1 );

    exception
    	when others then
        v_cdgo_rspsta := 100;
        v_mnsje_rspsta := 'No. '||v_cdgo_rspsta || '. Exception no controlada - ' || sqlerrm;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte, null,v_nmbre_up,v_nvel,v_mnsje_rspsta ,1);
        return;
    end prc_ap_resolucion;

end pkg_ws_resolucion_predio;
/

