prompt --application/pages/page_00054
begin
wwv_flow_api.create_page(
 p_id=>54
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Consulta de Expediente de Fiscalizaci\00F3n')
,p_step_title=>unistr('Consulta de Expediente de Fiscalizaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.badgeListColor .t-Region-bodyWrap .t-Region-body .t-BadgeList .t-BadgeList-item:nth-child(8n + 1){',
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
'  max-width: 398px;',
'',
'}',
'.badgeListColor .t-Region-bodyWrap .t-Region-body .t-BadgeList .t-BadgeList-item:nth-child(8n + 2){',
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
'  max-width: 398px;',
'}',
'.badgeListColor .t-Region-bodyWrap .t-Region-body .t-BadgeList .t-BadgeList-item:nth-child(8n + 3){',
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
'  max-width: 398px;',
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
,p_step_template=>wwv_flow_api.id(36470205860968633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20230412100045'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14544911045012608)
,p_plug_name=>'Expedientes Programas'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  count(c.id_prgrma) as total,',
'        c.nmbre_prgrma',
'from v_fi_g_candidatos          c',
'join fi_g_candidatos_vigencia   d   on  c.id_cnddto             =   d.id_cnddto',
'join fi_g_fiscalizacion_expdnte e   on  c.id_cnddto             =   e.id_cnddto',
'join fi_g_candidatos_funcionario    b   on  c.id_cnddto             =   b.id_cnddto',
'join v_si_i_sujetos_impuesto        g   on  c.id_sjto_impsto        =   g.id_sjto_impsto',
'where c.cdgo_clnte = :F_CDGO_CLNTE',
'and b.id_fncnrio = nvl( :P54_ID_FNCNRIO , b.id_fncnrio )',
'and c.id_impsto = nvl( :P54_ID_IMPSTO  , c.id_impsto )',
'and c.id_impsto_sbmpsto = nvl( :P54_ID_IMPSTO_SBMPSTO , c.id_impsto_sbmpsto )',
'and e.cdgo_expdnte_estdo = nvl(:P54_CDGO_EXPDNTE_ESTDO,e.cdgo_expdnte_estdo)',
'and c.id_prgrma = nvl(:P54_ID_PRGRMA,c.id_prgrma)',
'and c.id_sbprgrma = nvl(:P54_ID_SBPRGRMA,c.id_sbprgrma)',
'and g.idntfccion_sjto   = nvl(:P54_IDNTFCCION, g.idntfccion_sjto)',
'group by c.nmbre_prgrma;',
'',
'',
''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'NMBRE_PRGRMA'
,p_attribute_02=>'TOTAL'
,p_attribute_05=>'F'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(74445485200817902)
,p_plug_name=>unistr('Consulta de Expediente de Fiscalizaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'from (select ',
'	   a.nmbre_impsto,',
'       a.nmbre_impsto_sbmpsto,',
'	   a.nmbre_prgrma,',
'	   a.nmbre_sbprgrma,',
'	   a.id_sjto_impsto,',
'       g.idntfccion_sjto,',
'	   c.nmro_expdnte,',
'	   j.nmbre as estdo,',
'	   c.id_instncia_fljo,',
'	   trunc(c.fcha_aprtra ) as fcha_aprtra,',
'	   f.dscrpcion_trea as etapa',
'       ,( select x.dscrpcion from gn_d_actos_tipo x where x.id_acto_tpo =',
'       ac.id_acto_tpo ) as nmbre_acto_tpo',
'       ,ac.id_acto as id_acto',
'       --,trunc(ac.fcha_vncmnto_trmno) as prueba',
'       ,nvl((case  when ac.id_acto is null then  ',
'				''No''  ',
'			  else  ',
unistr('				''S\00ED'' '),
'			  end ), ''No'') as generado',
'',
'        ,nvl(( case  when y.id_ntfccion_dtlle is not  null  then ',
unistr('                ''S\00ED''  '),
'                else  ',
'                ''No'' end), ''No'') as notificado ,',
'        (select z.PRMER_NMBRE ||'' ''||z.PRMER_APLLDO from df_c_funcionarios  x',
'         join si_c_terceros z on  x.id_trcro = z.id_trcro ',
'         where x.ID_FNCNRIO=  nvl( :P54_ID_FNCNRIO , b.id_fncnrio )) as funcionario ',
'from v_fi_g_candidatos              a',
'join fi_g_candidatos_funcionario    b   on  a.id_cnddto             =   b.id_cnddto',
'join fi_g_fiscalizacion_expdnte     c   on  a.id_cnddto             =   c.id_cnddto    ',
'join wf_g_instancias_transicion     d   on  c.id_instncia_fljo      =   d.id_instncia_fljo',
'join wf_d_flujos_tarea              e   on  d.id_fljo_trea_orgen    =   e.id_fljo_trea',
'join wf_d_tareas                    f   on  e.id_trea               =   f.id_trea',
'join v_si_i_sujetos_impuesto        g   on  a.id_sjto_impsto        =   g.id_sjto_impsto',
'join fi_d_expediente_estado 		j   on  c.cdgo_expdnte_estdo    = j.cdgo_expdnte_estdo',
'left join fi_g_fsclzcion_expdnte_acto   ac  on  ac.id_fsclzcion_expdnte =   c.id_fsclzcion_expdnte',
'                                        and ac.id_fljo_trea         =   e.id_fljo_trea',
'left join nt_g_notificaciones       w   on ac.id_acto  = w.id_acto                                           ',
'left join nt_g_notificaciones_detalle y on w.id_ntfccion = y.id_ntfccion and y.id_ntfccion is not null',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and b.id_fncnrio = nvl( :P54_ID_FNCNRIO , b.id_fncnrio )',
'and c.cdgo_expdnte_estdo = nvl( :P54_CDGO_EXPDNTE_ESTDO , c.cdgo_expdnte_estdo )',
'--and d.id_estdo_trnscion in (1,2) ',
'and a.id_impsto = nvl( :P54_ID_IMPSTO  , a.id_impsto )',
'and a.id_impsto_sbmpsto = nvl( :P54_ID_IMPSTO_SBMPSTO , a.id_impsto_sbmpsto )',
'and a.id_prgrma = nvl( :P54_ID_PRGRMA , a.id_prgrma )',
'and a.id_sbprgrma = nvl( :P54_ID_SBPRGRMA  , a.id_sbprgrma )',
'and g.idntfccion_sjto   = nvl(:P54_IDNTFCCION, g.idntfccion_sjto)    ',
'--and e.id_fljo_trea = nvl(:P54_ETPA, e.id_fljo_trea)',
'group by a.nmbre_impsto,',
'       a.nmbre_impsto_sbmpsto,',
'	   a.nmbre_prgrma,',
'	   a.nmbre_sbprgrma,',
'	   a.id_sjto_impsto,',
'       g.idntfccion_sjto,',
'	   c.nmro_expdnte,',
'	   j.nmbre ,',
'	   c.id_instncia_fljo,',
'	   trunc(c.fcha_aprtra ) ,',
'	  -- trunc(ac.fcha_vncmnto_trmno),',
'	   f.dscrpcion_trea ,',
'         --max(y.id_ntfccion_dtlle ),',
'          ac.id_acto_tpo,',
'         ac.id_acto,',
unistr('         nvl((case when ac.id_acto is null then ''No'' else ''S\00ED'' end ), ''No''),'),
unistr('         nvl((case when y.id_ntfccion_dtlle is not null  then ''S\00ED'' else ''No'' end), ''No''),'),
'      b.id_fncnrio',
'order by  c.nmro_expdnte  );'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P54_ID_PRGRMA,P54_ID_SBPRGRMA,P54_ID_IMPSTO,P54_ID_IMPSTO_SBMPSTO,P54_IDNTFCCION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(126102003094794201)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(126102191609794202)
,p_name=>'ETAPA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ETAPA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Etapa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_api.id(126102298278794203)
,p_name=>'NMBRE_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_ACTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(126102355775794204)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(126102549937794206)
,p_name=>'GENERADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GENERADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Generado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>2
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
 p_id=>wwv_flow_api.id(126102657328794207)
,p_name=>'NOTIFICADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFICADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Notificado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>2
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
 p_id=>wwv_flow_api.id(127732718498708001)
,p_name=>'FUNCIONARIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FUNCIONARIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Funcionario'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>301
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
 p_id=>wwv_flow_api.id(190868413944124503)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(190868526532124504)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Impuesto Sub-impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>50
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
 p_id=>wwv_flow_api.id(190868669239124505)
,p_name=>'NMBRE_PRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_PRGRMA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Programa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(190868790884124506)
,p_name=>'NMBRE_SBPRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SBPRGRMA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Sub-programa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(190868837872124507)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(190868960211124508)
,p_name=>'NMRO_EXPDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_EXPDNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('N\00FAmero Expedinte')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(190869015725124509)
,p_name=>'ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(190869189348124510)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>false
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
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(190869217413124511)
,p_name=>'FCHA_APRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_APRTRA'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de Apertura'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(190869588745124514)
,p_name=>'flujo Estado'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Flujo Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" >Ir a flujo<span class="fa fa-external-link-square"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:79:&SESSION.::&DEBUG.:RP:P79_ID_INSTNCIA_FLJO,P79_ID_FLJO_TREA:&ID_INSTNCIA_FLJO.,&ETPA.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(190868392308124502)
,p_internal_uid=>190868392308124502
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
 p_id=>wwv_flow_api.id(190874149840125951)
,p_interactive_grid_id=>wwv_flow_api.id(190868392308124502)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>20
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(190874261996125959)
,p_report_id=>wwv_flow_api.id(190874149840125951)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(126108023823805656)
,p_view_id=>wwv_flow_api.id(190874261996125959)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(126102003094794201)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(126108639452805661)
,p_view_id=>wwv_flow_api.id(190874261996125959)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(126102191609794202)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(126109226943805664)
,p_view_id=>wwv_flow_api.id(190874261996125959)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(126102298278794203)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(126109874389805665)
,p_view_id=>wwv_flow_api.id(190874261996125959)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(126102355775794204)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(126111060961805669)
,p_view_id=>wwv_flow_api.id(190874261996125959)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(126102549937794206)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(126111629808805671)
,p_view_id=>wwv_flow_api.id(190874261996125959)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(126102657328794207)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(127738694739708412)
,p_view_id=>wwv_flow_api.id(190874261996125959)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(127732718498708001)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(190874700675125971)
,p_view_id=>wwv_flow_api.id(190874261996125959)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(190868413944124503)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(190875213709125980)
,p_view_id=>wwv_flow_api.id(190874261996125959)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(190868526532124504)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(190875756822125983)
,p_view_id=>wwv_flow_api.id(190874261996125959)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(190868669239124505)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(190876201116125985)
,p_view_id=>wwv_flow_api.id(190874261996125959)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(190868790884124506)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(190876732923125988)
,p_view_id=>wwv_flow_api.id(190874261996125959)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(190868837872124507)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(190877216409125990)
,p_view_id=>wwv_flow_api.id(190874261996125959)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(190868960211124508)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(190877730115125992)
,p_view_id=>wwv_flow_api.id(190874261996125959)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(190869015725124509)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(190878239691125994)
,p_view_id=>wwv_flow_api.id(190874261996125959)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(190869189348124510)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(190878789904125996)
,p_view_id=>wwv_flow_api.id(190874261996125959)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(190869217413124511)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(190884896736152511)
,p_view_id=>wwv_flow_api.id(190874261996125959)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(190869588745124514)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(74446747154817915)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(36491913657968646)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(222797833666257685)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'    </b>',
'</h5>',
'',
'<p align="justify">',
unistr('<i>Funcionalidad que permite consultar los expedientes de fiscalizaci\00F3n.</i>'),
'<br/><br/>',
unistr(' Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74657097022790487)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(74446747154817915)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74446813841817916)
,p_name=>'P54_ID_FNCNRIO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(74446747154817915)
,p_prompt=>'Funcionario'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_FUNCIONARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_trcro as d,',
'       a.id_fncnrio  as r',
'from df_c_funcionarios a ',
'join v_si_c_terceros   b  on a.id_trcro = b.id_trcro',
'join df_c_oficinas     c  on a.id_ofcna = c.id_ofcna',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'--and c.nmbre_ofcna = ''FISCALIZACION''',
'order by b.nmbre_trcro;'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74446964666817917)
,p_name=>'P54_CDGO_EXPDNTE_ESTDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(74446747154817915)
,p_prompt=>'Estado'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_EXPEDIENTE_ESTADO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre as l',
'     , cdgo_expdnte_estdo as v',
'  from fi_d_expediente_estado'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74651400207732006)
,p_name=>'P54_IDNTFCCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(74446747154817915)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74651768007735086)
,p_name=>'P54_ID_PRGRMA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(74446747154817915)
,p_prompt=>'Programa'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_PROGRAMAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  p.nmbre_prgrma as d,',
'        p.id_prgrma as r',
'from fi_d_programas p;'))
,p_lov_display_null=>'YES'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74652030116737601)
,p_name=>'P54_ID_SBPRGRMA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(74446747154817915)
,p_prompt=>'SubPrograma'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_sbprgrma as d,',
'       id_sbprgrma    as r',
' from fi_d_subprogramas ',
'where id_prgrma = :P54_ID_PRGRMA',
'  and actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P54_ID_PRGRMA'
,p_ajax_items_to_submit=>'P54_ID_SBPRGRMA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74652321025739872)
,p_name=>'P54_ID_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(74446747154817915)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto',
'     , b.id_impsto',
'  from fi_d_programas_impuesto a',
'  join df_c_impuestos b',
'    on a.id_impsto = b.id_impsto',
' where a.id_prgrma = :P54_ID_PRGRMA'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P54_ID_PRGRMA'
,p_ajax_items_to_submit=>'P54_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74652676986741861)
,p_name=>'P54_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(74446747154817915)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_impsto_sbmpsto',
'     , a.id_impsto_sbmpsto',
'  from df_i_impuestos_subimpuesto a',
' where a.id_impsto = :P54_ID_IMPSTO'))
,p_lov_cascade_parent_items=>'P54_ID_IMPSTO'
,p_ajax_items_to_submit=>'P54_ID_IMPSTO_SBMPSTO,P54_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
end;
/
