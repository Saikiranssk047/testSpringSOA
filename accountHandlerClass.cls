public class accountHandlerClass {
    public static list<account> accountmethod(){
        list<account> acclist = [select id, Name, Phone, Rating, Industry, AnnualRevenue from account order by createdDate DESC limit 10];
        return acclist;
    }
}