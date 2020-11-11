param(
    [Parameter(Mandatory = $False)]
    [string]$stackName = "ecr-repository"
)

aws cloudformation deploy --template-file .\repository.yaml --stack-name $stackName