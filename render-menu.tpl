{if 'mainmenu' == $position}
	{ia_menu menus=$menu.contents class="nav navbar-nav navbar-right nav-main {$menu.classname}"}
{elseif 'inventory' == $position}
	{ia_menu menus=$menu.contents class="nav-inventory pull-left {$menu.classname}"}
{elseif 'account' == $position}
	<ul class="nav navbar-nav navbar-right nav-account">
		{if 'account' == $menu.name && $member && $core.config.members_enabled}
			<li class="dropdown">
				<a href="#" class="dropdown-toggle filled" data-toggle="dropdown">
					<span>
						{$member.fullname|default:$member.username}
						<i class="icon-arrow-down"></i>
					</span>
				</a>
				{ia_hooker name='smartyFrontInsideAccountBox'}
				{ia_menu menus=$menu.contents class='dropdown-menu' loginout=true}
			</li>
		{else}
			<li{if 'login' == $core.page.name} class="active"{/if}>
				<a href="{$smarty.const.IA_URL}login/">{lang key='login'}</a>
			</li>
			<li{if 'member_registration' == $core.page.name} class="active"{/if}>
				<a href="{$smarty.const.IA_URL}registration/" class="filled"><span>{lang key='register'}</span></a>
			</li>
		{/if}
	</ul>
{elseif in_array($position, array('left', 'right', 'user1', 'user2', 'top'))}
	{if !empty($menu.contents[0]) && 'account' != $menu.name}
		{ia_block header=$menu.header title=$menu.title movable=true id=$menu.id name=$menu.name collapsible=$menu.collapsible classname=$menu.classname}
			{ia_menu menus=$menu.contents class="list-group {$menu.classname}"}
		{/ia_block}
	{/if}
{elseif 'copyright' == $position}
	{ia_menu menus=$menu.contents class="nav-footer {$menu.classname}"}
{elseif in_array($position, array('footer1', 'footer2', 'footer3'))}
	<div class="nav-footer">
		<!--__ms_{$menu.id}-->
		{if $menu.header || isset($manageMode)}
			<div class="nav-menu-header {$menu.classname}">{$menu.title}</div>
		{/if}

		<!--__ms_c_{$menu.id}-->
		{ia_menu menus=$menu.contents class='nav-menu'}
		<!--__me_c_{$menu.id}-->

		<!--__me_{$menu.id}-->
	</div>
{else}
	<!--__ms_{$menu.id}-->
	{if $menu.header || isset($manageMode)}
		<div class="nav-menu-header {$menu.classname}">{$menu.title}</div>
	{else}
		<div class="menu {$menu.classname}">
	{/if}

	<!--__ms_c_{$menu.id}-->
	{ia_menu menus=$menu.contents class='nav-menu'}
	<!--__me_c_{$menu.id}-->

	{if $menu.header || isset($manageMode)}
	{else}
		</div>
	{/if}
	<!--__me_{$menu.id}-->
{/if}