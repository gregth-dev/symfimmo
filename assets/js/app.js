// any CSS you import will output into a single css file (app.css in this case)
import '../css/app.css';
import $ from 'jquery';
import Map from './modules/Map';
import 'slick-carousel';
import 'slick-carousel/slick/slick.css';
import 'slick-carousel/slick/slick-theme.css';

// Affichage des éléments sur la carte à partir des coordonnées
Map.init();

// Autocomplétion des champs adresse du formulaire
let places = require('places.js');
let inputAddress = document.querySelector('#property_address')
if (inputAddress) {
    let place = places({
        container: inputAddress
    });
    place.on('change', evt => {
        document.querySelector('#property_city').value = evt.suggestion.city;
        document.querySelector('#property_postal_code').value = evt.suggestion.postcode;
        document.querySelector('#property_lat').value = evt.suggestion.latlng.lat;
        document.querySelector('#property_lng').value = evt.suggestion.latlng.lng;
    })
}
let searchAddress = document.querySelector('#search_address')
if (searchAddress) {
    let place = places({
        container: searchAddress
    });
    place.on('change', evt => {
        document.querySelector('#lat').value = evt.suggestion.latlng.lat;
        document.querySelector('#lng').value = evt.suggestion.latlng.lng;
    })
}

// Change l'apparence des select dans les formulaires
require('select2');
$('select').select2();

// Slide des images
$('[data-slider]').slick({
    dots: true,
    arrows: true
});

// Permet l'animation sur le formulaire de contact
let contactButton = $('#contactButton');
contactButton.click(e => {
    e.preventDefault();
    $('#contactForm').slideDown();
    contactButton.slideUp();
    cancelButton.slideDown();
})
let cancelButton = $('#cancelButton');
cancelButton.click(e => {
    e.preventDefault();
    $('#contactForm').slideUp();
    cancelButton.slideUp();
    contactButton.slideDown();
})

// Suppression des photos dans la partie admin
document.querySelectorAll('[data-delete').forEach(a => {
    a.addEventListener('click', evt => {
        evt.preventDefault();
        let container = evt.target.parentNode;
        let token = evt.target.getAttribute('data-token');
        let data = new FormData();
        data.append('_method', 'DELETE')
        data.append('_token', token)
        let init = { method: "POST", body: data };
        fetch(a.getAttribute('href'), init).then(response => response.json())
            .then(result => result.success ? container.remove() : alert('Impossible de supprimer l\'image'))
            .catch(error => alert(error));
    })
})
