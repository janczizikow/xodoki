{
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = new google.maps.Map(mapElement, {
      center: new google.maps.LatLng(55.7558, 37.6173),
      zoom: 8,
      mapTypeId: 'terrain'
    });
    const src = mapElement.dataset.kml;
    if (src) {
      const kmlLayer = new google.maps.KmlLayer(src, {
        map
      });
      kmlLayer.setMap(map);
    }
  }
}
