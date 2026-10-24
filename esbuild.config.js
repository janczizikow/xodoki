// Bundles every top-level file in app/javascript into app/assets/builds,
// where Sprockets serves it. Usage: `yarn build` or `yarn build --watch`.
const esbuild = require("esbuild");
const fs = require("fs");
const path = require("path");

const watch = process.argv.includes("--watch");
const production = (process.env.RAILS_ENV || process.env.NODE_ENV) === "production";
const sourceDir = path.join(__dirname, "app", "javascript");

const entryPoints = fs
  .readdirSync(sourceDir)
  .filter((file) => file.endsWith(".js"))
  .map((file) => path.join(sourceDir, file));

const options = {
  entryPoints,
  bundle: true,
  sourcemap: true,
  minify: production,
  target: "es2017",
  outdir: path.join(__dirname, "app", "assets", "builds"),
  publicPath: "/assets",
  logLevel: "info",
  // The app has always used the slim build (no ajax/effects)
  alias: { jquery: "jquery/dist/jquery.slim.js" },
  inject: [path.join(sourceDir, "shims", "jquery.js")],
};

if (watch) {
  esbuild
    .context(options)
    .then((context) => context.watch())
    .catch(() => process.exit(1));
} else {
  esbuild.build(options).catch(() => process.exit(1));
}
