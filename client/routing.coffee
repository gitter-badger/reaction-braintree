Router.map ->
  @route 'braintree',
    controller: ShopAdminController
    path: 'dashboard/settings/braintree',
    template: 'braintree'
    waitOn: ->
      PackagesHandle