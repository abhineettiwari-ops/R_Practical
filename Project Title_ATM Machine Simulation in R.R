--------------------------------------------------------------------------------
                    #Project Title: ATM Machine Simulation in R
--------------------------------------------------------------------------------

# ATM Machine - with bonus features


balance <- 10000
correct_pin <- "1234"
withdraw_count <- 0
max_withdrawals <- 3
daily_limit <- 20000
total_withdrawn <- 0

history <- c()

cat("--- ATM Machine ---\n")

attempts <- 0
pin_ok <- FALSE

while (attempts < 3) {
  cat("Enter PIN: ")
  pin <- readLines(con = stdin(), n = 1)
  if (pin == correct_pin) {
    pin_ok <- TRUE
    cat("PIN correct!\n")
    break
  } else {
    attempts <- attempts + 1
    cat("Wrong PIN.", 3 - attempts, "attempts left\n")
  }
}

if (pin_ok == FALSE) {
  
  cat("Card blocked. Too many wrong attempts.\n")
  
} else {
  
  keep_going <- TRUE
  
  while (keep_going == TRUE) {
    
    cat("\n====== MENU ======\n")
    cat("1. Check Balance\n")
    cat("2. Deposit\n")
    cat("3. Withdraw\n")
    cat("4. Transaction History\n")
    cat("5. Exit\n")
    cat("==================\n")
    cat("Enter your choice: ")
    
    ch <- readLines(con = stdin(), n = 1)
    
    if (ch == "1") {
      
      cat("Your current balance is:", balance, "\n")
      
    } else if (ch == "2") {
      
      cat("Enter deposit amount: ")
      dep <- readLines(con = stdin(), n = 1)
      dep <- as.numeric(dep)
      
      if (is.na(dep)) {
        cat("That is not a number!\n")
      } else if (dep <= 0) {
        cat("Amount must be more than 0\n")
      } else {
        balance <- balance + dep
        cat("Deposited:", dep, "\n")
        cat("Updated Balance:", balance, "\n")
        history <- c(history, paste("Deposited:", dep))
      }
      
    } else if (ch == "3") {
      
      if (withdraw_count >= max_withdrawals) {
        
        cat("Sorry, you have reached maximum withdrawal limit for today\n")
        
      } else {
        
        cat("Enter withdrawal amount: ")
        wd <- readLines(con = stdin(), n = 1)
        wd <- as.numeric(wd)
        
        if (is.na(wd)) {
          cat("Invalid input\n")
        } else if (wd <= 0) {
          cat("Enter amount greater than 0\n")
        } else if (wd > balance) {
          cat("Insufficient Balance\n")
        } else if ((total_withdrawn + wd) > daily_limit) {
          cat("Daily withdrawal limit will exceed. Limit is", daily_limit, "\n")
        } else {
          balance <- balance - wd
          withdraw_count <- withdraw_count + 1
          total_withdrawn <- total_withdrawn + wd
          cat("Withdrawal successful!\n")
          cat("Amount:", wd, "\n")
          cat("Balance left:", balance, "\n")
          cat("Withdrawals done today:", withdraw_count, "out of", max_withdrawals, "\n")
          history <- c(history, paste("Withdrawn:", wd))
        }
        
      }
      
    } else if (ch == "4") {
      
      if (length(history) == 0) {
        cat("No transactions yet\n")
      } else {
        cat("--- Transaction History ---\n")
        for (i in 1:length(history)) {
          cat(i, ".", history[i], "\n")
        }
      }
      
    } else if (ch == "5") {
      
      cat("\nThank you for using ATM. Goodbye!\n")
      keep_going <- FALSE
      
    } else {
      
      cat("Invalid option. Please enter 1 to 5\n")
      
    }
    
  }
  
}
