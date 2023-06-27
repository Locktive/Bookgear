var ProductImg = document.getElementById("ProductImg");
var SmallImg = document.getElementsByClassName("small-img");

$(document).ready(function() {
    $(SmallImg[0]).click(function() {
        $(".container-fluid").css("background", "#000");
        $(".product-title").css("color", "#000");
        $(".price span:first-child").css("color", "#000");
        $(".reviews i").css("color", "#000");

        ProductImg.src = SmallImg[0].src
    });
    $(SmallImg[1]).click(function() {
      
    
        ProductImg.src = SmallImg[1].src
    });
    $(SmallImg[2]).click(function() {
       
  
    20
        ProductImg.src = SmallImg[2].src
    });
    $(SmallImg[3]).click(function() {
           
    2
        ProductImg.src = SmallImg[3].src
    });
    $('.product-inf a').click(function() {
    
        $('.product-inf li').removeClass('active');
        $(this).parent().addClass('active');
        let currentTab = $(this).attr('href');
        $('.tabs-content div').hide();
        $(currentTab).show();
    
        return false;
    });
    $('.black').click(function(){
        $(".container-fluid").css("background", "#000");
        $(".product-title").css("color", "#000");
        $(".price span:first-child").css("color", "#000");  
        $(".reviews i").css("color", "#000");

        ProductImg.src = SmallImg[0].src
    });
    $('.red').click(function(){
              
    
        ProductImg.src = SmallImg[1].src
    });
    $('.white').click(function(){
       
        
        ProductImg.src = SmallImg[2].src
    });
    $('.yellow').click(function(){
               
        ProductImg.src = SmallImg[3].src
    });
});