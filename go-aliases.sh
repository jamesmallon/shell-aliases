#!/bin/bash

# Author: Thiago Mallon <thiagomallon@gmail.com

# dirs
alias cgo="cd ~/go/src"

# shortcut to go's src folder
alias gos="cd ~/go/src"

#----------------------- BUILDING ------------------------
alias gobu="go build -v -o main"
alias gobur="go build -v -o main; ./main"
#-----------------------------------------------------------



#------------------------- TESTING ------------------------
# Native Golang testing resource
alias gotest"=go test -v -cover -bench . ./..." 
alias gotst"=go test -v -cover ./..."


#----------- Initiating ginkgo
alias gkob="ginkgo bootstrap"

#----------- Generating test file
alias gkoge="ginkgo generate"

#---------- Running tests
alias gkor="ginkgo -r -v"
#------------------------------------------------------------



# -----------------DEPENDENCIES MANAGEMENT------------------

#---------- Requesting local dependencies
alias depin="dep init -v"

#---------- Ensuring dependencies
alias desure="dep ensure -v"


