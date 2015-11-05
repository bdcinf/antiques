$(document).ready(function(){
	$('#ProductDesMain').show();
	
	$('#ProductDes').click(function()
	{
		$('#ProductDesMain').show();
		$('#ProductSpecMain').hide();
		$('#ProductRevMain').hide();
	});

	$('#ProductSpec').click(function()
	{
		$('#ProductSpecMain').show();
		$('#ProductDesMain').hide();
		$('#ProductRevMain').hide();
	});

	$('#ProductRev').click(function()
	{
		$('#ProductRevMain').show();
		$('#ProductDesMain').hide();
		$('#ProductSpecMain').hide();
	});	
});


