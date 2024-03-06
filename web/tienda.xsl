<?xml version="1.0" encoding="UTF-8"?>
<!--
    Módulo:     LMSGI
    UD:         04
    Fecha:      05/03/2024
    Autor:      Edgar Rodrigues
    Tarea       Tarea Evaluativa 02
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-doctype"/>

  <!-- Plantilla principal -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Tienda del Club de Voleibol</title>
        <link rel="stylesheet" type="text/css" href="../css/estilo.css" />
      </head>
      <body>
        <header>
          <img src="../img/logotipo.png" alt="Reservas" />
          <a href="tienda.xml">Tienda</a>
          <a href="equipos.xml">Equipos</a>
          <a href="partidos.xml">Partidos</a>
        </header>

        <main class="principal">
          <!-- Aplicar plantilla para cada artículo -->
          <xsl:apply-templates select="//articulo" />
        </main>

        <footer>
          <address>&#169; Desarrollado por info@birt.eus</address>
        </footer>
      </body>
    </html>
  </xsl:template>

  <!-- Plantilla para cada artículo -->
  <xsl:template match="articulo">
    <article>
      <section>
        <img class="articulo" src="../img/{@foto}" />
      </section>
      <section>
        <h2><xsl:value-of select="precio" /> €</h2>
        <h3>Comentarios: <xsl:value-of select="count(comentarios)" /></h3>
        <ul>
          <!-- Aplicar plantilla para cada comentario -->
          <xsl:apply-templates select="comentarios" />
        </ul>
      </section>
    </article>
  </xsl:template>

  <!-- Plantilla para cada comentario -->
  <xsl:template match="comentarios">
    <li><xsl:value-of select="@fecha" />: <xsl:value-of select="." /></li>
  </xsl:template>
</xsl:stylesheet>
