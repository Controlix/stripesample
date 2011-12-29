<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <r:require modules="application, stripe"/>
        <r:script disposition='head'>
            Stripe.setPublishableKey("${grailsApplication.config.grails.plugins.stripe.publishableKey}");
            
            function stripeResponseHandler(status, response) {
                if (response.error) {
                    // re-enable the submit button
                    $('.submit-button').removeAttr("disabled");
                    // show the errors on the form
                    $(".payment-errors").html(response.error.message);
                } else {
                    var form$ = $("#payment-form");
                    // token contains id, last4, and card type
                    var token = response['id'];
                    // insert the token into the form so it gets submitted to the server
                    form$.append("<input type='hidden' name='stripeToken' value='" + token + "' />");
                    // and submit
                    form$.get(0).submit();
                }
            }

            $(document).ready(function() {
                $("#payment-form").submit(function(event) {
                    // disable the submit button to prevent repeated clicks
                    $('.submit-button').attr("disabled", "disabled");
                    var chargeAmount = 1000; //amount you want to charge, in cents. 1000 = $10.00, 2000 = $20.00 ...
                    // createToken returns immediately - the supplied callback submits the form if there are no errors
                    Stripe.createToken({
                        number: $('.card-number').val(),
                        cvc: $('.card-cvc').val(),
                        exp_month: $('.card-expiry-month').val(),
                        exp_year: $('.card-expiry-year').val()
                    }, chargeAmount, stripeResponseHandler);
                    return false; // submit from callback
                });
            });

            if (window.location.protocol === 'file:') {
                alert("stripe.js does not work when included in pages served over file:// URLs.");
            }
        </r:script>
    </head>
    <body>
        <h3>Checkout</h3>
        
        <g:form action="charge" method="POST" name="payment-form">
            <div class="form-row">
                <label>Amount (USD)</label>
                <input type="text" size="20" autocomplete="off" id="amount" name="amount"/>
            </div>            
            <div class="form-row">
                <label>Card Number</label>
                <input type="text" size="20" autocomplete="off" class="card-number"/>
            </div>
            <div class="form-row">
                <label>CVC</label>
                <input type="text" size="4" autocomplete="off" class="card-cvc"/>
            </div>
            <div class="form-row">
                <label>Expiration (MM/YYYY)</label>
                <input type="text" size="2" class="card-expiry-month"/>
                <span> / </span>
                <input type="text" size="4" class="card-expiry-year"/>
            </div>
            <button type="submit" class="submit-button">Submit Payment</button>
        </g:form>
    </body>
</html>