
let qtotal=0;

//상품 상세 이미지 변경----------------------------------------------------------------------------------------
var $mainProduct = $('.main_product'),
    $bigImg = $mainProduct.find('.big_img');
    $subImgList = $mainProduct.find('.sub_img li');

$subImgList.click(function(){
    $(this).addClass('active').siblings().removeClass('active'); //클릭한 것은 추가 다른것은 active를 삭제해줌
    var ImgPath = $(this).find('img').attr('src');  //클릭된 이미지 경로를 가져옴

    $bigImg.attr('src',ImgPath); //경로를 메인 이미지에 넣어줌

});


/* + - 버튼 선택시 수량 업다운 구간---------------------------------------------------------------------  */
var $quantitydiv=$('.quantity'), //수량 구간 등록
    $unitprice = $quantitydiv.attr('data-unitprice'),  //상품 가격 넣기
    $qBtn=$quantitydiv.find('span'), //업 다운 버튼 등록
    $quyInput=$quantitydiv.find('input'), //수량 데이터 변하는 구간
    $tagetTotal=$('.total_price .price'); //총 가격 나오는 구간




$qBtn.click(function(){
    var currentCount=$quyInput.val();


    if($(this).hasClass('plus')){
        // currentCount++;
        // $quyInput.val(currentCount);
        $quyInput.val(++currentCount);
    }else{
        if(currentCount>1) //수량이 1보다는 커야 주문이 가능함으로
            $quyInput.val(--currentCount);
    }   
       

});


/* 상품 추가 / 삭제 부분 ---------------------------------------------------------------------  */
var $orderClick = $('.order_click'),  //클릭버튼 있는 구간 등록
    $clickBtn = $orderClick.find('span'), //span을 버튼으로 등록
    $selectProduct = $('.select_product'),  //데이터를 넣을 위치의 구간 등록
    $showData =$selectProduct.find('.show_data'), //데이터를 넣을 위치
    $productName=$('.product_specs .product_option h2 label'),      //상품명/컬러/사이즈/수량(위에서 만든 $quyInput.val()로 처리) 가져오기
    $productColor=$('.color select[name="option_1"]'),  //컬러 경로
    $dataRow=$showData.find('.show_data_row'), //데이터 행 경로
    $delBtn=$dataRow.find('span'),  //데이터 삭제 버튼 경로
    $orderNow=$('.order_now'),
    $orderBtn=$orderNow.find('.orderBtn');


//상품 추가 버튼 클릭 시 (필요한것: 상품명/컬러/사이즈/수량)
$clickBtn.click(function(){
    var Name=$productName.text(), //ok
        Color=$productColor.val(),  //ok
        Size=$("input[name='size']:checked").val(), //ok
        quantity=$quyInput.val();  //ok  

        
    var price=quantity*$unitprice;
    let list=[Name,Color,Size,quantity,price];    //get List
    if(Color=="" || Size==null){
        alert("color 또는 size를 선택해주세요");
    }else{
        itemList.push(list);
        $quyInput.val("1"); //수량 값 초기화
        $productColor.val("");  //select값 초기화
        $('.select_product').css("display","block");
        showList();
    }    
});

let itemList=[];

//상품 삭제 버튼 클릭시
$delBtn.live('click',function(){
    let id=this.getAttribute("id");  //넘어온 요소의 id를 반환함
    itemList.splice(id, 1);   //리스트에 있는 해당 id를 삭제 splice("삭제할 요소","제거할 요소의 수")
    priceShow(); //삭제에 따른 가격변동을 보여주기위해 함수 호출
    $(this).parentsUntil("div").remove();  //부모 요소중 div를 만나기 전까지 삭제시킴 즉, 행삭제
    $(this).remove(); //자기자신 (버튼)까지 삭제
    priceShow();
    

});


//리스트에 들어있는 주문목록들이 반복을 통해서 나타남
function showList(){
    for(let i=0;i<itemList.length;i++){
        list="<p class='show_data_row' id="+i+">"
        for(let j=0;j<itemList[i].length;j++){
            list+=itemList[i][j]+' ';
        }
        list+='<span class="delete">x</span></p>';
    }
    $showData.append(list);
    priceShow();   
}

//총가격을 보여주는 함수
function priceShow(qtotal){
    var lastqTotal=0;
    for(let i=0;i<itemList.length;i++){
            lastqTotal+=Number(itemList[i][3]);  //리스트에 있는 수량만큼만 가격을 더해줌                
    }
    var TotalPrice=($unitprice * lastqTotal).toLocaleString('en');
    $tagetTotal.text(TotalPrice+'원');  //생성된 가격을 총가격이 표시되는 위치에 텍스트로 넣어줌
    if(TotalPrice==0){
    	$('.select_product').css("display","none");
    }
}

$orderBtn.click(function(){	 
   location.href='/jsp_leopard/product/payment.jsp?itemList='+itemList;
});

$('.cartBtn').click(function(){    
   location.href='cart.product?itemList='+itemList;
});

//----------마우스 이벤트--------------------//

$('.favorite').hover(function(){
    $('.favorite').find('img').attr('src',"/jsp_leopard/images/favorite2.png");
},function(){
    $('.favorite').find('img').attr('src',"/jsp_leopard/images/favorite1.png");
});


$('.basket').hover(function(){
    $('.basket').find('img').attr('src',"/jsp_leopard/images/basket2.png");
},function(){
    $('.basket').find('img').attr('src',"/jsp_leopard/images/basket1.png");
});

$('.orderBtn').hover(function(){
    $('.orderBtn').find('img').attr('src',"/jsp_leopard/images/order2.png");
},function(){
    $('.orderBtn').find('img').attr('src',"/jsp_leopard/images/order1.png");
})


        





       