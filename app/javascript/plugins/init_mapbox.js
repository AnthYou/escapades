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
    if (marker.step) {
      element.innerText = marker.step;
    }
    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });

  // markers.forEach((marker) => {
  //   const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this
  //   const pin = new mapboxgl.Marker()
  //     .setLngLat([ marker.lng, marker.lat ])
  //     .setPopup(popup)
  //     .addTo(map);
  //     console.log(pin);
  //     pin.innerHTML = '<p>${marker.step}</p>';
  // });


};

const drawRoute = (map, markers) => {
    const coords = markers.map(marker => [marker.lng, marker.lat])
    console.log(coords)
    // console.log(buildMarkers(map, markers))
    map.on('load', function() {
    //   map.addSource("my_markers", {
    //     type: "geojson",
    //     data: buildMarkers(map, markers)
    //   })
    //   .addLayer({
    //     id: "markersLayer",
    //     type: "symbol",
    //     source: "my_markers"
    //   })

      map.addSource('route', {
        'type': 'geojson',
        'data': {
          'type': 'Feature',
          'properties': {},
          'geometry': {
            'type': 'LineString',
            'coordinates': coords
          },
        'properties': {
          'marker-color': '#3bb2d0',
          'marker-size': 'large',
          'marker-symbol': 'rocket'
          }
        }
      });

      map.addLayer({
        'id': 'route',
        'type': 'line',
        'source': 'route',
        'layout': {
        'line-join': 'round',
        'line-cap': 'round'
        },
        'paint': {
        'line-color': 'blue',
        'line-width': 3,
        'line-opacity': 0.6
        }
      });
  });
}

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

  // MAP IN TRIP SHOW
   const mapElement2 = document.getElementById('map2');

   if (mapElement2) {
     mapboxgl.accessToken = mapElement2.dataset.mapboxApiKey;
     const map2 = new mapboxgl.Map({
       container: 'map2',
       style: 'mapbox://styles/mapbox/streets-v10'
     });
     const markers = JSON.parse(mapElement2.dataset.markers);

     addMarkersToMap(map2, markers)
     drawRoute(map2, markers);

     fitMapToMarkers(map2, markers);
     map2.addControl(new MapboxGeocoder({
       accessToken: mapboxgl.accessToken,
       language: 'en-US',
       mapboxgl: mapboxgl
     }));
   }
};

export { initMapbox };
