trigger QuotationHelperTrigger on Quote (After update) {

    if(Trigger.isUpdate){
    
        //Creating an object after update
        //Quote qt = Trigger.new[0]; <--------- Bad Practice.
        Quote qt = new Quote();
        for(Quote item: Trigger.new){
            qt = item;
        }

        QuotationHelper.updateQuoteLineItem(qt);

    }




}