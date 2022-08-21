$(document).ready(function() {

    let map = L.map('map').setView([45.464664 , 9.188540], 12);

    //definizione del layer mappa con relative opzioni di stile e zoom e successiva aggiunta alla mappa

    L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
        maxZoom: 15,
        id: 'mapbox/streets-v11',
        tileSize: 512,
        drawControl: true,
        zoomOffset: -1,
        accessToken: 'pk.eyJ1IjoiYm9ycmVjYWhiIiwiYSI6ImNsM2p4bGthcjBpcXUzaHFpb3Q5eG1sdDYifQ.8j9jswc_pAM2Lb2_Vn-qzw'
    }).addTo(map);

});