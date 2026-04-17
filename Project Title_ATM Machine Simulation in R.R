--------------------------------------------------------------------------------
                    #Project Title: ATM Machine Simulation in R
--------------------------------------------------------------------------------

#By::- Abhineet Tiwari

balance <- 10000          # starting money in account
correct_pin <- "1234"     # correct PIN for login
withdraw_count <- 0       # how many times user has withdrawn money
max_withdrawals <- 3      # maximum withdrawals allowed
daily_limit <- 20000      # max total withdrawal allowed in one day
total_withdrawn <- 0      # total money withdrawn today

history <- c()            # empty list to store transaction history

cat("--- ATM Machine ---\n")   # display welcome message

attempts <- 0             # number of wrong PIN attempts
pin_ok <- FALSE           # flag to check if PIN is correct

# -------------------------------
# PIN CHECK LOOP
# -------------------------------
while (attempts < 3) {    # allow only 3 attempts
  
  cat("Enter PIN: ")
  pin <- readLines(con = stdin(), n = 1)   # take input from user
  
  if (pin == correct_pin) {    # check if PIN is correct
    pin_ok <- TRUE             # mark PIN as correct
    cat("PIN correct!\n")
    break                      # exit loop if correct
  } else {
    attempts <- attempts + 1   # increase wrong attempt count
    cat("Wrong PIN.", 3 - attempts, "attempts left\n")
  }
}

# if PIN is wrong after 3 attempts
if (pin_ok == FALSE) {
  
  cat("Card blocked. Too many wrong attempts.\n")
  
} else {
  
  keep_going <- TRUE   # control variable for menu loop
  
  # -------------------------------
  # MAIN MENU LOOP
  # -------------------------------
  while (keep_going == TRUE) {
    
    # display menu
    cat("\n====== MENU ======\n")
    cat("1. Check Balance\n")
    cat("2. Deposit\n")
    cat("3. Withdraw\n")
    cat("4. Transaction History\n")
    cat("5. Exit\n")
    cat("==================\n")
    
    cat("Enter your choice: ")
    ch <- readLines(con = stdin(), n = 1)   # user choice
    
    # -------------------------------
    # OPTION 1: CHECK BALANCE
    # -------------------------------
    if (ch == "1") {
      
      cat("Your current balance is:", balance, "\n")
      
    # -------------------------------
    # OPTION 2: DEPOSIT
    # -------------------------------
    } else if (ch == "2") {
      
      cat("Enter deposit amount: ")
      dep <- readLines(con = stdin(), n = 1)  # take input
      dep <- as.numeric(dep)                 # convert to number
      
      if (is.na(dep)) {                      # check if input is not number
        cat("That is not a number!\n")
        
      } else if (dep <= 0) {                 # check if amount is valid
        cat("Amount must be more than 0\n")
        
      } else {
        balance <- balance + dep             # add money to balance
        cat("Deposited:", dep, "\n")
        cat("Updated Balance:", balance, "\n")
        
        history <- c(history, paste("Deposited:", dep))  # store history
      }
      
    # -------------------------------
    # OPTION 3: WITHDRAW
    # -------------------------------
    } else if (ch == "3") {
      
      # check withdrawal count limit
      if (withdraw_count >= max_withdrawals) {
        
        cat("Sorry, you have reached maximum withdrawal limit for today\n")
        
      } else {
        
        cat("Enter withdrawal amount: ")
        wd <- readLines(con = stdin(), n = 1)  # input
        wd <- as.numeric(wd)                 # convert to number
        
        if (is.na(wd)) {                    # invalid input
          cat("Invalid input\n")
          
        } else if (wd <= 0) {               # negative or zero amount
          cat("Enter amount greater than 0\n")
          
        } else if (wd > balance) {          # not enough balance
          cat("Insufficient Balance\n")
          
        } else if ((total_withdrawn + wd) > daily_limit) {  # daily limit check
          cat("Daily withdrawal limit will exceed. Limit is", daily_limit, "\n")
          
        } else {
          balance <- balance - wd           # subtract money
          withdraw_count <- withdraw_count + 1   # increase withdrawal count
          total_withdrawn <- total_withdrawn + wd  # update total withdrawn
          
          cat("Withdrawal successful!\n")
          cat("Amount:", wd, "\n")
          cat("Balance left:", balance, "\n")
          cat("Withdrawals done today:", withdraw_count, "out of", max_withdrawals, "\n")
          
          history <- c(history, paste("Withdrawn:", wd))  # save history
        }
        
      }
      
    # -------------------------------
    # OPTION 4: TRANSACTION HISTORY
    # -------------------------------
    } else if (ch == "4") {
      
      if (length(history) == 0) {   # if no transactions
        cat("No transactions yet\n")
        
      } else {
        cat("--- Transaction History ---\n")
        
        for (i in 1:length(history)) {   # loop through history
          cat(i, ".", history[i], "\n")
        }
      }
      
    # -------------------------------
    # OPTION 5: EXIT
    # -------------------------------
    } else if (ch == "5") {
      
      cat("\nThank you for using ATM. Goodbye!\n")
      keep_going <- FALSE   # stop loop
      
    } else {
      
      cat("Invalid option. Please enter 1 to 5\n")  # wrong input
      
    }
    
  }
  
}
