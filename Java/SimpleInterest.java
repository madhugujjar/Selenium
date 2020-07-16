public class SimpleInterest{
       


	public static void main(String args[]){
              int principal=100000;
              int period=5;
              float rate=0.11f; 
              
              double interest=(principal*rate*period)/100;
              double amount= principal + interest;
              System.out.println("Simple Interest=  "+interest);
              System.out.println("Amount is "  +amount);

          }



}