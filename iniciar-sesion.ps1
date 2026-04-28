# --- CONFIGURACIÓN DE RUTAS PORTÁTILES (Antigravity Academy) ---
# Forzar UTF8 para evitar caracteres raros
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
# Detectamos automáticamente la letra de la unidad actual (D:, F:, etc.)
$Drive = "$($PSScriptRoot.Substring(0,2))"

# Definimos las rutas principales basadas en tus documentos
$GitPath = "$Drive\git\PortableGit"
$NodePath = "$Drive\YOUTUBE\Antigravity\nodejs"
$NpmGlobal = "$Drive\YOUTUBE\Antigravity\npm-global"
$ScriptsPath = "$Drive\Scripts"

# --- Agregados para el entorno Antigravity ---
$RubyPath = "$Drive\ruby\bin;$Drive\ruby\mingw64\bin"
$PsqlPath = "$Drive\postgres\pgsql\bin"
$RedisPath = "$Drive\redis"

# Actualizamos el PATH para la sesión actual
$env:Path = "$GitPath\cmd;$GitPath\bin;$GitPath\usr\bin;$GitPath\mingw64\bin;" +
            "$NodePath;" +
            "$NpmGlobal;" + 
            "$NpmGlobal\node_modules\.bin;" +
            "$RubyPath;" +
            "$PsqlPath;" +
            "$RedisPath;" +
            "$Drive\;" +
            "$ScriptsPath;" +
            $env:Path

# --- Variables de entorno de Ruby ---
$env:GEM_HOME = "$Drive\ruby\gems"
$env:GEM_PATH = "$Drive\ruby\gems"
$env:BUNDLE_PATH = "$Drive\ruby\gems"

# Configuración de NPM para que siempre use tu carpeta portátil
npm config set prefix "$NpmGlobal"

# Permitir ejecución de scripts en esta ventana
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process

# --- CONFIGURACIÓN DE ESTILO Y COLOR ---
# Importar módulos de apariencia si están instalados (Terminal-Icons)
if (Get-Module -ListAvailable Terminal-Icons) { Import-Module Terminal-Icons }

# Configurar PSReadLine para resaltado de sintaxis y autocompletado estilo "gris tenue"
if (Get-Module -ListAvailable PSReadLine) {
    Import-Module PSReadLine
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionViewStyle ListView
    Set-PSReadLineOption -Colors @{
        Command            = "#81a1c1"
        Parameter          = "#ebcb8b"
        Operator           = "#b48ead"
        Variable           = "#d8dee9"
        String             = "#a3be8c"
        Number             = "#b48ead"
        Error              = "#bf616a"
    }
}

# Personalizar el Prompt (🚀 Antigravity [ruta] >)
function prompt {
    $path = Get-Location
    Write-Host "`n🚀 Antigravity " -ForegroundColor Cyan -NoNewline
    Write-Host "[$path]" -ForegroundColor Yellow -NoNewline
    Write-Host " > " -ForegroundColor White -NoNewline
    return " "
}

# --- INICIO DE SESIÓN ---
Clear-Host
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "🚀 ANTIGRAVITY ACADEMY - ENTORNO PORTÁTIL ACTIVADO" -ForegroundColor Cyan -BackgroundColor Black
Write-Host "============================================================" -ForegroundColor Cyan

# Verificación de herramientas
Write-Host " Verificando herramientas en unidad $Drive :" -ForegroundColor Gray
try {
    Write-Host "   Ruby:   " -NoNewline -ForegroundColor White; ruby -v
    Write-Host "   Node:   " -NoNewline -ForegroundColor White; node --version
    Write-Host "   Git:    " -NoNewline -ForegroundColor White; git --version
    Write-Host "   Python: " -NoNewline -ForegroundColor White; python --version
    
    # Intentamos comprobar PostgreSQL silenciosamente
    $pgStatus = & pg_isready 2>&1
    if ($pgStatus -match "accepting connections") {
        Write-Host "   PSQL:   " -NoNewline -ForegroundColor White; Write-Host "En Línea ✅" -ForegroundColor Green
    } else {
        Write-Host "   PSQL:   " -NoNewline -ForegroundColor White; Write-Host "Detenido ❌ (Ejecuta: pg_ctl start -D `"$Drive\postgres\data`")" -ForegroundColor Yellow
    }
} catch {
    Write-Host "⚠️  Alguna herramienta no se encontró en las rutas predefinidas." -ForegroundColor Yellow
}

Write-Host "`n✅ ¡LISTO PARA TRABAJAR!" -ForegroundColor Green
Write-Host "Comandos útiles:" -ForegroundColor Green
Write-Host " - Arrancar DB: pg_ctl start -D `"$Drive\postgres\data`"" -ForegroundColor Cyan
Write-Host " - Detener DB : pg_ctl stop -D `"$Drive\postgres\data`"" -ForegroundColor Cyan
Write-Host " - Servidor   : rails s" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
