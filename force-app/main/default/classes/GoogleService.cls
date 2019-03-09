/* 
 * wrap and perform the HTTP request for all API's
 * parse the GET responses, don't parse the POST
 * individual API's can still get at the POST methods 
 * and parse their own responses
 */
public class GoogleService {

	public GoogleService(string serviceName ) { } 

 	/* 
	 * based on 
	 * http://code.google.com/apis/gdata/javadoc/com/google/gdata/client/GoogleService.html
	 */
	public void  makePostRequest( string url, string body) {
		getFeedMethod('POST',url, body, CONTENT_TYPE_ATOM);
		/* If the resulting body is large and we parse the result here, 
		 * there is a chance to hit the heap limit. 
		 * This can occur as the body returned nears 90K
		 */
	}
	
	public void  makePutRequest( string url, string body) {
		getFeedMethod('PUT',url, body, CONTENT_TYPE_ATOM);
	}	
	
	public void  makeDeleteRequest( string url ) {
		getFeedMethod('DELETE', url, '', CONTENT_TYPE_ATOM);
	}	
	
	public GoogleData getFeed( string feedURL ) {
		getFeedMethod('GET', feedURL, null, CONTENT_TYPE_URL);
		
		GoogleData result = new GoogleData( responseXml );
		
		try {  // this fails if the response is HTML, not XML
			if ( result.errors.size() > 0 ) { 
				System.debug( ' fatal error ');
				result.feed.dump();
			}	
		} catch (System.NullPointerException npe) { 
			// catch the case of response is HTML
			system.debug( feedURL + ' returned HTML'); 
			system.debug( response.getBody() );
		}
		
		return result;
	}
	
	// limits helper
	public boolean canCallout { get { return Limits.getCallouts() < limits.getLimitCallouts() ; }}

	/* 
	 *	main method to the REST interface 	 
	 */
	public HttpResponse getFeedMethod(	string method, string url, string bodyin,
												string contentType)  
	{ 	
	    HttpRequest req = new HttpRequest();   
		response = null;
			
		if ( ! canCallout ) return response;
		
	   	req.setEndpoint(url); 

	   	if ( this.gsessionid!=null ) {  // CalendarService wants this
	    	req.setEndpoint( 
	    		GoogleData.appendQueryArg( url, 	
	    			'gsessionid=' + this.gsessionid) );
	   	}

	   	if ( method.tolowerCase() =='delete' ) {
	   		req.setMethod('POST');
	   		req.setHeader('X-HTTP-Method-Override','DELETE');
	   			
	   	} else { 
	    	req.setMethod(method);
	   	} 
	   	
	   	if (this.slug != null ) { 
	   		req.setHeader('SLUG', this.slug );
	   	}
	   	
	 	req.setHeader('X-If-No-Redirect', '1' ); // needed since callouts don't redirect
	    
	    if (contentType != null) { 
	    	req.setHeader('content-type', contentType );
	    	if( debug > 1) { system.debug( contentType ); }
	    }
	    
		req.setHeader('Authorization','AuthSub token="' + this.AuthSubToken+'"');
	
		if (bodyin != null) { 
			if( debug > 1) { system.debug( bodyin ); }
			req.setBody(bodyin);
			//req.setCompressed(true); // still testing with this
		} else { 
			//	Accept-Encoding: compress, gzip
			req.setHeader('Accept-Encoding','compress, gzip');
		}
		
		system.debug( method );
		if ( method == 'POST' || method == 'PUT' ) { 
			if( debug > 1) { system.debug( 'Content-length '+string.valueof(bodyin.length())); }	
			req.setHeader('Content-length',string.valueof(bodyin.length()));	
		}
		
		try {
			System.debug('HttpRequest :' +req);
			Http http = new Http();
			response = http.send(req);
			System.debug('STATUS:'+ response.getStatusCode() );
			//if ( response.getBody() != null ) { System.debug('BODY SIZE:'+  response.getBody().length());}
			
			if ( response.getStatusCode() == 412 ) { // status if no gsession passed in
				this.gsessionid = response.getHeader('X-Redirect-Location').split('gsessionid=')[1];
				response = getFeedMethod( method, url, bodyin, contentType ); // call back again to respond to this redirect
			}
			
			// allow 201 Created as well, returned for upload or insert 	
			if (response.getStatusCode() != 200 || response.getStatusCode() != 200 ) { 
				System.debug('STATUS:'+ response.getStatus() );
				System.debug('STATUS_CODE:'+ response.getStatusCode() );
				System.debug('BODY: '+ response.getBody() );
			}else{
				if( debug > 0) {
				System.debug('------------------------BODY-------------------------------');
				System.debug( response.getBody() );
				System.debug('------------------------BODY-------------------------------');
				}
			}
			
		} catch( System.Exception e) {
			System.debug('Error sending request');
			System.debug('ERROR: '+ e);
		}
		return response;
	}

	/* who needs this?
	string getBody(HttpResponse res) { return (res == null? '<feed></feed>' : res.getBody()); 	}
	*/
	 
	public xmldom responseXml { get { return new xmldom( response.getBody() ); } } 
	public transient HttpResponse response { get; private set; } 
	public integer 	debug { get; set; } 	{ this.debug = 0; }
	public string slug { get; set; } 		// document uploader uses this
	public string gsessionid { get; set; } 	// calendar requires session info 
	public string AuthSubToken { get; set; }

	public static final String CONTENT_TYPE_URL = 'application/x-www-form-urlencoded';
	public static final String CONTENT_TYPE_ATOM = 'application/atom+xml';

	/* *****************************************
	 * helper static methods for describing sobjects and fields
	 */
	// helper for fetching salesforce object metadata (fields of named object) 
	public static Map<String, Schema.SObjectField> getFieldsMap(string objname) {
		Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
		Schema.SObjectType objDesc = gd.get(objname);
		Schema.DescribeSObjectResult odesc = objDesc.getDescribe();
		return odesc.fields.getMap();
	}
	public static Schema.SObjectType getSobjectToken(string objname) { 
		Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
		return gd.get(objname);			
	}
	
		
}