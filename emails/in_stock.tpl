<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>{{ shop_name }} - Продукт в наличии</title>
<style>
@media only screen and (max-width: 300px) {
	.body {
		width: 218px !important;
		margin: auto !important;
	}
	.table {
		width: 195px !important;
		margin: auto !important;
	}
	.logo, .titleblock, .linkbelow, .box, .footer, .space_footer {
		width: auto !important;
		display: block !important;
	}
	span.title {
		font-size: 20px !important;
		line-height: 23px !important
	}
	span.subtitle {
		font-size: 14px !important;
		line-height: 18px !important;
		padding-top: 10px !important;
		display: block !important;
	}
	td.box p {
		font-size: 12px !important;
		font-weight: bold !important;
	}
	.table-recap table, .table-recap thead, .table-recap tbody, .table-recap th, .table-recap td, .table-recap tr { display: block !important; }
	.table-recap { width: 200px!important; }
	.table-recap tr td, .conf_body td { text-align: center !important; }
	.address {
		display: block !important;
		margin-bottom: 10px !important;
	}
	.space_address { display: none !important; }
}
@media only screen and (min-width: 301px) and (max-width: 500px) {
	.body {
		width: 308px!important;
		margin: auto!important;
	}
	.table {
		width: 285px!important;
		margin: auto!important;
	}
	.logo, .titleblock, .linkbelow, .box, .footer, .space_footer {
		width: auto!important;
		display: block!important;
	}
	.table-recap table, .table-recap thead, .table-recap tbody, .table-recap th, .table-recap td, .table-recap tr { display: block !important; }
	.table-recap { width: 295px !important; }
	.table-recap tr td, .conf_body td { text-align: center !important; }
}
@media only screen and (min-width: 501px) and (max-width: 768px) {
	.body {
		width: 478px!important;
		margin: auto!important;
	}
	.table {
		width: 450px!important;
		margin: auto!important;
	}
	.logo, .titleblock, .linkbelow, .box, .footer, .space_footer {
		width: auto!important;
		display: block!important;
	}
}
@media only screen and (max-device-width: 480px) {
	.body {
		width: 308px!important;
		margin: auto!important;
	}
	.table {
		width: 285px;
		margin: auto!important;
	}
	.logo, .titleblock, .linkbelow, .box, .footer, .space_footer {
		width: auto!important;
		display: block!important;
	}
	.table-recap { width: 295px!important; }
	.table-recap tr td, .conf_body td { text-align: center!important; }
	.address {
		display: block !important;
		margin-bottom: 10px !important;
	}
	.space_address { display: none !important; }
}
</style>
</head>

<body>
<div class="body" style="-webkit-text-size-adjust:none; background-color:#fff; width:650px; font-family: Open-sans, sans-serif; color:#555454; font-size: 13px;line-height: 18px; margin: auto">
  <table class="table table-mail" style="width: 100%; margin-top: 10px; -moz-box-shadow: 0 0 5px #afafaf; -webkit-box-shadow: 0 0 5px #afafaf; -o-box-shadow: 0 0 5px #afafaf; box-shadow: 0 0 5px #afafaf; filter: progid:DXImageTransform.Microsoft.Shadow(color=#afafaf,Direction=134,Strength=5)">
    <tbody>
      <tr>
        <td class="space" style="width: 20px; padding: 7px 0">&nbsp;</td>
        <td style="padding: 7px 0" align="center">
          <table class="table" style="width: 100%" bgcolor="#ffffff">
            <tbody>
              <tr>
                <td class="logo" style="border-bottom: 4px solid #5e6981; padding: 7px 0" align="center">
                  <a href="{{ shop_url }}" style="color: #5e6981" title="{{ shop_name }}">
                    <img src="{{ shop_url }}media/gswork/images/logo-jkassa.png" alt="{{ shop_name }}" />
                  </a>
                </td>
              </tr>
              <tr>
                <td class="titleblock" style="border-bottom: 1px solid #e2e7eb; padding: 7px 0" align="center">
                  <font size="2" face="Open-sans, sans-serif" color="#555454">
                    <span class="title" style="font-weight: 500; font-size: 28px; text-transform: uppercase; line-height: 33px">
                      Здравствуйте, {{ user_name }}
                    </span>
                  </font>
                </td>
              </tr>
              <tr>
                <td class="space_footer" style="padding: 0 !important">&nbsp;</td>
              </tr>
              <tr>
                <td class="linkbelow" style="padding: 7px 0">
                  <font size="2" face="Open-sans, sans-serif" color="#555454">
                    Уведомляем вас, что "<a href="{{ product_url }}" style="color: #5e6981">{{ product_name }}</a>" доступен для покупки.
					{% if add_desc %}
					<br><br>
					{{ add_desc }}
					{% endif %}
                  </font>
                </td>
              </tr>
              <tr>
                <td class="space_footer" style="padding: 0 !important">&nbsp;</td>
              </tr>
              <tr>
                <td class="linkbelow" style="border-top: 1px solid #e2e7eb; padding: 7px 0">
                  <font size="2" face="Open-sans, sans-serif" color="#555454">
                    <em>* Это уведомление создано автоматически системой и отвечать на него не нужно.</em>
                  </font>
                </td>
              </tr>
              <tr>
                <td class="space_footer" style="padding: 0 !important">&nbsp;</td>
              </tr>
              <tr>
                <td class="footer" style="border-top: 4px solid #5e6981; padding:7px 0">
                  <span>
                    <a href="{{ shop_url }}" style="color: #5e6981">
                      {{ shop_name }}
                    </a>
                  </span>
                </td>
              </tr>
            </tbody>
          </table>
        </td>
        <td class="space" style="width: 20px; padding: 7px 0">&nbsp;</td>
      </tr>
    </tbody>
  </table>
</div>
</body>
</html>