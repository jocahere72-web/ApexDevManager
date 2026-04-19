
  CREATE OR REPLACE EDITIONABLE PACKAGE "ZT_QR" AUTHID DEFINER AS

  PROCEDURE p_generate_qr_data(p_data             varchar2,
                               p_error_correction varchar2,
                               p_qr               OUT NOCOPY varchar2,
                               p_matrix_size      OUT pls_integer);

  PROCEDURE p_qr_debug(p_data             varchar2,
                       p_error_correction varchar2,
                       p_debug            boolean default true,
                       p_debug_level      pls_integer default 1,
                       p_masking_out      pls_integer default null,
                       p_qr               OUT NOCOPY varchar2,
                       p_matrix_size      OUT pls_integer);

  FUNCTION f_qr_as_html_table(p_data              varchar2, --data going to be encoded into QR code
                              p_error_correction  varchar2, --L, M, Q or H
                              p_module_size_in_px pls_integer default 8, --module size in pixels
                              p_margines          boolean default false --margines around QR code (4 modules)
                              ) RETURN clob;

  PROCEDURE p_qr_as_html_table(p_data              varchar2, --data going to be encoded into QR code
                               p_error_correction  varchar2, --L, M, Q or H
                               p_module_size_in_px pls_integer default 8, --module size in pixels
                               p_margines          boolean default false --margines around QR code (4 modules)
                               );

  FUNCTION f_qr_as_bmp(p_data             varchar2, --data going to be encoded into QR code
                       p_error_correction varchar2, --L, M, Q or H
                       p_margines         varchar2 default 'N' --margines around QR code (4 modules) - values Y or N
                       ) RETURN blob;

  FUNCTION f_qr_as_long_raw(p_data             varchar2, --data going to be encoded into QR code
                            p_error_correction varchar2, --L, M, Q or H
                            p_margines         varchar2 default 'N' --margines around QR code (4 modules) - values Y or N
                            ) RETURN long raw;

  PROCEDURE p_qr_as_img_tag_base64(p_data             varchar2, --data going to be encoded into QR code
                                   p_error_correction varchar2, --L, M, Q or H
                                   p_image_size_px    pls_integer,
                                   p_margines         varchar2 default 'N' --margines around QR code (4 modules) - values Y or N
                                   );

  FUNCTION f_qr_as_svg(p_data              varchar2, --data going to be encoded into QR code
                       p_error_correction  varchar2, --L, M, Q or H
                       p_module_size_px    pls_integer default 8, --modul size in pixels
                       p_margines_yn       varchar2 default 'N', --margines around QR code (4 modules) - values Y or N
                       p_module_color      varchar2 default 'black', --colors are defined as SVG named colors OR rgb (with # or rgb function)
                       p_background_color  varchar2 default 'white',
                       p_module_rounded_px pls_integer default 0 --0 - sharp corners; > 0 - rounded in pixels
                       ) RETURN clob;

  PROCEDURE p_qr_as_svg(p_data              varchar2, --data going to be encoded into QR code
                        p_error_correction  varchar2, --L, M, Q or H
                        p_module_size_px    pls_integer default 8, --modul size in pixels
                        p_margines_yn       varchar2 default 'N', --margines around QR code (4 modules) - values Y or N
                        p_module_color      varchar2 default 'black', --colors are defined as SVG named colors OR rgb (with # or rgb function)
                        p_background_color  varchar2 default 'white',
                        p_module_rounded_px pls_integer default 0 --0 - sharp corners; > 0 - rounded in pixels
                        );

  PROCEDURE p_save_file(p_document  blob,
                        p_file_name varchar2,
                        p_folder    varchar2);

END ZT_QR;
/

