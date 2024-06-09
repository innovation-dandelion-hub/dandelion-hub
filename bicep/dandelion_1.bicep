param location string = resourceGroup().location // Ubicación predeterminada del grupo de recursos
// Parámetros Azure Machine Learning
param workspaceName string = 'amlWorkspace${uniqueString(resourceGroup().id)}'
param storageAccountName string = 'amlstorage${uniqueString(resourceGroup().id)}'
param keyVaultName string = 'amlkeyvault${uniqueString(resourceGroup().id)}'
param cosmosDbName string = 'amlcosmos${uniqueString(resourceGroup().id)}'
param appInsightsName string = 'amlappinsights${uniqueString(resourceGroup().id)}'
param containerRegistryName string = 'amlcontainerregistry${uniqueString(resourceGroup().id)}'
param aiSearchName string = 'amlsearch${uniqueString(resourceGroup().id)}'


// Cuenta de almacenamiento
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-04-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS' 
  }
  kind: 'StorageV2'
}

// Azure Cosmos DB
resource cosmosDb 'Microsoft.DocumentDB/databaseAccounts@2024-02-15-preview' = {
  name: cosmosDbName
  location: location
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [
      {
        locationName: location
        failoverPriority: 0
      }
    ]
  }
}

// Azure Data Factory
resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: 'adf${uniqueString(resourceGroup().id)}'
  location: location
  properties: {}
}

// Crear recursos que va a necesitar Azure Machine Learning

// Key Vault
resource keyVault 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: keyVaultName
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    accessPolicies: []
  }
}

// Application Insights
resource appInsights 'microsoft.insights/components@2020-02-02' = {
  name: appInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}

// Container Registry
resource containerRegistry 'Microsoft.ContainerRegistry/registries@2019-05-01' = {
  name: containerRegistryName
  location: location
  sku: {
    name: 'Basic'
  }
}

// Azure Machine Learning
resource amlWorkspace 'Microsoft.MachineLearningServices/workspaces@2023-10-01' = {
  name: workspaceName
  location: location
  identity: {
      type: 'SystemAssigned'
    }
  properties: {
    storageAccount: storageAccount.id
    keyVault: keyVault.id
    applicationInsights: appInsights.id
    containerRegistry: containerRegistry.id
  }
}

// Azure AI Search 
resource amlSearch 'Microsoft.Search/searchServices@2024-06-01-preview' = {
  name: aiSearchName
  location: location
  sku: {
     name: 'Free'
    }
 }
