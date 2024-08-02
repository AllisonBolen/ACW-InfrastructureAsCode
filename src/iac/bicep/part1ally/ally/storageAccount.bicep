@minLength(3)
@allowed(['dev'
'prod'
'cert'])
param env string = 'dev'
param location string = resourceGroup().location
@minLength(3)
param storageAccountName string
@minLength(11)
@maxLength(11)
param uid string
var storageAccountNameFull = substring('${storageAccountName}${env}${uid}${uniqueString(resourceGroup().id)}', 0, 24)

resource storageaccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageAccountNameFull
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

output storageAccountName string = storageaccount.name
output storageAccountId string = storageaccount.id
output storageAccountLocation string = storageaccount.location
