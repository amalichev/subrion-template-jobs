<div class="quicksearch js-quicksearch hidden-xs">
	<form action="{$smarty.const.IA_URL}search/">
		<input type="text" name="keywords" class="quicksearch__input" placeholder="{lang key='keywords'}">

		<div class="quicksearch__select dropdown" data-name="category">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
				<span>{lang key='category'}</span>
				<i class="icon-arrow-down"></i>
			</a>
			<ul class="dropdown-menu">
				<li><a href="#" data-value="0"><i class="fa fa-ellipsis-h" aria-hidden="true"></i></a></li>
				<li><a href="#" data-value="1">Action</a></li>
				<li><a href="#" data-value="2">Another action</a></li>
				<li><a href="#" data-value="3">Something else here</a></li>
				<li><a href="#" data-value="4">Separated link</a></li>
				<li><a href="#" data-value="5">Action</a></li>
				<li><a href="#" data-value="6">Another action</a></li>
				<li><a href="#" data-value="7">Something else here</a></li>
				<li><a href="#" data-value="8">Separated link</a></li>
				<li><a href="#" data-value="9">Action</a></li>
				<li><a href="#" data-value="10">Another action</a></li>
				<li><a href="#" data-value="11">Something else here</a></li>
				<li><a href="#" data-value="12">Separated link</a></li>
			</ul>
		</div>

		<input type="hidden" name="category">

		<button type="submit" class="quicksearch__submit">
			<i class="icon-search"></i>
			{lang key='find'}
		</button>
	</form>
</div>

{ia_add_js}
$(function()
{
	$('.quicksearch__select .dropdown-menu > li > a').click(function(event)
	{
		event.preventDefault();

		var $option = $(this),
			$select = $option.closest('.quicksearch__select'),
			optionValue = $option.data('value'),
			selectName = $select.data('name');

		if (0 == parseInt(optionValue))
		{
			$('.quicksearch__select .dropdown-toggle > span').text(_t('category'));
			$('.quicksearch input[name="' + selectName  +'"]').val('');
		}
		else
		{
			$('.quicksearch__select .dropdown-toggle > span').text($option.text());
			$('.quicksearch input[name="' + selectName  +'"]').val(optionValue);
		}
	});
});
{/ia_add_js}