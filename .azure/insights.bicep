@description('Provide a name for the application insights resource.')
param appInsightsName string = 'app-insights-${uniqueString(resourceGroup().id)}'

@description('Provide a location for the application insights resource.')
param location string = resourceGroup().location

@description('Provide the id for the log analytics workspace.')
param logAnalyticsId string

// App Insights
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsId
  }
}
