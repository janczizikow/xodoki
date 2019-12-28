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

  // Add/remove kmls
  const addKMLButton = $(".js-add-kml");
  const KMLFieldsCount = $(".js-hike-kml").length;
  const generateKMLFieldsHTML = id => `
  <div class="mt-3 pb-3 border-bottom js-hike-kml">
    <div class="form-group string optional hike_kmls_name">
      <label class="form-control-label string optional" for="hike_kmls_attributes_${id}_name">Name</label>
      <input class="form-control string optional" type="text" name="hike[kmls_attributes][${id}][name]" id="hike_kmls_attributes_${id}_name">
    </div>
    <div class="form-group file required hike_kmls_file">
      <label class="file required" for="hike_kmls_attributes_${id}_file">
        File
        <abbr title="required">*</abbr>
      </label>
      <input class="form-control-file file required" type="file" name="hike[kmls_attributes][${id}][file]" id="hike_kmls_attributes_${id}_file">
    </div>
    <button class="btn btn-sm btn-danger js-remove-kml" type="button">Удалить Фаӣл</button>
  </div>
  `;
  const addKMLFields = () => {
    addKMLButton.before(generateKMLFieldsHTML(KMLFieldsCount));
  };
  const removeKMLFields = event => {
    const parent = $(event.target).parent();
    const idInputs = parent.find(".hike_kmls_id");
    if (idInputs.length) {
      const id = idInputs
        .first()
        .children()
        .attr("id")
        .match(/\d+/)[0];
      if (id) {
        const checkbox = $(`#hike_kmls_attributes_${id}__destroy`);
        if (checkbox) {
          checkbox.prop("checked", true);
        }
        parent.hide();
      } else {
        parent.remove();
      }
    } else {
      parent.remove();
    }
  };
  $("body").on("click", ".js-remove-kml", removeKMLFields);
  if (addKMLButton) {
    addKMLButton.on("click", addKMLFields);
  }
});
