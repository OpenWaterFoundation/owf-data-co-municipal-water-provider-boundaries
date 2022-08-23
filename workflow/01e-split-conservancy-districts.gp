# Split the large conservancy/conservation districts out of the districts layer:
# - this allows those districts to be viewed separately from smaller retail districts
#
# Read DOLA water providers determined from the special districts layer:
# - read from the data.openwaterfoundation.org website
ReadGeoLayerFromGeoJSON(InputFile="../data/latest/co-municipal-water-provider-boundaries-districts-only.geojson",GeoLayerID="WaterDistrictsDolaLayer",Name="Water District Boundaries (DOLA)",Description="Water district boundaries, from DOLA")
#
# Create the layer for conservancy districts:
# - include conservancy districts, which deliver raw water or provide other services
# - include the Colorado River Conservation District
# - don't include districts with retail customers
# Colorado River Water Conservation District, LGID:64046
# Dolores Water Conservancy District, LGID:64054
# Northern Water, LGID:64105
# Southeastern Colorado Conservancy District, LGID:64128
# Upper Arkansas Water Conservancy District, LGID:64141
# Upper Gunnison Water Conservancy District, LGID:64143
# Upper South Platte Water Conservancy, LGID:64145
# Upper Yampa Water Conservancy District, LGID:64146
CopyGeoLayer(GeoLayerID="WaterDistrictsDolaLayer",IncludeFeaturesIf="LGID = '64046' OR LGID = '64054' OR LGID = '64105' OR LGID = '64128' OR LGID = '64141' OR LGID = '64143' OR LGID = '64145' OR LGID = '64146'",OutputGeoLayerID="co-water-conservancy-district-boundaries",Name="Colorado Major Water Conservancy Districts",Description="Colorado major conservancy/conservation districts")
#
# Write the conservancy district file using the general layer file name.
WriteGeoLayerToGeoJSON(GeoLayerID="co-water-conservancy-district-boundaries",OutputFile="../data/latest/co-water-conservancy-district-boundaries.geojson")