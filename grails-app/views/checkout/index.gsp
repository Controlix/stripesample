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
            
            <stripe:creditCardInputs cssClass="form-row"/>     

            <button type="submit" class="submit-button">Submit Payment</button>
        </g:form>
    </body>
</html>