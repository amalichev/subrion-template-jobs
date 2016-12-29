{if $core.config.language_switch && count($core.languages) > 1}
	<ul class="nav-inventory pull-left">
		<li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				<i class="icon-flag"></i> {$core.languages[$smarty.const.IA_LANGUAGE].title} <i class="fa fa-angle-down"></i>
			</a>
			<ul class="dropdown-menu pull-left">
				{foreach $core.languages as $code => $language}
					<li{if $smarty.const.IA_LANGUAGE == $code} class="active"{/if}><a href="{ia_page_url code=$code}" title="{$language.title}">{$language.title}</a></li>
				{/foreach}
			</ul>
		</li>
	</ul>
{/if}