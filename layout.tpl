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

				.footer { background: {$core.config.footer_bg}; }
				.nav-footer > li > a,
				.nav-footer > li > a:focus { color: {$core.config.footer_link}; }
				.nav-footer > li > a:hover { color: {$core.config.footer_link_hover}; }
				.nav-footer > li.active > a,
				.nav-footer > li.active > a:focus,
				.nav-footer > li.active > a:hover { color: {$core.config.footer_link_active}; }
			</style>
		{/if}
	</head>

	<body class="page-{$core.page.name}">
		<header class="header">
			<div class="inventory">
				<div class="container">
					{if $core.config.website_social}
						<ul class="nav-inventory nav-inventory-social pull-right hidden-xs">
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

		{if $core.config.enable_landing && 'index' == $core.page.name}
			<div class="landing">
				{ia_blocks block='landing'}
				<div class="container">
					<h1>Lorem ipsum dolor sit amet</h1>
					<br>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Id eum, accusantium aliquam numquam accusamus, aspernatur quos voluptas a cum odio quam excepturi illum, doloribus quo praesentium tempora ab cupiditate nostrum!</p>
					<p>Obcaecati officia voluptates enim error repellat sit quia corrupti magni molestiae laboriosam fugit, culpa aperiam sapiente ipsam eum perspiciatis possimus! Vel veritatis necessitatibus soluta laudantium est voluptatum ab dolorum aliquam.</p>
					<p>Dolorum rerum et dolores temporibus, inventore, placeat illum eligendi eius consequuntur saepe itaque ex dolore similique. Facilis, enim sed distinctio dignissimos error illum at eum est placeat, ad eos omnis.</p>
					<p>Eius expedita earum quidem fuga sapiente ad dolorem similique nesciunt numquam quis, cupiditate doloremque officiis impedit ab et voluptate, quaerat, ut aliquam pariatur quos nam nisi enim? Fugiat, eveniet, consequatur?</p>
					<p>Necessitatibus cumque et consequuntur consequatur fugit repudiandae ipsum culpa minima modi earum repellendus ipsam cum excepturi voluptate nobis sequi saepe, voluptates inventore numquam ea laboriosam neque ad. Non, asperiores, quos.</p>
					<p>Adipisci ad neque nostrum explicabo, repellat sit, quisquam quam facilis alias iusto soluta. Omnis recusandae laudantium eveniet voluptates fugiat inventore mollitia sapiente fuga. Illo perspiciatis placeat praesentium quia quidem mollitia.</p>
					<p>Natus facilis ratione asperiores deleniti quo? Dolorum laborum ipsam ut dicta eligendi corporis illo, esse, ipsum quia possimus in dolore, voluptatum totam tempora qui id reprehenderit ratione reiciendis sapiente nemo!</p>
					<p>Tenetur error culpa voluptate illo. Accusamus repellendus doloribus odit aut debitis dicta iure quaerat eos possimus quod laudantium voluptatum cumque repellat eligendi mollitia nam voluptatibus, minus sequi nulla. Harum, quam.</p>
					<p>Similique quidem non quod, omnis qui odio veritatis pariatur aliquid quas voluptatem. Exercitationem numquam alias eum odio! Consequatur eos mollitia doloremque! Amet veritatis eaque laudantium, ex esse, cupiditate expedita libero!</p>
					<p>Optio assumenda dolore blanditiis, cumque eveniet ad consequuntur tenetur animi ex. Obcaecati excepturi nulla, id recusandae sequi cupiditate earum cum exercitationem iusto suscipit, impedit odit, perferendis cumque quos explicabo est.</p>
					<p>Repellat deleniti obcaecati at, eaque laudantium ipsa culpa quas illo recusandae quod, temporibus, voluptatem qui aut adipisci? Architecto harum inventore dolore fugiat illum. Expedita nisi harum, eius, hic ipsa debitis?</p>
					<p>Delectus fugit asperiores quidem consequuntur, est, blanditiis itaque exercitationem. Debitis aliquid dicta temporibus tempora consequatur cum amet iusto quo! Nisi cupiditate, aperiam modi consequatur blanditiis soluta dolor quia iusto consequuntur.</p>
					<p>Delectus nihil et assumenda, reprehenderit nam odit quod deserunt reiciendis nisi neque soluta fuga distinctio unde non saepe natus repudiandae ratione ut. Voluptates esse repellendus voluptatem sit, qui itaque reprehenderit!</p>
					<p>Magni totam tempora vero veniam ea quisquam asperiores culpa molestias vitae, odit odio explicabo sunt ut error aspernatur animi corporis laudantium consectetur. Et assumenda repellendus veniam, nam necessitatibus! Enim, minus!</p>
					<p>Amet sequi quasi ipsum sapiente quis officiis quidem porro rerum magnam assumenda corporis nesciunt, facilis, possimus incidunt unde inventore pariatur provident accusantium blanditiis praesentium temporibus illum natus architecto. Laboriosam, sunt.</p>
					<p>Provident ipsam pariatur quos obcaecati error ad at officiis sint esse vitae nesciunt rem, itaque alias non eveniet quasi voluptatem veniam, atque, harum saepe assumenda fugiat sit! Impedit, perspiciatis, architecto!</p>
					<p>Natus dolore inventore, quidem dolor numquam, eos odit doloribus accusantium itaque, ut vitae enim quam odio veritatis. Aut velit ducimus ipsa, quod voluptatibus expedita esse labore asperiores deserunt dolores in.</p>
					<p>Doloremque est architecto eum hic sunt repellat velit animi veritatis. Laboriosam voluptatem, ab! Quia laboriosam, debitis esse, nisi totam nam atque, assumenda necessitatibus minus inventore temporibus soluta corrupti et, quis.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Id eum, accusantium aliquam numquam accusamus, aspernatur quos voluptas a cum odio quam excepturi illum, doloribus quo praesentium tempora ab cupiditate nostrum!</p>
					<p>Obcaecati officia voluptates enim error repellat sit quia corrupti magni molestiae laboriosam fugit, culpa aperiam sapiente ipsam eum perspiciatis possimus! Vel veritatis necessitatibus soluta laudantium est voluptatum ab dolorum aliquam.</p>
					<p>Dolorum rerum et dolores temporibus, inventore, placeat illum eligendi eius consequuntur saepe itaque ex dolore similique. Facilis, enim sed distinctio dignissimos error illum at eum est placeat, ad eos omnis.</p>
					<p>Eius expedita earum quidem fuga sapiente ad dolorem similique nesciunt numquam quis, cupiditate doloremque officiis impedit ab et voluptate, quaerat, ut aliquam pariatur quos nam nisi enim? Fugiat, eveniet, consequatur?</p>
					<p>Necessitatibus cumque et consequuntur consequatur fugit repudiandae ipsum culpa minima modi earum repellendus ipsam cum excepturi voluptate nobis sequi saepe, voluptates inventore numquam ea laboriosam neque ad. Non, asperiores, quos.</p>
					<p>Adipisci ad neque nostrum explicabo, repellat sit, quisquam quam facilis alias iusto soluta. Omnis recusandae laudantium eveniet voluptates fugiat inventore mollitia sapiente fuga. Illo perspiciatis placeat praesentium quia quidem mollitia.</p>
					<p>Natus facilis ratione asperiores deleniti quo? Dolorum laborum ipsam ut dicta eligendi corporis illo, esse, ipsum quia possimus in dolore, voluptatum totam tempora qui id reprehenderit ratione reiciendis sapiente nemo!</p>
					<p>Tenetur error culpa voluptate illo. Accusamus repellendus doloribus odit aut debitis dicta iure quaerat eos possimus quod laudantium voluptatum cumque repellat eligendi mollitia nam voluptatibus, minus sequi nulla. Harum, quam.</p>
					<p>Similique quidem non quod, omnis qui odio veritatis pariatur aliquid quas voluptatem. Exercitationem numquam alias eum odio! Consequatur eos mollitia doloremque! Amet veritatis eaque laudantium, ex esse, cupiditate expedita libero!</p>
					<p>Optio assumenda dolore blanditiis, cumque eveniet ad consequuntur tenetur animi ex. Obcaecati excepturi nulla, id recusandae sequi cupiditate earum cum exercitationem iusto suscipit, impedit odit, perferendis cumque quos explicabo est.</p>
					<p>Repellat deleniti obcaecati at, eaque laudantium ipsa culpa quas illo recusandae quod, temporibus, voluptatem qui aut adipisci? Architecto harum inventore dolore fugiat illum. Expedita nisi harum, eius, hic ipsa debitis?</p>
					<p>Delectus fugit asperiores quidem consequuntur, est, blanditiis itaque exercitationem. Debitis aliquid dicta temporibus tempora consequatur cum amet iusto quo! Nisi cupiditate, aperiam modi consequatur blanditiis soluta dolor quia iusto consequuntur.</p>
					<p>Delectus nihil et assumenda, reprehenderit nam odit quod deserunt reiciendis nisi neque soluta fuga distinctio unde non saepe natus repudiandae ratione ut. Voluptates esse repellendus voluptatem sit, qui itaque reprehenderit!</p>
					<p>Magni totam tempora vero veniam ea quisquam asperiores culpa molestias vitae, odit odio explicabo sunt ut error aspernatur animi corporis laudantium consectetur. Et assumenda repellendus veniam, nam necessitatibus! Enim, minus!</p>
					<p>Amet sequi quasi ipsum sapiente quis officiis quidem porro rerum magnam assumenda corporis nesciunt, facilis, possimus incidunt unde inventore pariatur provident accusantium blanditiis praesentium temporibus illum natus architecto. Laboriosam, sunt.</p>
					<p>Provident ipsam pariatur quos obcaecati error ad at officiis sint esse vitae nesciunt rem, itaque alias non eveniet quasi voluptatem veniam, atque, harum saepe assumenda fugiat sit! Impedit, perspiciatis, architecto!</p>
					<p>Natus dolore inventore, quidem dolor numquam, eos odit doloribus accusantium itaque, ut vitae enim quam odio veritatis. Aut velit ducimus ipsa, quod voluptatibus expedita esse labore asperiores deserunt dolores in.</p>
					<p>Doloremque est architecto eum hic sunt repellat velit animi veritatis. Laboriosam voluptatem, ab! Quia laboriosam, debitis esse, nisi totam nam atque, assumenda necessitatibus minus inventore temporibus soluta corrupti et, quis.</p>
				</div>
			</div>
		{else}
			{if isset($iaBlocks.verytop)}
				<div class="verytop">
					<div class="container">{ia_blocks block='verytop'}</div>
				</div>
			{/if}

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

									{ia_blocks block='top'}

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

									{ia_blocks block='bottom'}
								</div>
							</div>
							<div class="{width section='content' position='right' tag='col-md-'} aside">
								{ia_blocks block='right'}
							</div>
						</div>
					{/if}
				</div>
			</div>

			{if isset($iaBlocks.verybottom)}
				<div class="verybottom">
					<div class="container">{ia_blocks block='verybottom'}</div>
				</div>
			{/if}
		{/if}

		{if isset($iaBlocks.footer1) || isset($iaBlocks.footer2) || isset($iaBlocks.footer3) || isset($iaBlocks.footer4)}
			<div class="footer-blocks">
				<div class="container">
					<div class="row">
						<div class="{width section='footer-blocks' position='footer1' tag='col-md-'}">{ia_blocks block='footer1'}</div>
						<div class="{width section='footer-blocks' position='footer2' tag='col-md-'}">{ia_blocks block='footer2'}</div>
						<div class="{width section='footer-blocks' position='footer3' tag='col-md-'}">{ia_blocks block='footer3'}</div>
					</div>
				</div>
			</div>
		{/if}
		{/if}

		<footer class="footer">
			<div class="container">
				{ia_hooker name='smartyFrontBeforeFooterLinks'}

				{if $core.config.website_social}
					<ul class="nav-footer nav-footer-social">
						{if $core.config.website_social_t}<li><a href="{$core.config.website_social_t}" class="twitter"><span class="fa fa-twitter"></span></a></li>{/if}
						{if $core.config.website_social_f}<li><a href="{$core.config.website_social_f}" class="facebook"><span class="fa fa-facebook"></span></a></li>{/if}
						{if $core.config.website_social_g}<li><a href="{$core.config.website_social_g}" class="google-plus"><span class="fa fa-google-plus"></span></a></li>{/if}
						{if $core.config.website_social_i}<li><a href="{$core.config.website_social_i}" class="linkedin"><span class="fa fa-linkedin"></span></a></li>{/if}
					</ul>
				{/if}

				{ia_blocks block='copyright'}

				<p class="copyright">&copy; {$smarty.server.REQUEST_TIME|date_format:'%Y'} {lang key='powered_by_subrion'}</p>

				{ia_hooker name='smartyFrontAfterFooterLinks'}
			</div>
		</footer>

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