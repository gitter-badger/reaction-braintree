Package.describe({
  summary: "Reaction Braintree - Braintree Payment Module for Reaction commerce"
});

Npm.depends({'braintree': '1.15.0'});

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
  api.add_files("server/braintree.coffee",["server"]);
  api.add_files([
    "client/register.coffee",
    "client/routing.coffee",

    "client/templates/braintree.html",
    "client/templates/braintree.coffee",
    "client/templates/braintreetest/braintreetest.html",
    "client/templates/braintreetest/braintreetest.coffee"
  ], ["client"]);
  
  api.export([
    "BraintreePackageSchema",
  ], ["client", "server"]);
  
});