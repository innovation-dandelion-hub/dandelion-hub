param actions array = ['Microsoft.Resources/subscriptions/resourceGroups/read']
param notActions array = []
param roleName string = 'Dandelion RG Reader'
param roleDescription string = 'Acceso de lectura a los grupos de recursos de Dandelion (las accions y los roles son personalizables)'

resource roleDef 'Microsoft.Authorization/roleDefinitions@2022-04-01' = {
  name: guid(roleName)
  properties: {
    roleName: roleName
    description: roleDescription
    type: 'customRole'
    permissions: [
      {
        actions: actions
        notActions: notActions
      }
    ]
    assignableScopes: [subscription().id] /*El Scope puede estar limitado solo al grupo de recursos, en este caso se asigna a la suscripción como demostración*/
  }
}
