const {
  Document, Packer, Paragraph, TextRun, Table, TableRow, TableCell,
  PageBreak, Header, Footer, PageNumber, NumberFormat,
  AlignmentType, HeadingLevel, WidthType, BorderStyle, ShadingType,
  PageOrientation, LevelFormat, TableOfContents, TableLayoutType, SectionType,
} = require("docx");
const fs = require("fs");

// ============================================================
// Design tokens – DS-1 Deep Sea (report / tech)
// ============================================================
const P = {
  bg: "0B1C2C",
  primary: "FFFFFF",
  accent: "529286",
  tableHeaderBg: "529286",
  tableHeaderText: "FFFFFF",
  tableAccentLine: "529286",
  tableInnerLine: "BECFCC",
  tableSurface: "E8ECEB",
  cover: {
    titleColor: "FFFFFF",
    subtitleColor: "B0B8C0",
    metaColor: "90989F",
    footerColor: "687078",
  },
};

const NB = { style: BorderStyle.NONE, size: 0, color: "FFFFFF" };
const noBorders = { top: NB, bottom: NB, left: NB, right: NB };
const allNoBorders = { top: NB, bottom: NB, left: NB, right: NB, insideHorizontal: NB, insideVertical: NB };

const PAGE_W = 11906;
const PAGE_H = 16838;

// ============================================================
// Title layout helpers (from design-system.md)
// ============================================================
function splitTitleLines(title, charsPerLine) {
  if (title.length <= charsPerLine) return [title];
  const breakAfter = new Set([
    ..." ，。、；：！？",
    ..."的与和及之在于为",
    ..."-_—–·/ ",
  ]);
  const lines = [];
  let remaining = title;
  while (remaining.length > charsPerLine) {
    let breakAt = -1;
    for (let i = charsPerLine; i >= Math.floor(charsPerLine * 0.6); i--) {
      if (i < remaining.length && breakAfter.has(remaining[i - 1])) {
        breakAt = i;
        break;
      }
    }
    if (breakAt === -1) {
      const limit = Math.min(remaining.length, Math.ceil(charsPerLine * 1.3));
      for (let i = charsPerLine + 1; i < limit; i++) {
        if (breakAfter.has(remaining[i - 1])) { breakAt = i; break; }
      }
    }
    if (breakAt === -1) {
      breakAt = charsPerLine;
      const prev = remaining[breakAt - 1];
      const next = remaining[breakAt];
      if (prev && next && !breakAfter.has(prev) && !breakAfter.has(next) && /[\u4e00-\u9fff]/.test(prev) && /[\u4e00-\u9fff]/.test(next)) {
        breakAt = breakAt - 1;
      }
    }
    lines.push(remaining.slice(0, breakAt).trim());
    remaining = remaining.slice(breakAt).trim();
  }
  if (remaining) lines.push(remaining);
  if (lines.length > 1 && lines[lines.length - 1].length <= 2) {
    const last = lines.pop();
    lines[lines.length - 1] += last;
  }
  return lines;
}

function calcTitleLayout(title, maxWidthTwips, preferredPt = 40, minPt = 24) {
  const charWidth = (pt) => pt * 20;
  const charsPerLine = (pt) => Math.floor(maxWidthTwips / charWidth(pt));
  let titlePt = preferredPt;
  let lines;
  while (titlePt >= minPt) {
    const cpl = charsPerLine(titlePt);
    if (cpl < 2) { titlePt -= 2; continue; }
    lines = splitTitleLines(title, cpl);
    if (lines.length <= 3) break;
    titlePt -= 2;
  }
  if (!lines || lines.length > 3) {
    const cpl = charsPerLine(minPt);
    lines = splitTitleLines(title, cpl);
    titlePt = minPt;
  }
  return { titlePt, titleLines: lines };
}

function calcCoverSpacing(params) {
  const {
    titleLineCount = 1, titlePt = 36, hasSubtitle = false,
    hasEnglishLabel = false, metaLineCount = 0,
    fixedHeight = 800, pageHeight = 16838,
    marginTop = 0, marginBottom = 0,
  } = params;
  const SAFETY = 1200;
  const usableHeight = pageHeight - marginTop - marginBottom - SAFETY;
  const titleHeight = titleLineCount * (titlePt * 23 + 200);
  const subtitleHeight = hasSubtitle ? (12 * 23 + 600) : 0;
  const englishLabelHeight = hasEnglishLabel ? (9 * 23 + 600) : 0;
  const metaHeight = metaLineCount * (10 * 23 + 100);
  const implicitParaHeight = 3 * 300;
  const contentHeight = titleHeight + subtitleHeight + englishLabelHeight + metaHeight + fixedHeight + implicitParaHeight;
  const remainingSpace = usableHeight - contentHeight;
  const safeRemaining = Math.max(remainingSpace, 400);
  const FOOTER_MIN = 800;
  const rawTop = Math.floor(safeRemaining * 0.45);
  const rawBottom = Math.floor(safeRemaining * 0.45);
  const bottomSpacing = Math.max(rawBottom, FOOTER_MIN);
  const topSpacing = Math.max(rawTop - Math.max(0, FOOTER_MIN - rawBottom), 400);
  const midSpacing = Math.max(safeRemaining - topSpacing - bottomSpacing, 0);
  return { topSpacing, midSpacing, bottomSpacing };
}

// ============================================================
// Cover builder R1 (from design-system.md)
// ============================================================
function buildCoverR1(config) {
  const palette = config.palette;
  const padL = 1200, padR = 800;
  const availableWidth = PAGE_W - padL - padR - 300;
  const { titlePt, titleLines } = calcTitleLayout(config.title, availableWidth, 40, 24);
  const titleSize = titlePt * 2;

  const spacing = calcCoverSpacing({
    titleLineCount: titleLines.length, titlePt,
    hasSubtitle: !!config.subtitle, hasEnglishLabel: !!config.englishLabel,
    metaLineCount: (config.metaLines || []).length,
    fixedHeight: 400,
  });

  const accentLeft = { style: BorderStyle.SINGLE, size: 8, color: palette.accent, space: 12 };
  const children = [];

  // 1. Top whitespace (dynamic)
  children.push(new Paragraph({ spacing: { before: spacing.topSpacing } }));

  // 2. English label with accent bottom border
  if (config.englishLabel) {
    children.push(new Paragraph({
      indent: { left: padL, right: padR }, spacing: { after: 500 },
      border: { bottom: { style: BorderStyle.SINGLE, size: 6, color: palette.accent, space: 8 } },
      children: [new TextRun({
        text: config.englishLabel.split("").join("  "),
        size: 18, color: palette.accent,
        font: { ascii: "Calibri", eastAsia: "SimHei" }, characterSpacing: 40,
      })],
    }));
  }

  // 3. Main title (dynamic font size + smart line breaks)
  for (let i = 0; i < titleLines.length; i++) {
    children.push(new Paragraph({
      indent: { left: padL },
      spacing: { after: i < titleLines.length - 1 ? 100 : 300, line: Math.ceil(titlePt * 23), lineRule: "atLeast" },
      children: [new TextRun({
        text: titleLines[i], size: titleSize, bold: true,
        color: palette.titleColor, font: { eastAsia: "SimHei", ascii: "Arial" },
      })],
    }));
  }

  // 4. Subtitle
  if (config.subtitle) {
    children.push(new Paragraph({
      indent: { left: padL }, spacing: { after: 800 },
      children: [new TextRun({
        text: config.subtitle, size: 24, color: palette.subtitleColor,
        font: { eastAsia: "Microsoft YaHei", ascii: "Arial" },
      })],
    }));
  }

  // 5. Meta info lines with left accent border
  for (const line of (config.metaLines || [])) {
    children.push(new Paragraph({
      indent: { left: padL + 200 }, spacing: { after: 80 },
      border: { left: accentLeft },
      children: [new TextRun({
        text: line, size: 24, color: palette.metaColor,
        font: { eastAsia: "Microsoft YaHei", ascii: "Arial" },
      })],
    }));
  }

  // 6. Bottom whitespace (dynamic)
  children.push(new Paragraph({ spacing: { before: spacing.bottomSpacing } }));

  // 7. Footer with top accent separator
  children.push(new Paragraph({
    indent: { left: padL, right: padR },
    border: { top: { style: BorderStyle.SINGLE, size: 2, color: palette.accent, space: 8 } },
    spacing: { before: 200 },
    children: [
      new TextRun({ text: config.footerLeft || "", size: 16, color: palette.footerColor, font: { ascii: "Arial" } }),
      new TextRun({ text: "                                        " }),
      new TextRun({ text: config.footerRight || "", size: 16, color: palette.footerColor, font: { ascii: "Arial" } }),
    ],
  }));

  return [new Table({
    width: { size: 100, type: WidthType.PERCENTAGE },
    layout: TableLayoutType.FIXED,
    borders: allNoBorders,
    rows: [new TableRow({
      height: { value: PAGE_H, rule: "exact" },
      children: [new TableCell({
        shading: { type: ShadingType.CLEAR, fill: palette.bg }, borders: noBorders,
        children,
      })],
    })],
  })];
}

// ============================================================
// Safe text helper
// ============================================================
function safeText(value, placeholder) {
  if (value === undefined || value === null || value === "" || String(value) === "NaN" || String(value) === "undefined") {
    return placeholder || "[Pendiente]";
  }
  return String(value);
}

// ============================================================
// Heading builders (Profile A – Formal)
// ============================================================
function heading1(text) {
  return new Paragraph({
    heading: HeadingLevel.HEADING_1,
    alignment: AlignmentType.CENTER,
    spacing: { before: 360, after: 160, line: 312 },
    children: [new TextRun({
      text: safeText(text),
      bold: true, size: 32, color: "000000",
      font: { eastAsia: "SimHei", ascii: "Times New Roman" },
    })],
  });
}

function heading2(text) {
  return new Paragraph({
    heading: HeadingLevel.HEADING_2,
    alignment: AlignmentType.LEFT,
    spacing: { before: 240, after: 120, line: 312 },
    children: [new TextRun({
      text: safeText(text),
      bold: true, size: 28, color: "000000",
      font: { eastAsia: "SimHei", ascii: "Times New Roman" },
    })],
  });
}

function heading3(text) {
  return new Paragraph({
    heading: HeadingLevel.HEADING_3,
    alignment: AlignmentType.LEFT,
    spacing: { before: 200, after: 100, line: 312 },
    children: [new TextRun({
      text: safeText(text),
      bold: true, size: 24, color: "000000",
      font: { eastAsia: "SimHei", ascii: "Times New Roman" },
    })],
  });
}

// ============================================================
// Body paragraph
// ============================================================
function bodyPara(text) {
  return new Paragraph({
    alignment: AlignmentType.JUSTIFIED,
    indent: { firstLine: 480 },
    spacing: { before: 0, after: 120, line: 312 },
    children: [new TextRun({
      text: safeText(text),
      size: 24, color: "000000",
      font: { eastAsia: "SimSun", ascii: "Times New Roman" },
    })],
  });
}

function emptyPara() {
  return new Paragraph({ spacing: { before: 0, after: 0, line: 312 }, children: [] });
}

// ============================================================
// Table builder – Horizontal-Only (Profile A)
// ============================================================
function buildTable(titleText, headers, rows) {
  const elements = [];
  if (titleText) {
    elements.push(new Paragraph({
      keepNext: true,
      spacing: { before: 240, after: 80 },
      children: [new TextRun({
        text: titleText, bold: true, size: 21, color: "000000",
        font: { eastAsia: "SimHei", ascii: "Times New Roman" },
      })],
    }));
  }
  elements.push(new Table({
    width: { size: 100, type: WidthType.PERCENTAGE },
    borders: {
      top: { style: BorderStyle.SINGLE, size: 2, color: P.tableAccentLine },
      bottom: { style: BorderStyle.SINGLE, size: 2, color: P.tableAccentLine },
      left: { style: BorderStyle.NONE },
      right: { style: BorderStyle.NONE },
      insideHorizontal: { style: BorderStyle.SINGLE, size: 1, color: P.tableInnerLine },
      insideVertical: { style: BorderStyle.NONE },
    },
    rows: [
      new TableRow({
        tableHeader: true, cantSplit: true,
        children: headers.map((h) => new TableCell({
          width: { size: 100 / headers.length, type: WidthType.PERCENTAGE },
          shading: { type: ShadingType.CLEAR, fill: P.tableHeaderBg },
          margins: { top: 60, bottom: 60, left: 120, right: 120 },
          children: [new Paragraph({ children: [new TextRun({
            text: h, bold: true, size: 21, color: P.tableHeaderText,
            font: { eastAsia: "SimHei", ascii: "Times New Roman" },
          })] })],
        })),
      }),
      ...rows.map((row) => new TableRow({
        cantSplit: true,
        children: row.map((cell) => new TableCell({
          width: { size: 100 / headers.length, type: WidthType.PERCENTAGE },
          margins: { top: 60, bottom: 60, left: 120, right: 120 },
          children: [new Paragraph({ children: [new TextRun({
            text: cell, size: 21, color: "000000",
            font: { eastAsia: "SimSun", ascii: "Times New Roman" },
          })] })],
        })),
      })),
    ],
  }));
  return elements;
}

// ============================================================
// Document assembly
// ============================================================
const pgSize = { width: PAGE_W, height: PAGE_H, orientation: PageOrientation.PORTRAIT };

const doc = new Document({
  styles: {
    default: {
      document: {
        run: {
          font: { ascii: "Times New Roman", eastAsia: "SimSun" },
          size: 24,
          color: "000000",
        },
        paragraph: { spacing: { line: 312 } },
      },
      heading1: {
        run: {
          font: { ascii: "Times New Roman", eastAsia: "SimHei" },
          size: 32,
          bold: true,
          color: "000000",
        },
        paragraph: { spacing: { before: 360, after: 160, line: 312 } },
      },
      heading2: {
        run: {
          font: { ascii: "Times New Roman", eastAsia: "SimHei" },
          size: 28,
          bold: true,
          color: "000000",
        },
        paragraph: { spacing: { before: 240, after: 120, line: 312 } },
      },
      heading3: {
        run: {
          font: { ascii: "Times New Roman", eastAsia: "SimHei" },
          size: 24,
          bold: true,
          color: "000000",
        },
        paragraph: { spacing: { before: 200, after: 100, line: 312 } },
      },
    },
  },
  numbering: {
    config: [
      {
        reference: "list-bullet",
        levels: [{
          level: 0,
          format: LevelFormat.BULLET,
          text: "\u2022",
          alignment: AlignmentType.LEFT,
          style: { paragraph: { indent: { left: 720, hanging: 360 } } },
        }],
      },
    ],
  },
  sections: [
    // ===== SECTION 1: COVER =====
    {
      properties: {
        page: {
          size: pgSize,
          margin: { top: 0, bottom: 0, left: 0, right: 0 },
        },
      },
      children: buildCoverR1({
        title: "Guía de Uso — MotorSocial",
        subtitle: "Documentación de análisis y diseño",
        englishLabel: "MOTORSOCIAL",
        metaLines: [
          "MotorSocial — Proyecto",
          "Fecha: 2026-08-21",
          "Basado en: _documentacion/_analisisydiseno",
        ],
        footerLeft: "MotorSocial",
        footerRight: "Guía de Uso",
        palette: P,
      }),
    },

    // ===== SECTION 2: FRONT MATTER (TOC) – Roman numerals =====
    {
      properties: {
        type: SectionType.NEXT_PAGE,
        page: {
          size: pgSize,
          margin: { top: 1440, bottom: 1440, left: 1701, right: 1417 },
          pageNumbers: { start: 1, formatType: NumberFormat.UPPER_ROMAN },
        },
      },
      footers: {
        default: new Footer({
          children: [
            new Paragraph({
              alignment: AlignmentType.CENTER,
              children: [new TextRun({
                children: [PageNumber.CURRENT],
                size: 18,
                color: "808080",
                font: { ascii: "Times New Roman", eastAsia: "SimSun" },
              })],
            }),
          ],
        }),
      },
      children: [
        new Paragraph({
          alignment: AlignmentType.CENTER,
          spacing: { before: 480, after: 360 },
          children: [new TextRun({
            text: "Índice",
            bold: true, size: 32,
            font: { eastAsia: "SimHei", ascii: "Times New Roman" },
            color: "000000",
          })],
        }),
        new TableOfContents("Table of Contents", {
          hyperlink: true,
          headingStyleRange: "1-3",
        }),
        new Paragraph({
          spacing: { before: 200 },
          children: [new TextRun({
            text: "Nota: este índice se genera mediante códigos de campo. Para asegurar que los números de página sean correctos tras editar el documento, haga clic derecho en el índice y seleccione \"Actualizar campo\".",
            italics: true, size: 18, color: "888888",
            font: { eastAsia: "SimSun", ascii: "Times New Roman" },
          })],
        }),
        new Paragraph({ children: [new PageBreak()] }),
      ],
    },

    // ===== SECTION 3: BODY – Arabic numerals =====
    {
      properties: {
        type: SectionType.NEXT_PAGE,
        page: {
          size: pgSize,
          margin: { top: 1440, bottom: 1440, left: 1701, right: 1417 },
          pageNumbers: { start: 1, formatType: NumberFormat.DECIMAL },
        },
      },
      headers: {
        default: new Header({
          children: [
            new Paragraph({
              alignment: AlignmentType.CENTER,
              children: [new TextRun({
                text: "Guía de Uso — MotorSocial",
                size: 18,
                color: "808080",
                font: { ascii: "Times New Roman", eastAsia: "SimSun" },
              })],
            }),
          ],
        }),
      },
      footers: {
        default: new Footer({
          children: [
            new Paragraph({
              alignment: AlignmentType.CENTER,
              children: [new TextRun({
                children: [PageNumber.CURRENT],
                size: 18,
                color: "808080",
                font: { ascii: "Times New Roman", eastAsia: "SimSun" },
              })],
            }),
          ],
        }),
      },
      children: [
        // ------------------------------------------------
        // 1. ¿Qué es MotorSocial?
        // ------------------------------------------------
        heading1("1. ¿Qué es MotorSocial?"),
        bodyPara("MotorSocial es una aplicación social y comercial diseñada como un motor de red reutilizable que combina tres capacidades principales:"),
        bodyPara("Dinámica social: feed, conversaciones, reacciones, contactos y grupos. Catálogo de productos y servicios con búsqueda y segmentación. Geolocalización para contextualizar experiencias por proximidad."),
        bodyPara("Aunque la arquitectura permite desplegar redes sociales verticales (vecinales, profesionales, empresariales), la instancia actual de MotorSocial aplica este motor al registro de calorías y alimentación, integrando el descubrimiento de alimentos y servicios de nutrición con una capa social y de ubicación."),

        // ------------------------------------------------
        // 2. Objetivos del Proyecto (OKRs)
        // ------------------------------------------------
        heading1("2. Objetivos del Proyecto (OKRs)"),
        bodyPara("El proyecto se sustenta en cuatro Resultados Clave que orientan el desarrollo de cada módulo:"),
        ...buildTable("Tabla 1. Resultados clave del proyecto (OKRs)", [
          "Resultado Clave", "Descripción",
        ], [
          ["KR 1", "Desarrollar y documentar el 100 % de los módulos core (Identity, Activity, Catalog, Social Graph, Location) con Material Design 3, Riverpod 3 y arquitectura SDD/BDD."],
          ["KR 2", "Abstraer el acceso a CouchDB en repositorios intercambiables, logrando una arquitectura limpia y testeable."],
          ["KR 3", "Completar la ingeniería inversa y la especificación de diseño (EARS, Gherkin, User Stories) de todos los módulos de lib/."],
          ["KR 4", "Garantizar un flujo de usuario sin fricciones desde el registro hasta la interacción en el feed y el catálogo."],
        ]),

        // ------------------------------------------------
        // 3. Segmentos de Usuario
        // ------------------------------------------------
        heading1("3. Segmentos de Usuario"),
        bodyPara("MotorSocial define cuatro actores principales cuyas necesidades se reflejan en la funcionalidad de la plataforma:"),
        ...buildTable("Tabla 2. Actores de la plataforma", [
          "Actor", "Descripción",
        ], [
          ["Usuario final", "Persona que se registra, gestiona su perfil y consume el feed y el catálogo."],
          ["Negocio / Comercio", "Entidad que publica productos o servicios y busca exposición social."],
          ["Administrador de la red vertical", "Operador que despliega y configura la instancia MotorSocial."],
          ["Sistema (backend)", "API Node.js + Express + CouchDB + microservicio mailer."],
        ]),

        // ------------------------------------------------
        // 4. Módulos y Funcionalidades
        // ------------------------------------------------
        heading1("4. Módulos y Funcionalidades"),

        // 4.1 Identity
        heading2("4.1 Identity — Identidad y Autenticación"),
        bodyPara("El módulo Identity gestiona el ciclo de vida de la identidad del usuario, desde el acceso hasta la persistencia de la sesión y el control de roles."),
        ...buildTable("Tabla 3. Funcionalidades del módulo Identity", [
          "Funcionalidad", "Descripción",
        ], [
          ["Inicio de sesión", "Acceso mediante email y contraseña en LoginPage."],
          ["Registro de cuenta", "Creación de cuenta con email, contraseña y nombre visible."],
          ["Recuperación de contraseña", "Solicitud de enlace de recuperación por email sin revelar la existencia de la cuenta."],
          ["Persistencia de sesión", "Almacenamiento local del token y userId para mantener conexión entre ejecuciones."],
          ["Perfil y roles", "SocialUser (displayName, photoUrl) y RoleProfile con permisos."],
        ]),
        bodyPara("Flujo de acceso: el usuario introduce credenciales; si son válidas se almacena el token y se navega a la pantalla principal; si son inválidas se muestra un mensaje de error; al reabrir la app, una sesión vigente restaura el acceso automáticamente."),

        // 4.2 Activity
        heading2("4.2 Activity — Feed social y mensajería"),
        heading3("4.2.1 Feed de Actividad"),
        bodyPara("La pantalla de feed muestra un listado de actividades sociales recientes de las conexiones del usuario. Cada elemento presenta el actor (quién hizo la acción), el verbo (qué hizo) y el objeto (en qué interactuó). Las actividades se ordenan cronológicamente inversas y soportan paginación al hacer scroll."),
        bodyPara("En caso de error de conexión, el sistema muestra un mensaje con opción de reintentar. En desconexiones prolongadas, puede operar temporalmente con datos en memoria."),

        heading3("4.2.2 Conversaciones y Chat"),
        bodyPara("El módulo permite mantener conversaciones privadas con otros usuarios. El campo de entrada valida que el mensaje no esté vacío antes de enviar. Durante el envío se deshabilita la entrada y se muestra un indicador; si el envío falla, el error se expone y el texto se conserva para reintento."),

        heading3("4.2.3 Reacciones"),
        bodyPara("El usuario puede reaccionar (Like o Comentario) a las actividades del feed. La actualización del estado es reactiva, sin recargar toda la página. Mientras se procesa la reacción se refleja visualmente el estado pendiente; si la operación falla se revierte el estado visual y se expone el error."),

        // 4.3 Catalog
        heading2("4.3 Catalog — Catálogo de productos y servicios"),
        bodyPara("El catálogo permite explorar ítems sociales paginados, acceder a su detalle, buscar con filtros avanzados y exportar resultados a PDF."),
        ...buildTable("Tabla 4. Capacidades del catálogo", [
          "Capacidad", "Descripción",
        ], [
          ["Listado paginado", "Exploración de ítems con título, tipo e identificador."],
          ["Detalle de objeto", "Vista de detalle que muestra tipo e ID del objeto social."],
          ["Búsqueda y filtrado", "Consulta por tipo preferido, límite, filtros personalizados y orden."],
          ["Exportación a PDF", "Generación opcional de documento PDF con los ítems de la página actual."],
          ["Integración social", "Visualización de la actividad social asociada a un ítem."],
        ]),
        bodyPara("Los filtros de búsqueda incluyen preferredType, limit (defecto 20), filters personalizados y criterios de ordenación (sort)."),

        // 4.4 Social Graph
        heading2("4.4 Social Graph — Contactos, grupos e invitaciones"),
        bodyPara("El grafo social modela las relaciones entre usuarios, facilitando la construcción de redes dentro de la plataforma."),
        ...buildTable("Tabla 5. Funcionalidades del grafo social", [
          "Funcionalidad", "Descripción",
        ], [
          ["Contactos y relaciones", "Gestión de vínculos con otros usuarios; listado por actor o por contacto."],
          ["Invitaciones", "Envío y recepción de invitaciones para establecer conexiones consentidas."],
          ["Grupos", "Descubrimiento y adhesión a grupos, filtrados por visibilidad (público/privado) y posibilidad de unirse."],
        ]),

        // 4.5 Media
        heading2("4.5 Media — Biblioteca multimedia"),
        bodyPara("El módulo Media gestiona la biblioteca personal de assets del usuario."),
        ...buildTable("Tabla 6. Capacidades multimedia", [
          "Funcionalidad", "Descripción",
        ], [
          ["Biblioteca de medios", "Consulta de la colección de assets subidos por el usuario."],
          ["Subida de medios", "Registro de nuevos assets en la biblioteca."],
          ["Eliminación", "Borrado de assets de la biblioteca."],
          ["Slideshow", "Presentación secuencial de un medio seleccionado."],
        ]),

        // 4.6 Location
        heading2("4.6 Location — Geolocalización y ubicación"),
        bodyPara("Location aporta contexto geográfico al catálogo y al feed, permitiendo personalizar la experiencia por proximidad."),
        ...buildTable("Tabla 7. Funcionalidades de ubicación", [
          "Funcionalidad", "Descripción",
        ], [
          ["Geolocalización", "Captura automática de la ubicación actual mediante sensores del dispositivo."],
          ["Búsqueda por código postal", "Alternativa manual para seleccionar localidad cuando el GPS no está disponible."],
          ["Selección de localidad", "El sistema recuerda la elección para personalizar catálogo y feed."],
        ]),

        // 4.7 Navigation
        heading2("4.7 Navigation — Navegación"),
        bodyPara("La navegación se organiza mediante un shell inferior con barra de navegación que cambia entre las secciones principales. Las rutas protegidas utilizan guardias de acceso que redirigen a /login cuando el usuario no está autenticado."),
        ...buildTable("Tabla 8. Rutas principales", [
          "Ruta", "Propósito",
        ], [
          ["/", "Home — Pantalla principal post-login."],
          ["/login", "Acceso — Punto de entrada para visitantes."],
          ["/catalog", "Catálogo — Exploración de productos y servicios."],
          ["/feed", "Feed — Actividades sociales recientes."],
          ["/profile", "Perfil — Consulta de sesión y datos de usuario."],
        ]),

        // 4.8 Features
        heading2("4.8 Features — Pantallas integradoras"),
        bodyPara("El módulo features actúa como consumidor real de los demás módulos, integrando sus capacidades en pantallas cohesivas:"),
        ...buildTable("Tabla 9. Pantallas integradoras", [
          "Pantalla", "Módulo consumido", "Descripción",
        ], [
          ["Home", "General", "Pantalla principal post-login."],
          ["FeedPage", "Activity", "Feed integrado de actividades sociales."],
          ["CatalogPage", "Catalog", "Catálogo integrado con búsqueda."],
          ["ChatPage", "Social Graph", "Grupos e integración social."],
          ["ProfilePage", "Identity / Core", "Perfil del usuario y sesión activa."],
          ["AccountPage", "Identity", "Gestión de cuenta (pendiente de integración)."],
        ]),

        // ------------------------------------------------
        // 5. Flujo de Usuario Principal
        // ------------------------------------------------
        heading1("5. Flujo de Usuario Principal"),
        bodyPara("El recorrido habitual de un usuario transita por las siguientes etapas:"),
        bodyPara("1. Descubrimiento: el visitante conoce la aplicación y sus propuestas de valor."),
        bodyPara("2. Registro / Login: el usuario crea una cuenta o accede con sus credenciales."),
        bodyPara("3. Configuración inicial: selección de ubicación mediante geolocalización o código postal."),
        bodyPara("4. Exploración del catálogo: navegación por productos y servicios, con opción de ver detalle."),
        bodyPara("5. Interacción social: consumo del feed, reacciones y seguimiento de actividades."),
        bodyPara("6. Contactos y grupos: construcción de la red social mediante conexiones y comunidades."),
        bodyPara("7. Chat privado: comunicación directa con otros usuarios."),
        bodyPara("8. Gestión de medios: administración de la biblioteca personal de assets."),

        // ------------------------------------------------
        // 6. Métricas Clave
        // ------------------------------------------------
        heading1("6. Métricas Clave"),
        bodyPara("La plataforma se evalúa mediante indicadores centrados en engagement y retención:"),
        ...buildTable("Tabla 10. Métricas clave", [
          "Métrica", "Propósito",
        ], [
          ["DAU / MAU", "Usuarios activos diarios y mensuales."],
          ["Tasa de retención", "Capacidad de la plataforma para mantener usuarios a lo largo del tiempo."],
          ["Volumen de interacciones en el Feed", "Nivel de engagement social de la red."],
        ]),

        // ------------------------------------------------
        // 7. Canales de Distribución
        // ------------------------------------------------
        heading1("7. Canales de Distribución"),
        bodyPara("MotorSocial se distribuye a través de canales multiplataforma:"),
        bodyPara("App móvil: Play Store para Android y App Store para iOS."),
        bodyPara("App Web: despliegue web WASM mediante Flutter Web."),

        // ------------------------------------------------
        // 8. Modelo de Ingresos
        // ------------------------------------------------
        heading1("8. Modelo de Ingresos (ROI Esperado)"),
        bodyPara("El modelo económico se apoya en dos vías principales:"),
        bodyPara("1. Monetización de negocios destacados en el Catálogo, ofreciendo posicionamiento patrocinado o premium."),
        bodyPara("2. Funciones premium o analíticas para negocios, con estadísticas de interacción y embudo de contacto."),

        // ------------------------------------------------
        // 9. Consideraciones Técnicas
        // ------------------------------------------------
        heading1("9. Consideraciones Técnicas Relevantes"),
        bodyPara("La plataforma está construida sobre una pila tecnológica moderna orientada a la escalabilidad y la experiencia multiplataforma:"),
        ...buildTable("Tabla 11. Stack técnico", [
          "Aspecto", "Detalle",
        ], [
          ["Tecnología", "Flutter (Android, iOS, Web, Windows)."],
          ["Diseño", "Material Design 3 (M3)."],
          ["Estado", "Riverpod 3.x con Notifier / NotifierProvider."],
          ["Backend", "API Node.js + Express + JWT + microservicio mailer."],
          ["Base de datos", "CouchDB (motorsocial_*). Temporalmente accesible desde Flutter; arquitectura orientada a consumo vía API propia."],
          ["Sincronización", "Repositorios con implementación en memoria (stub) y backend real para desarrollo offline."],
        ]),

        // ------------------------------------------------
        // 10. Mapa de Épicas
        // ------------------------------------------------
        heading1("10. Mapa de Épicas"),
        bodyPara("El desarrollo se organiza en once épicas que cubren todos los dominios de la plataforma:"),
        ...buildTable("Tabla 12. Mapa de épicas", [
          "Épica", "Módulo",
        ], [
          ["E1 — Registro e identidad", "Identity"],
          ["E2 — Catálogo de objetos sociales", "Catalog"],
          ["E3 — Feed y conversaciones", "Activity"],
          ["E4 — Conexiones y grafo social", "Social Graph"],
          ["E5 — Multimedia", "Media"],
          ["E6 — Ubicación", "Location"],
          ["E7 — Personalización M3", "Design"],
          ["E8 — Navegación y experiencia", "Navigation / Features"],
          ["E9 — Sincronización y resiliencia", "Resilience"],
          ["E10 — Seguridad", "Security"],
          ["E11 — Infraestructura", "Core / Providers"],
        ]),

        // ------------------------------------------------
        // 11. Estado del Proyecto
        // ------------------------------------------------
        heading1("11. Estado del Proyecto"),
        bodyPara("De acuerdo con la documentación de análisis y diseño, la plataforma se encuentra en fase activa de desarrollo. Muchos módulos presentan implementaciones iniciales tipo stub —repositorios en memoria, páginas placeholder, lógica pendiente de cableado— y existen deudas técnicas documentadas (duplicaciones internas, proveedores no conectados, migración hacia repositorios reales de CouchDB)."),
        bodyPara("Las funcionalidades descritas en esta guía reflejan el comportamiento esperado según las User Stories y especificaciones EARS. Se recomienda consultar el directorio _documentacion/_analisisydiseno para el detalle técnico de cada módulo."),
      ],
    },
  ],
});

// ============================================================
// Generate
// ============================================================
async function main() {
  try {
    const buffer = await Packer.toBuffer(doc);
    const outPath = "D:\\motorsocial\\_documentacion\\Guia_de_Uso_MotorSocial.docx";
    fs.writeFileSync(outPath, buffer);
    console.log("Generated: " + outPath);
  } catch (err) {
    console.error("Generation failed:", err);
    process.exit(1);
  }
}

main();