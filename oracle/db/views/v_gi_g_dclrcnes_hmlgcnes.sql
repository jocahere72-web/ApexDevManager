
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GI_G_DCLRCNES_HMLGCNES" ("ID_DCLRCION", "ID_HMLGCION", "CDGO_HMLGCION", "CDGO_PRPDAD", "VLOR") AS
  select  id_dclrcion,
        id_hmlgcion,
        cdgo_hmlgcion,
        cdgo_prpdad,
        vlor
from    json_table(
                    (pkg_gi_declaraciones.fnc_gn_json_propiedades_2	   ()
                    ),  '$[*]' columns  (
                                            id_dclrcion     number      path '$.id_dclrcion',
                                            id_hmlgcion     number      path '$.id_hmlgcion',
                                            cdgo_hmlgcion   varchar2    path '$.cdgo_hmlgcion',
                                            cdgo_prpdad     varchar2    path '$.cdgo_prpdad',
                                            vlor            clob        path '$.vlor'
                                        )
                  );

