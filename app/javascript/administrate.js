// Entry point bundled by esbuild (see esbuild.config.js) into app/assets/builds/administrate.js.

require("@rails/ujs").start();
// require("turbolinks").start();

// The next line you only need if you want ActiveStorage support
require("@rails/activestorage").start();

// The next line you only need if you need channels in administrate
// require("channels");

// The next two lines you only need if you want ActionText support
require("trix");
require("@rails/actiontext");

require("selectize");
require("./administrate/index");
