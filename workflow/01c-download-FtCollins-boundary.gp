# Download Fort Collins Utility Service Area boundary
# - this should only need to be done periodically
# - output is saved to results/FortCollins and is then merged into the full water providers
#   layer in a later command file
#
# The layer is not available on the web.  It was exported using the Export to Shapefile tool from:
#   https://gisweb.fcgov.com/HTML5Viewer/index.html?Viewer=Utility%20Districts
# Higlight the Fort Collins Utilities boundary and then use "I want to..." and "Export to Shapefile"
# to the data-orig/YYYY-MM-DD/Export.zip file.
# Then process the shapefile into a GeoJSON.
UnzipFile(File="../data-orig/FtCollins/2021-05-15/Export.zip",OutputFolder="downloads/FtCollins/2022-08-22",IfFolderDoesNotExist="Create")
ReadGeoLayerFromShapefile(InputFile="downloads/FtCollins/2022-08-22/Water District Service Areas.shp",GeoLayerID="FortCollinsServiceAreaLayer",Name="Fort Collins Service Area",Description="Fort Collins Service Area from Fort Collins")
WriteGeoLayerToGeoJSON(GeoLayerID="FortCollinsServiceAreaLayer",OutputFile="downloads/FtCollins/2022-08-22/FtCollins-boundary.geojson")
# CopyFile(SourceFile="downloads/fort-collins-boundary.geojson",DestinationFile="layers/fort-collins-boundary.geojson")
#
# ===========================================
# TODO smalers 2021-05-15 need to use something like selenium to download