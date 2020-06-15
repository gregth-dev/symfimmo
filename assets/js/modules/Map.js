import L from 'leaflet';
import 'leaflet/dist/leaflet.css';

export default class Map {
    static init() {
        let map = document.querySelector('#map');
        if (!map)
            return;
        let lat = map.getAttribute('data-lat');
        let lng = map.getAttribute('data-lng');
        let position = [lat, lng];
        map = L.map(map).setView(position, 13);
        let token = 'pk.eyJ1IjoiZ3JlZ3RoIiwiYSI6ImNrYXg4aGN3MDAzdHMzMG5wZGt3NHlwZzUifQ.-z4cr7-gF9u6mYJWeK2-_w';
        L.tileLayer(`https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=${token}`, {
            attribution: `Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, 
            <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>`,
            maxZoom: 18,
            id: 'mapbox/streets-v11',
            tileSize: 512,
            zoomOffset: -1,
            accessToken: 'pk.eyJ1IjoiZ3JlZ3RoIiwiYSI6ImNrYXg4aGN3MDAzdHMzMG5wZGt3NHlwZzUifQ.-z4cr7-gF9u6mYJWeK2-_w'
        }).addTo(map);
        let icon = L.icon({
            iconUrl: '/images/marker-icon.png',
        })
        let marker = L.marker(position, { icon: icon }).addTo(map);
    }
}