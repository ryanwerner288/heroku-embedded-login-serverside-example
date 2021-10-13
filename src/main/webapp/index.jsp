<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FIX, curated coffee components</title>

    <link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,600" type="text/css" rel="stylesheet">
    <link href="main.css" rel="stylesheet">
	
    <meta name="salesforce-community" content="https://<%= System.getenv("SALESFORCE_COMMUNITY_URL") %>">
    <meta name="salesforce-client-id" content="<%= System.getenv("SALESFORCE_CLIENT_ID") %>">
    <meta name="salesforce-redirect-uri" content="https://<%= System.getenv("SALESFORCE_HEROKUAPP_URL") %>/_callback">
    <meta name="salesforce-mode" content="<%= System.getenv("SALESFORCE_MODE") %>">
    <meta name="salesforce-server-callback" content="true">
    <meta name="salesforce-namespace" content="">
    <meta name="salesforce-target" content="#sign-in-link">
    <meta name="salesforce-save-access-token" content="true">
    <meta name="salesforce-forgot-password-enabled" content="<%= System.getenv("SALESFORCE_FORGOT_PASSWORD_ENABLED") %>">
    <meta name="salesforce-self-register-enabled" content="<%= System.getenv("SALESFORCE_SELF_REGISTER_ENABLED") %>">
    <meta name="salesforce-login-handler" content="onLogin">
    <meta name="salesforce-logout-handler" content="onLogout">
    <meta name="salesforce-mask-redirects" content="true">
	<link href="https://<%= System.getenv("SALESFORCE_COMMUNITY_URL") %>/servlet/servlet.loginwidgetcontroller?type=css" rel="stylesheet" type="text/css" />
    <script src="https://<%= System.getenv("SALESFORCE_COMMUNITY_URL") %>/servlet/servlet.loginwidgetcontroller?type=javascript_widget&min=false" async defer></script>
	  
	  
  </head>
  
  <body>
	  
	  <input class="sfid-button sfid-wide sfid-mb16" type="submit" id="sfid-submit" onclick="javascript:SFIDWidget.logout();SFIDWidget.cancel();" value="Log In"></input>
	  
  	<div id="sign-in-link" style="position: absolute; top: 40px;right: 40px;"></div>
	  <br/><br/>
	  <div id="cancel-logout" onclick="javascript:SFIDWidget.logout();SFIDWidget.cancel();">logout</div>
	  <br/><br/>
	<form action="https://salesdev9-salesportal.cs27.force.com/secur/frontdoor.jsp" method="POST" target="my_iframe">
		<input type="hidden" name="sid"
      value="<%= System.getenv("TOKEN") %>" />
		<input type="hidden" name="retURL" 
      value="<%= System.getenv("RETURL") %>" /> 
		<input type="submit" value="Do Stuff!">
	</form>
	<!-- when the form is submitted, the server response will appear in this iframe -->
	<iframe name="my_iframe" style="width:100%;height:800px;" src=""></iframe>
	
	
</body>
	
	<script>
		
	SFIDWidget.authenticate = function() {
		alert('hello');
	}
		
		authenticate = function() {
			alert('hello2');	
		}

	function onLogin(identity) {
		
		var targetDiv = document.querySelector(SFIDWidget.config.target);	
		var avatar = document.createElement('a'); 
	 	avatar.href = "javascript:showIdentityOverlay();";
		var img = document.createElement('img'); 
	 	img.src = identity.photos.thumbnail; 
		img.className = "sfid-avatar";	
		var username = document.createElement('span'); 
		username.innerHTML = identity.username;
		username.className = "sfid-avatar-name";	
		var iddiv = document.createElement('div'); 
	 	iddiv.id = "sfid-identity";		
		avatar.appendChild(img);
		avatar.appendChild(username);
		iddiv.appendChild(avatar);			
		targetDiv.innerHTML = '';
		targetDiv.appendChild(iddiv);			
	}
	
	
	function showIdentityOverlay() {
		var lightbox = document.createElement('div'); 
	 	lightbox.className = "sfid-lightbox";
	 	lightbox.id = "sfid-login-overlay";
		lightbox.setAttribute("onClick", "SFIDWidget.cancel();");	
		var wrapper = document.createElement('div'); 
	 	wrapper.id = "identity-wrapper";
		wrapper.onclick = function(event) {
		    event = event || window.event // cross-browser event
		    if (event.stopPropagation) {
		        // W3C standard variant
		        event.stopPropagation()
		    } else {
		        // IE variant
		        event.cancelBubble = true
		    }
		}		
		var content = document.createElement('div'); 
	 	content.id = "sfid-content";
		var community = document.createElement('a');
		var commURL = document.querySelector('meta[name="salesforce-community"]').content;
		community.href = commURL;
		community.innerHTML = "Go to the Community";
		community.setAttribute("style", "float:left");
		content.appendChild(community);
		var logout = document.createElement('a'); 
	 	logout.href = "javascript:SFIDWidget.logout();SFIDWidget.cancel();";
		logout.innerHTML = "logout";
		logout.setAttribute("style", "float:right");
		content.appendChild(logout);	
		var t = document.createElement('div'); 
	 	t.id = "sfid-token";
		t.className = "sfid-mb24";	
		var p = document.createElement('pre'); 
	 	p.innerHTML = JSON.stringify(SFIDWidget.openid_response, undefined, 2);
		t.appendChild(p);		
		content.appendChild(t);	
		wrapper.appendChild(content);
		lightbox.appendChild(wrapper);		
		document.body.appendChild(lightbox);			
	}
	
	
	function onLogout() {
		// reinit the SFIDWidget to be used again
		SFIDWidget.init();

	}


	</script>
	
  </body>
</html>
