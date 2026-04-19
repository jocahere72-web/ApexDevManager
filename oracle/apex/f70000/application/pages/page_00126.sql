prompt --application/pages/page_00126
begin
wwv_flow_api.create_page(
 p_id=>126
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Consulta de Liquidaciones de VUR'
,p_step_title=>'Consulta de Liquidaciones de VUR'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js',
''))
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/tooltipster.bundle.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-borderless.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-shadow.min.css'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.badgeListColor .t-Region-bodyWrap .t-Region-body .t-BadgeList .t-BadgeList-item:nth-child(3n + 1){',
'  margin: 15px;',
'  color: #fff !important;',
'  font-weight: 400;',
'  text-shadow: 0px 2px 2px rgba(0, 0, 0, 0.49);',
'  background: linear-gradient(',
'      135deg,',
'      rgba(0, 174, 255, 0.925),',
'      rgba(0, 220, 176, 0.664)',
'    ),',
'    url(''data:image/svg+xml;charset=utf-8,<svg width="480" height="480" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 480 480"><path fill="%23A6A6A6" d="M69.2 63.2L0 69.3V25.8L18.5 0h46.7l4 63.2z"/><path fill="%23ADADAD" d="M165.8 20.6l30 110.6L275'
||'.2 7.9 165.8 20.6z"/><path fill="%23A6A6A6" d="M480 25.8v44.8l-32.2 2.6L480 25.8zm0 112.6v17l-88.2-40.2 56-42 32.2 65.2z"/><path fill="%23ADADAD" d="M405.2 211.2l10.6 108.7-79.3 10 68.7-118.7zM480 169v18.9l-64.2 132 17.4-118.7L480 169zm0 151.5v46.8l-'
||'64.2-47.4 64.2.6zm-186.2 37.4l62.7 64.7-74 6.6 11.3-71.3zm-174-101.3l100.7 90 73.3 11.3-174-101.3zm-50.6 67.3l17.3-59.3 29.3 126-46.6-66.7zm0 0l-4 94L0 367.3v-46.8l69.2 3.4zm114.6 143.3L65.2 417.9l50.6-27.3 68 76.6zM65.2 417.9V480H18.5l46.7-62.1z"/><'
||'path fill="%23A6A6A6" d="M12.5 159.9L0 155.4v-17l12.5 21.5z"/><path fill="%23ADADAD" d="M12.5 159.9L0 187.9V169l12.5-9.1z"/><path fill="%23A6A6A6" d="M308.5 164.6l28 165.3-68.7-126 40.7-39.3zm96.7 46.6l28-10-17.4 118.7-10.6-108.7zM220.5 346.6l62 82.6'
||' 11.3-71.3-73.3-11.3z"/><path fill="%23A6A6A6" d="M282.5 429.2l-6.3 50.8h-74.9l81.2-50.8zM69.2 323.9l46.6 66.7-50.6 27.3 4-94zm-56.7-164l56.7 164-4-79.3-52.7-84.7zM276.2 0l-1 7.9-109.4 12.7L201.3 0h74.9z"/><path fill="%23A6A6A6" d="M86.5 264.6l33.3-8'
||'-4 134-29.3-126z"/><path fill="%23B8BEBE" d="M293.8 357.9l122-38-59.3 102.7-62.7-64.7z"/><path fill="%23F4F4F4" d="M441.8 429.2l-85.3-6.6 59.3-102.7 26 109.3z"/><path fill="%23DCDCE2" d="M480 367.3v58.2l-38.2 3.7-26-109.3 64.2 47.4z"/><path fill="%23'
||'BEC3C3" d="M480 425.5V480h-53.3l15.1-50.8 38.2-3.7z"/><path fill="%23DCDCE2" d="M441.8 429.2L426.7 480h-57.5l-12.7-57.4 85.3 6.6z"/><path fill="%23BEC3C3" d="M369.2 480h-84.1l71.4-57.4 12.7 57.4z"/><path fill="%23F4F4F4" d="M356.5 422.6L285.1 480h-8.'
||'9l6.3-50.8 74-6.6zm-74 6.6L201.3 480h-35.9l18.4-12.8 98.7-38z"/><path fill="%23B8BEBE" d="M115.8 390.6l68 76.6 98.7-38-116.7-63.3-50 24.7z"/><path fill="%23F4F4F4" d="M119.8 256.6l-4 134 50-24.7-46-109.3z"/><path fill="%23CFCFCF" d="M220.5 346.6l62 8'
||'2.6-116.7-63.3-46-109.3 100.7 90z"/><path fill="%23B8BEBE" d="M183.8 467.2L165.4 480H89l-23.8-62.1 118.6 49.3z"/><path fill="%23BEC3C3" d="M89 480H65.2v-62.1L89 480z"/><path fill="%23DCDCE2" d="M65.2 417.9L0 425.5v-58.2l65.2 50.6z"/><path fill="%23CF'
||'CFCF" d="M65.2 417.9L18.5 480H9.4l55.8-62.1z"/><path fill="%23B8BEBE" d="M65.2 417.9L9.4 480H0v-54.5l65.2-7.6z"/><path fill="%23F4F4F4" d="M65.2 244.6l54.6 12-33.3 8-17.3 59.3-4-79.3z"/><path fill="%23CFCFCF" d="M12.5 159.9L0 169v-13.6l12.5 4.5z"/><p'
||'ath fill="%23F4F4F4" d="M69.2 323.9L0 320.5V187.9l12.5-28 56.7 164zm267.3 6l-42.7 28 122-38-79.3 10zm143.5-142v132.6l-64.2-.6 64.2-132zm-171.5-23.3l124.7 36.6-28 10-68.7 118.7-28-165.3z"/><path fill="%23BEC3C3" d="M119.8 256.6l216.7 73.3-42.7 28-174-'
||'101.3z"/><path fill="%23B8BEBE" d="M267.8 203.9l68.7 126-216.7-73.3 148-52.7zm-255.3-44l107.3 96.7-54.6-12-52.7-84.7z"/><path fill="%23CFCFCF" d="M195.8 131.2l-76 125.4-107.3-96.7 183.3-28.7z"/><path fill="%23BEC3C3" d="M69.2 63.2l-56.7 96.7 183.3-28'
||'.7-126.6-68z"/><path fill="%23DCDCE2" d="M69.2 63.2l-56.7 96.7L0 138.4V69.3l69.2-6.1z"/><path fill="%23BEC3C3" d="M103.2 32.6l-34 30.6-4-63.2H89l14.2 32.6z"/><path fill="%23DCDCE2" d="M165.8 20.6l30 110.6-126.6-68 34-30.6 62.6-12z"/><path fill="%23F4'
||'F4F4" d="M119.8 256.6l76-125.4 112.7 33.4-40.7 39.3-148 52.7z"/><path fill="%23DCDCE2" d="M391.8 115.2l41.4 86-124.7-36.6 83.3-49.4zM275.2 7.9l33.3 156.7-112.7-33.4L275.2 7.9z"/><path fill="%23B8BEBE" d="M391.8 115.2l-83.3 49.4L275.2 7.9l9.9-7.9h84.1'
||'l22.6 115.2z"/><path fill="%23CFCFCF" d="M480 9.9v15.9l-32.2 47.4-56 42L480 9.9z"/><path fill="%23B8BEBE" d="M480 0v9.9l-88.2 105.3L426.7 0H480z"/><path fill="%23DCDCE2" d="M426.7 0l-34.9 115.2L369.2 0h57.5z"/><path fill="%23F4F4F4" d="M285.1 0l-9.9 '
||'7.9 1-7.9h8.9zm-83.8 0l-35.5 20.6-62.6 12L165.4 0h35.9z"/><path fill="%23CFCFCF" d="M18.5 0L0 25.8V9.9L9.4 0h9.1z"/><path fill="%23B8BEBE" d="M165.4 0l-62.2 32.6L89 0h76.4zM9.4 0L0 9.9V0h9.4z"/><path fill="%23DCDCE2" d="M480 69.3v69.1l-32.2-65.2 32.2'
||'-3.9z"/><path fill="%23CFCFCF" d="M480 155.4V169l-46.8 32.2-41.4-86 88.2 40.2z"/></svg>'') !important;',
'  border-radius: 8px !important;',
'  transition-property:margin-left;',
'  transition-duration:1s;',
'  transition-timing-function:linear;',
'',
'  /* Safari */',
'  -webkit-transition-property:margin-left;',
'  -webkit-transition-duration:1s;',
'  -webkit-transition-timing-function:linear;',
'',
'}',
'.badgeListColor .t-Region-bodyWrap .t-Region-body .t-BadgeList .t-BadgeList-item:nth-child(3n + 2){',
'  margin: 15px;',
'  color: #fff !important;',
'  font-weight: 400;',
'  text-shadow: 0px 2px 2px rgba(0, 0, 0, 0.49);',
'  background: linear-gradient(',
'      135deg,',
'      rgba(71, 114, 217, 0.92),',
'      rgba(0, 220, 176, 0.692)',
'    ),',
'    url(''data:image/svg+xml;charset=utf-8,<svg width="480" height="480" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 480 480"><path fill="%23A6A6A6" d="M69.2 63.2L0 69.3V25.8L18.5 0h46.7l4 63.2z"/><path fill="%23ADADAD" d="M165.8 20.6l30 110.6L275'
||'.2 7.9 165.8 20.6z"/><path fill="%23A6A6A6" d="M480 25.8v44.8l-32.2 2.6L480 25.8zm0 112.6v17l-88.2-40.2 56-42 32.2 65.2z"/><path fill="%23ADADAD" d="M405.2 211.2l10.6 108.7-79.3 10 68.7-118.7zM480 169v18.9l-64.2 132 17.4-118.7L480 169zm0 151.5v46.8l-'
||'64.2-47.4 64.2.6zm-186.2 37.4l62.7 64.7-74 6.6 11.3-71.3zm-174-101.3l100.7 90 73.3 11.3-174-101.3zm-50.6 67.3l17.3-59.3 29.3 126-46.6-66.7zm0 0l-4 94L0 367.3v-46.8l69.2 3.4zm114.6 143.3L65.2 417.9l50.6-27.3 68 76.6zM65.2 417.9V480H18.5l46.7-62.1z"/><'
||'path fill="%23A6A6A6" d="M12.5 159.9L0 155.4v-17l12.5 21.5z"/><path fill="%23ADADAD" d="M12.5 159.9L0 187.9V169l12.5-9.1z"/><path fill="%23A6A6A6" d="M308.5 164.6l28 165.3-68.7-126 40.7-39.3zm96.7 46.6l28-10-17.4 118.7-10.6-108.7zM220.5 346.6l62 82.6'
||' 11.3-71.3-73.3-11.3z"/><path fill="%23A6A6A6" d="M282.5 429.2l-6.3 50.8h-74.9l81.2-50.8zM69.2 323.9l46.6 66.7-50.6 27.3 4-94zm-56.7-164l56.7 164-4-79.3-52.7-84.7zM276.2 0l-1 7.9-109.4 12.7L201.3 0h74.9z"/><path fill="%23A6A6A6" d="M86.5 264.6l33.3-8'
||'-4 134-29.3-126z"/><path fill="%23B8BEBE" d="M293.8 357.9l122-38-59.3 102.7-62.7-64.7z"/><path fill="%23F4F4F4" d="M441.8 429.2l-85.3-6.6 59.3-102.7 26 109.3z"/><path fill="%23DCDCE2" d="M480 367.3v58.2l-38.2 3.7-26-109.3 64.2 47.4z"/><path fill="%23'
||'BEC3C3" d="M480 425.5V480h-53.3l15.1-50.8 38.2-3.7z"/><path fill="%23DCDCE2" d="M441.8 429.2L426.7 480h-57.5l-12.7-57.4 85.3 6.6z"/><path fill="%23BEC3C3" d="M369.2 480h-84.1l71.4-57.4 12.7 57.4z"/><path fill="%23F4F4F4" d="M356.5 422.6L285.1 480h-8.'
||'9l6.3-50.8 74-6.6zm-74 6.6L201.3 480h-35.9l18.4-12.8 98.7-38z"/><path fill="%23B8BEBE" d="M115.8 390.6l68 76.6 98.7-38-116.7-63.3-50 24.7z"/><path fill="%23F4F4F4" d="M119.8 256.6l-4 134 50-24.7-46-109.3z"/><path fill="%23CFCFCF" d="M220.5 346.6l62 8'
||'2.6-116.7-63.3-46-109.3 100.7 90z"/><path fill="%23B8BEBE" d="M183.8 467.2L165.4 480H89l-23.8-62.1 118.6 49.3z"/><path fill="%23BEC3C3" d="M89 480H65.2v-62.1L89 480z"/><path fill="%23DCDCE2" d="M65.2 417.9L0 425.5v-58.2l65.2 50.6z"/><path fill="%23CF'
||'CFCF" d="M65.2 417.9L18.5 480H9.4l55.8-62.1z"/><path fill="%23B8BEBE" d="M65.2 417.9L9.4 480H0v-54.5l65.2-7.6z"/><path fill="%23F4F4F4" d="M65.2 244.6l54.6 12-33.3 8-17.3 59.3-4-79.3z"/><path fill="%23CFCFCF" d="M12.5 159.9L0 169v-13.6l12.5 4.5z"/><p'
||'ath fill="%23F4F4F4" d="M69.2 323.9L0 320.5V187.9l12.5-28 56.7 164zm267.3 6l-42.7 28 122-38-79.3 10zm143.5-142v132.6l-64.2-.6 64.2-132zm-171.5-23.3l124.7 36.6-28 10-68.7 118.7-28-165.3z"/><path fill="%23BEC3C3" d="M119.8 256.6l216.7 73.3-42.7 28-174-'
||'101.3z"/><path fill="%23B8BEBE" d="M267.8 203.9l68.7 126-216.7-73.3 148-52.7zm-255.3-44l107.3 96.7-54.6-12-52.7-84.7z"/><path fill="%23CFCFCF" d="M195.8 131.2l-76 125.4-107.3-96.7 183.3-28.7z"/><path fill="%23BEC3C3" d="M69.2 63.2l-56.7 96.7 183.3-28'
||'.7-126.6-68z"/><path fill="%23DCDCE2" d="M69.2 63.2l-56.7 96.7L0 138.4V69.3l69.2-6.1z"/><path fill="%23BEC3C3" d="M103.2 32.6l-34 30.6-4-63.2H89l14.2 32.6z"/><path fill="%23DCDCE2" d="M165.8 20.6l30 110.6-126.6-68 34-30.6 62.6-12z"/><path fill="%23F4'
||'F4F4" d="M119.8 256.6l76-125.4 112.7 33.4-40.7 39.3-148 52.7z"/><path fill="%23DCDCE2" d="M391.8 115.2l41.4 86-124.7-36.6 83.3-49.4zM275.2 7.9l33.3 156.7-112.7-33.4L275.2 7.9z"/><path fill="%23B8BEBE" d="M391.8 115.2l-83.3 49.4L275.2 7.9l9.9-7.9h84.1'
||'l22.6 115.2z"/><path fill="%23CFCFCF" d="M480 9.9v15.9l-32.2 47.4-56 42L480 9.9z"/><path fill="%23B8BEBE" d="M480 0v9.9l-88.2 105.3L426.7 0H480z"/><path fill="%23DCDCE2" d="M426.7 0l-34.9 115.2L369.2 0h57.5z"/><path fill="%23F4F4F4" d="M285.1 0l-9.9 '
||'7.9 1-7.9h8.9zm-83.8 0l-35.5 20.6-62.6 12L165.4 0h35.9z"/><path fill="%23CFCFCF" d="M18.5 0L0 25.8V9.9L9.4 0h9.1z"/><path fill="%23B8BEBE" d="M165.4 0l-62.2 32.6L89 0h76.4zM9.4 0L0 9.9V0h9.4z"/><path fill="%23DCDCE2" d="M480 69.3v69.1l-32.2-65.2 32.2'
||'-3.9z"/><path fill="%23CFCFCF" d="M480 155.4V169l-46.8 32.2-41.4-86 88.2 40.2z"/></svg>'') !important;',
'  border-radius: 8px !important;',
'}',
'.badgeListColor .t-Region-bodyWrap .t-Region-body .t-BadgeList .t-BadgeList-item:nth-child(3n + 3){',
'  margin: 15px;',
'  color: #fff !important;',
'  font-weight: 400;',
'  text-shadow: 0px 2px 2px rgba(0, 0, 0, 0.49);',
'  background: linear-gradient(',
'      to bottom right,',
'      rgba(71, 114, 217, 0.92),',
'      rgba(110, 71, 217, 0.726)',
'    ),',
'    url(''data:image/svg+xml;charset=utf-8,<svg width="480" height="480" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 480 480"><path fill="%23A6A6A6" d="M69.2 63.2L0 69.3V25.8L18.5 0h46.7l4 63.2z"/><path fill="%23ADADAD" d="M165.8 20.6l30 110.6L275'
||'.2 7.9 165.8 20.6z"/><path fill="%23A6A6A6" d="M480 25.8v44.8l-32.2 2.6L480 25.8zm0 112.6v17l-88.2-40.2 56-42 32.2 65.2z"/><path fill="%23ADADAD" d="M405.2 211.2l10.6 108.7-79.3 10 68.7-118.7zM480 169v18.9l-64.2 132 17.4-118.7L480 169zm0 151.5v46.8l-'
||'64.2-47.4 64.2.6zm-186.2 37.4l62.7 64.7-74 6.6 11.3-71.3zm-174-101.3l100.7 90 73.3 11.3-174-101.3zm-50.6 67.3l17.3-59.3 29.3 126-46.6-66.7zm0 0l-4 94L0 367.3v-46.8l69.2 3.4zm114.6 143.3L65.2 417.9l50.6-27.3 68 76.6zM65.2 417.9V480H18.5l46.7-62.1z"/><'
||'path fill="%23A6A6A6" d="M12.5 159.9L0 155.4v-17l12.5 21.5z"/><path fill="%23ADADAD" d="M12.5 159.9L0 187.9V169l12.5-9.1z"/><path fill="%23A6A6A6" d="M308.5 164.6l28 165.3-68.7-126 40.7-39.3zm96.7 46.6l28-10-17.4 118.7-10.6-108.7zM220.5 346.6l62 82.6'
||' 11.3-71.3-73.3-11.3z"/><path fill="%23A6A6A6" d="M282.5 429.2l-6.3 50.8h-74.9l81.2-50.8zM69.2 323.9l46.6 66.7-50.6 27.3 4-94zm-56.7-164l56.7 164-4-79.3-52.7-84.7zM276.2 0l-1 7.9-109.4 12.7L201.3 0h74.9z"/><path fill="%23A6A6A6" d="M86.5 264.6l33.3-8'
||'-4 134-29.3-126z"/><path fill="%23B8BEBE" d="M293.8 357.9l122-38-59.3 102.7-62.7-64.7z"/><path fill="%23F4F4F4" d="M441.8 429.2l-85.3-6.6 59.3-102.7 26 109.3z"/><path fill="%23DCDCE2" d="M480 367.3v58.2l-38.2 3.7-26-109.3 64.2 47.4z"/><path fill="%23'
||'BEC3C3" d="M480 425.5V480h-53.3l15.1-50.8 38.2-3.7z"/><path fill="%23DCDCE2" d="M441.8 429.2L426.7 480h-57.5l-12.7-57.4 85.3 6.6z"/><path fill="%23BEC3C3" d="M369.2 480h-84.1l71.4-57.4 12.7 57.4z"/><path fill="%23F4F4F4" d="M356.5 422.6L285.1 480h-8.'
||'9l6.3-50.8 74-6.6zm-74 6.6L201.3 480h-35.9l18.4-12.8 98.7-38z"/><path fill="%23B8BEBE" d="M115.8 390.6l68 76.6 98.7-38-116.7-63.3-50 24.7z"/><path fill="%23F4F4F4" d="M119.8 256.6l-4 134 50-24.7-46-109.3z"/><path fill="%23CFCFCF" d="M220.5 346.6l62 8'
||'2.6-116.7-63.3-46-109.3 100.7 90z"/><path fill="%23B8BEBE" d="M183.8 467.2L165.4 480H89l-23.8-62.1 118.6 49.3z"/><path fill="%23BEC3C3" d="M89 480H65.2v-62.1L89 480z"/><path fill="%23DCDCE2" d="M65.2 417.9L0 425.5v-58.2l65.2 50.6z"/><path fill="%23CF'
||'CFCF" d="M65.2 417.9L18.5 480H9.4l55.8-62.1z"/><path fill="%23B8BEBE" d="M65.2 417.9L9.4 480H0v-54.5l65.2-7.6z"/><path fill="%23F4F4F4" d="M65.2 244.6l54.6 12-33.3 8-17.3 59.3-4-79.3z"/><path fill="%23CFCFCF" d="M12.5 159.9L0 169v-13.6l12.5 4.5z"/><p'
||'ath fill="%23F4F4F4" d="M69.2 323.9L0 320.5V187.9l12.5-28 56.7 164zm267.3 6l-42.7 28 122-38-79.3 10zm143.5-142v132.6l-64.2-.6 64.2-132zm-171.5-23.3l124.7 36.6-28 10-68.7 118.7-28-165.3z"/><path fill="%23BEC3C3" d="M119.8 256.6l216.7 73.3-42.7 28-174-'
||'101.3z"/><path fill="%23B8BEBE" d="M267.8 203.9l68.7 126-216.7-73.3 148-52.7zm-255.3-44l107.3 96.7-54.6-12-52.7-84.7z"/><path fill="%23CFCFCF" d="M195.8 131.2l-76 125.4-107.3-96.7 183.3-28.7z"/><path fill="%23BEC3C3" d="M69.2 63.2l-56.7 96.7 183.3-28'
||'.7-126.6-68z"/><path fill="%23DCDCE2" d="M69.2 63.2l-56.7 96.7L0 138.4V69.3l69.2-6.1z"/><path fill="%23BEC3C3" d="M103.2 32.6l-34 30.6-4-63.2H89l14.2 32.6z"/><path fill="%23DCDCE2" d="M165.8 20.6l30 110.6-126.6-68 34-30.6 62.6-12z"/><path fill="%23F4'
||'F4F4" d="M119.8 256.6l76-125.4 112.7 33.4-40.7 39.3-148 52.7z"/><path fill="%23DCDCE2" d="M391.8 115.2l41.4 86-124.7-36.6 83.3-49.4zM275.2 7.9l33.3 156.7-112.7-33.4L275.2 7.9z"/><path fill="%23B8BEBE" d="M391.8 115.2l-83.3 49.4L275.2 7.9l9.9-7.9h84.1'
||'l22.6 115.2z"/><path fill="%23CFCFCF" d="M480 9.9v15.9l-32.2 47.4-56 42L480 9.9z"/><path fill="%23B8BEBE" d="M480 0v9.9l-88.2 105.3L426.7 0H480z"/><path fill="%23DCDCE2" d="M426.7 0l-34.9 115.2L369.2 0h57.5z"/><path fill="%23F4F4F4" d="M285.1 0l-9.9 '
||'7.9 1-7.9h8.9zm-83.8 0l-35.5 20.6-62.6 12L165.4 0h35.9z"/><path fill="%23CFCFCF" d="M18.5 0L0 25.8V9.9L9.4 0h9.1z"/><path fill="%23B8BEBE" d="M165.4 0l-62.2 32.6L89 0h76.4zM9.4 0L0 9.9V0h9.4z"/><path fill="%23DCDCE2" d="M480 69.3v69.1l-32.2-65.2 32.2'
||'-3.9z"/><path fill="%23CFCFCF" d="M480 155.4V169l-46.8 32.2-41.4-86 88.2 40.2z"/></svg>'') !important;',
'  border-radius: 8px !important;',
'}',
'.badgeListColor .t-Region-bodyWrap .t-Region-body .t-BadgeList .t-BadgeList-item a span{',
'    color: white !important;',
'}',
'',
'.t-BadgeList--dash a.t-BadgeList-wrap:hover:before {',
'    background-color: rgba(255, 255, 255, 0.07);',
'}',
'',
'.t-BadgeList--circular .t-BadgeList-value a:focus, .t-BadgeList--circular a.t-BadgeList-wrap:focus .t-BadgeList-value, .t-BadgeList--dash .t-BadgeList-wrap:focus-within, .t-BadgeList--dash a.t-BadgeList-wrap:focus {',
'    box-shadow: none !important;',
'    background-color: transparent !important;',
'    color: #fff;',
'}'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'HMARTINEZ'
,p_last_upd_yyyymmddhh24miss=>'20210608104000'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71869892327365521)
,p_plug_name=>'Tabs Container '
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple:t-TabsRegion-mod--large'
,p_plug_template=>wwv_flow_api.id(164084128065707698)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71869987299365522)
,p_plug_name=>'VUR'
,p_parent_plug_id=>wwv_flow_api.id(71869892327365521)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select --a.id_vur,',
'       --a.id_impsto,',
'       --a.id_impsto_sbmpsto,',
'       --a.id_sjto_impsto,',
'       a.pin,',
'       a.id_rnta,',
'       a.id_lqdcion,',
'       --a.id_dcmnto,',
'       c.nmro_dcmnto,',
'       a.id_rcdo,',
'       a.fcha_prcso,',
'       trunc(a.fcha_rcdo),',
'       d.idntfccion_sjto,',
'       b.nmbre_rzon_scial,',
'       to_char(c.vlor, :F_FRMTO_MNDA)',
'  from gi_g_vur                a ',
'  join si_i_personas           b on b.id_sjto_impsto = a.id_sjto_impsto',
'  join re_g_recaudos           c on c.id_rcdo        = a.id_rcdo',
'  join v_si_i_sujetos_impuesto d on d.id_sjto_impsto = a.id_sjto_impsto',
' where a.id_impsto         =  :P126_IMPSTO',
'   and a.id_impsto_sbmpsto =  :P126_IMPSTO_SUBMPSTO',
'   and c.fcha_rcdo         >= :P126_FCHA_DSDE --or :P198_FCHA_DSDE is null',
'   and c.fcha_rcdo         <= :P126_FCHA_HSTA --or :P198_FCHA_HSTA is null'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P126_FCHA_DSDE,P126_FCHA_HSTA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4102522887955207)
,p_name=>'NMRO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'No. Recaudo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
,p_value_alignment=>'CENTER'
,p_link_target=>unistr('f?p=&APP_ID.:199:&SESSION.::&DEBUG.:RP:P199_ID_RCDO,P199_TTLO:&ID_RCDO.,Informaci\00F3n del Recaudo')
,p_link_text=>'&NMRO_DCMNTO.'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4102848041955210)
,p_name=>'NMBRE_RZON_SCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RZON_SCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Contribuyente'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>300
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>200
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4103026201955212)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>320
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>25
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4103234212955214)
,p_name=>'FCHA_PRCSO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_PRCSO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de Procesamiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>340
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8376970693635008)
,p_name=>'PIN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PIN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'PIN'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'LEFT'
,p_link_target=>'f?p=&APP_ID.:149:&SESSION.::&DEBUG.:RP:P149_ID_RNTA,P149_BRANCH:&ID_RNTA.,&APP_PAGE_ID.'
,p_link_text=>'&PIN.'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10845870102430618)
,p_name=>'ID_RCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RCDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>350
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10845999579430619)
,p_name=>'ID_LQDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_LQDCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>unistr('No. de Liquidaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>360
,p_value_alignment=>'CENTER'
,p_link_target=>unistr('f?p=&APP_ID.:199:&SESSION.::&DEBUG.:RP:P199_ID_LQDCION,P199_TTLO:&ID_LQDCION.,Informaci\00F3n de la Liquidaci\00F3n')
,p_link_text=>'&ID_LQDCION.'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10846008236430620)
,p_name=>'ID_RNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RNTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>370
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10846152515430621)
,p_name=>'TRUNC(A.FCHA_RCDO)'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRUNC(A.FCHA_RCDO)'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de Recaudo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>380
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10846213509430622)
,p_name=>'TO_CHAR(C.VLOR,:F_FRMTO_MNDA)'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TO_CHAR(C.VLOR,:F_FRMTO_MNDA)'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Valor Recaudado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>390
,p_value_alignment=>'RIGHT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(71870131186365523)
,p_internal_uid=>71870131186365523
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(115558311149626008)
,p_interactive_grid_id=>wwv_flow_api.id(71870131186365523)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>20
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(115558408044626016)
,p_report_id=>wwv_flow_api.id(115558311149626008)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10638536787312)
,p_view_id=>wwv_flow_api.id(115558408044626016)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(4103026201955212)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>140
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8426669016158991)
,p_view_id=>wwv_flow_api.id(115558408044626016)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(8376970693635008)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>157
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10791091075771694)
,p_view_id=>wwv_flow_api.id(115558408044626016)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(4102522887955207)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>138
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10792591555771699)
,p_view_id=>wwv_flow_api.id(115558408044626016)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(4102848041955210)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>361
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10834773740726162)
,p_view_id=>wwv_flow_api.id(115558408044626016)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(4103234212955214)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>179
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10936560279061508)
,p_view_id=>wwv_flow_api.id(115558408044626016)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(10845870102430618)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10938768299070048)
,p_view_id=>wwv_flow_api.id(115558408044626016)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(10845999579430619)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10943015426105930)
,p_view_id=>wwv_flow_api.id(115558408044626016)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(10846008236430620)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10945963954133178)
,p_view_id=>wwv_flow_api.id(115558408044626016)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(10846152515430621)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>148
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10952105982250831)
,p_view_id=>wwv_flow_api.id(115558408044626016)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(10846213509430622)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>146
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(212316205070398444)
,p_plug_name=>unistr('Estad\00EDsticas ')
,p_parent_plug_id=>wwv_flow_api.id(71869892327365521)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10844613088430606)
,p_plug_name=>unistr('Recaudos por d\00EDa')
,p_parent_plug_id=>wwv_flow_api.id(212316205070398444)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--stacked:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>100
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(10844727957430607)
,p_region_id=>wwv_flow_api.id(10844613088430606)
,p_chart_type=>'lineWithArea'
,p_animation_on_display=>'zoom'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'smooth'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_fill_multi_series_gaps=>false
,p_zoom_and_scroll=>'delayed'
,p_initial_zooming=>'none'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_legend_font_family=>'Arial'
,p_legend_font_color=>'#000000'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'No hay datos que mostrar.'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(10844878547430608)
,p_chart_id=>wwv_flow_api.id(10844727957430607)
,p_seq=>10
,p_name=>unistr('Recaudos por d\00EDa')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Recaudos por mes ',
'select c.fcha_rcdo,',
'       to_char(c.fcha_rcdo, ''Day'') as dia,',
'       to_char(c.fcha_rcdo, ''DD/MM/YYYY'') as dia_mes,',
'       to_char(c.fcha_rcdo, ''DD'') as nmro_dia,',
'       to_char(c.fcha_rcdo, ''Month'') as mes,',
'       count(a.id_rnta) as cntdad,',
'       sum(b.vlor_ttal_dcmnto) as vlor_rcddo,',
'       ''<b>Liquidaciones de VUR Recaudadas: </b>'' || count(a.id_rnta) || ',
unistr('       ''<br><b>D\00EDa: </b>''                         || to_char(c.fcha_rcdo, ''DD/MM/YYYY'') || '),
'       ''<br><b>Total Recaudado: </b> ''            || to_char(sum(b.vlor_ttal_dcmnto), :F_FRMTO_MNDA) || ',
'       ''<br>'' as tooltip',
'  from gi_g_rentas a',
'  join re_g_documentos b',
'    on a.id_dcmnto = b.id_dcmnto',
'  join re_g_recaudos c',
'    on b.id_dcmnto = c.id_orgen',
'   and c.cdgo_rcdo_orgn_tpo = ''DC''',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_impsto = :P126_IMPSTO',
'   and a.id_impsto_sbmpsto = :P126_IMPSTO_SUBMPSTO',
'   and b.indcdor_pgo_aplcdo = ''S''',
'      and (trunc(c.fcha_rcdo) >= :P126_FCHA_DSDE /*or :P126_FCHA_DSDE is null*/)',
'      and (trunc(c.fcha_rcdo) <= :P126_FCHA_HSTA /*or :P126_FCHA_HSTA is null*/)',
'',
' group by c.fcha_rcdo,',
'          to_char(c.fcha_rcdo, ''Day''),',
'          to_char(c.fcha_rcdo, ''DD/MM/YYYY''),',
'          to_char(c.fcha_rcdo, ''DD''),',
'          to_char(c.fcha_rcdo, ''Month'')',
' order by c.fcha_rcdo',
''))
,p_ajax_items_to_submit=>'P126_FCHA_DSDE,P126_FCHA_HSTA'
,p_optimizer_hint=>'/*+ RESULT_CACHE */'
,p_items_value_column_name=>'VLOR_RCDDO'
,p_items_label_column_name=>'DIA_MES'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_custom_column_name=>'TOOLTIP'
,p_color=>'#4C46FA'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
end;
/
begin
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(10845063593430610)
,p_chart_id=>wwv_flow_api.id(10844727957430607)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Valor'
,p_format_type=>'currency'
,p_currency=>'COP'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(10844908246430609)
,p_chart_id=>wwv_flow_api.id(10844727957430607)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Mes'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10845154188430611)
,p_plug_name=>unistr('Distribuci\00F3n de Recaudos por D\00EDa')
,p_parent_plug_id=>wwv_flow_api.id(212316205070398444)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>110
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(10845250737430612)
,p_region_id=>wwv_flow_api.id(10845154188430611)
,p_chart_type=>'pie'
,p_title=>unistr('Distribuci\00F3n de Recaudos por D\00EDa')
,p_animation_on_display=>'zoom'
,p_animation_on_data_change=>'slideToLeft'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'snap'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'percent'
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_title=>'Mes'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlightAndExplode'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(10845378016430613)
,p_chart_id=>wwv_flow_api.id(10845250737430612)
,p_seq=>10
,p_name=>unistr('Distribuci\00F3n de Recaudos por D\00EDa')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('-- Recaudos por d\00EDa '),
'select trunc(c.fcha_rcdo) as dia',
'         , sum(b.vlor_ttal_dcmnto) as vlor_rcddo     ',
'         , ''<b> Liquidaciones de VUR Recaudadas: </b>''         || ',
'             count(a.id_rnta)||''<br><b>Total Recaudado: </b> '' || ',
'             to_char(sum(b.vlor_ttal_dcmnto),:F_FRMTO_MNDA)    || ',
'             ''<br><b>Fecha del Recaudo: </b> '' || trunc(c.fcha_rcdo) || ''<br>'' as tooltip',
'  from gi_g_rentas     a',
'  join re_g_documentos b on a.id_dcmnto = b.id_dcmnto',
'  join re_g_recaudos   c on b.id_dcmnto = c.id_orgen  and c.cdgo_rcdo_orgn_tpo = ''DC''          ',
' where   a.cdgo_clnte           = :F_CDGO_CLNTE',
'   and   a.id_impsto            = :P126_IMPSTO',
'   and   a.id_impsto_sbmpsto    = :P126_IMPSTO_SUBMPSTO',
'   --and a.indcdor_rnta_pgda  = ''S''',
'   and b.indcdor_pgo_aplcdo = ''S''',
'   and (trunc(c.fcha_rcdo)  >= :P126_FCHA_DSDE /*or :P126_FCHA_DSDE is null*/)',
'   and (trunc(c.fcha_rcdo)  <= :P126_FCHA_HSTA /*or :P126_FCHA_HSTA is null*/)',
' group by trunc(c.fcha_rcdo) ',
' order by trunc(c.fcha_rcdo) asc'))
,p_ajax_items_to_submit=>'P126_FCHA_DSDE,P126_FCHA_HSTA'
,p_optimizer_hint=>'/*+ RESULT_CACHE */'
,p_items_value_column_name=>'VLOR_RCDDO'
,p_items_label_column_name=>'DIA'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10845449504430614)
,p_plug_name=>'Total Recaudado por Conceptos'
,p_parent_plug_id=>wwv_flow_api.id(212316205070398444)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-md'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.dscrpcion as label, to_char(sum(a.vlor_lqddo), :F_FRMTO_MNDA) as value',
'  from gi_g_rentas_acto_concepto    a',
'  join gi_g_rentas_acto             b on b.id_rnta_acto          = a.id_rnta_acto',
'  join gi_g_rentas                  c on c.id_rnta               = b.id_rnta',
'  join df_i_impuestos_acto_concepto d on d.id_impsto_acto_cncpto = a.id_impsto_acto_cncpto',
'  join df_i_conceptos               e on e.id_cncpto             = d.id_cncpto',
'  join re_g_recaudos                f on f.id_orgen              = c.id_dcmnto',
'  ',
' where c.cdgo_clnte        = :F_CDGO_CLNTE',
'   and c.id_impsto         = :P126_IMPSTO',
'   and c.id_impsto_sbmpsto = :P126_IMPSTO_SUBMPSTO',
'   and ((f.fcha_rcdo) >= :P126_FCHA_DSDE)',
'   and ((f.fcha_rcdo) <= :P126_FCHA_HSTA)',
'   ',
'   group by e.dscrpcion',
'   order by e.dscrpcion'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_ajax_items_to_submit=>'P126_FCHA_DSDE,P126_FCHA_HSTA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(212049412007404931)
,p_plug_name=>unistr('Distribuci\00F3n de Recaudos por Actos Liquidados')
,p_parent_plug_id=>wwv_flow_api.id(212316205070398444)
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(8302125823402110)
,p_region_id=>wwv_flow_api.id(212049412007404931)
,p_chart_type=>'donut'
,p_title=>unistr('Distribuci\00F3n de Recaudos por Actos Liquidados')
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'percent'
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_title=>'Estados de Pasaportes'
,p_legend_position=>'start'
,p_legend_font_color=>'#000000'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_no_data_found_message=>'No hay datos por mostrar.'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(8302618214402121)
,p_chart_id=>wwv_flow_api.id(8302125823402110)
,p_seq=>10
,p_name=>'Recaudo por Actos'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto_acto as Acto, sum(d.vlor_lqddo) as Valor_Recaudado,',
'        ''<b> Acto: </b>'' || b.nmbre_impsto_acto||''<br><b>Total Recaudado: </b> '' || to_char(sum(d.vlor_lqddo),:F_FRMTO_MNDA) || ''<br>'' as tooltip',
'  from gi_g_vur                    a',
'  join v_gi_g_rentas_acto          b on b.id_rnta = a.id_rnta',
'  join re_g_recaudos               c on c.id_rcdo = a.id_rcdo',
'  join gi_g_rentas_acto_concepto   d on d.id_rnta_acto = b.id_rnta_acto',
'',
' where a.id_impsto         =  :P126_IMPSTO',
'   and a.id_impsto_sbmpsto =  :P126_IMPSTO_SUBMPSTO',
'   and c.fcha_rcdo         >= :P126_FCHA_DSDE --or :P126_FCHA_DSDE is null',
'   and c.fcha_rcdo         <= :P126_FCHA_HSTA --or :P126_FCHA_HSTA is null',
'   ',
' group by b.nmbre_impsto_acto'))
,p_ajax_items_to_submit=>'P126_FCHA_DSDE,P126_FCHA_HSTA'
,p_optimizer_hint=>'/*+ RESULT_CACHE */'
,p_series_name_column_name=>'ACTO'
,p_items_value_column_name=>'VALOR_RECAUDADO'
,p_items_label_column_name=>'ACTO'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideBarEdge'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(212050249738404940)
,p_plug_name=>'Total Recaudado General'
,p_parent_plug_id=>wwv_flow_api.id(212316205070398444)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-md'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(count(a.id_rnta)) as vlue, ''Liquidaciones de VUR Recaudadas'' as ttlo',
'  from gi_g_rentas     a',
'  join re_g_documentos b on a.id_dcmnto = b.id_dcmnto',
'  join re_g_recaudos   c on c.id_orgen  = b.id_dcmnto and c.cdgo_rcdo_orgn_tpo = ''DC''',
' where   a.cdgo_clnte           = :F_CDGO_CLNTE',
'   and   a.id_impsto            = :P126_IMPSTO',
'   and   a.id_impsto_sbmpsto    = :P126_IMPSTO_SUBMPSTO',
'   and b.indcdor_pgo_aplcdo  = ''S''',
'   and ((c.fcha_rcdo) >= :P126_FCHA_DSDE /*or :P126_FCHA_DSDE is null*/)',
'   and ((c.fcha_rcdo) <= :P126_FCHA_HSTA /*or :P126_FCHA_HSTA is null*/)',
'',
'union all',
'',
'select to_char(nvl(sum(b.vlor_ttal_dcmnto),0),:F_FRMTO_MNDA) as vlue, ''Total Recaudado'' as ttlo',
'  from gi_g_rentas     a',
'  join re_g_documentos b on a.id_dcmnto = b.id_dcmnto',
'  join re_g_recaudos   c on c.id_orgen  = b.id_dcmnto and c.cdgo_rcdo_orgn_tpo = ''DC''',
' where   a.cdgo_clnte           = :F_CDGO_CLNTE',
'   and   a.id_impsto            = :P126_IMPSTO',
'   and   a.id_impsto_sbmpsto    = :P126_IMPSTO_SUBMPSTO',
'   and b.indcdor_pgo_aplcdo  = ''S''',
'   and ((c.fcha_rcdo) >= :P126_FCHA_DSDE /*or :P126_FCHA_DSDE is null*/)',
'   and ((c.fcha_rcdo) <= :P126_FCHA_HSTA /*or :P126_FCHA_HSTA is null*/)'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_ajax_items_to_submit=>'P126_FCHA_DSDE,P126_FCHA_HSTA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VLUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TTLO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(212051383395404951)
,p_plug_name=>'Recaudos por mes'
,p_parent_plug_id=>wwv_flow_api.id(212316205070398444)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--stacked:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>80
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(8303797851402129)
,p_region_id=>wwv_flow_api.id(212051383395404951)
,p_chart_type=>'lineWithArea'
,p_animation_on_display=>'zoom'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'smooth'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_fill_multi_series_gaps=>false
,p_zoom_and_scroll=>'delayed'
,p_initial_zooming=>'none'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>false
,p_show_row=>false
,p_show_start=>false
,p_show_end=>false
,p_show_progress=>false
,p_show_baseline=>false
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_legend_font_family=>'Arial'
,p_legend_font_color=>'#000000'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'No hay datos que mostrar.'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>false
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(8305439495402141)
,p_chart_id=>wwv_flow_api.id(8303797851402129)
,p_seq=>10
,p_name=>'Recaudos por mes'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Recaudos por mes ',
'select to_char(c.fcha_rcdo, ''Month'') as mes',
'     , to_char(c.fcha_rcdo, ''MM'')    as nmro_mes',
'     , to_char(c.fcha_rcdo, ''YYYY'')  as anio',
'     , count(a.id_rnta)              as cntdad',
'     , sum(b.vlor_ttal_dcmnto)       as vlor_rcddo     ',
'     , ''<b> Liquidaciones de VUR Recaudadas: </b>'' || count(a.id_rnta)||''<br><b>Total Recaudado: </b> '' || to_char(sum(b.vlor_ttal_dcmnto),:F_FRMTO_MNDA) || ''<br>'' as tooltip',
'  from gi_g_rentas     a',
'  join re_g_documentos b on a.id_dcmnto = b.id_dcmnto',
'  join re_g_recaudos   c on b.id_dcmnto = c.id_orgen  and c.cdgo_rcdo_orgn_tpo = ''DC''          ',
' where   a.cdgo_clnte           = :F_CDGO_CLNTE',
'   and   a.id_impsto            = :P126_IMPSTO',
'   and   a.id_impsto_sbmpsto    = :P126_IMPSTO_SUBMPSTO',
'   and b.indcdor_pgo_aplcdo = ''S''',
'   and (trunc(c.fcha_rcdo) >= :P126_FCHA_DSDE /*or :P126_FCHA_DSDE is null*/)',
'   and (trunc(c.fcha_rcdo) <= :P126_FCHA_HSTA /*or :P126_FCHA_HSTA is null*/)',
' group by to_char(c.fcha_rcdo, ''Month''),to_char(c.fcha_rcdo, ''MM''), to_char(c.fcha_rcdo, ''YYYY'')',
' order by to_char(c.fcha_rcdo, ''MM'')'))
,p_ajax_items_to_submit=>'P126_FCHA_DSDE,P126_FCHA_HSTA'
,p_optimizer_hint=>'/*+ RESULT_CACHE */'
,p_items_value_column_name=>'VLOR_RCDDO'
,p_items_label_column_name=>'MES'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_custom_column_name=>'TOOLTIP'
,p_color=>'#4C46FA'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(8304252884402129)
,p_chart_id=>wwv_flow_api.id(8303797851402129)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Mes'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(8304818419402140)
,p_chart_id=>wwv_flow_api.id(8303797851402129)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Valor'
,p_format_type=>'currency'
,p_currency=>'COP'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(212316303743398445)
,p_plug_name=>'Cantidad de Actos de VUR Liquidados'
,p_region_name=>'rx1'
,p_parent_plug_id=>wwv_flow_api.id(212316205070398444)
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(8306309678402141)
,p_region_id=>wwv_flow_api.id(212316303743398445)
,p_chart_type=>'bar'
,p_title=>'Cantidad de Actos de VUR Liquidados'
,p_animation_on_display=>'alphaFade'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'on'
,p_stack_label=>'on'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(8308082115402145)
,p_chart_id=>wwv_flow_api.id(8306309678402141)
,p_seq=>10
,p_name=>'Actos Liquidados'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto_sbmpsto as Impuesto, ',
'        count(a.id_rnta)      as Cantidad',
'  from gi_g_vur                   a',
'  join df_i_impuestos_subimpuesto b on b.id_impsto_sbmpsto = a.id_impsto_sbmpsto',
'  join re_g_recaudos              c on c.id_rcdo           = a.id_rcdo',
'',
' where a.id_impsto         =  :P126_IMPSTO',
'   and a.id_impsto_sbmpsto =  :P126_IMPSTO_SUBMPSTO',
'   and c.fcha_rcdo         >= :P126_FCHA_DSDE --or :P198_FCHA_DSDE is null',
'   and c.fcha_rcdo         <= :P126_FCHA_HSTA --or :P198_FCHA_HSTA is null',
'',
' group by b.nmbre_impsto_sbmpsto'))
,p_ajax_items_to_submit=>'P126_FCHA_DSDE,P126_FCHA_HSTA'
,p_optimizer_hint=>'/*+ RESULT_CACHE */'
,p_items_value_column_name=>'CANTIDAD'
,p_items_label_column_name=>'IMPUESTO'
,p_color=>'#5DE1E3'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(8306894063402144)
,p_chart_id=>wwv_flow_api.id(8306309678402141)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Actos Recaudados de VUR'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(8307486234402144)
,p_chart_id=>wwv_flow_api.id(8306309678402141)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Cantidad de Actos Recaudados'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(212700089251731927)
,p_plug_name=>unistr('Distribuci\00F3n de Recaudos por Mes ')
,p_parent_plug_id=>wwv_flow_api.id(212316205070398444)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>90
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(8308989220402146)
,p_region_id=>wwv_flow_api.id(212700089251731927)
,p_chart_type=>'pie'
,p_title=>unistr('Distribuci\00F3n de Recaudos por Mes ')
,p_animation_on_display=>'zoom'
,p_animation_on_data_change=>'slideToLeft'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'snap'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'percent'
,p_value_format_scaling=>'auto'
,p_fill_multi_series_gaps=>false
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>false
,p_show_value=>true
,p_show_label=>false
,p_show_row=>false
,p_show_start=>false
,p_show_end=>false
,p_show_progress=>false
,p_show_baseline=>false
,p_legend_rendered=>'on'
,p_legend_title=>'Mes'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlightAndExplode'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>false
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(8309463046402146)
,p_chart_id=>wwv_flow_api.id(8308989220402146)
,p_seq=>10
,p_name=>unistr('Distribuci\00F3n de Recaudos por Mes ')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Recaudos por mes ',
'select to_char(c.fcha_rcdo, ''Month'') as mes ',
'     --, count(a.id_rnta)              as cntdad',
'     , sum(b.vlor_ttal_dcmnto)       as vlor_rcddo     ',
'     , ''<b> Liquidaciones de VUR Recaudadas: </b>'' || count(a.id_rnta)||''<br><b>Total Recaudado: </b> '' || to_char(sum(b.vlor_ttal_dcmnto),:F_FRMTO_MNDA) || ''<br>'' as tooltip',
'  from gi_g_rentas     a',
'  join re_g_documentos b on a.id_dcmnto = b.id_dcmnto',
'  join re_g_recaudos   c on b.id_dcmnto = c.id_orgen  and c.cdgo_rcdo_orgn_tpo = ''DC''          ',
' where   a.cdgo_clnte           = :F_CDGO_CLNTE',
'   and   a.id_impsto            = :P126_IMPSTO',
'   and   a.id_impsto_sbmpsto    = :P126_IMPSTO_SUBMPSTO',
'   --and a.indcdor_rnta_pgda  = ''S''',
'   and b.indcdor_pgo_aplcdo = ''S''',
'   and (trunc(c.fcha_rcdo)  >= :P126_FCHA_DSDE /*or :P126_FCHA_DSDE is null*/)',
'   and (trunc(c.fcha_rcdo)  <= :P126_FCHA_HSTA /*or :P126_FCHA_HSTA is null*/)',
' group by to_char(c.fcha_rcdo, ''Month'')',
' order by to_char(c.fcha_rcdo, ''Month'')'))
,p_ajax_items_to_submit=>'P126_FCHA_DSDE,P126_FCHA_HSTA'
,p_optimizer_hint=>'/*+ RESULT_CACHE */'
,p_items_value_column_name=>'VLOR_RCDDO'
,p_items_label_column_name=>'MES'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(212100456928058544)
,p_plug_name=>'Cabecera'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(115622143046065207)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_parent_plug_id=>wwv_flow_api.id(212100456928058544)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(115622193731065208)
,p_plug_name=>'<b>Resumen</b>'
,p_parent_plug_id=>wwv_flow_api.id(212100456928058544)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(212510944575110131)
,p_plug_name=>'TOTAL DE LIQUIDACIONES DE VUR'
,p_parent_plug_id=>wwv_flow_api.id(115622193731065208)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_grid_column_css_classes=>'badgeListColor'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*) as cntdad, ''Total Liquidaciones de VUR'' as ttal',
'  from gi_g_vur a',
'  left join re_g_recaudos b on a.id_dcmnto = b.id_orgen',
' where a.id_impsto         = :P126_IMPSTO',
'   and a.id_impsto_sbmpsto = :P126_IMPSTO_SUBMPSTO',
'   and b.fcha_rcdo         >= :P126_FCHA_DSDE --or :P126_FCHA_DSDE is null',
'   and b.fcha_rcdo         <= :P126_FCHA_HSTA --or :P126_FCHA_HSTA is null;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_ajax_items_to_submit=>'P126_FCHA_DSDE,P126_FCHA_HSTA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'CNTDAD'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(212475289115205776)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
'Funcionalidad que permite Consultar liquidaciomes de VUR en un rango de fechas establecidos. <br><br>',
'<b></b> Adicionalmente muestra un consolidados de los pasaportes por estados y el valor total recadudado de las pasaportes procesados.<br><br>',
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8300780829402088)
,p_name=>'P126_IDNTFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(71869987299365522)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8301173340402107)
,p_name=>'P126_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(71869987299365522)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8310684914402148)
,p_name=>'P126_FCHA_DSDE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(115622143046065207)
,p_item_default=>'trunc(sysdate,''MM'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'<b>Fecha Desde</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>11
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8311057491402149)
,p_name=>'P126_FCHA_HSTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(115622143046065207)
,p_item_default=>' trunc(last_day(sysdate))'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'<b>Fecha Hasta</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>11
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P126_FCHA_DSDE.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8311702366402150)
,p_name=>'P126_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(115622193731065208)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8312171318402150)
,p_name=>'P126_IMPSTO_SUBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(115622193731065208)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(8315276792402170)
,p_computation_sequence=>10
,p_computation_item=>'P126_IMPSTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto',
'  from df_c_impuestos',
' where cdgo_clnte   = :F_CDGO_CLNTE',
'   and cdgo_impsto  = ''REN'''))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(8314838716402167)
,p_computation_sequence=>20
,p_computation_item=>'P126_IMPSTO_SUBMPSTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto_sbmpsto',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte          = :F_CDGO_CLNTE',
'   and id_impsto           = :P126_IMPSTO',
'   and cdgo_impsto_sbmpsto = ''VUR'''))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8315521662402171)
,p_name=>'Al cambiar la Fecha Desde'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P126_FCHA_DSDE,P126_FCHA_HSTA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8320599220402184)
,p_event_id=>wwv_flow_api.id(8315521662402171)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P126_FCHA_HSTA").datepicker( ''option'' , ''minDate'' , $("#P126_FCHA_DSDE").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8317084606402181)
,p_event_id=>wwv_flow_api.id(8315521662402171)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(212316303743398445)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8317528612402181)
,p_event_id=>wwv_flow_api.id(8315521662402171)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(212049412007404931)
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8318096553402182)
,p_event_id=>wwv_flow_api.id(8315521662402171)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(212050249738404940)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10845505831430615)
,p_event_id=>wwv_flow_api.id(8315521662402171)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(10845449504430614)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8318566097402182)
,p_event_id=>wwv_flow_api.id(8315521662402171)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(212051383395404951)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10845794165430617)
,p_event_id=>wwv_flow_api.id(8315521662402171)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(10844613088430606)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8319049185402182)
,p_event_id=>wwv_flow_api.id(8315521662402171)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(212700089251731927)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10845648328430616)
,p_event_id=>wwv_flow_api.id(8315521662402171)
,p_event_result=>'TRUE'
,p_action_sequence=>120
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(10845154188430611)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8319513971402183)
,p_event_id=>wwv_flow_api.id(8315521662402171)
,p_event_result=>'TRUE'
,p_action_sequence=>130
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(212510944575110131)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8320050209402183)
,p_event_id=>wwv_flow_api.id(8315521662402171)
,p_event_result=>'TRUE'
,p_action_sequence=>140
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(71869987299365522)
,p_stop_execution_on_error=>'Y'
);
end;
/
