targetScope = 'subscription'

param rgName string
param location string

resource contactWebResourceGroup 'Microsoft.Resources/resourceGroups@2024-03-01' ={
  name: rgName
  location: location
}
