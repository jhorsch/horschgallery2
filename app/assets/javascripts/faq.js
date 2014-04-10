


$(function() {

    $('.answer').hide();

    $('.question').click(function() {

        $(this).next('.answer').slideToggle(300);

    });
});
