import { initMap } from "../utils/map";

$(document).ready(function() {
  const mapElements = $(".js-map");

  if (mapElements.length) {
    initMap(mapElements[0]);
    mapElements[0].className = "";
  }
});
