//Like Operation by AJAX START
function doLike(pid,uid){
    const info={
        uid:uid,
        pid:pid,
        operation: 'like'
    };
    $.ajax({
        url: "LikeServlet",
        data: info,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            if(data.trim() === 'success'){
          let c= $('.like-counter').html();
          c++;
          $('.like-counter').html(c);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
        }
    })
}


//Like Operation by AJAX END

