modules = {
    application {
		dependsOn 'jquery'
        resource url:'js/application.js'
		resource url:'css/main.css'
    }

	login {
		resource url:'css/login.css'
	}
	
	errors {
	    resource url:'css/errors.css'
	}
}