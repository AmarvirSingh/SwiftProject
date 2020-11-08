class Account
{
var accountNumber:Int
var holderName:String
var holderAddress:String
var holderPhoneNumber:String
var initialBalance:Double

init (accountNumber:Int, holderName:String, holderAddress:String, holderPhoneNumber:String, initialBalance:Double)
{
  self.accountNumber=accountNumber
  self.holderName=holderName
  self.holderAddress=holderAddress
  self.holderPhoneNumber = holderPhoneNumber
  self.initialBalance=initialBalance
}

}