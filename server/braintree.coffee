Braintree = Npm.require('braintree')
Fiber = Npm.require("fibers")
Future = Npm.require("fibers/future")

gateway = Braintree.connect(
  environment: Braintree.Environment.Sandbox
  merchantId: "your_merchant_id"
  publicKey: "your_public_key"
  privateKey: "your_private_key"
)

Meteor.methods

  braintreeSubmit: (cardData, amount) ->
    
    fut = new Future()
    @unblock()
    
    gateway.transaction.sale
      amount: amount
      creditCard:
        number: cardData.number
        expirationMonth: cardData.expirationMonth
        expirationYear: cardData.expirationYear
        cvv: cardData.cvv
      , (err, result) ->
        throw err if err
        if result.success
          console.log "Success. Transaction ID: " + result.transaction.id
        else
          console.log result.message
        return
   
      
    fut.wait()