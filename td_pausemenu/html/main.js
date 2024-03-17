$(document).ready(function(){
    window.addEventListener("message", function(event){
        if(event.data.action == "show") {
            var selector = document.getElementById("container");
            selector.style = "display:block";

        } else if(event.data.action == "hide") {
            var selector = document.getElementById("container");
            selector.style = "display:none";
        } 

        if (event.data.imagen) {
            // var div = document.getElementById("personaje");
            var imagem = '<img src='+event.data.imagen+' class="circle" />';;
            // imagem.src= event.data.imagen;
            document.getElementById("circle").innerHTML = imagem;
        }

        if (event.data.name) {
            $(".name_player").html(event.data.name);
        } 
        if (event.data.job) {
            $(".name_job").html(event.data.job);
        }

        if (event.data.bank) {
            $(".bank_money").html(event.data.bank);
        }

        if (event.data.money) {
            $(".money").html(event.data.money);
        }


        if (event.data.players) {
            $(".count_players").html(event.data.players);
        }
       
        if (event.data.police == 0) {
            console.log(event.data.police)
            $(".lspd_dos").html('NO DISPONIBLE');
        }
    })
})


document.onkeydown = function (data) {
    if ((data.which == 27)) { // || data.which == 8
        $.post(`https://${GetParentResourceName()}/exit`);
    }
};

function exit() {
    $.post(`https://${GetParentResourceName()}/exit`);
}

function instagram() {
    window.invokeNative('openUrl', 'https://discord.gg/DtH2xhRcs2')
}

function tiktok() {
    window.invokeNative('openUrl', 'https://discord.gg/DtH2xhRcs2')
}

function twitter() {
    window.invokeNative('openUrl', 'https://discord.gg/DtH2xhRcs2')
}


function OpenMap() {
    $.post(`https://${GetParentResourceName()}/open_map`);
}

function OpenSettings() {
    $.post(`https://${GetParentResourceName()}/open_settings`);
}

function OpenDiscord() {
    window.invokeNative('openUrl', 'https://discord.gg/DtH2xhRcs2')
}

function Tebex() {
    window.invokeNative('openUrl', 'https://discord.gg/DtH2xhRcs2')
}