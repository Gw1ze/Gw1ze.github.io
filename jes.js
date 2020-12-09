let map;

function initMap() {
   map = new google.maps.Map(document.getElementById("map"), {
      enter: { lat: -34.397, lng: 150.644 },zoom: 8,
   });
}