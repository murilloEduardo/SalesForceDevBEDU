public class CreateChildRecords {
    
    @InvocableMethod(label='Create Contacts')
    public static void createContact(List<Id> accIds) {
        
        List<Contact> contIsToInsert = new List<Contact>();
     
        List<Account> accList = [SELECT id, Name, Number_of_Contacts__c FROM Account WHERE id= :accIds];
        
        for(Account acc : accList){
            
            if(acc.Number_of_Contacts__c != null){
                
                for (integer i = 1;i <= acc.Number_of_Contacts__c;i++){
                    
                    Contact con = new Contact();
                    con.LastName ='Invocable' + acc.Name +' '+i;
                    con.AccountId = acc.Id;
                    contIsToInsert.add(con);
                }
            }
        }
        if(!contIsToInsert.isEmpty()){
            insert contIsToInsert;
        }
    } 

}