global class FutureClass {

    @future
    public static void processContactRecord(){

        List<Account> accList = [SELECT id, Name FROM Account];

          //Ejecuta nuestro codigo
          for(Account acc : accList){
            acc.Name = acc.Name + 'Bedu';
          }

        update accList;

    }


}