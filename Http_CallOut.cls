public class Http_CallOut {
    
    public void HttpCallOutMethod(){
     Http http = new Http();
     HttpRequest request = new HttpRequest();
     string url ='https://postman-echo.com/get?foo1=bar1&foo2=bar2';
     request.setEndpoint(url);
     request.setMethod('GET');
     httpresponse resonse = http.send(request);
     string responsestring = resonse.getBody();
     System.debug(resonse);
     system.debug(responsestring);
        
    }
}