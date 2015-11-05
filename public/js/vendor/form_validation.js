$(function()
{
			$('#error_name').hide();
		$('#error_mail').hide();
		$('#error_company').hide();
		$('#error_telephone').hide();
		$('#error_mobile').hide();

});

function validatename()
{
		var pname = /^[a-zA-Z][a-zA-Z ]*$/;
		var name = document.getElementById("name");
	    if(!pname.test(name.value)&&name.value!=null)
	    {
	    	$('#error_name').show();
	    	return false;
	    }
	    else
	    {
	    	$('#error_name').hide();
	    	return true;
	    }
}

function validatemail() 
{	
    var pemail = /^([a-zA-Z0-9_\.\-])+\@([a-zA-Z])+\.([a-zA-Z])+$/;
    var email = document.getElementById("mail");
    if(!(pemail.test(email.value))) 
    {
    	$('#error_mail').show();
    	return false;
    }
    else
    {
    	$('#error_mail').hide();
    	return true;
    }
}

function validatecompany()
{
		var pname = /^[a-zA-Z][a-zA-Z ]*$/;
		var name = document.getElementById("company");
	    if(!pname.test(name.value)&&name.value!=null)
	    {
	    	$('#error_company').show();
	    	return false;
	    }
	    else
	    {
	    	$('#error_company').hide();
	    	return true;
	    }
}

function validatetelephone() 
{	
    var pmobno = /^[0-9]{7}[0-9]*$/;
    var mobno = document.getElementById("telephone");
    if(!(pmobno.test(mobno.value))) 
    {
    	$('#error_telephone').show();
    	return false;
    }
    else
    {
    	$('#error_telephone').hide();
    	return true;
    }
}

function validatemobile() 
{	
    var pmobno = /^[0-9]{10}$/;
    var mobno = document.getElementById("mobile");
    if(!(pmobno.test(mobno.value))) 
    {
    	$('#error_mobile').show();
    	return false;
    }
    else
    {
    	$('#error_mobile').hide();
    	return true;
    }
}

function validate()
{
	if(validatename() && validatemail() && validatecompany() &&validatetelephone() && validatemobile())
	{
		return true;
	}
	else
	{
		alert("All fields are mandatory and should be valid!");
		return false;
	}
}