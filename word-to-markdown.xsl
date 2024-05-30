<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="text"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="w:body">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="w:p">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="w:pPr">
        <xsl:apply-templates select="w:pStyle"/>
    </xsl:template>

    <xsl:template match="w:pStyle">
        <xsl:variable name="headinglevel" select="substring-after(@w:val, 'Heading')"/>
        <xsl:if test="$headinglevel">
            <xsl:for-each select="1 to xs:integer($headinglevel)">
                <xsl:text>#</xsl:text>
            </xsl:for-each>
        </xsl:if>

        <xsl:apply-templates select="ancestor::w:p/w:r/w:t" mode="header"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

    <xsl:template match="w:r">
        <xsl:apply-templates mode="body"/>
    </xsl:template>

    <xsl:template match="w:t" mode="body">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="w:t" mode="header">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="w:t"/>

</xsl:stylesheet>
