$(document).ready(function () {

    var tmp_single = [];
    $("a[rel$=_picgroup]").each(function(i){
        tmp_single[i] = $(this).attr('rel');
    });
    var norepeat=function (x) {
        var y='c0cb5f0fcf239ab3d9c1fcd31fff1efc';
        return x.sort().join(y).replace(RegExp('(.*('+y+'|$))\\1+','g'),'').split(y);
    };
    var oneImageArr = norepeat(tmp_single);
    var m=oneImageArr.length;
    for(var i=0;i<m;i++){
        $("a[rel="+oneImageArr[i]+"]").addClass("singlepic");
    }

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

    $("input[name^='inquiry']").click(function(){
        $(this).val("").css('background','white');
    });
    
});

	