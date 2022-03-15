public with sharing class BatchApexExample  implements Database.Batchable<SObject>, Database.Stateful{
 
    public int contador = 0;

    global Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'SELECT id, Name FROM Account WHERE Name = "BEDU"';
        return Database.QueryLocator(query);
 }

    global void  execute(Database.BatchableContext BC, List<Accout> accList){

        List<Account> lst = new List<Account>();

        for(Account item: accList){
            iten.Name = 'Bedu';
            lst.add(item);
            contador++;
        }

        update lst;

    }
    global void finish(Database.BatchableContext BC){
        system.debug('Resultado contado: ', +contador);
    }
}