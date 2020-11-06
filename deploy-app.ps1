param(
    [Parameter(Mandatory = $True)]
    [string]$imageTag,

    [Parameter(Mandatory = $True)]
    [string]$vpcId,

    [Parameter(Mandatory = $True)]
    [string]$subnetAId,

    [Parameter(Mandatory = $True)]
    [string]$subnetBId,

    [Parameter(Mandatory = $False)]
    [string]$stackName = "ecs-blue-green-app"
)

aws cloudformation deploy --template-file .\application.yaml --stack-name $stackName --parameter-overrides ImageTag=$imageTag Vpc=$vpcId SubnetA=$subnetAId SubnetB=$subnetBId --capabilities CAPABILITY_IAM