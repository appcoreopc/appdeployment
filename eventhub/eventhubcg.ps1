function CreateConsumerGroupForTargetEventHub($targetRG, $targetEHNs, $targetEHName, $consumergroupName) 
{
    # Get ConsumerGroup #
    $ehcg = Get-AzureRmEventHubConsumerGroup -ResourceGroupName $targetRG -NamespaceName $targetEHNs -EventHubName $targetEHName -ConsumerGroupName $consumergroupName
    
    write-host $ehch
    
    # Create ConsumerGroup if one does not exist s
    if (!$ehcg) {
        
        Write-Host "Creating consumer group"

        $result = New-AzureRmEventHubConsumerGroup -ResourceGroupName $targetRG -NamespaceName $targetEHNs -EventHubName $targetEHName -ConsumerGroupName $consumergroupName
        
        Write-Debug $result
        Write-Host "Completed consumer group creation"
    }    
}

$functionAppIdentity = "mt9filevalidator"
CreateConsumerGroupForTargetEventHub("sbrgmt9filevalidator", "sbehnspmtmt9filevalidator", "ehpmtevtmt9validated", $functionAppIdentity)
