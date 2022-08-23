# Download Denver Water Service Area boundary
# - this layer is used for information
# - this should only need to be done periodically
# - save the file in 'results/DenverWater' and then merge into the final layer
#   using a different command file
#
# The layer is not available on the web.  It was provided by email after doing a data request.
UnzipFile(File="../data-orig/DenverWater/2022-08-23/DW_CombinedServiceArea.zip",OutputFolder="downloads/DenverWater/2022-08-23",IfFolderDoesNotExist="Create")
ReadGeoLayerFromShapefile(InputFile="downloads/DenverWater/2022-08-23/IT_GIS.shp",GeoLayerID="DenverWaterBoundaryLayer",Name="Denver Water Service Area",Description="Denver Water Service Area from Denver Water")
WriteGeoLayerToGeoJSON(GeoLayerID="DenverWaterBoundaryLayer",OutputFile="downloads/DenverWater/2022-08-23/DenverWater-boundary.geojson")
#
# The following was for 2021-04-15 download.
# The layer is not available on the web.  It was provided by email after doing a data request.
#UnzipFile(File="../data-orig/DenverWater/2021-04-15/DW_ServiceArea.zip",OutputFolder="downloads/DenverWater/2021-04-15",IfFolderDoesNotExist="Create")
#ReadGeoLayerFromShapefile(InputFile="downloads/DenverWater/2021-04-15/DW_ServiceArea.shp",GeoLayerID="DenverWaterBoundaryLayer",Name="Denver Water Service Area",Description="Denver Water Service Area from Denver Water")
#WriteGeoLayerToGeoJSON(GeoLayerID="DenverWaterBoundaryLayer",OutputFile="downloads/DenverWater/2021-04-15/DenverWater-boundary.geojson")