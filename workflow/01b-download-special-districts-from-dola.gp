StartLog(LogFile="results/01b-download-special-districts-from-dola.gp.log")
# Download statewide water and sanitation districts boundary polygon layer from DOLA.
# - datasets are on the data.openwaterfoundation.org website, created from DOLA data
# - this should only need to be run periodically
# - save downloaded files in 'downloads/' and copy the results to the '../data/latest' folder
#
# Download the full DOLA special districts layer:
# - the full special districts layer includes water & sanitation districts, and metropolitan districts
# - the layer is filtered by the OWF water providers dataset
# - use a name and description for Water and Sanitation Districts

ReadGeoLayerFromGeoJSON(InputFile="https://data.openwaterfoundation.org/state/co/dola/district-boundaries/latest/co-special-districts.geojson",GeoLayerID="co-special-districts",Name="Water and Sanitation Districts",Description="Water and Sanitation Districts, from DOLA")
WebGet(URL="https://data.openwaterfoundation.org/state/co/owf/municipal-water-providers/co-municipal-water-providers.csv",OutputFile="downloads/co-municipal-water-providers.csv")

#
# Copy the initial water districts layer so it can be filtered down to only water and sanitation
# and metropolitan districts.
# - start with the layer that has the most boundaries
CopyGeoLayer(GeoLayerID="co-special-districts",OutputGeoLayerID="co-municipal-water-provider-boundaries-districts-only")

# Read the list of identifiers to include in the model:
# - read DOLA_LG_ID as a string to preserve leading zero
# ReadTableFromDelimitedFile(InputFile="data/water-entities-master-list2.csv",TableID="WaterProvidersTable",TextColumns="DOLA_LG_ID_Full")
ReadTableFromDelimitedFile(InputFile="downloads/co-municipal-water-providers.csv",TableID="WaterProvidersTable",TextColumns="DOLA_LG_ID")
# Remove features that do not match the list of entities of interest for the analyiss.
# RemoveGeoLayerFeatures(GeoLayerID="SpecialDistrictsLayer",MatchAttribute="LGID",IncludeTableID="WaterProvidersTable",IncludeTableColumn="DOLA_LG_ID_Full")
#RemoveGeoLayerFeatures(GeoLayerID="SpecialDistrictsLayer",MatchAttribute="LGID",IncludeTableID="WaterProvidersTable",IncludeTableColumn="DOLA_LG_ID")
#RemoveGeoLayerFeatures(GeoLayerID="WaterProvidersLayer",MatchAttribute="lgid",IncludeTableID="WaterProvidersTable",IncludeTableColumn="DOLA_LG_ID_Full")
RemoveGeoLayerFeatures(GeoLayerID="co-municipal-water-provider-boundaries-districts-only",MatchAttribute="LGID",IncludeTableID="WaterProvidersTable",IncludeTableColumn="DOLA_LG_ID")

# Write to the '../data/latest' folder:
# - only includes special districts but not utilites, companies, etc.
WriteGeoLayerToGeoJSON(GeoLayerID="co-municipal-water-provider-boundaries-districts-only",OutputFile="../data/latest/co-municipal-water-provider-boundaries-districts-only.geojson")