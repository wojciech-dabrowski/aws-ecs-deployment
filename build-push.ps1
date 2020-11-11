param(
    [Parameter(Mandatory = $True)]
    [string]$imageTag,

    [Parameter(Mandatory = $True)]
    [string]$awsAccountId,

    [Parameter(Mandatory = $False)]
    [string]$repositoryName = "ecr-repository"
)

(Get-ECRLoginCommand).Password | docker login --username AWS --password-stdin "${awsAccountId}.dkr.ecr.eu-west-1.amazonaws.com"
docker build -t $repositoryName .
docker tag "${repositoryName}:latest" "${awsAccountId}.dkr.ecr.eu-west-1.amazonaws.com/${repositoryName}:${imageTag}"
docker push "${awsAccountId}.dkr.ecr.eu-west-1.amazonaws.com/${repositoryName}:${imageTag}"