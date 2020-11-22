$resultFileFullPath = Join-Path (Get-Location).Path $resultFile "tfsec-result.xml"
docker run --rm -v "$(pwd):/src" liamg/tfsec /src --format JUnit | Out-File $resultFileFullPath
Write-Host "Result written to $resultFileFullPath"