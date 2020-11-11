param(
    [Parameter(Mandatory = $True)]
    [string]$imageTag,

    [Parameter(Mandatory = $True)]
    [string]$vpcId,

    [Parameter(Mandatory = $True)]
    [string]$publicSubnetAId,

    [Parameter(Mandatory = $True)]
    [string]$publicSubnetBId,

    [Parameter(Mandatory = $True)]
    [string]$privateSubnetAId,

    [Parameter(Mandatory = $True)]
    [string]$privateSubnetBId,

    [Parameter(Mandatory = $False)]
    [string]$stackName = "ecs-blue-green-deploy"
)

aws cloudformation deploy --template-file .\application.yaml --stack-name $stackName `
    --parameter-overrides ImageTag=$imageTag `
                          Vpc=$vpcId `
                          PublicSubnetA=$publicSubnetAId `
                          PublicSubnetB=$publicSubnetBId PrivateSubnetA=$privateSubnetAId `
                          PrivateSubnetB=$privateSubnetBId `
    --capabilities CAPABILITY_IAM