ReactionCore.registerPackage
  name: "reaction-braintree"
  provides: ['paymentMethod']
  label: "Braintree"
  description: "Braintree Payment for Reaction Commerce"
  icon: "fa fa-globe"
  settingsRoute: "braintree"
  defaultSettings:
    merchant_id: ""
    public_key: ""
    private_key: ""
  hasWidget: false
  autoEnable: false
  priority: "2"
  shopPermissions: [
    {
      label: "Braintree Payments"
      permission: "dashboard/payments"
      group: "Shop Settings"
    }
  ]