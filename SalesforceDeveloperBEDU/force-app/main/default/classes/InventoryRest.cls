public class InventoryRest {

    public static void connectionRest(){

        Http http = new Http();
        HttpRequest Request = new HttpRequest();

        request.setEndpoint(endpoint);
        request.setMethod('GET');

        HttpResponse response = http.send(request);

        if (response.getStatusCode == 200) {

            Map<String,Object> resultado = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
            System.debug('Esto es lo que recibí: ', +resultado);
        }
        }


    }
