// JavaScript Document


(function (doc, win) {
    var docEl = doc.documentElement,
        resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
        recalc = function () {
            var clientWidth = docEl.clientWidth;
            if (!clientWidth) return;
            docEl.style.fontSize = 10 * (clientWidth / 320) + 'px';
        };

    if (!doc.addEventListener) return;
    win.addEventListener(resizeEvt, recalc, false);
    doc.addEventListener('DOMContentLoaded', recalc, false);
    recalc();
})(document, window);




$(function(){
    var tab_menu_li = $('.tab_menu li');
    $('.tab_con .common:gt(0)').hide();

    tab_menu_li.click(function(){
        var index = $(this).index()+1;
        $(this).addClass('selected')
            .siblings().removeClass('selected');

        tab_menu_li.each(function(){
            var i = $(this).index()+1;

        })

        var tab_menu_li_index = tab_menu_li.index(this);
        $('.tab_con .common').eq(tab_menu_li_index).show()
            .siblings().hide();
    }).click(function(){
        $(this).addClass('hover');
    },function(){
        $(this).removeClass('hover');
    });

});

$(function(){
    $('.proMan_header strong').click(function(){
        if($('.proMan_menu').css('display')=='none'){
            $('.proMan_menu').show(0);
        }else{
            $('.proMan_menu').hide(0);
        }
        return false;
    })
    $(window).click(function(){
        $('.proMan_menu').hide(0);
    })

    $('.proMan_menu ul li').click(function(){
        $(this).addClass('cur').siblings('li').removeClass('cur');
    })

    $('.login dl dd span').click(function(){
        if($(this).hasClass('current')){
            $(this).removeClass('current');
        }else{
            $(this).addClass('current');
        }

    })

})


// 下拉框
$(function(){
    $(".select_box").click(function(event){
        event.stopPropagation();
        $(this).find(".option").toggle();
        $(this).parent().siblings().find(".option").hide();
    });
    $(document).click(function(event){
        var eo=$(event.target);
        if($(".select_box").is(":visible") && eo.attr("class")!="option" && !eo.parent(".option").length)
            $('.option').hide();
    });
    /*赋值给文本框*/
    $(".option a").click(function(){
        var value=$(this).text();
        $(this).parent().siblings(".select_txt").text(value);
        $("#select_value").val(value)
    });
});
