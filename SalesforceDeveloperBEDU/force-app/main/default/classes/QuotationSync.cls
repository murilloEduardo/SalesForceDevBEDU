public interface QuotationSync {
    
        Boolean confirmProductExistsByCode(String productCode);


        double searchProductByCode(String productCode);
}