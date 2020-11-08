import Foundation

class methods
{
var initialACC = 1114

func readingCurrent()
{
  let lines = bankCurrent.components(separatedBy: "\n")
  for line in lines 
  {
    let data = line.components(separatedBy: ",")
    let rc = current(accountNumber:Int(data[0])! , holderName:data[1], holderAddress:data[2], holderPhoneNumber:data[3] , initialBalance:Double(data[4])!, businessName:data[5])
    details.append(rc)
  }
}

func readingSalary()
{
  let lines = bankSalary.components(separatedBy: "\n")
  for line in lines 
  {
    let data = line.components(separatedBy: ",")
    let rs = salary(accountNumber:Int(data[0])! , holderName:data[1], holderAddress:data[2], holderPhoneNumber:data[3] , initialBalance:Double(data[4])!, companyName:data[5])
    details.append(rs)
  }
}


//**************** function just to return acount number with increment of 1 **************** 
func account()->Int
{
  initialACC += 1
  return initialACC

}


//******************this function craete current for the user**********************
func createCurrent()
{
  let A = account()
  print( "Your Account Number is = ", A)
  
  print("Enter your  Name = ")
  let n = readLine()!

  print("Enter your Permanent Address = ")
  let a = readLine()!
  
  print("Enter your Contact No. = ")
  let c = readLine()!
  
  print("Enter the Initial Balance = ")
  let b = Double(readLine()!)!

  print("Enter your Business  Name = ")
  let B = readLine()!

  let ca = current(accountNumber:A , holderName:n, holderAddress:a, holderPhoneNumber:c , initialBalance:b, businessName:B)
  details.append(ca)

  print (" Your Account has been created !!!! ")
}

//******************this function create Salary account for the user *******************************
func createSalary()
{
  let A = account()
  print( "Your Account Number is = ", A)
  
  print("Enter your  Name = ")
  let n = readLine()!

  print("Enter your Permanent Address = ")
  let a = readLine()!
  
  print("Enter your Contact No. = ")
  let c = readLine()!
  
  print("Enter the Initial Balance = ")
  let b = Double(readLine()!)!

  print("Enter your Company  Name = ")
  let B = readLine()!

  let sa = salary(accountNumber:A , holderName:n, holderAddress:a, holderPhoneNumber:c , initialBalance:b, companyName:B)
  details.append(sa)

  print (" Your Account has been created !!!! ")

}

//**************************this function get account details using accout number**************************************
func getAccountDetails()->Int
{
  print ("Enter your Account Number")
  let temp = Int(readLine()!)!
  for i in details 
   {
      if let salaryAccount = i as? salary {
      if salaryAccount.accountNumber == temp
      {        
         print("ACCOUNT NUMBER- \(salaryAccount.accountNumber),\nNAME- \(salaryAccount.holderName) \nADDRESS- \(salaryAccount.holderAddress)\nPhone Number- \(salaryAccount.holderPhoneNumber)\nBALANCE- \(salaryAccount.initialBalance) \nCOMPANY NAME- \(salaryAccount.companyName)")
         return 1
      } 
    }

    if let currentAccount = i as? current {
      if currentAccount.accountNumber == temp
      {        
         print(" ACCOUNT NUMBER- \(currentAccount.accountNumber),\n NAME- \(currentAccount.holderName) \n ADDRESS- \(currentAccount.holderAddress)\n Phone Number- \(currentAccount.holderPhoneNumber)\n BALANCE- \(currentAccount.initialBalance) \n BUSINESS NAME- \(currentAccount.businessName)")
         return 1
      } 
    }
}
return -1
}


//***************************** this function used to deposit money int the account it return deposited money if account is present or -1.0 if not*************************
func depositMoney()->Double
{
  print("Enter the Account Number = ")
  let temp = Int(readLine()!)!
  print("Enter the Depoist Money = ")
  let dep = Double(readLine()!)!

for i in details
{
   if let salaryAccount = i as? salary {
    if salaryAccount.accountNumber == temp
    {
     let jam = salaryAccount.initialBalance + dep
     salaryAccount.initialBalance = jam
     return jam
  }
}
 else if let currentAccount = i as? current {
    if currentAccount.accountNumber == temp
    {
     let jam = currentAccount.initialBalance + dep
     currentAccount.initialBalance = jam
     return jam
  }
}
}
return -1.0
}

//******************* this function withdraw money if account is presetn with suffiecient balance or return -1.0*************************
func withdrawMoney()->Double
{
  print("Enter the Account Number = ")
 let temp = Int(readLine()!)!
 print("Enter the Withdraw Money = ")
 let with = Double(readLine()!)!

 for i in details
{
   if let salaryAccount = i as? salary {
    if salaryAccount.accountNumber == temp && salaryAccount.initialBalance >= with // checks if account number is of salary Account present with enough balance 
    {
     let jam = salaryAccount.initialBalance - with
     salaryAccount.initialBalance = jam
     return jam
  }
}
 else if let currentAccount = i as? current {
    if currentAccount.accountNumber == temp && currentAccount.initialBalance >= with // checks if account number is of current Account present with enough balance
    {
     let jam = currentAccount.initialBalance - with
     currentAccount.initialBalance = jam
     return jam
  }
}
}
return -1.0
}

// ***************this function is used to transfer money from one account to another account **************************************

func transferMoney() ->Double
{
  print("Enter the Account Number From which You want to Transfer Money : ")
  let temp = Int(readLine()!)!
  print("Enter the Second Account Number")
  let temp1 = Int(readLine()!)!
  print("Enter the Transfer Money : ")
  let trans = Double(readLine()!)!

  
  for i in details
  {
    if let salaryAccount = i as? salary
    {
      if salaryAccount.accountNumber == temp && salaryAccount.initialBalance >= trans
      {
        salaryAccount.initialBalance -= trans
        //print ("available balance in Account1 = \(salaryAccount.initialBalance)")
        break
      }
      else if salaryAccount.accountNumber == temp1
      {
        salaryAccount.initialBalance += trans
        //print("available balance in second account is = \(salaryAccount.initialBalance)")
        return salaryAccount.initialBalance
        
      }
    }  
  for j in details
  {
    if let currentAccount = j as? current
    {
      if currentAccount.accountNumber == temp && currentAccount.initialBalance >= trans
      {
        currentAccount.initialBalance -= trans
        //print ("available balance in Account1 = \(currentAccount.initialBalance)")
        break
        
      }
      else if currentAccount.accountNumber == temp1
      {
        currentAccount.initialBalance += trans
        //print("available balance in second account is = \(currentAccount.initialBalance)")
        return currentAccount.initialBalance
        
      }
      }
    }
  }
return -1.0
}

// ************************* with this method this application can pay bill of everytype if balance is enough and account is present *******************************

func billPayment() ->Double
{
  print (" Enter the bill number : ")
  let bele = readLine()!
  print (" Enter the Account number : ")
  let aele = Int(readLine()!)!
  print (" Enter your Amount :")
  let amount = Double (readLine()!)!
      
  for i in details 
  {
    if let salaryAccount = i as? salary
    {
      if salaryAccount.accountNumber == aele && salaryAccount.initialBalance >= amount
     {
      salaryAccount.initialBalance -= amount
      return salaryAccount.initialBalance
    }
    }

    if let currentAccount = i as? current
    {if currentAccount.accountNumber == aele && currentAccount.initialBalance >= amount
    {
      currentAccount.initialBalance -= amount
      return currentAccount.initialBalance
    }
    }
  }
 return -1.0
}
