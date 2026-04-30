# 🎨 DESIGN SYSTEM: 10 PLATAFORMAS CON IA (VIBE CODING)

Este documento define la identidad visual, la paleta de colores y los principios de UX/UI aplicados en el ecosistema de aplicaciones del maratón.

---

## 🌈 1. Paleta de Colores (Brand Palette)

El diseño utiliza una estética **Dark Premium** con acentos de alta energía (Neon).

### Colores Principales
| Elemento | Hex / CSS | Aplicación |
| :--- | :--- | :--- |
| **Primary (Neon)** | `#00ffa3` | **Restringido:** Solo CTAs principales, precios, estados LIVE y detalles de énfasis. |
| **Primary Dark** | `#00d689` | Hover states de elementos primarios. |
| **Danger / Alert** | `#facc15` | Etiquetas de "En construcción" o avisos importantes. |
| **Telegram Blue** | `#0088cc` | Botón flotante y accesos a comunidad. |

### Fondos y Superficies (Dark Mode - Default)
*   **Body Background:** `#050505` (Deep Black)
*   **Surface / Card:** `#0f0f0f` (Ligeramente elevado)
*   **Border Color:** `rgba(255, 255, 255, 0.05)` (Sutil para delimitar secciones)
*   **Grid Overlay:** `rgba(255, 255, 255, 0.02)` (Patrón de cuadrícula de 50px)

### Fondos y Superficies (Light Mode)
*   **Body Background:** `#ffffff`
*   **Surface / Card:** `#f9f9f9`
*   **Border Color:** `rgba(0, 0, 0, 0.08)`

---

## ✍️ 2. Tipografía y Estilo de Texto
*   **Fuente Principal:** `Outfit` (Google Fonts).
*   **Headings:** `font-black` (900) o `font-extrabold` (800) con `tracking-tighter`.
*   **Estilo "Vibe":** Uso de cursiva (`italic`) en nombres de marca para dar sensación de velocidad y dinamismo.
*   **Uppercase:** Se utiliza ampliamente en etiquetas (`labels`) y botones para una estética de "mando" y claridad.

---

## ✨ 3. Componentes y Efectos UX/UI

### Glassmorphism & Glow
*   **Glass Cards:** Fondos con `backdrop-blur(10px)` y bordes semi-transparentes.
*   **Neon Glow:** Sombras difusas (`box-shadow`) utilizando el color primario con baja opacidad (`rgba(0, 255, 163, 0.2)`).
*   **Ambient Background:** Gradientes radiales en las esquinas de la página para evitar que el fondo negro sea plano.

### Animaciones de Firma (Signature Animations)
*   **Marquee Stats:** Cinta infinita de estadísticas en movimiento horizontal.
*   **Radar Effect:** Animación circular expansiva en el botón flotante de Telegram.
*   **Float Bounce:** Movimiento vertical suave para elementos que deben captar la atención.
*   **Reveal on Scroll:** Las secciones aparecen con un fade-in y un desplazamiento hacia arriba al hacer scroll.
*   **Diagonal Separator:** Líneas de tensión visual (`linear-gradient`) para romper la cuadrícula entre secciones.
*   **Sticky CTA Bar:** Barra persistente al final de la página que aparece tras el scroll para facilitar la conversión.

---

## 🧩 4. Librerías de Interfaz
*   **Iconografía:** [Lucide Icons](https://lucide.dev/) (Líneas finas, modernas y escalables).
*   **Carousels:** [Swiper.js](https://swiperjs.com/) (Efecto `coverflow` para visualización de capturas de pantalla).
*   **Framework CSS:** Tailwind CSS (Utilizando configuraciones personalizadas para extender colores y animaciones).

---

## 💡 5. Principios de Diseño
1.  **High Contrast:** El color neon debe "saltar" sobre el fondo oscuro.
2.  **SaaS Premium:** Evitar colores genéricos (azul puro, rojo puro). Usar variantes curadas (HSL).
3.  **Visual Hierarchy:** Uso de bordes de neón solo en el "Nicho Actual" o el "CTA Principal" para guiar el ojo.
4.  **Micro-interacciones:** Cada botón o card debe tener una respuesta visual inmediata (scale, color change, glow).
5.  **Neon Restringido:** El neón es una herramienta de atención, no decorativa. No saturar la interfaz.
6.  **Prueba Social Visible:** Siempre mostrar indicadores de actividad (builders, apps live) en el Hero.

---
*Última actualización de diseño: 30 de Abril, 2026.*
