import { LightningElement, wire } from 'lwc';
import accountmethod from '@salesforce/apex/accountHandlerClass.accountmethod'
export default class TestAccountData extends LightningElement {
    Accountsdata=[];
    @wire(Accountsmethod)
    datahandler({data,error}){
        if(data){
                this.Accountsdata=data;    
        }if(error){
            console.log(error)
        }
    }
}