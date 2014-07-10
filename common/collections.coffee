@BraintreePackageSchema = new SimpleSchema([
  PackageConfigSchema
  {
    "settings.merchant_id":
      type: String
      label: "Merchant ID"
  
    "settings.public_key":
      type: String
      label: "Public Key"
  
    "settings.private_key":
      type: String
      label: "Private Key"
  }
])
BraintreePackageSchema = @BraintreePackageSchema

@BraintreePaymentSchema = new SimpleSchema
  payerName:
    type: String
    label: "Cardholder name",
    regEx: /^\w+\s\w+$/
  cardNumber:
    type: String
    min: 16
    label: "Card number"
  expireMonth:
    type: String
    max: 2
    label: "Expiration month"
  expireYear:
    type: String
    max: 4
    label: "Expiration year"
  cvv:
    type: String
    max: 4
    label: "CVV"

BraintreePaymentSchema = @BraintreePaymentSchema

BraintreePaymentSchema.messages
  "regEx payerName": "[label] must include both first and last name"

###
# Fixture - we always want a record
###
Meteor.startup ->
  unless Packages.findOne({name:"reaction-braintree"})
    Shops.find().forEach (shop) ->
      unless Meteor.settings.braintree
        Meteor.settings.braintree =
          mode: false
          client_id: ""
          client_secret: ""

      Packages.insert
        shopId: shop._id
        name: "reaction-braintree"
        settings: Meteor.settings.braintree