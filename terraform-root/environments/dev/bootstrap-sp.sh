#!/bin/bash
# Usage: ./bootstrap-sp.sh <SP_NAME> <SUBSCRIPTION_ID>

SP_NAME=$1
SUBSCRIPTION_ID=$2

# Login using your user account (once)
az login

# Set subscription
az account set --subscription $SUBSCRIPTION_ID

# Create Service Principal (Bootstrap SP)
BOOTSTRAP_SP=$(az ad sp create-for-rbac \
    --name "$SP_NAME" \
    --role Contributor \
    --scopes /subscriptions/$SUBSCRIPTION_ID \
    --sdk-auth \
    --query "{}" \
    -o json)

echo "Bootstrap SP created successfully!"
echo $BOOTSTRAP_SP

# Optionally save credentials to a secure file
echo $BOOTSTRAP_SP > bootstrap-sp.json
chmod 600 bootstrap-sp.json
