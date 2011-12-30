<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <r:require module="application"/>
    </head>
    <body>
        <h3>Checkout</h3>
        
        <stripe:script formName="payment-form"/>
        
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