$(document).ready(function() {
    $('#ajax').click(function() {
        $.ajax({
            url:'ajax.xml',
            type:'GET',
            dataType: 'xml',
            success: function(data){
                $('#dictionary').empty();
                $.each($(data).find('entry'), function(){
                    var $entry = $(this);
                    var html ='<div class="entry">';
                    html +='<h3 class="term">'+ $entry.attr('term'); +'</h3>';
                    html +='<div class="part">'+ $entry.attr('part'); +'</div>';
                    html +='<div class="definition">'+  $entry.text()+'</div>';
                    html +='</div>';
                    $('#dictionary').append(html);
                });// end each
            }// end
        });// end ajax
        return false;
    });
});