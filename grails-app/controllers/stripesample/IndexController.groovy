package stripesample

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class IndexController {
	def springSecurityService

    def index() { 
		if (springSecurityService.isLoggedIn()) {
			redirect uri: SpringSecurityUtils.securityConfig.successHandler.defaultTargetUrl
		}
	}
}