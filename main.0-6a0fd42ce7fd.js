document.addEventListener('DOMContentLoaded', function() {
    if ('moment' in window)
        moment.loadPersian({
            usePersianDigits: true,
            dialect: 'persian-modern'
        });
});

function csrfSafeMethod(method) {
    // these HTTP methods do not require CSRF protection
    return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
}

$.ajaxSetup({
    beforeSend: function (xhr, settings) {
        if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
            xhr.setRequestHeader("X-CSRFToken", $.cookie('csrf_token'));
        }
    }
});

function init_semantic() {
    $('.qu-dropdown').each(function (i, e) {
            var settings = {
                fullTextSearch: true,
                forceSelection: false,
            };
            if ($(e).hasClass('clearable'))
                settings['clearable'] = true;
            $(e).dropdown(settings);
        }
    );
    $('.qu-checkbox').checkbox();
    $('.menu .item').tab();
    //$('.menu .item').tab({
    //    history: true,
    //    historyType: 'hash'
    //});
    $('.qu-popup').popup();
    $('.qu-accordion').accordion();
}

// https://remysharp.com/2010/07/21/throttling-function-calls
function quera_debounce(fn, delay) {
    var timer = null;
    return function () {
        var context = this, args = arguments;
        clearTimeout(timer);
        timer = setTimeout(function () {
            fn.apply(context, args);
        }, delay);
    };
}

var englishDigits = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
    persianDigits = ["۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹", "۰"];

function persian_digits(str) {
    str = '' + str;
    for (var i = 0; i < 10; i++)
        str = str.replace(new RegExp(englishDigits[i], "g"), persianDigits[i]);
    return str;
}

function english_digits(str) {
    str = '' + str;
    for (var i = 0; i < 10; i++)
        str = str.replace(new RegExp(persianDigits[i], "g"), englishDigits[i]);
    return str;
}

function html_escape(value) {
    return $('<div/>').text(value).html();
}

// selectText is used for "Select All" when viewing a submitted code
jQuery.fn.selectText = function () {
    var doc = document
        , element = this[0]
        , range, selection;
    if (doc.body.createTextRange) {
        range = document.body.createTextRange();
        range.moveToElementText(element);
        range.select();
    } else if (window.getSelection) {
        selection = window.getSelection();
        range = document.createRange();
        range.selectNodeContents(element);
        selection.removeAllRanges();
        selection.addRange(range);
    }
};

function s_humanize(s) {
    s = ~~(s / 60);
    var h = ~~(s / 60), m = (s % 60);
    if (h < 10)
        h = '0' + h;
    if (m < 10)
        m = '0' + m;
    return persian_digits(h + ':' + m);
}

function duration_nice_repr(duration) {
    // Gets moment.duration objects
    var result = [];
    if (duration.years() > 0)
        result.push(persian_digits(duration.years()) + ' سال');
    if (duration.months() > 0)
        result.push(persian_digits(duration.months()) + ' ماه');
    if (duration.days() > 0)
        result.push(persian_digits(duration.days()) + ' روز');
    if (duration.hours() > 0)
        result.push(persian_digits(duration.hours()) + ' ساعت');
    if (duration.minutes() > 0)
        result.push(persian_digits(duration.minutes()) + ' دقیقه');
    if (duration.seconds() > 0)
        result.push(persian_digits(duration.seconds()) + ' ثانیه');
    var result_str = '';
    for (var i = 0; i < result.length; i++) {
        result_str += result[i];
        if (i != result.length - 1)
            result_str += ' و '
    }
    return result_str;
}

Noty.overrideDefaults({
    layout: 'bottomLeft',
    theme: 'relax',
    type: 'info',
    animation: {
        open: 'noty_effects_open',
        close: 'noty_effects_close',
    },
    timeout: 2000,
    closeWith: ['click'],
});

$(document).ready(function () {
    init_semantic();

    var mobile_menu_toggle_button = $('#mobile-menu-toggle');
    if (mobile_menu_toggle_button.length) { // if toggle button exists
        var toggle_icon = mobile_menu_toggle_button.children('.icon');

        function toggleMenu() {
            $('#mobile-menu').transition({
                animation: 'slide down',
                onStart: function () {
                    if (toggle_icon.attr('class') === 'large arrow left icon') {
                        toggle_icon.attr('class', 'large sidebar icon');
                        $('#mobile-menu-overlay').remove();
                    }
                    else {
                        toggle_icon.attr('class', 'large arrow left icon');
                        $('#qu-scroll, #land-body').append('<div id="mobile-menu-overlay"></div>');
                    }
                }
            });
        }

        mobile_menu_toggle_button.click(function (e) {
            e.preventDefault();
            toggleMenu();
        });
        $('#qu-scroll, #land-body').on('click', '#mobile-menu-overlay', toggleMenu);
    }
});

function render_markdown(md_text, result_html_div=null, markedOptions={}) {
    /*
    if (result_html_div is null) this function returns result html as text
    else this function render markdown in result_html_div
        example 1:
            html_div.html(render_markdown(md_text))
        example 2:
            render_markdown(md_text, html_div)
    */
    let mapping_katex = [];

    function katex_step1(text) {
        let mapping_code = [];
        // 1. replace inline codes (`code`) with placeholders (to let KaTeX do its work without problem)
        text = text.replace(/(`+)\s*([\s\S]*?[^`])\s*\1(?!`)/g, function (match) {
            let placeholder = 'qcodeph' + Math.floor((Math.random() * 1000000) + 1);
            mapping_code.push([placeholder, match]);
            return placeholder;
        });
        // 2. let KaTeX do its work
        let element = $('<div/>').html(text);
        try {
            renderMathInElement(element[0], {
                delimiters: [
                    {left: "$$", right: "$$", display: true},
                    {left: "\\[", right: "\\]", display: true},
                    {left: "\\(", right: "\\)", display: false},
                    {left: "$", right: "$", display: false}
                ]
            });
        } catch (e) {
            console.log(e)
        }
        // 3. Replace KaTeX html elements with placeholders (to let marked.js do its work without problem)
        element.children().each(function (i, e) {
            let placeholder = 'qkatexph' + Math.floor((Math.random() * 1000000) + 1);
            mapping_katex.push([placeholder, $(e).prop('outerHTML')]);
            $(e).replaceWith(placeholder);
        });
        text = element.html();
        // 4. Restore inline code placeholders with real codes
        // https://stackoverflow.com/a/40005925/1744633
        for (let i = 0; i < mapping_code.length; i++)
            text = text.replace(mapping_code[i][0], function () {
                return mapping_code[i][1]
            });
        return text;
    }

    function katex_step2(text) {
        // replace katex placeholders with KaTeX html elements
        // https://stackoverflow.com/a/40005925/1744633
        for (let i = 0; i < mapping_katex.length; i++)
            text = text.replace(mapping_katex[i][0], function () {
                return mapping_katex[i][1]
            });
        return text;
    }

    function collapsible_text_step1(tokens) {
        // "[^]" is used instead of "." with s (dotall) flag. "[^]" matches any character including newline
        // reason: s flag is not supported in FireFox
        var tokens2 = marked.lexer('');
        tokens.map(function(token){
            if (token.type === 'paragraph') {
                token.text.split(/((?:^|\n)&lt;summary&gt;[^]*?&lt;\/summary&gt;)/)
                    .map(function (c) {return c.trim()}).filter(function (c) {return c.length > 0})
                    .map(function (c) {tokens2.push({type: 'paragraph', text: c})});
            } else
                tokens2.push(token);
        });
        tokens = marked.lexer('');
        tokens2.map(function(token){
            if (token.type === 'paragraph') {
                token.text.split(/((?:^|\n)&lt;(?:details\s*(?:(?: class=".*?")?(?: open)?|(?: open)?(?: class=".*?")?)|\/details)&gt;)/)
                    .map(function (c) {return c.trim()}).filter(function (c) {return c.length > 0})
                    .map(function (c) {tokens.push({type: 'paragraph', text: c})});
            } else
                tokens.push(token);
        });
        return tokens;
    }

    function collapsible_text_step2(text) {
        // "[^]" is used instead of "." with s (dotall) flag. "[^]" matches any character including newline
        // reason: s flag is not supported in FireFox
        return text.replace(/<p>\s*&lt;summary&gt;([^]*?)&lt;\/summary&gt;\s*<\/p>/g, '<summary>$1</summary>')
            .replace(/<p>\s*&lt;details&gt;\s*<\/p>/g, '<details>')
            .replace(/<p>\s*&lt;details\s*(?: class=&quot;(.+?)&quot;)?\s*( open)?\s*&gt;\s*<\/p>/g, '<details class="$1"$2>')
            .replace(/<p>\s*&lt;details\s*( open)?\s*(?: class=&quot;(.+?)&quot;)?\s*&gt;\s*<\/p>/g, '<details class="$2"$1>')
            .replace(/<p>\s*&lt;\/details&gt;\s*<\/p>/g, '</details>');
    }

    // customize renderer (to disable id from headings)
    // let renderer = new marked.Renderer();
    // renderer.heading = function (text, level, raw) {
    //     return '<h' + level + '>' + text + '</h' + level + '>\n';
    // };

    marked.setOptions(Object.assign({
        // renderer: renderer,
        headerIds: false,
        gfm: true,
        tables: true,
        smartLists: true,
        sanitize: true // Actually, doesn't matter!
    }, markedOptions));

    let html_div = $("<div></div>");
    if (result_html_div != null) html_div = result_html_div;
    // Replace occurrences of &gt; at the beginning of a new line with ">"
    // so Markdown blockquotes are handled correctly
    md_text = md_text.replace(/^&gt;/mg, '>');

    // Tokenize
    var tokens = marked.lexer(md_text);

    // Extract <details>, <summary> tags as separate tokens
    tokens = collapsible_text_step1(tokens);

    // Run katex_step1 on token texts (except for code blocks)
    for (let i = 0; i < tokens.length; i++) {
        var token = tokens[i];
        switch (token.type) {
            case 'heading':
            case 'paragraph':
            case 'text':
                token.text = katex_step1(token.text);
                break;
            case 'table':
                for (let j = 0; j < token.header.length; j++) {
                    token.header[j] = katex_step1(token.header[j]);
                }
                for (let j = 0; j < token.cells.length; j++)
                    for (let k = 0; k < token.cells[j].length; k++)
                        token.cells[j][k] = katex_step1(token.cells[j][k]);
                break;
        }
    }

    // Let marked.js parse tokens
    var marked_text = marked.parser(tokens);

    // Run katex_step2 on parsed output
    marked_text = katex_step2(marked_text);

    // Replace <details>, <summary> placeholders with real tags
    marked_text = collapsible_text_step2(marked_text);

    // Show the result
    html_div.html(marked_text);

    // Set elements' text directions
    html_div.children().attr('dir', 'auto');
    html_div.find('details').children().attr('dir', 'auto');

    // We needed to change auto to ltr, because of Edge browser
    // html_div.find('pre').attr('dir', 'auto');
    html_div.find('pre').attr('dir', 'ltr');

    html_div.find('code').each(function (i, e) {
        if (!$(e).parent().is('pre'))
            // set direction for inline codes
            // We needed to change auto to ltr, because of Edge browser
            // $(e).attr('dir', 'auto');
            $(e).attr('dir', 'ltr');
        // Fix Code Blocks (un-escape inner html)
        // and enable <mark> tags
        $(e).html($(e).text()
            .replace(/&lt;mark\s*( title="[^"]*?")?\s*( class="(?:red|orange|yellow|olive|green|teal|blue|violet|purple|pink|brown|grey)")?\s*&gt;(.*?)&lt;\/mark&gt;/g, '<mark$1$2>$3</mark>')
            .replace(/&lt;mark\s*( class="(?:red|orange|yellow|olive|green|teal|blue|violet|purple|pink|brown|grey)")?\s*( title="[^"]*?")?\s*&gt;(.*?)&lt;\/mark&gt;/g, '<mark$1$2>$3</mark>')
        );
    });

    // add semantic-ui class to tables
    html_div.find('table').addClass('ui unstackable table');

    // Syntax Highlight Codes
    html_div.find('pre code').filter(function () {
        return this.className.match(/language-.*/);
    }).each(function (i, e) {
        // enable line numbers
        e.parentElement.className += ' line-numbers';
        Prism.highlightElement(e);
    });

    // Enable "Copy" button for simple code elements
    html_div.find('pre code').filter(function () {
        return !this.className.match(/language-.*/);
    }).each(function (i, e) {
        Prism.highlightElement(e);
    });



    html_div.find('mark[title]').each(function(i, e){
        $(e).popup({
            content: this.title,
            position: 'top center',
            variation: 'small'
        });
        $(this).removeAttr('title');
    });
    if (result_html_div == null) return html_div.html();
}

function render_problem_text(md_id, html_id) {
    let md_div = $('#' + md_id);
    let html_div = $('#' + html_id);

    // Replace occurrences of &gt; at the beginning of a new line with ">"
    // so Markdown blockquotes are handled correctly
    let md_text = md_div.html();
    render_markdown(md_text, html_div);
}

// https://varvy.com/pagespeed/defer-images.html
function defer_load_images() {
    var imgDefer = document.getElementsByTagName('img');
    for (var i = 0; i < imgDefer.length; i++) {
        if (imgDefer[i].getAttribute('data-src')) {
            imgDefer[i].setAttribute('src', imgDefer[i].getAttribute('data-src'));
        }
    }
}
document.addEventListener('DOMContentLoaded', defer_load_images);

document.addEventListener('DOMContentLoaded', function () {
    $('.qrate-progress').each(function (i, e) {
        var circle = new ProgressBar.Circle(e, {
            color: '#00b5ad',
            duration: 1400,
            easing: 'easeInOut',
            strokeWidth: 6,
            trailWidth: 2,
        });
        circle.animate(($(e).data('rate') / 10) * 0.9 + 0.1);
    });
});

function setPopup(cssSelector, hoverContent, clickContent){
    var element = $(cssSelector);
    element.on('mouseenter', function () {
        element.popup({content: hoverContent, on: "manual"}).popup('show');
    });
    element.on('mouseleave', function () {
        element.popup('hide')
    });
    element.on('click', function () {
        element.popup({content: clickContent, on: "manual"}).popup('show');
    });
}