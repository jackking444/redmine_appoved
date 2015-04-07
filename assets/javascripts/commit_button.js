function addNewsEntry() {
    if (typeof(jQuery) != 'undefined') 
    {
    $('#suppress_mail').prop('checked', true);
    $('#suppress_mail').val("1");
    $('#issue_notes').val(" h1. *%{color:green}Согласовано%*");
    $('#issue-form').submit();
    }    
}
