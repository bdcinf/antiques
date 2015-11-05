$(document).ready(function(){

    $('.InDepthContent').hide();
    $('.less').hide();

    $('.more').click(function(){
        $('.less').show();
        $('.more').hide();
        $('.InDepthContent').toggle();
    })

    $('.less').click(function(){
        $('.more').show();
        $('.less').hide();
        $('.InDepthContent').toggle();
    })
});
