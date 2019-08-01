##################################################################################################
# rock-paper-scissors.ps1
# Teo Espero
# Cloud and Systems Administration (BS)
# Western Governors University
#
# The Rock, Paper, Scissors game challenges the player to outguess the computer by selecting
# superior moves each time a new round is played, based on the scoring rules outlined below:
# 
#        Player Move         Computer Move      Result
#        ---------------------------------------------------------
#        Rock                Rock               Tie
#        Rock                Scissors           Player Wins
#        Rock                Paper              Player Loses
#        Paper               Paper              Tie
#        Paper               Rock               Player Wins
#        Paper               Scissors           Player Loses
#        Scissors            Scissors           Tie
#        Scissors            Paper              Player Wins
#        Scissors            Rock               Player Loses
#
##################################################################################################

## declare our vars

$playGame = "True"                   # This variable controls game play
$number = 0                          # This variable stores the numeric version of the computer's move
$randomNo = New-Object System.Random # This variable stores a random object
$guess = 0                           # This variable stores the numeric version of the player's move
$playerMove = ""                     # This variable stores the string version of the player's move
$computerMove = ""                   # This variable stores the string version of the computer's move
$noPlayed = 0                        # This variable keeps track of the number of games played
$noWon = 0                           # This variable keeps track of the number of games won
$noLost = 0                          # This variable keeps track of the number of games lost
$noTied = 0                          # This variable keeps track of the number of games tied


## Display the game's opening screen
Clear-Host

Write-Host "`n`n`n`n`t`t`t     W E L C O M E   T O   T H E"
Write-Host "`n`n`n`t`tR O C K,   P A P E R,   S C I S S O R S   G A M E"
Write-Host "`n`n`n`t`t`t`t   By Teo Espero"
Write-Host "`n`n`n`n`n`n`n`n`n`nPress Enter to continue."


## Pause the game until the player presses the Enter key

Read-Host

## Loop until the player guesses the secret number
while ($playGame -ne "False") {
    ## Generate the game's random number (between 1 - 3)
    ## Value assignment: 1 = Rock, 2 = Paper and 3 = Scissors

    $number = $randomNo.Next(1, 4)

    ## Translate the computer's move to English
    if ($number -eq 1) {$computerMove = "Rock"}
    if ($number -eq 2) {$computerMove = "Paper"}
    if ($number -eq 3) {$computerMove = "Scissors"}

    ## Prompt the player to guess a number
    while ($guess -eq "") {

        Clear-Host 

        ## Display instructions
        Write-Host "`n`n"
        Write-Host " Enter one of the following options:`n"
        Write-Host " -----------------------------------`n"
        Write-Host " R = Rock"
        Write-Host " P = Paper"
        Write-Host " S = Scissors"
        Write-Host " G = Game Play Rules"
        Write-Host " Q = Quit`n"
        Write-Host " -----------------------------------`n`n`n`n`n`n`n`n`n`n"

        ## Collect the player's guess
        $guess = Read-Host " Make a move"

        break
    }

    ## Validate the player move

    if ($guess -eq "Q") { 
        ## Player has decided to quit playing

        Clear-Host 

        Write-Host "`n`n"
        Write-Host " Game over.`n`nThanks for playing Rock, Paper, Scissors.`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n"
        Write-host " Press Enter to view game stats and quit the game."

        Read-Host # Pause while the player reads the screen

        $playGame = "False" # Set variable to false indicating the game is over
        continue # Skip the remainder of the loop
    }
    elseif (($guess -ne "R") -and ($guess -ne "P") -and ($guess -ne "S")-and ($guess -ne "G")) {

        Clear-Host 

        Write-Host "`n`n`n Invalid input. Please try again."
        Read-Host # Pause while the player reads the screen
    
        $guess = "" # Clear out the player's previous guess
        continue # Skip the remainder of the loop
    }
    elseif ($guess -eq "G") { 
        ## Show player the rules of play

        Clear-Host 

        Write-Host "`tThe Rock, Paper, Scissors game challenges the player to outguess the computer by selecting"
        Write-Host "`tsuperior moves each time a new round is played, based on the scoring rules outlined below:`n"
        Write-Host "`t`tPlayer Move`t`tComputer Move`t`tResult"
        Write-Host "`t`t--------------------------------------------------------------"
        Write-Host "`t`tRock`t`t`tRock`t`t`tTie"
        Write-Host "`t`tRock`t`t`tScissors`t`tPlayer Wins"
        Write-Host "`t`tRock`t`t`tPaper`t`t`tPlayer Loses"
        Write-Host "`t`tPaper`t`t`tPaper`t`t`tTie"
        Write-Host "`t`tPaper`t`t`tRock`t`t`tPlayer Wins"
        Write-Host "`t`tPaper`t`t`tScissors`t`tPlayer Loses"
        Write-Host "`t`tScissors`t`tScissors`t`tTie"
        Write-Host "`t`tScissors`t`tPaper`t`t`tPlayer Wins"
        Write-Host "`t`tScissors`t`tRock`t`t`tPlayer Loses"
        Write-Host "`t`t--------------------------------------------------------------`n`n`n`n`n"

        Write-host "Press Enter to view game stats and return to the game."
        Read-Host # Pause while the player reads the screen

        $guess = "" # Clear out the player's previous guess
        continue # Skip the remainder of the loop
        
    }

    ## Translate the player's move to English
    if ($guess -eq "R") {$playerMove = "Rock"}
    if ($guess -eq "P") {$playerMove = "Paper"}
    if ($guess -eq "S") {$playerMove = "Scissors"}

    Clear-Host 

    ## show the moves made

    Write-Host " `n`n`n Results:`n"
    Write-Host " -----------------------------------`n"
    Write-Host " The computer picked: $computerMove`n"
    Write-Host " You picked: $playerMove`n"
    Write-Host " -----------------------------------`n`n"

    $noPlayed += 1 # Increment count by 1

    ## Pause the game until the player presses the Enter key

    switch ($computerMove)
    {
        "Rock" { #The computer picked rock
            if ($playerMove -eq "Rock") {
                $noTied += 1 #Increment count by 1
                Write-Host " You tie!"
            }
            if ($playerMove -eq "Paper") {
                $noWon += 1 #Increment count by 1
                Write-Host " You win!"
            }
            if ($playerMove -eq "Scissors") {
                $noLost += 1 #Increment count by 1
                Write-Host " You lose!"
            }
        }
        "Paper" { #The computer picked paper
            if ($playerMove -eq "Rock") {
                $noLost += 1 #Increment count by 1
                Write-Host " You lose!"
            }
            if ($playerMove -eq "Paper") {
                $noTied += 1 #Increment count by 1
                Write-Host " You tie!"
            }
            if ($playerMove -eq "Scissors") {
                $noWon += 1 #Increment count by 1
                Write-Host " You win!"
            }
        }
        "Scissors" { #The computer picked scissors
            if ($playerMove -eq "Rock") {
                $noWon += 1 #Increment count by 1
                Write-Host " You win!"
            }
            if ($playerMove -eq "Paper") {
                $noLost += 1 #Increment count by 1
                Write-Host " You lose!"
            }
            if ($playerMove -eq "Scissors") {
                $noTied += 1 #Increment count by 1
                Write-Host " You tie!"
            }
        }
    }

    ## Pause the game until the player presses the Enter key
    Read-Host

    ## Reset variables to prepare for a new round of play
    $number = 0           #Reset the computer's guess back to zero
    $guess = 0            #Reset the numeric version of the player's guess back to zero
    $playerMove = ""      #Reset the string version of the player's guess back to an empty string
    $computerMove = ""    #Reset the string version of the player's guess back to an empty string

    
    
}

Clear-Host

## Display the game statistics
    
Write-Host "`n`n`n Game Statistics`n"
Write-Host " -----------------------------------`n"
Write-Host "`n Number of games played: $noPlayed"
Write-Host "`n Number of games won: $noWon"
Write-Host "`n Number of games lost: $noLost"
Write-Host "`n Number of games tied: $noTied`n"
Write-Host " -----------------------------------"
Write-Host "`n`n`n`n`n`n`n Press Enter to continue."

## Pause the game until the player presses the Enter key
Read-Host

## Show credits 

Clear-Host

Write-Host "`n`n`n`n`n`n"
Write-Host "                                   Rock, Paper, Scissors Game`n"
Write-Host "             Copyright 2019 - Teo Espero, Cloud and Systems Administration (BS)`n"
Write-Host "                                   Western Governors University`n`n`n`n`n`n`n" 

## create a 3-second delay before returning the player to the command shell

Start-Sleep -Seconds 3

Clear-Host

##################################################################################################
## EOF 