StartLog(LogFile="results/01c-download-ACWWA-boundary.gp.log")
#
# Read in the Arapahoe County Water and Wastewater Authority's boundary from KML file hosted on their website.
# 1. View the website in a browser:  https://www.google.com/maps/d/u/0/viewer?mid=1vlGZrFPnhBX-mSSnnkN_T6nJMgU&ll=39.58385025572299%2C-104.805972&z=13
#    As of 2022-08-22 the note says "Published on June 13, 2016".
# 2. Manually save to 'data-orig/ACWWA/YYYY-MM-DD/ACWWA.kml' (default name)
# 3. Automate reading in and saving below.
ReadGeoLayerFromKML(InputFile="../data-orig/ACWWA/2021-04-15/ACWWA.kml",InputLayerName="ACWWA Service Area",GeoLayerID="ACWWALayer",Name="Arapaho County Water and Wastewater Authority",Description="Arapaho County Water and Wastewater Authority service area boundary from website")
RemoveGeoLayerAttributes(GeoLayerID="ACWWALayer",AttributeNames="Name,description,timestamp,begin,end,altitudeMode,tessellate,extrude,visibility,drawOrder,icon")
AddGeoLayerAttribute(GeoLayerID="ACWWALayer",AttributeName="LGID",AttributeType="string",InitialValue="64247")
AddGeoLayerAttribute(GeoLayerID="ACWWALayer",AttributeName="SOURCE",AttributeType="string",InitialValue="ACWWA website Google Map")
AddGeoLayerAttribute(GeoLayerID="ACWWALayer",AttributeName="LGNAME",AttributeType="string",InitialValue="Arapahoe County Water and Wastewater Authority")
AddGeoLayerAttribute(GeoLayerID="ACWWALayer",AttributeName="LGTYPEID",AttributeType="string")
AddGeoLayerAttribute(GeoLayerID="ACWWALayer",AttributeName="LGSTATUSID",AttributeType="string")
AddGeoLayerAttribute(GeoLayerID="ACWWALayer",AttributeName="ABBREV_NAM",AttributeType="string")
AddGeoLayerAttribute(GeoLayerID="ACWWALayer",AttributeName="MAIL_ADDRE",AttributeType="string")
AddGeoLayerAttribute(GeoLayerID="ACWWALayer",AttributeName="ALT_ADDRES",AttributeType="string")
AddGeoLayerAttribute(GeoLayerID="ACWWALayer",AttributeName="MAIL_CITY",AttributeType="string")
AddGeoLayerAttribute(GeoLayerID="ACWWALayer",AttributeName="MAIL_STATE",AttributeType="string")
AddGeoLayerAttribute(GeoLayerID="ACWWALayer",AttributeName="MAIL_ZIP",AttributeType="string")
AddGeoLayerAttribute(GeoLayerID="ACWWALayer",AttributeName="URL",AttributeType="string",InitialValue="acwwa.com")
AddGeoLayerAttribute(GeoLayerID="ACWWALayer",AttributeName="PREV_NAME",AttributeType="string")
#
# Merge the special districts and ACWWA layer into water providers layer
ChangeGeoLayerGeometry(InputGeoLayerID="ACWWALayer",OutputGeometry="Polygon",OutputGeoLayerID="ACWWAPolygonLayer")
# MergeGeoLayers(GeoLayerIDs="SpecialDistrictsLayer,ACWWAPolygonLayer",OutputGeoLayerID="WaterProvidersLayer",Name="Water Providers",Description="Water Providers (DOLA districts and ACWWA)")
# RemoveGeoLayerAttributes(GeoLayerID="WaterProvidersLayer",AttributeNames="layer,path")
CreateFolder(Folder="downloads/ACWWA/2021-04-15",CreateParentFolders="True",IfFolderExists="Ignore")
WriteGeoLayerToGeoJSON(GeoLayerID="ACWWAPolygonLayer",OutputFile="downloads/ACWWA/2021-04-15/ACWWA-boundary.geojson")
