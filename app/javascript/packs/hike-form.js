import getFilename from "../utils/getFilename";

$(document).ready(function() {
  // Image file input
  const removeImageCheckbox = $("#hike_remove_image");
  const removeImageButton = $("button[data-remove='hike_image']");
  const imageInput = $("#hike_image");
  const imageInputLablel = $(`label[for=${imageInput.attr("id")}]`);

  $(imageInput).on("change", function(e) {
    const filename = getFilename(e.target.value);
    $(imageInputLablel).text(filename);
    $(removeImageCheckbox).prop("checked", false);
  });

  $(removeImageButton).on("click", function() {
    $(imageInput).val("");
    // FIXME: figure out how to dynamically translate strings from yml files in JS
    $(imageInputLablel).text("Выберите фаӣл...");
    $(removeImageCheckbox).prop("checked", true);
  });

  // kml file input
  const removeKMLCheckbox = $("#hike_remove_kml");
  const removeKMLButton = $("button[data-remove='hike_kml']");
  const kmlInput = $("#hike_kml");
  const kmlInputLablel = $(`label[for=${kmlInput.attr("id")}]`);

  $(kmlInput).on("change", function(e) {
    const filename = getFilename(e.target.value);
    $(kmlInputLablel).text(filename);
    $(removeKMLCheckbox).prop("checked", false);
  });

  $(removeKMLButton).on("click", function() {
    $(kmlInput).val("");
    // FIXME: figure out how to dynamically translate strings from yml files in JS
    $(kmlInputLablel).text("Выберите фаӣл...");
    $(removeKMLCheckbox).prop("checked", true);
  });
});
