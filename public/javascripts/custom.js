$(document).ready(function () {
    $("a[rel$=_picgroup]").fancybox({
        'transitionIn'		: 'none',
        'transitionOut'		: 'none',
        'titlePosition' 	: 'over',
        'titleFormat'		: function(title, currentArray, currentIndex, currentOpts) {
            return '<span id="fancybox-title-over">Image('+ (currentIndex + 1) + ' / ' + currentArray.length+ ')' + (title.length ? ' &nbsp; ' + title : '') + '</span>';
        }
    });

    $("#add_propics_link").click( function() {
            $("#add_propics_file_p").append("<input id='project_propics_attributes__photo' multiple='multiple' name='project[propics_attributes][][photo]' type='file'>");
    });

    $("#cat_projects img").hover(function(){
        $(this).fadeTo("fast", 0.45, function(){
           $(this).prev("span").css("visibility","visible");
         }).addClass('box-hover');
            },function(){
        $(this).fadeTo("fast", 1, function(){
            $(this).prev("span").css("visibility","hidden");
         }).removeClass('box-hover');
        }
    );
    
});

	