prompt --application/pages/page_00177
begin
wwv_flow_api.create_page(
 p_id=>177
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Detalle de Solicitudes'
,p_page_mode=>'MODAL'
,p_step_title=>'Detalle de Solicitudes'
,p_autocomplete_on_off=>'OFF'
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
,p_step_template=>wwv_flow_api.id(164066978207707637)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_last_updated_by=>'JRANGEL'
,p_last_upd_yyyymmddhh24miss=>'20201103170607'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96950943376876530)
,p_plug_name=>'Detalle de solicitudes'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96951061697876531)
,p_plug_name=>'Detalle de Solicitudes.'
,p_parent_plug_id=>wwv_flow_api.id(96950943376876530)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  nmro_rnta,',
'        trunc(fcha_rgstro) fcha_rgstro,',
'        idntfccion_sjto,',
'        nmbre_rzon_scial,',
'        to_char(vlor_ttal,:F_FRMTO_MNDA) vlor_ttal,',
'        dscrpcion_rnta_estdo',
'from    v_gi_g_rentas ',
'where   cdgo_clnte           = :F_CDGO_CLNTE',
'  and   id_impsto            = :P177_ID_IMPSTO',
'  and   id_impsto_sbmpsto    = :P177_ID_IMPSTO_SBMPSTO',
'  and   cdgo_rnta_estdo      = nvl(:P177_COD_RNTA_ESTDO,cdgo_rnta_estdo)',
'  and   (trunc(fcha_rgstro)  >= :P177_FCHA_DSDE or :P177_FCHA_DSDE is null) ',
'  and   (trunc(fcha_rgstro)  <= :P177_FCHA_HSTA or :P177_FCHA_HSTA is null)'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(96951182893876532)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JRANGEL'
,p_internal_uid=>96951182893876532
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96952220360876543)
,p_db_column_name=>'NMRO_RNTA'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>unistr('N\00FAmero Solicitud')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96952347440876544)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Fecha Solicitud'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96952419772876545)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>unistr('Identificaci\00F3n Sujeto')
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96952506566876546)
,p_db_column_name=>'NMBRE_RZON_SCIAL'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>unistr('Nombr\00E9 Raz\00F3n Social')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96952704502876548)
,p_db_column_name=>'DSCRPCION_RNTA_ESTDO'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>unistr('Descripci\00F3n Renta Estado')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96952852595876549)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Valor Total de la Solicitud'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_display_condition_type=>'PLSQL_EXPRESSION'
,p_display_condition=>':P177_COD_RNTA_ESTDO is null or :P177_COD_RNTA_ESTDO = ''APB'''
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(97011793334394327)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'970118'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_RNTA:FCHA_RGSTRO:IDNTFCCION_SJTO:NMBRE_RZON_SCIAL:DSCRPCION_RNTA_ESTDO:VLOR_TTAL:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96988588781780904)
,p_plug_name=>'Resumen '
,p_parent_plug_id=>wwv_flow_api.id(96950943376876530)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(id_rnta)              as cntdad',
'     , ''Solicitudes ''||dscrpcion_rnta_estdo ||''s''  as stdo     ',
'  from v_gi_g_rentas',
' where cdgo_clnte           =  :F_CDGO_CLNTE',
'   and id_impsto            =  :P177_ID_IMPSTO',
'   and id_impsto_sbmpsto    =  :P177_ID_IMPSTO_SBMPSTO',
'   and cdgo_rnta_estdo      =  nvl(:P177_COD_RNTA_ESTDO, cdgo_rnta_estdo)',
'   and (trunc(fcha_rgstro)  >= :P177_FCHA_DSDE or :P177_FCHA_DSDE is null)',
'   and (trunc(fcha_rgstro)  <= :P177_FCHA_HSTA or :P177_FCHA_HSTA is null)',
' group by dscrpcion_rnta_estdo'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'CNTDAD'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'STDO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96951315916876534)
,p_name=>'P177_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(96950943376876530)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96951420018876535)
,p_name=>'P177_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(96950943376876530)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96951534310876536)
,p_name=>'P177_FCHA_DSDE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(96950943376876530)
,p_prompt=>'<b>Fecha Desde</b>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96951672684876537)
,p_name=>'P177_FCHA_HSTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(96950943376876530)
,p_prompt=>'<b>Fecha Hasta</b>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96951702572876538)
,p_name=>'P177_COD_RNTA_ESTDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(96950943376876530)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
