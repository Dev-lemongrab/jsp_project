
 $(window).scroll(function(){
     var scroll=$(window).scrollTop();
     console.log(scroll);

     if(scroll >=2){
    	 if($(".tit"+value).is(":none"))
    		 $(".tit"+value).hide();
     }
 });
 
 $(window).scroll(function(){
     var scroll=$(window).scrollTop();
     console.log(scrol2);

     if(scrol2 ==0){
    	 if($(".tit"+value).is(":hidden"))
    		 $(".tit"+value).show();
     }
 });

 $(window).scroll(function(){
    var scroll2=$(window).scrollTop();
    console.log(scroll2);

    if(scroll2==0){
        $(".navbar").css("background","rgba(47, 47, 49, 100)");

    }
});
 
	$(function(){ 
		var soo=[1,2,3,4,5,6,7,8,9,10]; 
		
		$.each(soo,function(index,value){
			$("#title"+value).click(function(){
				if($('#stitle'+value).is(':hidden')) 
						$('#stitle'+value).show(); 
				else
					$('#stitle'+value).hide();				
			}); 
			
		}); 
	}); 