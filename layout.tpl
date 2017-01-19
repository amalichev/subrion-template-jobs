<!DOCTYPE html>
<html lang="{$core.language.iso}" dir="{$core.language.direction}">
	<head>
		{ia_hooker name='smartyFrontBeforeHeadSection'}

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<title>{ia_print_title}</title>
		<meta name="description" content="{$core.page['meta-description']}">
		<meta name="keywords" content="{$core.page['meta-keywords']}">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="generator" content="Subrion CMS - Open Source Content Management System">
		<meta name="robots" content="index">
		<meta name="robots" content="follow">
		<meta name="revisit-after" content="1 day">
		<base href="{$smarty.const.IA_URL}">

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

		<link rel="shortcut icon" href="{if !empty($core.config.site_favicon)}{$core.page.nonProtocolUrl}uploads/{$core.config.site_favicon}{else}{$core.page.nonProtocolUrl}favicon.ico{/if}">

		{ia_add_media files='jquery, subrion, bootstrap' order=0}
		{ia_print_js files='_IA_TPL_app' order=999}

		{ia_hooker name='smartyFrontAfterHeadSection'}

		{ia_print_css display='on'}

		{ia_add_js}
			intelli.pageName = '{$core.page.name}';

			{foreach $core.customConfig as $key => $value}
				intelli.config.{$key} = '{$value}';
			{/foreach}
		{/ia_add_js}

		{if $core.config.custom_colors}
			<style type="text/css">
				body { background-color: {$core.config.custom_color_body_bg}; color: {$core.config.custom_color_text}; }
				h1, h2, h3, h4, h5, h6,
				.box__caption { color: {$core.config.custom_color_headings}; }
				a,
				a:focus { color: {$core.config.custom_color_link}; }
				a:hover { color: {$core.config.custom_color_link_hover}; }

				.inventory { background-color: {$core.config.custom_color_inventory_bg}; }
				.nav-inventory > li > a,
				.nav-inventory > li > a:focus { color: {$core.config.custom_color_inventory_link}; }
				.nav-inventory > li > a:hover { color: {$core.config.custom_color_inventory_link_hover}; }
				.nav-inventory > li.active > a,
				.nav-inventory > li.active > a:focus,
				.nav-inventory > li.active > a:hover { color: {$core.config.custom_color_inventory_link_active}; }

				.navbar-default { background-color: {$core.config.custom_color_navbar_bg}; }
				.navbar-default .navbar-nav > li > a,
				.navbar-default .navbar-nav > li > a:focus { color: {$core.config.custom_color_navbar_link}; }
				.navbar-default .navbar-nav > li > a:hover { color: {$core.config.custom_color_navbar_link_hover}; }
				.navbar-default .navbar-nav > li.active > a,
				.navbar-default .navbar-nav > li.active > a:focus,
				.navbar-default .navbar-nav > li.active > a:hover { color: {$core.config.custom_color_navbar_link_active}; }

				.header {
					{if $core.config.bg_header_use_color}
						background: {$core.config.bg_header_color};
					{elseif $core.config.bg_header}
						background-image: url('{$core.page.nonProtocolUrl}uploads/{$core.config.bg_header}');
					{/if}
				}

				.call-to-action {
					{if $core.config.bg_call_to_action_use_color}
						background: {$core.config.bg_call_to_action_color};
					{elseif $core.config.bg_call_to_action}
						background-image: url('{$core.page.nonProtocolUrl}uploads/{$core.config.bg_call_to_action}');
					{/if}
				}

				.footer { background: {$core.config.footer_bg}; }
				.nav-footer .nav-menu > li > a,
				.nav-footer .nav-menu > li > a:focus { color: {$core.config.footer_link}; }
				.nav-footer .nav-menu > li > a:hover { color: {$core.config.footer_link_hover}; }
				.nav-footer .nav-menu > li.active > a,
				.nav-footer .nav-menu > li.active > a:focus,
				.nav-footer .nav-menu > li.active > a:hover { color: {$core.config.footer_link_active}; }
			</style>
		{/if}
	</head>

	<body class="page-{$core.page.name}">
		<header class="header hidden-xs">
			<div class="inventory">
				<div class="container">
					{if $core.config.website_social}
						<ul class="nav-inventory nav-inventory-social pull-right">
							{if $core.config.website_social_t}<li><a href="{$core.config.website_social_t}" class="twitter"><span class="fa fa-twitter-square"></span></a></li>{/if}
							{if $core.config.website_social_f}<li><a href="{$core.config.website_social_f}" class="facebook"><span class="fa fa-facebook-square"></span></a></li>{/if}
							{if $core.config.website_social_g}<li><a href="{$core.config.website_social_g}" class="google-plus"><span class="fa fa-google-plus-square"></span></a></li>{/if}
							{if $core.config.website_social_i}<li><a href="{$core.config.website_social_i}" class="linkedin"><span class="fa fa-linkedin-square"></span></a></li>{/if}
						</ul>
					{/if}
					{include 'language-selector.tpl'}
					{ia_blocks block='inventory'}
				</div>
			</div>

			<div class="container">
				{if isset($iaBlocks.teaser)}
					{ia_blocks block='teaser'}
				{/if}
			</div>
		</header>

		<nav class="navbar navbar-default navbar-sticky">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand{if !$core.config.enable_text_logo} navbar-brand--img{/if}" href="{$smarty.const.IA_URL}">
						{if $core.config.enable_text_logo}
							{$core.config.logo_text}
						{else}
							{if !empty($core.config.site_logo)}
								<img src="{$core.page.nonProtocolUrl}uploads/{$core.config.site_logo}" alt="{$core.config.site}">
							{else}
								<img src="{$img}logo.png" alt="{$core.config.site}">
							{/if}
						{/if}
					</a>
				</div>
				<div class="collapse navbar-collapse" id="navbar-collapse">
					{ia_blocks block='account'}
					{ia_blocks block='mainmenu'}
				</div>
			</div>
		</nav>

		{if isset($smarty.get.elements)}
			{include 'page.elements.tpl'}
		{else}

		{ia_hooker name='smartyFrontBeforeBreadcrumb'}

		{include 'breadcrumb.tpl'}

		{if isset($iaBlocks.verytop)}
			<div class="verytop">
				<div class="container">{ia_blocks block='verytop'}</div>
			</div>
		{/if}

		{if $core.config.enable_landing && 'index' == $core.page.name}
			{if isset($iaBlocks.featured_jobs) || isset($iaBlocks.latest_jobs) || isset($iaBlocks.candidates)}
				<div class="landing">
					<div class="container">
						{$landingBlocks['featured_jobs'] = 'featured-jobs'}
						{$landingBlocks['latest_jobs'] = 'latest-jobs'}
						{$landingBlocks['candidates'] = 'candidates'}

						{foreach $landingBlocks as $key => $id}
							{if isset($iaBlocks[{$key}])}
								{$landingBlockActive = $key}
								{break}
							{/if}
						{/foreach}

						<ul class="tabs">
							{foreach $landingBlocks as $key => $id}
								{if isset($iaBlocks[{$key}])}
									<li{if $landingBlockActive == $key} class="active"{/if}><a href="#{$id}" data-toggle="tab">{lang key="{$key}"}</a></li>
								{/if}
							{/foreach}
						</ul>
						<div class="tab-content">
							{foreach $landingBlocks as $key => $id}
								{if isset($iaBlocks[{$key}])}
									<div class="tab-pane{if $landingBlockActive == $key} active{/if}" id="{$id}">
										{ia_blocks block="{$key}"}
									</div>
								{/if}
							{/foreach}
						</div>
					</div>
				</div>
			{/if}

			{if isset($iaBlocks.companies) || isset($iaBlocks.popular_categories)}
				<div class="brief-blocks">
					<div class="container">
						<div class="row">
							{if isset($iaBlocks.companies)}
								<div class="{width section='brief-blocks' position='companies' tag='col-md-'} brief-blocks__item">
									{ia_blocks block='companies'}
								</div>
							{/if}
							{if isset($iaBlocks.popular_categories)}
								<div class="{width section='brief-blocks' position='popular_categories' tag='col-md-'} brief-blocks__item">
									{ia_blocks block='popular_categories'}
								</div>
							{/if}
						</div>
					</div>
				</div>
			{/if}
		{else}
			<div class="content">
				<div class="container">
					{if in_array($core.page.name, array('login', 'member_registration'))}
						<div class="page-system">
							<div class="content__header">
								<h1>{$core.page.title}</h1>
								<ul class="content__actions">
									{foreach $core.actions as $name => $action}
										<li>
											{if 'action-favorites' == $name}
												{printFavorites item=$item itemtype=$item.item guests=true}
											{else}
												<a data-toggle="tooltip" title="{$action.title}" {foreach $action.attributes as $key => $value}{$key}="{$value}" {/foreach}>
													<span class="fa fa-{$name}"></span>
												</a>
											{/if}
										</li>
									{/foreach}
								</ul>
							</div>

							{ia_hooker name='smartyFrontBeforeNotifications'}
							{include 'notification.tpl'}

							{ia_hooker name='smartyFrontBeforeMainContent'}

							<div class="content__body">
								{$_content_}
							</div>

							{ia_hooker name='smartyFrontAfterMainContent'}
						</div>
					{else}
						<div class="row">
							<div class="{width section='content' position='left' tag='col-md-'} aside">
								{ia_blocks block='left'}
							</div>
							<div class="{width section='content' position='center' tag='col-md-'}">
								<div class="content__wrap">

									{if isset($iaBlocks.bottom)}
										{ia_blocks block='top'}
									{/if}

									<div class="content__header">
										<h1>{$core.page.title}</h1>
										<ul class="content__actions">
											{foreach $core.actions as $name => $action}
												<li>
													{if 'action-favorites' == $name}
														{printFavorites item=$item itemtype=$item.item guests=true}
													{else}
														<a data-toggle="tooltip" title="{$action.title}" {foreach $action.attributes as $key => $value}{$key}="{$value}" {/foreach}>
															<span class="fa fa-{$name}"></span>
														</a>
													{/if}
												</li>
											{/foreach}
										</ul>
									</div>

									{ia_hooker name='smartyFrontBeforeNotifications'}
									{include 'notification.tpl'}

									{ia_hooker name='smartyFrontBeforeMainContent'}

									<div class="content__body">
										{$_content_}
									</div>

									{ia_hooker name='smartyFrontAfterMainContent'}

									{if isset($iaBlocks.bottom)}
										{ia_blocks block='bottom'}
									{/if}
								</div>
							</div>
							<div class="{width section='content' position='right' tag='col-md-'} aside">
								{ia_blocks block='right'}
							</div>
						</div>
					{/if}
				</div>
			</div>
		{/if}

		{if isset($iaBlocks.call_to_action)}
			<div class="call-to-action">
				<div class="container">{ia_blocks block='call_to_action'}</div>
			</div>
		{/if}

		{if isset($iaBlocks.verybottom)}
			<div class="verybottom">
				<div class="container">{ia_blocks block='verybottom'}</div>
			</div>
		{/if}

		<footer class="footer">
			<div class="container">
				{ia_hooker name='smartyFrontBeforeFooterLinks'}
				<div class="row">
					{if isset($iaBlocks.footer1) || isset($iaBlocks.footer2) || isset($iaBlocks.footer3) || isset($iaBlocks.footer4)}
						<div class="col-md-6 footer__left-side">
							<div class="row">
								<div class="{width section='footer-blocks' position='footer1' tag='col-md-'}">{ia_blocks block='footer1'}</div>
								<div class="{width section='footer-blocks' position='footer2' tag='col-md-'}">{ia_blocks block='footer2'}</div>
								<div class="{width section='footer-blocks' position='footer3' tag='col-md-'}">{ia_blocks block='footer3'}</div>
							</div>
						</div>
					{/if}
					<div class="col-md-5 col-md-offset-1 footer__right-side">
						<div class="row">
							<div class="col-md-6">
								<a class="footer-brand{if !$core.config.enable_text_logo} footer-brand--img{/if}" href="{$smarty.const.IA_URL}">
									{if $core.config.enable_text_logo}
										{$core.config.logo_text}
									{else}
										{if !empty($core.config.site_logo)}
											<img src="{$core.page.nonProtocolUrl}uploads/{$core.config.site_logo}" alt="{$core.config.site}">
										{else}
											<img src="{$img}logo.png" alt="{$core.config.site}">
										{/if}
									{/if}
								</a>
							</div>
							<div class="col-md-6">
								{if $core.config.website_social}
									<ul class="nav-footer-social">
										{if $core.config.website_social_f}<li><a href="{$core.config.website_social_f}" class="facebook"><span class="fa fa-facebook-square"></span></a></li>{/if}
										{if $core.config.website_social_t}<li><a href="{$core.config.website_social_t}" class="twitter"><span class="fa fa-twitter-square"></span></a></li>{/if}
										{if $core.config.website_social_g}<li><a href="{$core.config.website_social_g}" class="google-plus"><span class="fa fa-google-plus-square"></span></a></li>{/if}
										{if $core.config.website_social_i}<li><a href="{$core.config.website_social_i}" class="linkedin"><span class="fa fa-linkedin-square"></span></a></li>{/if}
									</ul>
								{/if}
							</div>
						</div>
						{if isset($iaBlocks.copyright)}
							<div class="m-b">
								{ia_blocks block='copyright'}
							</div>
						{/if}
						<p class="copyright">&copy; {$smarty.server.REQUEST_TIME|date_format:'%Y'} {lang key='powered_by_subrion'}</p>
					</div>
				</div>
				{ia_hooker name='smartyFrontAfterFooterLinks'}
			</div>
		</footer>
		{/if}

		<button class="back-to-top js-back-to-top"><span class="fa fa-angle-double-up"></span></button>

		<!-- SYSTEM STUFF -->

		{if $core.config.cron}
			<div style="display: none;">
				<img src="{$core.page.nonProtocolUrl}cron/?{randnum}" width="1" height="1" alt="">
			</div>
		{/if}

		{if isset($manageMode)}
			{include 'visual-mode.tpl'}
		{/if}

		{if isset($previewMode)}
			<p>{lang key='youre_in_preview_mode'}</p>
		{/if}

		{ia_print_js display='on'}

		{ia_hooker name='smartyFrontFinalize'}
	</body>
</html>