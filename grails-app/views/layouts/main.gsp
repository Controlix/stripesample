<!doctype html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title><g:layoutTitle default="Stripe Sample"/></title>
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<g:layoutHead/>
        <r:layoutResources />
	</head>
	<body>
		<sec:ifLoggedIn>
		Welcome <sec:username/> - <g:link controller='logout'>Log Out</g:link>
		</sec:ifLoggedIn>
		<sec:ifNotLoggedIn>
		<g:link controller='login' action='auth'>Login</g:link>
		</sec:ifNotLoggedIn>	
		<h1>Stripe Sample</h1>
		<g:layoutBody/>
        <r:layoutResources />
	</body>
</html>