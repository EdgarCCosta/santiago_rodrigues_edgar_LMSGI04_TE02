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
                <title>Partidos</title>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <style>
                    .visitante-gana {
                        color: blue;
                    }
                </style>
            </head>
            <body>
                <header>
                    <img src="../img/logotipo.png" alt="Reservas" />
                    <a href="tienda.xml">Tienda</a>
                    <a href="equipos.xml">Equipos</a>
                    <a href="partidos.xml">Partidos</a>
                </header>
                <main>
                    <h1>Partidos</h1>
                    <table>
                        <tr>
                            <th>PARTIDO</th>
                            <th>FECHA</th>
                            <th>RESULTADO</th>
                        </tr>
                        <!-- Aplicar plantilla para cada partido -->
                        <xsl:apply-templates select="//partido[lugar/@ciudad='Lima']">
                            <!-- Ordenar por fecha en orden descendente -->
                            <xsl:sort select="fecha" order="descending"/>
                        </xsl:apply-templates>
                    </table>
                </main>
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>

    <!-- Plantilla para cada partido -->
    <xsl:template match="partido">
        <tr>
            <td><xsl:value-of select="equipos/local"/> - <xsl:value-of select="equipos/visitante"/></td>
            <td><xsl:value-of select="fecha"/></td>
            <td>
                <xsl:choose>
                    <!-- Comprobar el resultado y aplicar estilo si el visitante gana -->
                    <xsl:when test="equipos/visitante/@puntuacion > equipos/local/@puntuacion">
                        <span class="visitante-gana">
                            <xsl:value-of select="equipos/visitante/@puntuacion"/> - <xsl:value-of select="equipos/local/@puntuacion"/>
                        </span>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="equipos/local/@puntuacion"/> - <xsl:value-of select="equipos/visitante/@puntuacion"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
