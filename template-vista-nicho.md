# 🗂️ TEMPLATE: Vista de Nicho — Estructura Basada en Futorbita

Este documento define la estructura estándar que deben seguir todas las vistas de nicho del maratón (`[nicho].html`). Se basa en el análisis de `futorbita.html`, la primera vista de producto completa del ecosistema.

---

## 📁 Nombre del Archivo

```
[nombre-del-nicho].html
```

**Ejemplos:**
- `futorbita.html` ✅ (ya existe)
- `cripto.html`
- `tarot.html`
- `fitness.html`
- `ia-tools.html`

---

## 🧱 Estructura General de la Página

```
DOCTYPE html
└── <html lang="es" class="dark">
    ├── <head>
    │   ├── Meta tags (charset, viewport, title, description)
    │   ├── Tailwind CSS CDN
    │   ├── Google Fonts (Outfit + Space Mono + Syne)
    │   ├── Lucide Icons CDN
    │   ├── Swiper.js CSS + JS CDN
    │   ├── tailwind.config (colores: primary #00ffa3, font: Outfit)
    │   └── <style> CSS Custom (ver sección de estilos)
    │
    └── <body class="font-sans antialiased custom-scrollbar">
        ├── .grid-bg (fondo de cuadrícula fija)
        ├── <header> Navbar + Marquee Ticker
        ├── <main class="pt-32">
        │   ├── [1] Hero Section (2 columnas: texto + imagen)
        │   ├── .diagonal-separator
        │   ├── [2] Video Demo Section
        │   ├── [3] Visual Tour Explosivo (stacked images con modal)
        │   ├── [4] Benefits Showcase (grid 4 cards)
        │   ├── [5] ¿Cómo funciona por dentro? (Antigravity/IA Section)
        │   ├── [6] Swiper Gallery (capturas de pantalla)
        │   ├── [7] Roadmap CTA (link a roadmap.html)
        │   └── [8] Final CTA (precio + conversión)
        ├── <footer>
        └── Floating Telegram Button
```

---

## 📐 Secciones en Detalle

### [HEAD] Dependencias Obligatorias

```html
<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700;800&family=Space+Mono:wght@400;700&family=Syne:wght@400;600;700;800&display=swap" rel="stylesheet">

<!-- Lucide Icons -->
<script src="https://unpkg.com/lucide@latest"></script>

<!-- Swiper.js (para galería de capturas) -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
```

### [HEAD] Configuración Tailwind

```js
tailwind.config = {
    darkMode: 'class',
    theme: {
        extend: {
            colors: {
                primary: {
                    DEFAULT: '#00ffa3',  // << Color del nicho puede cambiar
                    dark: '#00d689',
                },
            },
            fontFamily: {
                sans: ['Outfit', 'sans-serif'],
            }
        }
    }
}
```

> **NOTA:** El color `primary` puede adaptarse al nicho. El neon verde `#00ffa3` es el default global. Cada nicho puede tener su propio acento definido como CSS variable `--accent`.

---

### [CSS] Variables y Estilos Base Obligatorios

```css
:root {
    --bg-color: #050505;
    --text-color: #ffffff;
    --card-bg: #0f0f0f;
    --border-color: rgba(255, 255, 255, 0.05);
    --grid-color: rgba(255, 255, 255, 0.02);
    --neon: #00ffa3;           /* << Color del nicho */
    --mono: 'Space Mono', monospace;
}

:root:not(.dark) {
    --bg-color: #ffffff;
    --text-color: #050505;
    --card-bg: #f9f9f9;
    --border-color: rgba(0, 0, 0, 0.08);
    --grid-color: rgba(0, 0, 0, 0.03);
}
```

**Clases de componente reutilizables (copiar tal cual):**
- `.grid-bg` — fondo cuadrícula fija
- `.glass-card` — card con blur y borde semitransparente
- `.diagonal-separator` — separador visual diagonal con neon
- `.custom-scrollbar` — scrollbar estilizada
- `.animate-float-bounce` — animación flotante suave
- `.radar-effect::before` — efecto radar para botón Telegram
- `.fade-in` / `.fade-in.visible` — reveal on scroll
- `.swiper` configs — galería coverflow

---

### [1] HERO SECTION

**Layout:** `grid lg:grid-cols-2 gap-12 items-center`

**Columna izquierda (texto):**
- Badge de contexto (pill animado) → ej. "Oportunidad de Oro: [Evento Clave del Nicho]"
- `<h1>` Headline principal: EN MAYÚSCULAS, font-black, tracking-tighter, con span en color primario
- Párrafo descriptivo en `text-gray-400 font-light`
- 3 badges de propuesta de valor (pill con ícono Lucide + texto)

**Columna derecha (imagen):**
- `<img>` del dashboard/hero del producto, con:
  - Glow blob detrás: `bg-primary/20 blur-[120px]`
  - Clase `rounded-2xl border border-white/5`
  - Hover: `group-hover:scale-[1.02]`

```html
<!-- PLACEHOLDER PERSONALIZABLE -->
<img src="[nicho]/[nombre-imagen-hero].png" alt="[Nicho] Dashboard" ...>
```

---

### [SEPARADOR] Diagonal Separator

```html
<div class="diagonal-separator mb-24"></div>
```

Se usa 1 vez, entre el Hero y el Video Demo, para romper la monotonía visual.

---

### [2] VIDEO DEMO SECTION

**Layout:** `grid lg:grid-cols-12 gap-8 items-center`

- **Col izquierda (4 cols):** glass-card con lista de 3 features del producto (icono + título en primary + descripción)
- **Col derecha (8 cols):** iframe de YouTube embebido dentro de `glass-card` con borde en primary y glow verde

```html
<!-- Sección de estado -->
<div class="inline-flex items-center gap-2 bg-primary/10 border border-primary/20 px-4 py-2 rounded-full mb-4">
    <div class="w-2 h-2 bg-primary rounded-full animate-pulse"></div>
    <span class="text-[10px] font-black uppercase tracking-widest text-primary">Estado: Avance del XX%</span>
</div>

<!-- Video -->
<iframe src="https://www.youtube.com/embed/[VIDEO_ID]?autoplay=0" ...></iframe>
```

---

### [3] VISUAL TOUR EXPLOSIVO (Stacked Images)

**Layout:** `flex flex-wrap justify-center gap-20`

- 2-3 imágenes grandes (`md:w-[45%]`) con efecto de **hover rotation** y capas de sombra pseudo-elementos
- 2-3 imágenes pequeñas (`md:w-[25-30%]`) con hover simple
- Cada imagen grande tiene un **floating badge** (pill rotado o normal) con label contextual
- Todas las imágenes abren un **image modal** con `onclick="openModal('[url]')"`

**Modal (único por página):**
```html
<div id="imageModal" class="fixed inset-0 z-[200] bg-black/95 backdrop-blur-xl hidden flex items-center justify-center p-6" onclick="closeModal()">
    <img id="modalImg" src="" alt="Full Preview" class="w-full rounded-2xl shadow-[0_0_100px_rgba(0,255,163,0.2)]">
</div>
```

---

### [4] BENEFITS SHOWCASE

**Título:** "Todo lo que necesitas para Dominar el Nicho"
**Layout:** `grid md:grid-cols-2 lg:grid-cols-4 gap-6`

Cada card (`glass-card p-8 rounded-3xl`) contiene:
- Icono emoji grande en contenedor `bg-primary/10 rounded-2xl`
- `<h3>` en uppercase tracking-tighter
- `<p>` descriptivo en `text-gray-500 font-light`
- Hover: `hover:border-primary/50`

> **Personalizar:** Los 4 beneficios deben ser específicos del nicho. Ej. Fútbol: Live Scores, SEO News, Comunidad, Monetizar.

---

### [5] CÓMO FUNCIONA POR DENTRO (Antigravity / IA Section)

**Layout:** Bloque contenedor `bg-white/5 border border-white/5 rounded-[3rem]` con `grid md:grid-cols-2`

- **Col izquierda:** H2 + párrafo + lista numerada (01, 02, 03) de pasos de automatización
- **Col derecha:** glass-card con imagen de un dashboard interno del sistema (grayscale → color en hover)
- Glow blob decorativo: `bg-primary/10 blur-[150px]`

> Esta sección es **genérica del stack Antigravity**. Los pasos siempre son: sincronización de datos → generación de contenido → auto-monitoreo.

---

### [6] SWIPER GALLERY (¿Qué verán tus usuarios?)

**Librería:** Swiper.js con efecto `coverflow`

```js
var swiper = new Swiper(".mySwiper", {
    effect: "coverflow",
    grabCursor: true,
    centeredSlides: true,
    slidesPerView: "auto",
    coverflowEffect: { rotate: 0, stretch: 0, depth: 100, modifier: 2, slideShadows: true },
    loop: true,
    pagination: { el: ".swiper-pagination", clickable: true },
    breakpoints: {
        640: { slidesPerView: 1 },
        768: { slidesPerView: 2 },
        1024: { slidesPerView: 3 }
    }
});
```

Cada slide: `glass-card rounded-[2rem]` con imagen + label descriptivo abajo.
**Mínimo 3 slides** (capturas reales del producto).

---

### [7] ROADMAP CTA

Bloque `glass-card p-12 rounded-[3rem] border-primary/20 text-center` con:
- H2: "¿Quieres ver el progreso de las demás apps?"
- Párrafo explicativo
- Botón: `href="roadmap.html"` con estilo primary neon

---

### [8] FINAL CTA (Conversión)

```html
<section class="max-w-5xl mx-auto px-6 mb-40 text-center">
    <h2><!-- Headline de urgencia en mayúsculas --></h2>
    <p><!-- Propuesta de valor final --></p>

    <!-- Monetización badge -->
    <div>AdSense · Afiliados · Membresías Premium · Patrocinios</div>

    <!-- CTAs -->
    <a href="https://ko-fi.com/s/694308f582" target="_blank">🔥 Quiero mi plataforma de [nicho] — $97</a>
    <a href="index.html">Ver otros nichos →</a>

    <!-- Garantía -->
    <p>Acceso completo · Código fuente · Sin mensualidades</p>
</section>
```

---

## 🦶 FOOTER

```html
<footer class="border-t border-white/5 py-16 bg-[#030303]">
    <div class="max-w-7xl mx-auto px-6 flex flex-col md:flex-row justify-between items-center gap-8">
        <div class="text-primary italic font-black text-sm tracking-tighter uppercase">[NOMBRE PRODUCTO PRO]</div>
        <div class="text-[10px] font-medium text-gray-600 uppercase tracking-widest">© 2026 Vibe Coding Marathon. Todos los derechos reservados.</div>
    </div>
</footer>
```

---

## 📌 ELEMENTOS GLOBALES FIJOS

### Navbar (idéntico en todas las vistas)
- Logo: `10 Plataformas con IA` → link a `index.html`
- Links: Plataformas (→ `index.html#plataformas`), Roadmap Full (→ `roadmap.html`), Precios (→ `index.html#precios`)
- Botón: `theme-toggle` (sun/moon) + `Acceso de por vida` (CTA → ko-fi)
- Marquee ticker debajo del nav con stats en tiempo real (duplicado para loop infinito)

### Floating Telegram Button
```html
<a href="https://t.me/IAcomunIA_Tienda_Web" target="_blank"
   class="fixed bottom-8 right-8 z-[100] bg-[#0088cc] text-white p-4 rounded-full ... radar-effect animate-float-bounce">
    <i data-lucide="send" class="w-6 h-6"></i>
</a>
```

---

## ⚙️ JAVASCRIPT OBLIGATORIO (al final del body)

```js
// 1. Inicializar iconos Lucide
lucide.createIcons();

// 2. Theme toggle (dark/light)
const themeToggleBtn = document.getElementById('theme-toggle');
themeToggleBtn.addEventListener('click', () => {
    document.documentElement.classList.toggle('dark');
    localStorage.setItem('theme', ...);
});

// 3. Swiper gallery (coverflow)
var swiper = new Swiper(".mySwiper", { ... });

// 4. Fade-in on scroll (IntersectionObserver para .fade-in)
const observer = new IntersectionObserver(...);
document.querySelectorAll('.fade-in').forEach(el => observer.observe(el));

// 5. Modal de imágenes (openModal / closeModal)
function openModal(src) { ... }
function closeModal() { ... }
```

---

## 🎨 PERSONALIZACIÓN POR NICHO

| Campo | Descripción | Ejemplo Fútbol |
|---|---|---|
| `--neon` / `primary` | Color de acento del nicho | `#00ffa3` (verde) |
| `[nicho]/` | Carpeta de imágenes del nicho | `futorbita/` |
| `<title>` | Título SEO de la página | `Futbol Órbita PRO - Plataforma con IA` |
| Badge Hero | Evento de oportunidad del nicho | `Oportunidad de Oro: Mundial 2026` |
| `<h1>` | Headline principal | `TU PROPIO SITIO DE FÚTBOL. LISTO PARA EL 2026.` |
| 3 pills Hero | Propuesta de valor | Genera Ingresos / Audiencia Fiel / Tráfico Orgánico |
| Video YouTube | ID del video demo | `11cwuDpzp1I` |
| 4 Benefits | Features clave del nicho | Live Scores / SEO News / Comunidad / Monetizar |
| Slides Swiper | Capturas reales (mín. 3) | `vista-dark-futorbita.png` |
| Final CTA texto | Urgencia + contexto del nicho | `EL MUNDIAL EMPIEZA PRONTO...` |
| Footer brand | Nombre del producto | `FOOTBALL ÓRBITA PRO` |

---

## 📂 Estructura de Carpeta de Imágenes

```
landing-10-maraton-web/
├── futorbita/
│   ├── vista-dark-futorbita.png       ← hero image
│   ├── activity_achievements_rbita.png
│   └── user_profile_settings_rbita.png
│
├── [nicho]/                            ← crear por cada nuevo nicho
│   ├── [nicho]-hero.png
│   ├── [nicho]-dashboard.png
│   └── [nicho]-feature-X.png
```

---

## ✅ Checklist para crear una nueva vista de nicho

- [ ] Copiar `futorbita.html` y renombrar a `[nicho].html`
- [ ] Actualizar `<title>` y `<meta name="description">`
- [ ] Cambiar color `--neon` / `primary` según paleta del nicho
- [ ] Crear carpeta `[nicho]/` con imágenes reales del producto
- [ ] Actualizar Hero: badge, h1, párrafo, 3 pills
- [ ] Actualizar Video Demo: ID de YouTube + % avance + 3 features
- [ ] Reemplazar imágenes del Visual Tour Explosivo
- [ ] Actualizar los 4 Benefits al contexto del nicho
- [ ] Adaptar pasos de la sección Antigravity/IA al nicho
- [ ] Subir mínimo 3 capturas para el Swiper
- [ ] Actualizar Final CTA: headline de urgencia + botón con nombre del nicho
- [ ] Actualizar Footer brand con nombre del producto
- [ ] Actualizar el link en `index.html` (niche-card del nicho) → `onclick="window.location.href='[nicho].html'"`

---

*Última actualización: 3 de Mayo, 2026. Basado en análisis de `futorbita.html` (780 líneas).*
