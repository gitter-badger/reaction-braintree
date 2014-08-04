Template.braintree.helpers
  packageData: ->
    return ReactionCore.Collections.Packages.findOne({name:"reaction-braintree"})

AutoForm.hooks "braintree-update-form":
  onSuccess: (operation, result, template) ->
    Alerts.removeSeen()
    Alerts.add "Braintree settings saved.", "success"

  onError: (operation, error, template) ->
    Alerts.removeSeen()
    Alerts.add "Braintree settings update failed. " + error, "danger"