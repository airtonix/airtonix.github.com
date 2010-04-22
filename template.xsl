<!DOCTYPE stylesheet [
	<!ENTITY nbsp  " " ><!-- small n, tilde -->
]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" />

	<xsl:template match="/document">

		<html>
			<head>
				<title>zenobius.jiricek@this-host-name.local</title>
				<!-- Meta Tags -->
				<meta http-equiv="content-type" content="text/html; charset=utf-8" />
				<meta name="robots" content="index, follow" />

				<!-- CSS -->
				<link href="/www-core/airtonix/css/div-row-col.css" rel="stylesheet" type="text/css" media="all"/>
				<link href="/www-core/airtonix/css/horizontal-menu.css" rel="stylesheet" type="text/css" media="all"/>
				<link href="/www-core/airtonix/css/redfire.css" rel="stylesheet" type="text/css" media="all"/>	
				
			</head>
			<body>
				<div class="page">
					<div class="page-inner-vertical-left">
						<div class="page-inner-vertical-right">
							<div class="page-inner-top-left">
								<div class="page-inner-top-right">
									<div class="page-inner-bottom">
										<div class="page-inner-bottom-left">
											<div class="page-inner-bottom-right">
												<div class="page-inner">
												<!-- start of page-inner wrapper -->

													<xsl:apply-templates select="siteheader"/>

													<xsl:apply-templates select="page"/>

												<!-- end of page-inner wrapper //-->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="SiteHeader" match="/document/siteheader">
		<div class="row site-header">
			<div class="inner">
			
				<div class="wrap">
			
					<div class="icon">
						<div class="inner">
						
							<h1 class="name"> <xsl:value-of select="title"/> </h1>
							<span class="desc"></span>

						</div>
					</div>
				
					<xsl:call-template name="SiteMenu"/>

					<div class="break">&nbsp;</div>
				</div>

			</div>
		</div>
	</xsl:template>

	<xsl:template name="SiteMenu">
		<div class="site-menu-horizontal">
			<div class="inner">
			
				<ul>
					<xsl:for-each select="//page/section">
						<li>
							<a>
								<xsl:attribute name="href">
									#<xsl:value-of select="./title"/>
								</xsl:attribute>
								<xsl:value-of select="./title"/>
							</a>
						</li>
					</xsl:for-each>
				</ul>
				
			</div>
		</div>
	</xsl:template>

	<xsl:template name="Page"  match="/document/page">
		<div class="row content">
			<div class="inner">

				<div class="wrap">

				<div class="page-body">
					<div class="inner">
						<xsl:apply-templates select="section"/>
						<div class="break">&nbsp;</div>
					</div>
				</div>

				</div>

				<div class="break">&nbsp;</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="PageSection"  match="section">
		<div>
			<xsl:attribute name="class">section 
				<xsl:choose>
					<xsl:when test="position()=1">special</xsl:when>
					<xsl:otherwise>columns</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<div class="inner">
			
				<div class="section-title">
					<div class="inner">
						<h2>
						<xsl:attribute name="id">
							<xsl:value-of select="./title"/>
						</xsl:attribute>
						<xsl:value-of select="./title"/>
						<a>
							<xsl:attribute name="name">
								<xsl:value-of select="./title"/>
							</xsl:attribute>
						</a>
						</h2>
					</div>
				</div>
				
				<div class="section-group">
					<div class="inner">
						<xsl:choose>
							<xsl:when test="position()=1"><xsl:call-template name="FeatureGroupSections"/></xsl:when>
							<xsl:otherwise><xsl:call-template name="GroupSections"/></xsl:otherwise>
						</xsl:choose>
						<div class="break">&nbsp;</div>
					</div>
				</div>
				
				<div class="break">&nbsp;</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="FeatureGroupSections">
		<xsl:for-each select="content/group/items">
			<div class="group">
				<div class="inner">
					<dl class="">
						<xsl:if test=" @title">
						<dt><b><xsl:value-of select="./@title"/></b></dt>
						</xsl:if>
						<xsl:call-template name="GroupItems"/>				
					</dl>
					<div class="break">&nbsp;</div>
				</div>
			</div>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="GroupSections">
			<xsl:for-each select="content/group">
				<xsl:sort select="./@title"/>
				<h3 class="group-title"><xsl:value-of select="./@title"/></h3>
				<xsl:call-template name="GroupItemSection"/>
			</xsl:for-each>
	</xsl:template>

	<xsl:template name="GroupItemSection">
		<div class="group">
			<dl>
				<xsl:for-each select="items">
					<dt><b><xsl:value-of select="./@title"/></b></dt>
					<xsl:call-template name="GroupItems"/>				
				</xsl:for-each>
			</dl>
			<div class="break">&nbsp;</div>
		</div>
	</xsl:template>

	<xsl:template name="GroupItems"  match="item">
		<xsl:for-each select="item">
			<dd>				
				<xsl:attribute name="class">
					item 
					<xsl:value-of select="./@class"/>
				</xsl:attribute>
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="./@href"/>
					</xsl:attribute>
					<xsl:value-of select="."/>
				</a>
			</dd>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>
