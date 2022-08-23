# Create merged water providers layer from DOLA districts and entity water provider data.
# - layers/*.geojson files were previously created
# - read the layers and manipulate attributes to only have Name, Type, and Website properties
#
# Read DOLA water providers determined from the special districts layer:
# - read from the data.openwaterfoundation.org website
ReadGeoLayerFromGeoJSON(InputFile="../data/latest/co-municipal-water-provider-boundaries-districts-only.geojson",GeoLayerID="WaterDistrictsDolaLayer",Name="Water District Boundaries (DOLA)",Description="Water district boundaries, from DOLA")
#
# Remove districts that are not appropriate:
# - area is usually large and overlaps other districts, making map hard to read
# - remove conservancy districts, which deliver raw water or provide other services
# - remove the Colorado River Conservation District
# - don't remove districts with retail customers
# Colorado River Water Conservation District
RemoveGeoLayerFeatures(GeoLayerID="WaterDistrictsDolaLayer",ExcludeAttributes="LGID:64046")
# Dolores Water Conservancy District
RemoveGeoLayerFeatures(GeoLayerID="WaterDistrictsDolaLayer",ExcludeAttributes="LGID:64054")
# Florida Water Conservancy District
#RemoveGeoLayerFeatures(GeoLayerID="WaterDistrictsDolaLayer",ExcludeAttributes="LGID:34010")
# Northern Water
RemoveGeoLayerFeatures(GeoLayerID="WaterDistrictsDolaLayer",ExcludeAttributes="LGID:64105")
# Southeastern Colorado Conservancy District
RemoveGeoLayerFeatures(GeoLayerID="WaterDistrictsDolaLayer",ExcludeAttributes="LGID:64128")
# Tri-County Water Conservancy District
#RemoveGeoLayerFeatures(GeoLayerID="WaterDistrictsDolaLayer",ExcludeAttributes="LGID:64138")
# Upper Arkansas Water Conservancy District
RemoveGeoLayerFeatures(GeoLayerID="WaterDistrictsDolaLayer",ExcludeAttributes="LGID:64141")
# Upper Gunnison Water Conservancy District
RemoveGeoLayerFeatures(GeoLayerID="WaterDistrictsDolaLayer",ExcludeAttributes="LGID:64143")
# Upper South Platte Water Conservancy
RemoveGeoLayerFeatures(GeoLayerID="WaterDistrictsDolaLayer",ExcludeAttributes="LGID:64145")
# Upper Yampa Water Conservancy District
RemoveGeoLayerFeatures(GeoLayerID="WaterDistrictsDolaLayer",ExcludeAttributes="LGID:64146")
# Ute Water Conservancy District
#RemoveGeoLayerFeatures(GeoLayerID="WaterDistrictsDolaLayer",ExcludeAttributes="LGID:39043")
#
# Read the other water providers in alphabetical order:
# - the order will be set when merging to ensure top to bottom order on the map
# Read ACWWA.
ReadGeoLayerFromGeoJSON(InputFile="downloads/ACWWA/2021-04-15/ACWWA-boundary.geojson",GeoLayerID="ACWWABoundaryLayer",Name="Arapahoe County Water and Wastewater Authority",Description="Arapahoe County Water and Wastewater Authority (Water) service area, from ACWWA")
#
# Read Denver Water.
# - before merging, must have manually modified GeoJSON for each feature to include:
#     "Name": "Denver Water",
#     "Website": "https://www.denverwater.org/"
ReadGeoLayerFromGeoJSON(InputFile="downloads/DenverWater/2021-04-15/DenverWater-boundary.geojson",GeoLayerID="DenverWaterBoundaryLayer",Name="Denver Water Service Area",Description="Denver Water service area, from Denver Water")
#
# Read Fort Collins.
ReadGeoLayerFromGeoJSON(InputFile="downloads/FtCollins/2022-08-22/FtCollins-boundary.geojson",GeoLayerID="FortCollinsBoundaryLayer",Name="Fort Collins Utilities Service Area",Description="Fort Collins Utilities (Water) service area, from Fort Collins")
#
# Merge the layers:
# - put Denver Water first because its overall boundary overlaps other districts
# - put Fort Collins next because its overall boundary overlaps other districts
MergeGeoLayers(GeoLayerIDs="DenverWaterBoundaryLayer,FortCollinsBoundaryLayer,ACWWABoundaryLayer,WaterDistrictsDolaLayer",OutputGeoLayerID="WaterProvidersBoundaryLayer",Name="Municipal Water Provider Boundaries",Description="Municipal water providers boundary layer (merged)",AttributeMap="LGNAME:Name,URL:Website")
#
# Remove attributes that were introduced during processing.
RemoveGeoLayerAttributes(GeoLayerID="WaterProvidersBoundaryLayer",AttributeNames="layer,path")
#
# Write the merged file using the general layer file name.
WriteGeoLayerToGeoJSON(GeoLayerID="WaterProvidersBoundaryLayer",OutputFile="../data/latest/co-municipal-water-provider-boundaries.geojson")