// These words are used in countdown timer
quera.time_words = ['روز', 'روز', 'ساعت', 'ساعت', 'دقیقه', 'دقیقه', 'ثانیه', 'ثانیه'];

quera.update_clock = function () {
    quera.time = moment();
    tehran_zone = '+' + quera.server_first_time.split('+')[1].replace(':', '');
    var now = moment().add(quera.offset, 'milliseconds');
    set_count_down();
    var countdown = quera.finish_time.diff(now);
    if (countdown <= 0 && countdown + quera.extra_time.asMilliseconds() >= 0) {
        countdown = countdown + quera.extra_time.asMilliseconds();
        $("div#extra_time").css("display", "block");
    }
    else
        $("div#extra_time").css("display", "none");
    if (countdown <= 0) {
        countdown = 0;
    }

    countdown = Math.floor(moment.duration(countdown).asSeconds());
    var seconds = countdown % 60;
    countdown = (countdown - seconds) / 60;
    var minutes = countdown % 60;
    countdown = (countdown - minutes) / 60;
    var hours = countdown % 24;
    countdown = (countdown - hours) / 24;
    var days = countdown;
    $("#time_days").html(persian_digits(days));
    $("#time_hours").html(persian_digits(hours));
    $("#time_minutes").html(persian_digits(minutes));
    $("#time_seconds").html(persian_digits(seconds));
    if (days == 1)
        $("#days_label").html(quera.time_words[0]);
    else
        $("#days_label").html(quera.time_words[1]);
    if (hours == 1)
        $("#hours_label").html(quera.time_words[2]);
    else
        $("#hours_label").html(quera.time_words[3]);
    if (minutes == 1)
        $("#minutes_label").html(quera.time_words[4]);
    else
        $("#minutes_label").html(quera.time_words[5]);
    if (seconds == 1)
        $("#seconds_label").html(quera.time_words[6]);
    else
        $("#seconds_label").html(quera.time_words[7]);
}


/**
 * SERVER TIME
 */
$(document).ready(function () {
    quera.update_clock();
    window.setInterval(quera.update_clock, 1000);
});


function set_time(countdown, main_class) {
    seconds = countdown % 60;
    countdown = (countdown - seconds) / 60;
    minutes = countdown % 60;
    countdown = (countdown - minutes) / 60;
    hours = countdown % 24;
    countdown = (countdown - hours) / 24;
    days = countdown;
    $("#" + main_class + " .time_block .time_days").html(persian_digits(days));
    $("#" + main_class + " .time_block .time_hours").html(persian_digits(hours));
    $("#" + main_class + " .time_block .time_minutes").html(persian_digits(minutes));
    $("#" + main_class + " .time_block .time_seconds").html(persian_digits(seconds));
    if (days == 1)
        $("#" + main_class + " .time_block .days_label").html(quera.time_words[0]);
    else
        $("#" + main_class + " .time_block .days_label").html(quera.time_words[1]);
    if (hours == 1)
        $("#" + main_class + " .time_block .hours_label").html(quera.time_words[2]);
    else
        $("#" + main_class + " .time_block .hours_label").html(quera.time_words[3]);
    if (minutes == 1)
        $("#" + main_class + " .time_block .minutes_label").html(quera.time_words[4]);
    else
        $("#" + main_class + " .time_block .minutes_label").html(quera.time_words[5]);
    if (seconds == 1)
        $("#" + main_class + " .time_block .seconds_label").html(quera.time_words[6]);
    else
        $("#" + main_class + " .time_block .seconds_label").html(quera.time_words[7]);
}

function calc_one_field(num, i, class_name, delta_time, contest_id) {
    //alert(contest_id);
    delta = quera.offset - delta_time * 1000;
    now = moment().subtract(delta, 'milliseconds');
    countdown = quera.times[i][num].diff(now);
    //alert(countdown);
    if (countdown <= 0) {
        countdown = 0;
    }
    // if (class_name == 'register') {
    //     if (countdown == 0) {
    //         //alert($('.remove_from_contest').html());
    //         $('#add_to_contest-' + contest_id).html('').hide();
    //         $('#add_to_contest-login_required-' + contest_id).hide();
    //         $('#remove_from_contest-' + contest_id).html('').hide();
    //         //alert($('.remove_from_contest').html());
    //         //alert(countdown);
    //     }
    //     else {
    //         //alert(countdown);
    //         var add_to_contest = $('#add_to_contest-' + contest_id);
    //         var remove_from_contest = $('#remove_from_contest-' + contest_id);
    //         var can_enter = add_to_contest.data('registered');
    //         var applied = add_to_contest.data('applied');
    //         //alert(can_enter);
    //         //alert(applied);
    //         if (can_enter == 'True') {
    //             remove_from_contest.html('لغوعضویت').show();
    //             add_to_contest.hide();
    //         }
    //         else if (applied == 'True') {
    //             remove_from_contest.html('لغودرخواست عضویت').show();
    //             add_to_contest.hide();
    //         }
    //         else {
    //             add_to_contest.html('عضویت').show();
    //             remove_from_contest.hide();
    //         }
    //     }
    // }
    countdown = Math.floor(moment.duration(countdown).asSeconds());
    //alert(quera.times[i][3]);
    set_time(countdown, quera.times[i][3] + '-' + class_name)
}

function set_count_down() {
    for (i = 0; i < quera.times.length; i++) {
        calc_one_field(0, i, 'start', 0, quera.times[i][4]);
        calc_one_field(0, i, 'register', quera.times[i][2], quera.times[i][4]);
        countdown = quera.times[i][1].diff(quera.times[i][0]);
        //alert(countdown);
        if (countdown <= 0) {
            countdown = 0;
        }
        countdown = Math.floor(moment.duration(countdown).asSeconds());
        //alert(quera.times[i][3]);
        set_time(countdown, quera.times[i][3] + '-duration')
    }
}
