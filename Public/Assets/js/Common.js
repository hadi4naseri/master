function checkForRun(tenant,moduleName)
{
	//control if tenant contain required modules for run code...
	return true;
}

//get error text from database and convert to to current common text
function translateError(tenant,msg)
{
	$.ajax({        
   type: "POST",
   url: siteDomain+"Public/Modules/getError.php",
   data: {tenant:tenant,msgHandle:msg},
   success: function(Rdata) {
	
	var Data=$.parseJSON(JSON.parse(Rdata));
	
	for(i=0;i<Data[0]["translation"].length;i++)
		if (Data[0]["translation"][i]["language"]==siteLang)
		{
			message(Data[0]["translation"][i]["description"],Data[0]["callback"]);
			break;
		}
		return 0;
	},
	error: function () {
				alert("error in formsFieldFillCheck");
	  }
	});
}

function formsFieldFillCheck(tenant,elementId,errmsg)
{
	if($('#'+elementId).val()=="")
		translateError(tenant,errmsg);
	else	
		return 1;
}
function formControl(tenant,handle)
{
	if (checkForRun(tenant,"forms"))
	{
	   var RData;
	   $.ajax({        
	   type: "POST",
	   url: siteDomain+"Public/Modules/forms/functions/getFields.php",
	   data: {tenant:tenant,moduleHandle:handle},
	   success: function(Rdata) {
		
		var Data=$.parseJSON(JSON.parse(Rdata));
		
		var rulesCount=0;
		for(i=0;i<Data[0]["data"]["fields"].length;i++)
			for(j=0;j<Data[0]["data"]["fields"][i]["rules"].length;j++)
				if (Data[0]["data"]["fields"][i]["rules"][j]["enabled"]==true)
					rulesCount++;
		
		
		var checkRules=0;
		for(i=0;i<Data[0]["data"]["fields"].length;i++)
			for(j=0;j<Data[0]["data"]["fields"][i]["rules"].length;j++)
				if (Data[0]["data"]["fields"][i]["rules"][j]["enabled"]==true)
					checkRules+=eval(Data[0]["data"]["fields"][i]["rules"][j]["function"])(tenant,Data[0]["data"]["fields"][i]["id"],Data[0]["data"]["fields"][i]["rules"][j]["messageOnError"]);
								
								
		if (checkRules==rulesCount)
		{
			$.ajax({        
		   type: "POST",
		   url: siteDomain+"Public/Modules/forms/functions/formSubmit.php",
		   data: {tenant:tenant,moduleHandle:handle,fields:$('#'+handle).serialize()},
		   success: function(RData) {
			   translateError(tenant,RData);
			},
			error: function () {
						alert("error in formControl");
			  }
			});
		}
		
		},
		error: function () {
					alert("error in formControl");
		  }
		});
	}
}

function getCaptcha($handle)
{
	message("getCaptcha for:"+$handle);
}
function message(msg,callback=""){
	$.fancybox.open(msg,{
	afterClose : function() {
		if (callback!=""){
			window[callback]();
			}
	}
});
}

function pageReload(){
	location.reload();
}

function moduleSubmit(tenant,handle)
{	
   //first, get schema for module
 
   $.ajax({        
   type: "POST",
   url: siteDomain+"Public/Modules/getSchema.php",
   data: {tnt:tenant,moduleHandle:handle},
   success: function(Rdata) {
	
	
	var Data=$.parseJSON(JSON.parse(Rdata));
	
	for(i=0;i<Data[0]["modules"].length;i++)
		if (Data[0]["modules"][i]["enabled"]==true)
			if (Data[0]["modules"][i]["mandatory"]==true)
				eval(Data[0]["modules"][i]["grabFunction"])(tenant,handle);	
	
	//run grabFunction for module
	if (Data[0]["grabFunction"]!="")
		eval(Data[0]["grabFunction"])(tenant,handle);
	
	
	},
	error: function () {
				alert("error in moduleSubmit");
      }
	});
}