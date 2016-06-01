$oldResourceGroupName = ""
$newResourceGroupName = ""
$webAppName           = ""
$planName             = ""
$destSubscriptionId   = ""

<# Login #>
Login-AzureRmAccount

<# List all subscription (if needed) #>
Get-AzureRmSubscription

<# Select the correct subscription #>
Select-AzureRmSubscription $destSubscriptionId

<# Get WebApp #> 
$webapp = Get-AzureRmResource -ResourceGroupName $oldResourceGroupName -ResourceName $webAppName -ResourceType Microsoft.Web/sites 

<# Get ServicePlan #> 
$plan = Get-AzureRmResource -ResourceGroupName $oldResourceGroupName -ResourceName $planName -ResourceType Microsoft.Web/serverFarms

<# move resources to a new subscrption #> 
Move-AzureRmResource -DestinationResourceGroupName $newResourceGroupName -ResourceId ($webapp.ResourceId, $plan.ResourceId) -DestinationSubscriptionId $destSubscriptionId