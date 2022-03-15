//Crear dos objetos con la clase QuotationHelper
public class QuotationHelper {
        public void initialConfig(){
            Account acc = new Account();
            acc.Name = 'Compumundo';
                INSERT acc;
            Account acc2 = new Account();
            acc2.Name = 'Compuworld';
            	INSERT acc2;
   }
    // Buscar todos los productos con un método//
                 
        public List<Inventario__c> productsInInventory(){
        List<Inventario__c> invActual = [SELECT Id, Name, Cantidad_Apart__c, Cantidad_dis__c, CodigoProd__c FROM Inventario__c];
                                            return invActual;
            }
   
    /*public void productsInInventory(){
        List<Inventario_c> invactual = [SELECT Id, Name, Codigo_Prodc, Cantidad_disc, Cantidad_apartc FROM Inventario_c];
        system.debug(invactual)
    }*/
    
    
    
        public Boolean confirmProductExistsByCode(String CodigoProducto){
            Boolean exist = false;

            List<Product2> productList = [SELECT ID FROM Product2 WHERE ExternalID = :CodigoProducto LIMIT 1];

            if(productList.size()>0){
                exist = true;
            }

        }
    
 }