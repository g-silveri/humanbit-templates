$(document).ready(function(){

    $(".nav_calendar").on('click', function(){
        let urlcalendar = $(this).data('url-calendar');
        let urlmonth = $(this).data('url-month');
        let monthid = $(this).data('month');
        let month = $(monthid);
        let month_val = Number($(monthid).attr('data-value'));
        let year_val = Number($(monthid).attr('data-year'));
        let elemid = $(this).data('elem');
        let elem = $(elemid);
        if($(this).hasClass('prev_cal')){
            if(month_val === 1){
                month_val = 12;
                year_val = year_val - 1;
            } else {
                month_val = month_val - 1;
                if(month_val < 10){
                    month_val = '0' + month_val;
                }
            }
        } else {
            if(month_val === 12){
                month_val = '01';
                year_val = year_val + 1;
            } else {
                month_val = month_val + 1;
                if(month_val < 10){
                    month_val = '0' + month_val;
                }
            }
        }
        $(monthid).attr('data-year', year_val);
        $(monthid).attr('data-value', month_val);
        urlcalendar = urlcalendar + '&year=' + year_val + '&month=' + month_val;
        urlmonth = urlmonth + '&year=' + year_val + '&month=' + month_val;
        htmltodiv(month,urlmonth);
        htmltodiv(elem,urlcalendar);
    });
});