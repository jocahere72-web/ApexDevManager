
  CREATE OR REPLACE EDITIONABLE PACKAGE "PKG_AC_EMBARGOS_CARTERA" as

procedure prc_ac_embrgos_crtra  ( p_cdgo_clnte        in	number
									   ,o_mnsje_rspsta	    out	varchar2
									   ,o_cdgo_rspsta       out number);

end  pkg_ac_embargos_cartera;
/

