Package.describe({
  summary: "Reaction Braintree - Braintree Payment Module for Reaction commerce"
});

Npm.depends({'braintree': '1.14.1'});

Package.on_use(function (api, where) {
  api.use([
    "templating",
    "coffeescript",
    "iron-router",
    "simple-schema",
    "autoform",
    "underscore-string-latest",
    "less",
    "reaction-core"
  ], ["client", "server"]);

  api.add_files("common/collections.coffee",["client","server"]);
  api.add_files([
    "client/register.coffee",
    "client/routing.coffee",

    "client/templates/braintree.html",
    "client/templates/braintree.coffee"
  ], ["client"]);
  
  api.export([
    "StripePackageSchema",
  ], ["client", "server"]);
  
});