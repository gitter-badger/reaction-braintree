Router.map ->
  @route 'braintree',
    controller: ShopAdminController
    path: 'dashboard/settings/braintree',
    template: 'braintree'
    waitOn: ->
      PackagesHandle
  
  @route 'braintreetest',
    controller: ShopAdminController
    path: 'braintreetest',
    template: 'braintreetest'
    waitOn: ->
      PackagesHandle