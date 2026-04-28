# NUEVA RUTA Git (F:\git\PortableGit)
$env:Path = "F:\git\PortableGit\cmd;F:\git\PortableGit\bin;F:\git\PortableGit\usr\bin;F:\git\PortableGit\mingw64\bin;" +
            "F:\YOUTUBE\Antigravity\nodejs;" +
            "F:\;F:\Scripts;" +
            $env:Path

# VERIFICAR TODO
Clear-Host
Write-Host "🚀 ANTIGRAVITY ACADEMY - GIT 2.53.0 ACTIVADO" -ForegroundColor Green
git --version
node --version
python --version
Write-Host "✅ ¡LISTO! Usa: npm run dev | git add . | git push" -ForegroundColor Green

# Definimos las rutas de OpenCode y NPM Global
$openCodePath = "F:\YOUTUBE\Antigravity\npm-global"

# Actualizamos el Path incluyendo las herramientas de Git y Node que ya tenías
$env:Path = "D:\git\PortableGit\cmd;D:\git\PortableGit\bin;D:\git\PortableGit\usr\bin;D:\git\PortableGit\mingw64\bin;" +
            "D:\YOUTUBE\Antigravity\nodejs;" +
            "D:\YOUTUBE\Antigravity\npm-global;" + 
            "D:\YOUTUBE\Antigravity\npm-global\node_modules\.bin;" +
            "D:\;D:\Scripts;" +
            $env:Path

# (Opcional) Configura NPM para que use esa carpeta siempre
npm config set prefix "F:\YOUTUBE\Antigravity\npm-global"
