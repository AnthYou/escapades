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
    element.style.backgroundSize = 'contain';
    element.style.width = '25px';
    element.style.height = '25px';

    if (marker.step) {
      element.innerText = marker.step;
      new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);

    } else  {
      new mapboxgl.Marker({color: '#f2a365'})

      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
    }

  });
};


//DESSINER DES LIGNES DROITES ENTRES LES POINTS ACTIVITIES (trajet avion) ===========
const drawRouteLines = (map, markers, i) => {
    const coords = markers.map(marker => [marker.lng, marker.lat])
    console.log(coords)
    // console.log(buildMarkers(map, markers))
    map.on('load', function() {
      map.addSource(`route-${i}`, {
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
        'id': `route-${i}`,
        'type': 'line',
        'source': `route-${i}`,
        'layout': {
        'line-join': 'round',
        'line-cap': 'round'
        },
        'paint': {
        'line-color': '#30475e',
        'line-width': 3,
        'line-opacity': 0.6
        }
      });
  });
}




//DESSINER LES TRAJETS ROUTES entre les activities (call API) ===========
const drawRouteDriving = (map, markers, i) => {
  const mapElement = document.getElementById('map2');
  const apiKey = mapElement.dataset.mapboxApiKey;
  const coords = markers.map(marker => [marker.lng, marker.lat])
  // console.log(coords);
  const coords_string = coords.join(";")
  // console.log(coords_string);
  const url = `https://api.mapbox.com/directions/v5/mapbox/driving/${coords_string}?geometries=geojson&access_token=${apiKey}`
  fetch(url)
    .then(response => response.json())
    .then((data) => {
      const route = data.routes[0].geometry.coordinates;
      console.log(data)
        map.on('load', function() {
          map.addSource(`route-${i}`, {
            'type': 'geojson',
            'data': {
              'type': 'Feature',
              'properties': {},
              'geometry': {
                'type': 'LineString',
                'coordinates': route
              },
            'properties': {
              'marker-color': '#3bb2d0',
              'marker-size': 'large',
              'marker-symbol': 'rocket'
              }
            }
          });
          map.addLayer({
            'id': `route-${i}`,
            'type': 'line',
            'source': `route-${i}`,
            'layout': {
            'line-join': 'round',
            'line-cap': 'round'
            },
            'paint': {
            'line-color': '#f2a365',
            'line-width': 3,
            'line-opacity': 0.6
            }
          })
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
   // const activity = mapElement2.dataset.activity;
   // console.log(activity);
   // console.log(typeof(JSON.parse(activity)));

   if (mapElement2) {
     mapboxgl.accessToken = mapElement2.dataset.mapboxApiKey;
     const map2 = new mapboxgl.Map({
       container: 'map2',
       style: 'mapbox://styles/mapbox/streets-v10'
     });
     const markers = JSON.parse(mapElement2.dataset.markers);
     console.log(markers)

     addMarkersToMap(map2, markers)

     markers.forEach(function (marker, i) {
      console.log(marker)
      if (i>0) {
        let previous_marker = markers[i-1];
        if (marker.transport_type === 'Plane') {
          let steps = [previous_marker, marker]
          drawRouteLines(map2, steps, i);
        } else {
          let steps = [previous_marker, marker];
          drawRouteDriving(map2, steps, i);
        }
      }
    });


     // drawRouteDriving(map2, markers);
     if ((mapElement2.dataset.activity) !== "") {
          fitMapToMarkers(map2, markers);
        }

   }
};

export { initMapbox };
