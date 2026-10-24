// Entry point bundled by esbuild (see esbuild.config.js) into app/assets/builds/application.js.

import Rails from "@rails/ujs";
import * as ActiveStorage from "@rails/activestorage";

Rails.start();
ActiveStorage.start();

import "bootstrap";
import "lazysizes";

import { initMap } from "./utils/map";

$('a[data-toggle="tab"]').on("shown.bs.tab", function (e) {
  const activeTabContent = $(".tab-pane.active");
  const mapElement = activeTabContent.find(".js-map")[0];

  if (mapElement) {
    initMap(mapElement);
    mapElement.className = "";
  }
});
