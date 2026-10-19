$ErrorActionPreference = "Stop"
$vault = "C:\Users\gusta\OneDrive\Documentos\Obisidian\brain\llm-wiki"
$utf8 = New-Object System.Text.UTF8Encoding($false)
$entities = Join-Path $vault "wiki\entities"

$hub = Join-Path $entities "Entidade - Multi-Agent Systems Architect.md"

$concepts = Get-ChildItem -LiteralPath (Join-Path $vault "wiki\concepts") -Filter "*.md" -File | Sort-Object Name
$sources = Get-ChildItem -LiteralPath (Join-Path $vault "wiki\sources") -Filter "*.md" -File | Sort-Object Name
$repos = Get-ChildItem -LiteralPath $entities -Filter "Entidade - *.md" -File |
    Where-Object { $_.FullName -ne $hub } | Sort-Object Name
$skills = Get-ChildItem -LiteralPath $entities -Filter "Skill - *.md" -File | Sort-Object Name

$order = @()
$order += (Get-Item -LiteralPath $hub)
$order += $concepts
$order += $sources
$order += $repos
$order += $skills

"notas na corrente: $($order.Count)"

for ($i = 0; $i -lt $order.Count; $i++) {
    $file = $order[$i]
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)

    $content = [System.Text.RegularExpressions.Regex]::Replace($content, "(?s)\r?\n## Corrente\r?\n.*\z", "").TrimEnd()

    $block = "`n`n## Corrente`n"
    if ($i -gt 0) { $block += "- Anterior: [[$($order[$i-1].BaseName)]]`n" }
    if ($i -lt $order.Count - 1) { $block += "- Próxima: [[$($order[$i+1].BaseName)]]`n" }
    $block = $block.TrimEnd() + "`n"

    [System.IO.File]::WriteAllText($file.FullName, ($content + $block), $utf8)
}
"corrente aplicada de '$($order[0].BaseName)' ate '$($order[-1].BaseName)'"
