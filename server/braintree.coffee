Braintree = Npm.require('braintree')
Fiber = Npm.require("fibers")
Future = Npm.require("fibers/future")

gateway = Braintree.connect(
  environment: Braintree.Environment.Sandbox
  merchantId: "your_merchant_id"
  publicKey: "your_public_key"
  privateKey: "your_private_key"
)
###
gateway.transaction.sale
  amount: "5.00"
  creditCard:
    number: "4111111111111111"
    expirationMonth: "05"
    expirationYear: "12"
, (err, result) ->
  throw err  if err
  if result.success
    console.log "Transaction ID: " + result.transaction.id
  else
    console.log result.message
  return
###
Meteor.methods
  #submit (sale, authorize)
  braintreeSubmit: (cardData, paymentData) ->
    fut = new Future()
    @unblock()
    gateway.transaction.sale
      amount:
      creditCart:
        number: "4111111111111111"
        expirationMonth: "05"
        expirationYear:
   
      
    fut.wait()