<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <html>
      <body>


        <!-- Anfang HEADER -->
        <a name="top"></a>
        <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#333333" rules="none">
          <tr>
            <td height="61" colspan="3" valign="top" bgcolor="#333333">
              <TABLE WIDTH="400" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="54">
                <TR>
                  <TD HEIGHT="16"></TD>
                </TR>
                <TR>
                  <TD HEIGHT="18" bgcolor="#E0E9EE" WIDTH="250">
                    <xsl:value-of select="Doku/Firm" />
                  </TD>
                </TR>
                <TR>
                  <TD HEIGHT="20" width="70"></TD>
                </TR>
              </TABLE>
            </td>
            <td height="61" bgcolor="#333333">
              <img src="sewlogo.gif" align="right" height="61" width="283"></img>
            </td>
          </tr>
        </table>
        <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#333333" rules="none">
          <tr>
            <td width="291" bgcolor="#333333">
              <table width="100%" border="0" Cellspacing="0" Cellpadding="0">
                <tr>
                  <img width="289" height="24" src="sewline1.gif"></img>
                </tr>
                <tr>
                  <img width="289" height="24" src="sewline2.jpg"></img>
                </tr>
              </table>
            </td>
            <td bgcolor="#333333">
              <table width="100%" border="0" Cellspacing="0" Cellpadding="0">
                <tr>
                  <td height="48" bgcolor="white">
                    <font size="5">MOVITOOLS®-MotionStudio</font>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        <!-- Ende HEADER -->


        <!-- Anfang FIRMENDATEN + INHALTSVERZEICHNIS -->
        <table valign="top" width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top" width="149" height="398"  bgcolor="#333333">
              <img src="SewDocu.jpg"></img>
            </td>
            <td width="20">
            </td>
            <td valign="top">
              <table valign="top" width="100%" border="0" Cellspacing="1" Cellpadding="1" bgcolor="#E0E9EE">
                <tr>
                  <td height="20"></td>
                </tr>
                <tr>
                  <td bgcolor="#34434d">
                    <font size="6" color="white">
                      <xsl:value-of select="Doku/Title" />
                    </font>
                  </td>
                </tr>
              </table>
              <table valign="top" width="100%" border="0" Cellspacing="1" Cellpadding="1" bgcolor="#E0E9EE">
                <tr>
                  <td width="20%" bgcolor="#D2E0E8">Author</td>
                  <td bgcolor="#D2E0E8">
                    <xsl:value-of select="Doku/Author" />
                  </td>
                </tr>
                <tr>
                  <td bgcolor="#D2E0E8">Date/time</td>
                  <td bgcolor="#D2E0E8">
                    <xsl:value-of select="Doku/Date" />
                  </td>
                </tr>
                <tr>
                  <td bgcolor="#D2E0E8">Comment</td>
                  <td bgcolor="#D2E0E8">
                    <xsl:value-of select="Doku/Comment" />
                  </td>
                </tr>

                <xsl:variable name="ParameterQuelle">
                  <xsl:value-of select="Doku/Quelle" />
                </xsl:variable>
                <xsl:if test="$ParameterQuelle!=''">
                  <tr>
                    <td bgcolor="#D2E0E8">Source</td>
                    <td bgcolor="#D2E0E8">
                      <xsl:value-of select="Doku/Quelle" />
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="$ParameterQuelle=''">
                  <tr>
                    <td bgcolor="#D2E0E8">Source 1</td>
                    <td bgcolor="#D2E0E8">
                      <xsl:value-of select="Doku/Quelle1" />
                    </td>
                  </tr>
                  <tr>
                    <td bgcolor="#D2E0E8">Source 2</td>
                    <td bgcolor="#D2E0E8">
                      <xsl:value-of select="Doku/Quelle2" />
                    </td>
                  </tr>
                  <tr>
                    <td bgcolor="#D2E0E8">Comparison options</td>
                    <td bgcolor="#D2E0E8">
                      <xsl:value-of select="Doku/VergleichsOptionen" />
                    </td>
                  </tr>
                  <tr>
                    <td bgcolor="#D2E0E8">Comparison result</td>
                    <xsl:variable name="Unterschiede">
                      <xsl:value-of select="Doku/Unterschiede" />
                    </xsl:variable>
                    <xsl:if test="$Unterschiede='true'">
                      <td bgcolor="#FF0000" color="#000000">
                        <xsl:value-of select="Doku/VergleichsErgebnis" />
                      </td>
                    </xsl:if>
                    <xsl:if test="$Unterschiede='false'">
                      <td bgcolor="#D2E0E8">
                        <xsl:value-of select="Doku/VergleichsErgebnis" />
                      </td>
                    </xsl:if>
                  </tr>
                </xsl:if>

              </table>
              <p></p>

              <table valign="top" width="100%" border="0" Cellspacing="1" Cellpadding="1" bgcolor="#E0E9EE">
                <tr>
                  <td bgcolor="#34434d">
                    <font size="4" color="white">Content</font>
                  </td>
                </tr>
                <xsl:for-each select="Doku/DokuSections/DokuSection">
                  <tr>
                    <!-- Unterschiede farblich markieren-->
                    <xsl:variable name="HasError">
                      <xsl:value-of select="HasError" />
                    </xsl:variable>
                    <xsl:if test="$HasError='true'">
                      <xsl:attribute name = "bgcolor">#FF0000</xsl:attribute>
                    </xsl:if>

                    <td>
                      <font size="4">
                        <xsl:variable name="AnkerName1">
                          <xsl:value-of select="Anker" />
                        </xsl:variable>
                        <a href="#&#123;$AnkerName1&#125;">
                          <xsl:value-of select="Title" />
                        </a>
                        <br/>
                      </font>
                      <font size="2">
                        <xsl:for-each select="DokuSubSections/DokuSubSection">
                          <li>
                            <xsl:variable name="InnerAnkerName1">
                              <xsl:value-of select="Anker" />
                            </xsl:variable>
                            <a href="#&#123;$InnerAnkerName1&#125;">
                              <xsl:value-of select="Title" />
                            </a>
                            <br/>
                          </li>
                        </xsl:for-each>
                      </font>
                    </td>
                  </tr>
                </xsl:for-each>
              </table>
            </td>
          </tr>
        </table>
        <p />
        <!-- Ende FIRMENDATEN + INHALTSVERZEICHNIS -->



        <!-- Anfang  DOKUSECTIONS -->
        <xsl:for-each select="Doku/DokuSections/DokuSection">
          <p />
          <xsl:variable name="AnkerName">
            <xsl:value-of select="Anker" />
          </xsl:variable>
          <a name="&#123;$AnkerName&#125;"></a>
          <table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#E0E9EE">
            <tr>
              <td width="20"></td>
              <td>
                <a href="#top">↑</a>
                <table width="100%" border="1" cellpadding="1" cellspacing="1" bgcolor="#D2E0E8" bordercolor="#E0E9EE">
                  <tr>
                    <td style="font-size:24pt" bgcolor="#34434d">
                      <font color="white">
                        <b>
                          <xsl:value-of select="Title" />
                        </b>
                      </font>
                    </td>
                  </tr>
                  <tr bgcolor="#FFC800">
                    <td style="font-size:12pt" bgcolor="#34434d">
                      <font color="white">
                        <b>
                          <xsl:value-of select="Description" />
                        </b>
                      </font>
                    </td>
                  </tr>
                  <tr>
                    <td>

                      <!-- Anfang DOKUSUBSECTION -->

                      <xsl:for-each select="DokuSubSections/DokuSubSection">
                        <xsl:variable name="InnerAnkerName">
                          <xsl:value-of select="Anker" />
                        </xsl:variable>
                        <a name="&#123;$InnerAnkerName&#125;"></a>
                        <table width="100%" border="1" cellpadding="1" cellspacing="1" bgcolor="#D2E0E8" bordercolor="#E0E9EE">
                          <tr>
                            <td width="20" valign="top">
                              <a href="#top">↑</a>
                            </td>
                            <td>
                              <table width="100%" border="1" cellpadding="1" cellspacing="1" bgcolor="#D2E0E8" bordercolor="#E0E9EE">
                                <tr>
                                  <td height="20"></td>
                                </tr>
                                <tr>
                                  <td bgcolor="#8394a7">
                                    <font size="5">
                                      <b>
                                        <xsl:value-of select="Title" />
                                      </b>
                                    </font>
                                  </td>
                                </tr>

                                <!--Anfang BILD-->
                                <xsl:variable name="ImageFile">
                                  <xsl:value-of select="PictName" />
                                </xsl:variable>
                                <xsl:if test="$ImageFile!=''">
                                  <tr>
                                    <td>
                                      <img align="center" vspace="20" src="&#123;$ImageFile&#125;"></img>
                                    </td>
                                  </tr>
                                </xsl:if>
                                <!-- Ende BILD -->

                              </table>

                              <!-- Anfang TABELLEN -->

                              <table align="right" width ="100%" border="1" cellpadding="1" cellspacing="1" bgcolor="#D2E0E8" bordercolor="#E0E9EE">
                                <tr bgcolor="#8394a7">
                                  <xsl:for-each select="DokuTables/DokuTable">
                                    <td VALIGN="top" >

                                      <xsl:variable name="UseOriginalFormat">
                                        <xsl:value-of select="UseOriginalTextFormat" />
                                      </xsl:variable>

                                      <table align="right" width ="100%" cellpadding="1" cellspacing="1" bgcolor="#D2E0E8">
                                        <tr bgcolor="#8394a7">


                                          <!-- Titelzeile-->
                                          <xsl:variable name="TempTitle">
                                            <xsl:value-of select="Title" />
                                          </xsl:variable>
                                          <xsl:if test="$TempTitle!=''">
                                            <td>
                                              <b>
                                                <xsl:value-of select="Title" />
                                              </b>
                                            </td>
                                            <tr/>
                                          </xsl:if>

                                          <!-- Titelzeile-->
                                          <xsl:variable name="TempAdditionalInfo">
                                            <xsl:value-of select="AdditionalInfo" />
                                          </xsl:variable>
                                          <xsl:if test="$TempAdditionalInfo!=''">
                                            <tr bgcolor="#8394a7">
                                              <td>
                                                <b>
                                                  <xsl:value-of select="AdditionalInfo" />
                                                </b>
                                              </td>
                                            </tr>
                                          </xsl:if>

                                          <tr >
                                            <td>
                                              <table align="right" width ="100%" border="1" cellpadding="1" cellspacing="1" bgcolor="#D2E0E8" bordercolor="#E0E9EE">

                                                <tr bgcolor="#8394a7">
                                                  <xsl:for-each select="DokuCols/DokuColumn">
                                                    <td>
                                                      <b>
                                                        <xsl:value-of select="Name" />
                                                      </b>
                                                    </td>
                                                  </xsl:for-each>
                                                </tr>


                                                <xsl:for-each select="DokuRows/DokuRow">
                                                  <tr>

                                                    <!-- Unterschiede farblich markieren-->
                                                    <xsl:variable name="HasError">
                                                      <xsl:value-of select="HasError" />
                                                    </xsl:variable>
                                                    <xsl:if test="$HasError='true'">
                                                      <xsl:attribute name = "bgcolor">#FF0000</xsl:attribute>
                                                      <xsl:attribute name = "color">#000000</xsl:attribute>
                                                    </xsl:if>

                                                    <xsl:for-each select="Items">
                                                      <xsl:for-each select="string">
                                                        <td>
                                                          <xsl:if test="$UseOriginalFormat='true'">
                                                            <xsl:element name = "pre">
                                                              <xsl:value-of select = "." />
                                                            </xsl:element>
                                                          </xsl:if>
                                                          <xsl:if test="$UseOriginalFormat='false'">
                                                            <xsl:value-of select = "." />
                                                          </xsl:if>
                                                        </td>
                                                      </xsl:for-each>
                                                    </xsl:for-each>
                                                  </tr>
                                                </xsl:for-each>

                                              </table>
                                            </td>
                                          </tr>

                                        </tr>
                                      </table>
                                    </td>
                                  </xsl:for-each>

                                </tr>
                              </table>
                              <!-- Ende TABELLEN -->

                            </td>
                          </tr>
                        </table>
                      </xsl:for-each>

                      <!-- Ende DOKUSUBSECTION -->


                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </xsl:for-each>
        <!-- Ende  DOKUSECTIONS -->


      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
