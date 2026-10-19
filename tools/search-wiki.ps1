# search-wiki.ps1 — busca simples (acentuada, case-insensitive) no vault
# Uso: .\tools\search-wiki.ps1 -Term "palavra" [-Root caminho]
param(
    [Parameter(Mandatory = $true)][string]$Term,
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$files = Get-ChildItem -LiteralPath $Root -Recurse -Filter *.md -File |
    Where-Object { $_.FullName -notmatch '\\\.(obsidian|trash)\\' }

foreach ($file in $files) {
    $lineNo = 0
    foreach ($line in (Get-Content -LiteralPath $file.FullName -Encoding UTF8 -ErrorAction SilentlyContinue)) {
        $lineNo++
        if ($line.IndexOf($Term, [System.StringComparison]::OrdinalIgnoreCase) -ge 0) {
            "{0}:{1}: {2}" -f $file.FullName, $lineNo, $line
        }
    }
}
