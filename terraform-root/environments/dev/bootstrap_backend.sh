#!/bin/bash
# ------------------------------
# Bootstrap Terraform backend
# ------------------------------

# Set variables
LOCATION="EastUS"
RESOURCE_GROUP="tfstate-rg"
STORAGE_ACCOUNT="devtfstate1280"
CONTAINER="tfstate"

# 1. Create Resource Group
echo "Creating Resource Group..."
az group create \
  --name "$RESOURCE_GROUP" \
  --location "$LOCATION"

# 2. Create Storage Account
echo "Creating Storage Account..."
az storage account create \
  --name "$STORAGE_ACCOUNT" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --kind StorageV2

# 3. Get Storage Account Key
ACCOUNT_KEY=$(az storage account keys list \
  --resource-group "$RESOURCE_GROUP" \
  --account-name "$STORAGE_ACCOUNT" \
  --query '[0].value' -o tsv)

# 4. Create Blob Container
echo "Creating Blob Container..."
az storage container create \
  --name "$CONTAINER" \
  --account-name "$STORAGE_ACCOUNT" \
  --account-key "$ACCOUNT_KEY"
