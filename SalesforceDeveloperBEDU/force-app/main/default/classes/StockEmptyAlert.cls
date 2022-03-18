//implements Database.Batchable<sObject>
public with sharing class StockEmptyAlert {
    // Postwork 05 - no se pudo implementar InvocableMethod
    // public Database.QueryLocator start(Database.BatchableContext bc){
    //     String query = 'SELECT Id, Name,Cantidad_apart__c, Cantidad_dis__c, CodigoProd__c FROM Inventario__c';
    //     return Database.getQueryLocator(query);
    // }

    // public static void execute(Database.BatchableContext bc, List<Inventario__c> invList){
    //     FeedItem post = new FeedItem();
    //     List<String> itemsunex = new List<String>();
    //     for (Inventario__c item : invList) {
    //         if(item.Cantidad_dis__c < 1){
    //             itemsunex.add(item.Name);
    //         }
    //     }
    //     post.Body = 'Existen productos en inventario sin existencia';

    //     // Hace 5 horas
    //     Datetime h5h = System.now().addHours(-5);

    //     List<FeedItem> fiList = [Select Id FROM FeedItem WHERE LastModifiedDate > :h5h];
    //     if (!(fiList.size()>0)) {
    //         insert post;
    //     }

    // }
    // public void finish(Database.BatchableContext bc){
    //     // execute any post-processing operations
    // }
    @InvocableMethod (Label = 'Create Post')
    public static void createPost(List<Inventario__c> invList){
        FeedItem post = new FeedItem();
            List<String> itemsunex = new List<String>();
            for (Inventario__c item : invList) {
                if(item.Cantidad_dis__c < 1){
                    itemsunex.add(item.Name);
                }
            }
            post.Body = 'Existen productos en inventario sin existencia';
            post.ParentId = invList[0].Id;
            // Hace 5 horas
            Datetime h5h = System.now().addHours(-5);
    
            List<FeedItem> fiList = [Select Id FROM FeedItem WHERE LastModifiedDate > :h5h];
            if (!(fiList.size()>0)) {
                insert post;
            }
    }
}