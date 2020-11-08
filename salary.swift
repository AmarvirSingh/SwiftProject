class salary:Account
{
 var companyName:String = ""

 init (accountNumber:Int, holderName:String, holderAddress:String, holderPhoneNumber:String, initialBalance:Double, companyName:String)
{
  super.init(accountNumber:accountNumber, holderName:holderName, holderAddress:holderAddress, holderPhoneNumber:holderPhoneNumber, initialBalance:initialBalance)
  self.companyName=companyName
}

}