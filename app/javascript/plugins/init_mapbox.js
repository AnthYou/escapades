import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '25px';
    element.style.height = '25px';

    new mapboxgl.Marker({color: 'red'})
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // add this
      .addTo(map);
  });
};

const initMapbox = () => {

  // MAP IN HOME
  const mapElement = document.getElementById('map');

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    const markers = JSON.parse(mapElement.dataset.markers);

    addMarkersToMap(map, markers)

    fitMapToMarkers(map, markers);
    map.addControl(new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      language: 'en-US',
      mapboxgl: mapboxgl
    }));
  }

  const mapElement2 = document.getElementById('map2');

  if (mapElement2) {
    mapboxgl.accessToken = mapElement2.dataset.mapboxApiKey;
    const map2 = new mapboxgl.Map({
      container: 'map2',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    const markers = JSON.parse(mapElement2.dataset.markers);

    addMarkersToMap(map2, markers)

    fitMapToMarkers(map2, markers);
    map2.addControl(new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      language: 'en-US',
      mapboxgl: mapboxgl
    }));
  }

};

export { initMapbox };
