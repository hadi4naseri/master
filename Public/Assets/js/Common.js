function _Submit(tenant,handle)
{	
   $.ajax({        
   type: "POST",
   url: siteDomain+"Public/Modules/forms/scripts/_submit.php",
   data: {tnt:tenant,frmHandle:handle,frmData:$('#'+handle).serialize()},
   dataType:'json',
   success: function(data) {
			//resp=JSON.parse(data);
			//if (siteLang)
			//$('#'+handle+'_notification').html(resp);
			
				$.each(data[0].translation,function(i,item)
				{
					if (siteLang==item.language)
					{	
						$('#'+handle+'_notification').html(item.description).stop().css({'color':'red','font-size':'13px'}).fadeIn(1000).effect("shake");
						$('#'+handle).find("input").not(":input[type=button]").val("");
						$('#'+handle+'_notification').fadeOut(5000);
					}
				});
			
				$.each(data[0].callbacks,function(i,item)
				{
					eval(item);
				}
				);
		   }
	});
	
}