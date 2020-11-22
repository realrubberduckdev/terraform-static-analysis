param (
    [switch]$CIRun
)
$resultFileFullPath = Join-Path (Get-Location).Path "tfsec-result.xml"
if ($CIRun) {
    docker run --rm -v "$(pwd):/src" liamg/tfsec /src --format JUnit | Out-File $resultFileFullPath
}
else {
    docker run --rm -it -v "$(pwd):/src" liamg/tfsec /src
}
Write-Host "Result written to $resultFileFullPath"