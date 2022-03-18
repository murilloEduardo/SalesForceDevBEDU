public class AccountQueueableExample implements Queueable{

        public List<Account> accList ;

        public AccountQueueableExample(List<Account> accList){
            this.accList = accList;
        }

        public void execute(QueueableContext context){
            //Ejecuta nuestro Código
            for(Account acc : accList){
                acc.Name = acc.Name + 'Bedu';
            }
            update accList;
        }
}
