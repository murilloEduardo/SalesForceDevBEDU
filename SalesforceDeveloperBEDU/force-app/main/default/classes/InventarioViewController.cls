public class InventarioViewController {
    
    private final sObject parent;
    public String codigo {get;set;}
    public List<Inventario__c> listInv {get;set;}

    
    
    public InventarioViewController(ApexPages.StandardController controller){
        parent = controller.getRecord();
    }
    
    public void buscar(){
        String query = 'SELECT CodigoProd__c, Cantidad_dis__c, Cantidad_apart__c FROM Inventario__c WHERE CodigoProd__c = :codigo';
        listInv = Database.query(query);
    }
    
    public void limpiar(){
        listInv.clear();
    }

}