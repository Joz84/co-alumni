import GMaps from 'gmaps';

const styles = [
    {
        "featureType": "administrative",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "administrative.country",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "administrative.province",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "geometry",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "color": "#e3e3e3"
            }
        ]
    },
    {
        "featureType": "landscape.natural",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "all",
        "stylers": [
            {
                "color": "#cccccc"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit.line",
        "elementType": "geometry",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit.line",
        "elementType": "labels.text",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit.station.airport",
        "elementType": "geometry",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit.station.airport",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#FFFFFF"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    }
]


const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(mapElement.dataset.markers);
  // debugger;

  // const svg = '<svg width="400" height="110"><rect width="300" height="100" /></svg>';
  // const url = 'data:image/svg+xml;charset=UTF-8;base64,' + btoa(svg);

  const template = [
    '<?xml version="1.0" encoding="UTF-8"?>',
    '<svg width="75px" height="75px" viewBox="0 0 75 75" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">',
        '<!-- Generator: Sketch 3.6.1 (26313) - http://www.bohemiancoding.com/sketch -->',
        '<title>Group 4</title>',
        '<desc>Created with Sketch.</desc>',
        '<defs></defs>',
        '<g id="Welcome" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">',
        '<g id="Desktop-HD" transform="translate(-659.000000, -276.000000)">',
        '<g id="Group-3" transform="translate(-24.000000, -30.000000)">',
        '<g id="Group-4" transform="translate(683.000000, 306.000000)">',
        '<ellipse id="Oval-3" fill="{{ color }}" cx="37.5" cy="37.5" rx="37.5" ry="37.5"></ellipse>',
        '<text id="00" font-family="Arial-Black, Arial Black" font-size="19" font-weight="700" letter-spacing="-1.06346166" fill="#FFFFFF">',
        '<tspan x="10" y="42">{{ score }}</tspan>',
        '</text>',
        '</g>',
        '</g>',
        '</g>',
        '</g>',
    '</svg>'
  ].join('\n');

  markers.forEach((marker) => {
    let svg = template.replace('{{ score }}', marker.score)
      .replace('{{ color }}', marker.color);
    marker.icon = { url: 'data:image/svg+xml;charset=UTF-8,' + encodeURIComponent(svg), scaledSize: new google.maps.Size((marker.score / 2000 * 3), (marker.score / 2000 * 3)) };
  });

  map.addMarkers(markers);
  map.setCenter(25, 0);
  map.setZoom(2);

  map.addStyle({
    styles: styles,
    mapTypeId: 'map_style'
  });
  map.setStyle('map_style');

}

