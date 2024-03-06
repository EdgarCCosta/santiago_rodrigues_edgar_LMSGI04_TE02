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

    <!-- Variable para almacenar el nombre del entrenador -->
    <xsl:variable name="nombre_entrenador" select="//equipo[entrenador/nombre='Julio Velasc']/entrenador/nombre"/>

    <!-- Plantilla principal -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Equipo entrenado por <xsl:value-of select="$nombre_entrenador"/></title>
                <link rel="stylesheet" type="text/css" href="../css/estilo.css" />
            </head>
            <body>
                <header>
                    <img src="../img/logotipo.png" alt="Reservas" />
                    <a href="tienda.xml">Tienda</a>
                    <a href="equipos.xml">Equipos</a>
                    <a href="partidos.xml">Partidos</a>
                </header>

                <main>
                    <!-- Mostrar el nombre del entrenador con un enlace a su página de Wikipedia -->
                    <h1><a href="{//equipo[entrenador/nombre='Julio Velasc']/entrenador/url}"><xsl:value-of select="$nombre_entrenador"/></a></h1>
                    <article class="equipos">
                        <!-- Mostrar el nombre del equipo -->
                        <h4><xsl:value-of select="$nombre_entrenador"/></h4>                        
                        <!-- Aplicar plantilla para mostrar jugadores titulares -->
                        <xsl:apply-templates select="//equipo[entrenador/nombre='Julio Velasco']/jugadores/jugador[@titular='si']"/>
                    </article>
                </main>

                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>

    <!-- Plantilla para los jugadores titulares -->
    <xsl:template match="jugador[@titular='si']">
        <p><xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/></p>
    </xsl:template>

</xsl:stylesheet>
