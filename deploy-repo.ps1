param(
    [Parameter(Mandatory = $False)]
    [string]$stackName = "ecs-blue-green-repository"
)

aws cloudformation deploy --template-file .\repository.yaml --stack-name $stackName