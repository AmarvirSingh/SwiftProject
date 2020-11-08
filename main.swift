import Foundation

var details = [Account]()
var m = methods()

// this is the predefined data of account of Current Type
var bankCurrent = """
1112,Amarvir Singh,Lakhnaur,9781355869,1000.0,Gill Traders
1111,Kevin Mathew,Toronto,8754986554,2000.0,Math Pharmacy
"""

// this the the predefined data of accounts of Salary type 
var bankSalary = """
1113,Pollard Button,Pembroke,7898655435,3000.0,But Store
1114,Jelly Christ,Brampton,8765982145,2500.0,Pro Computers
"""

//******************* calling these methods to fill the data about of predefined accounts in the array of objects ******************** 
m.readingCurrent()
m.readingSalary()

var menu = 0
repeat{
  print("\n")
print("*****MENU***** \n 1.Create Account \n 2.To do Transactions\n 0.exit\n")
menu = Int(readLine()!)!

switch(menu)
{
  case 1:
          print("****CREATE ACCOUNT****\n1.Current Account \n2.Salary Account \n ")
          let answer = Int(readLine()!)!
          switch answer 
          {
           case 1:
           m.createCurrent()
           
           case 2:
           m.createSalary()
           
           default:
           break

          }
  case 2: 
          print("****TO DO Transactions****\n1.Get Account Details \n2.Deposit Money\n3.Withdraw Money\n4.Transfer Money\n5.Pay Bills \nEnter your choice >>> ")
          let todo = Int(readLine()!)!
          switch todo 
          {
            case 1:
            let got = m.getAccountDetails()
            if got == -1
            {
              print ("No Account with this Account Number")
            }
            
            case 2:
            let deposite = m.depositMoney()
            if deposite != -1.0
            {
             print("Money Deposite Succesfully!\n Available Balance = ",deposite)
            }
            else 
            {
              print("Account not Found")
            }

            case 3:
            let answer = m.withdrawMoney()
            if answer != -1.0
            {
              print (" Money Withdrawed Succesfully! \n Available Balance = ",answer)
            }   
            else
            {
             print (" No Data Available")
            }

            case 4:
            
            let trans = m.transferMoney()
            if trans == -1.0
            {
              print ("Either  of the Account is not Present or insufficient Balance ")
            }
            else 
            {
              print (" Amount transfered !!!!!")
            }

            case 5 :
            print ("PAY BILLS...........\n1.electricity bill \n2.BroadBand Bill \n3.Water Bill \nEnter your choice ")
            let billanser = Int(readLine()!)!
            switch(billanser)
            {
              case 1:
                  let something =  m.billPayment()
                  if something != -1.0
                  {
                    print ("Bill Paid successfuly , And Available balance is \(something)")
                  }
                  else 
                  {
                    print ("Account not Found OR Balance is low!!!!!")
                  }
              case 2:
                    let something =  m.billPayment()
                  if something != -1.0
                  {
                    print ("Bill Paid successfuly , And Available balance is \(something)")
                  }
                  else 
                  {
                    print ("Account not Found OR Balance is low!!!!!")
                  }
              case 3:
                    let something =  m.billPayment()
                  if something != -1.0
                  {
                    print ("Bill Paid successfuly , And Available balance is \(something)")
                  }
                  else 
                  {
                    print ("Account not Found OR Balance is low!!!!!")
                  }
              default :
              print ("Enter a valid choice \t EXITING TO MAIN MENU........................ \n")       
            }
            default:
            print ("Enter A Valid choice \t EXITINg TO MAIN MENU.............\n")
          }

  default:
  print("Thank You For Using Our Application :)")
}
}while menu != 0
