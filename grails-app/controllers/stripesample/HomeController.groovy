package stripesample

import grails.plugins.springsecurity.Secured

import com.stripe.Stripe

@Secured(['ROLE_USER'])
class HomeController {
    
    def index() { }
    
    def stripetest() {
        render Stripe.apiKey
    }
}
