param (
    [Parameter(Mandatory=$true, ValueFromRemainingArguments)]
    [string[]]$Notebooks
)

foreach ($notebook in $Notebooks) {
    # Clear the output
    jupyter nbconvert --clear-output --inplace "$notebook"
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

    # Execute all cells
    jupyter nbconvert --to notebook --execute --inplace "$notebook"
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}