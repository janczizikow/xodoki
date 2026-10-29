import { kml } from "@tmcw/togeojson";

const fitToData = (map, data) => {
  const bounds = new google.maps.LatLngBounds();
  data.forEach(feature => {
    feature.getGeometry().forEachLatLng(latLng => bounds.extend(latLng));
  });
  if (!bounds.isEmpty()) {
    map.fitBounds(bounds);
  }
};

// KmlLayer is no longer supported, so fetch the KML, convert it to GeoJSON
// in the browser and draw it with the Data layer.
const renderKml = async (map, src) => {
  const response = await fetch(src);
  if (!response.ok) {
    throw new Error(`Failed to load KML: ${response.status}`);
  }
  const doc = new DOMParser().parseFromString(
    await response.text(),
    "text/xml"
  );
  const geojson = kml(doc);

  map.data.addGeoJson(geojson);
  map.data.setStyle(feature => {
    const stroke = feature.getProperty("stroke");
    const fill = feature.getProperty("fill");
    return {
      strokeColor: stroke || "#ff0000",
      strokeWeight: feature.getProperty("stroke-width") || 3,
      strokeOpacity: feature.getProperty("stroke-opacity") || 1,
      fillColor: fill || "#ff0000",
      fillOpacity: feature.getProperty("fill-opacity") || 0.3,
      title: feature.getProperty("name")
    };
  });

  const infoWindow = new google.maps.InfoWindow();
  map.data.addListener("click", event => {
    const name = event.feature.getProperty("name");
    if (!name) return;
    const content = document.createElement("div");
    content.textContent = name;
    infoWindow.setContent(content);
    infoWindow.setPosition(event.latLng);
    infoWindow.open(map);
  });

  fitToData(map, map.data);
};

export const initMap = mapElement => {
  const map = new google.maps.Map(mapElement, {
    center: new google.maps.LatLng(55.7558, 37.6173),
    zoom: 8,
    mapTypeId: "terrain"
  });
  const src = mapElement.dataset.kml;
  if (src) {
    renderKml(map, src).catch(error => console.error(error));
  }
};
