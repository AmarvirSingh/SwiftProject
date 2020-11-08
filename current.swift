class current:Account
{
var businessName:String = ""

init (accountNumber:Int , holderName:String, holderAddress:String, holderPhoneNumber:String, initialBalance:Double, businessName:String)
{
  super.init(accountNumber:accountNumber, holderName:holderName, holderAddress:holderAddress, holderPhoneNumber:holderPhoneNumber, initialBalance:initialBalance)
  self.businessName=businessName
}
}