// Replaces webpack's ProvidePlugin: esbuild injects these exports wherever
// a bundled file references a free `$` or `jQuery` (see esbuild.config.js).
import jquery from "jquery";

export { jquery as $, jquery as jQuery };
