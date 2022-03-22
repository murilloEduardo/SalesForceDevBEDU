public class InventoryDataScheduler implements Schedulable{
    /*public void execute(SchedulableContext sc){
        QuotationHelperPW.ExternalLegacyConnection();
    }  */
   @future (callout = true)
      public static void ExternalLegacyConnection() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://64bjp0q5wg.execute-api.us-east-2.amazonaws.com/Implement/');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
        //Now that we have out JSON reponse, the next step is to DESERIALIZE it, we use this technic: Parsing.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String, Object> results2 = (Map<String, Object>) results.get('body');
            List<Object> listProducts = (List<Object>) results2.get('Inventory');
          //Pass the data registers to an empty List called "data"
            List<Map<String, Object>> data = new List<Map<String, Object>>();
            //Recolect all products
            for(Object item:listProducts){
                data.add((Map<String, Object>)item);
            }
            //Create a List to save the items
            List<Inventario__c> lstRestInv = new List<Inventario__c>();
            //From map to object
            for(Map<String, Object> key:data) {
                Inventario__c inv = new Inventario__c();
                integer pos = 0;
                  for(Object item:key.values()) {
                    if(pos == 0){
                        inv.Name = ''+item;
                    }else if(pos == 1){
                        inv.CodigoProd__c = ''+item;
                    }else if(pos == 2){
                        inv.Cantidad_dis__c = (Double) item;
                    }else if(pos == 3){
                        inv.Cantidad_apart__c = (Double) item;
                        //
                        pos = 0;
                        lstRestInv.add(inv);
                    }
                    pos++;
                }
            }
            update lstRestInv;
            System.debug('Productos leidos desde rest:'+lstRestInv);
            
          }
		}
    public void execute(SchedulableContext sc){
       ExternalLegacyConnection();
    }
}