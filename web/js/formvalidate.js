$(function() {
    $('#formulario').validate({
        highlight: function(input) {
            console.log(input);
            $(input).parents('.form-line').addClass('error');
        },
        unhighlight: function(input) {
            $(input).parents('.form-line').removeClass('error');
        },
        errorPlacement: function(error, element) {
            $(element).parents('.input-group').append(error);
        }
    });
});


$(function() {
    $('#formulariom').validate({
        highlight: function(input) {
            console.log(input);
            $(input).parents('.form-line').addClass('error');
        },
        unhighlight: function(input) {
            $(input).parents('.form-line').removeClass('error');
        },
        errorPlacement: function(error, element) {
            $(element).parents('.input-group').append(error);
        }
    });
});


$(function() {
    $('#formularion').validate({
        highlight: function(input) {
            console.log(input);
            $(input).parents('.form-line').addClass('error');
        },
        unhighlight: function(input) {
            $(input).parents('.form-line').removeClass('error');
        },
        errorPlacement: function(error, element) {
            $(element).parents('.input-group').append(error);
        }
    });
});
