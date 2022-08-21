$(document).ready(function() {

    $('#spidValidatorTest').on('click', function(){
        let form = $(this).data('ref');
        let action = $(this).data('action');
        $(form).attr('action', action);
        $(form).submit();
    });

    $('.btnLogin').on('click', function(){
        let form = $(this).data('ref');
        let action = $(this).data('action');
        let requestEncoded = '';
        $(form).attr('action', action);
        $.ajax({ 
            type: 'post',
            url: '../../service/spid/spid.php',
            beforeSend: function(){
            },
            success: function (data) {
                requestEncoded = data;
                let urlEncoded = btoa(action);
                $('#SAMLRequest').val(requestEncoded);
                $('#RelayState').val(urlEncoded);
                $(form).submit();
            },
            error: function(data) {
                console.log(data);
            }
        });
    });
});

$(document).ready(function(){
    var rootList = $("#spid-idp-list-small-root-get");
    var idpList = rootList.children(".spid-idp-button-link");
    var lnkList = rootList.children(".spid-idp-support-link");
    while (idpList.length) {
        rootList.append(idpList.splice(Math.floor(Math.random() * idpList.length), 1)[0]);
    }
    rootList.append(lnkList);
});

$(document).ready(function(){
    var rootList = $("#spid-idp-list-medium-root-get");
    var idpList = rootList.children(".spid-idp-button-link");
    var lnkList = rootList.children(".spid-idp-support-link");
    while (idpList.length) {
        rootList.append(idpList.splice(Math.floor(Math.random() * idpList.length), 1)[0]);
    }
    rootList.append(lnkList);
});

$(document).ready(function(){
    var rootList = $("#spid-idp-list-large-root-get");
    var idpList = rootList.children(".spid-idp-button-link");
    var lnkList = rootList.children(".spid-idp-support-link");
    while (idpList.length) {
        rootList.append(idpList.splice(Math.floor(Math.random() * idpList.length), 1)[0]);
    }
    rootList.append(lnkList);
});

$(document).ready(function(){
    var rootList = $("#spid-idp-list-xlarge-root-get");
    var idpList = rootList.children(".spid-idp-button-link");
    var lnkList = rootList.children(".spid-idp-support-link");
    while (idpList.length) {
        rootList.append(idpList.splice(Math.floor(Math.random() * idpList.length), 1)[0]);
    }
    rootList.append(lnkList);
});

$(document).ready(function(){
    var rootList = $("#spid-idp-list-small-root-post");
    var idpList = rootList.children(".spid-idp-button-link");
    var lnkList = rootList.children(".spid-idp-support-link");
    while (idpList.length) {
        rootList.append(idpList.splice(Math.floor(Math.random() * idpList.length), 1)[0]);
    }
    rootList.append(lnkList);
});

$(document).ready(function(){
    var rootList = $("#spid-idp-list-medium-root-post");
    var idpList = rootList.children(".spid-idp-button-link");
    var lnkList = rootList.children(".spid-idp-support-link");
    while (idpList.length) {
        rootList.append(idpList.splice(Math.floor(Math.random() * idpList.length), 1)[0]);
    }
    rootList.append(lnkList);
});

$(document).ready(function(){
    var rootList = $("#spid-idp-list-large-root-post");
    var idpList = rootList.children(".spid-idp-button-link");
    var lnkList = rootList.children(".spid-idp-support-link");
    while (idpList.length) {
        rootList.append(idpList.splice(Math.floor(Math.random() * idpList.length), 1)[0]);
    }
    rootList.append(lnkList);
});

$(document).ready(function(){
    var rootList = $("#spid-idp-list-xlarge-root-post");
    var idpList = rootList.children(".spid-idp-button-link");
    var lnkList = rootList.children(".spid-idp-support-link");
    while (idpList.length) {
        rootList.append(idpList.splice(Math.floor(Math.random() * idpList.length), 1)[0]);
    }
    rootList.append(lnkList);
});