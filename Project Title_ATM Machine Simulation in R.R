--------------------------------------------------------------------------------
                    #Project Title: ATM Machine Simulation in R
--------------------------------------------------------------------------------

# Set initial balance to simulate user's bank account
balance <- 10000

# Display welcome message to simulate ATM interface
cat("Welcome to ATM\n")

# Start infinite loop so ATM keeps running until user exits
while(TRUE){
  
  # Display menu options every time loop runs (continuous operation)
  cat("\n1. Check Balance\n")
  cat("2. Deposit Money\n")
  cat("3. Withdraw Money\n")
  cat("4. Exit\n")
  
  # Take user input and convert it to numeric (because readline gives text)
  choice <- as.numeric(readline("Enter your choice: "))
  
  # Check if input is invalid (non-numeric becomes NA)
  # We handle this to prevent program crash
  if(is.na(choice)){
    cat("Please enter a valid number\n")
    next   # Skip current loop iteration and go back to menu
  }
  
  # If user selects option 1 → show balance
  if(choice == 1){
    cat("Current Balance:", balance, "\n")
  }
  
  # If user selects option 2 → deposit money
  else if(choice == 2){
    
    # Take deposit amount from user
    amount <- as.numeric(readline("Enter amount: "))
    
    # Validate input:
    # - NA → invalid input
    # - <=0 → invalid amount (cannot deposit negative/zero)
    if(is.na(amount) || amount <= 0){
      cat("Invalid amount\n")
    } else {
      
      # Add amount to balance (core logic of deposit)
      balance <- balance + amount
      
      # Show success message and updated balance
      cat("Amount Deposited\n")
      cat("Updated Balance:", balance, "\n")
    }
  }
  
  # If user selects option 3 → withdraw money
  else if(choice == 3){
    
    # Take withdrawal amount
    amount <- as.numeric(readline("Enter amount: "))
    
    # Validate input (same logic as deposit)
    if(is.na(amount) || amount <= 0){
      cat("Invalid amount\n")
    }
    
    # Check if user has enough balance before withdrawing
    else if(amount > balance){
      cat("Insufficient Balance\n")
    }
    
    else{
      # Subtract amount from balance (withdraw logic)
      balance <- balance - amount
      
      # Show success message and remaining balance
      cat("Withdrawal Successful\n")
      cat("Remaining Balance:", balance, "\n")
    }
  }
  
  # If user selects option 4 → exit system
  else if(choice == 4){
    cat("Thank you!\n")
    
    # break stops the loop → program ends
    break
  }
  
  # If user enters any number other than 1–4
  else{
    cat("Invalid Choice\n")
  }
}