## Overview ##

This dataset contains GeoJSON polygon features for Colorado municipal water provider boundaries.
This is a statewide layer.

Water and sanitation districts, metropolitan districts, and other districts
are available from the Colorado Department of Local Affairs (DOLA).
However, this layer does not contain municipal water utilities,
and other entity types such as Denver Water are also be missing.
Consequently, it is necessary to retrieve data from other sources and merge the various
boundaries into one layer.
OWF is working to automate this processing from public sources.
However, the effort is large and focus is currently on the Poudre Basin and surrounding region.

The DOLA data also contain regional districts that do not supply treated water
(e.g., Northern Water and the Colorado River District)
and must be removed from the municipal water providers layer so as to not
obscure other districts.

The workflow to process the dataset will evolve to address the above considerations.

## Downloads ##

The following files can be downloaded or used directly.

| **Layer File** | **Description** | **View** |
| -- | -- | -- |
| [`co-municipal-water-provider-boundaries.geojson`](latest/co-municipal-water-provider-boundaries.geojson) | Colorado municipal water provider boundaries for the entire State (**incomplete**). | [View](https://gavinr.github.io/geojson-viewer/?url=https://data.openwaterfoundation.org/state/co/owf/municipal-water-provider-boundaries/latest/co-municipal-water-provider-boundaries.geojson) |
| [`co-municipal-water-provider-boundaries-districts-only.geojson`](latest/co-municipal-water-provider-boundaries-districts-only.geojson) | Colorado municipal water provider boundaries for the entire State, containing only special districts (no utilities, etc.) (**incomplete**). | [View](https://gavinr.github.io/geojson-viewer/?url=https://data.openwaterfoundation.org/state/co/owf/municipal-water-provider-boundaries/latest/co-municipal-water-provider-boundaries-districts-only.geojson) |
| [`co-water-conservancy-district-boundaries.geojson`](latest/co-water-conservancy-district-boundaries.geojson) | Colorado major water conservancy and conservation districts. | [View](https://gavinr.github.io/geojson-viewer/?url=https://data.openwaterfoundation.org/state/co/owf/municipal-water-provider-boundaries/latest/co-water-conservancy-district-boundaries.geojson) |

The `co-municipal-water-provider-boundaries` dataset **does not include** the following large conservancy and conservation districts
because these districts focus on raw water and, because of their size,
would obscure municipal water provider boundaries.
These organizations typically were formed to operate regional projects such as reservoirs
and to provide a broad range of services.
These districts are included in the `co-water-conservancy-district-boundaries` dataset.

| **District** | **Basin** |
| -- | -- |
| Colorado River Water Conservation District | Colorado |
| Dolores Water Conservancy District | Dolores |
| Northern Water | South Platte |
| Southeastern Colorado Conservancy District | Arkansas |
| Upper Arkansas Water Conservancy District | Arkansas |
| Upper Gunnison Water Conservancy District | Gunnison |
| Upper South Platte Water Conservancy | South Platte |
| Upper Yampa Water Conservancy District | Yampa |

## Workflow ##

See the [`owf-data-co-municipal-water-provider-boundaries`](https://github.com/OpenWaterFoundation/owf-data-co-municipal-water-provider-boundaries)
GitHub repository for information.

## Update Frequency and Versions ##

The dataset is updated periodically using data from the State Department of Local Affairs (DOLA) and other sources.
A single `latest` version is published.
In the future, dated snapshots may be published to help archive data to understand growth.

## Credits ##

* The original dataset shapefiles are downloaded from the State Department of Local Affairs (DOLA)
  [Water and Sanitation District Boundaries, and Metropolitan District Boundaries](https://demography.dola.colorado.gov/assets/html/gis.html) datasets.
* Data for individual organizations have been provided by those organizations, as listed below.
* The Open Water Foundation created and maintains this merged dataset.

Other service area boundary data are taken from the following sources,
with processing workflow specific to the entity:

| **Water Provider** | **Water Provider ID** | **Data Source** |
| -- | -- | -- |
| Arapahoe County Water and Wastewater Authority| `ACWWA` | [KML File from Google Map](https://www.google.com/maps/d/u/0/viewer?mid=1vlGZrFPnhBX-mSSnnkN_T6nJMgU&ll=39.58385025572299%2C-104.805972&z=13)
| Denver Water | `DenverWater` | [GIS data request delivered as shapefile](https://www.denverwater.org/contractors/construction-information/gis-maps-and-data-requests). See the disclaimer below. |
| Fort Collins | `FtCollins` | [Esri Map Server shapefile export](https://gisweb.fcgov.com/HTML5Viewer/index.html?Viewer=Utility%20Districts) |

## License ##

[Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)

See also additional disclaimers in the next section.

## Disclaimers ##

The following disclaimers are associated with specific datasets.

### Denver Water ####

Disclaimer (data and metadata):

The geographic information systems maps, data and metadata contained herein were prepared by the Denver water board for its internal purposes only. The Denver water board provides GS maps, data and metadata as a public service with no claim as to the completeness, usefulness, timeliness or accuracy of its content, positional or otherwise. Denver water and its employees make no warranty, expressed or implied, and assume no legal liability or responsibility for the ability of users to fulfill their intended purposes and accessing or using GIS maps, data or metadata or for omissions and content regarding such. The information provided is presented “as is”, without warranty of any kind, including, but not limited to, the implied warranties of merchantability, fitness for a particular purpose, or non-infringement. Your use of this information is at your own risk. In providing this information or access to it, Denver water assumes no obligation to assist the user in the use of such information or in the development, use, or maintenance of any applications applied to or associated with maps, data or metadata. The GIS material provided to you may contain confidential and or security sensitive information and any sale, reproduction or distribution of this information, or products derived their from, in any format is expressly prohibited. In protecting the provided GIS material from further distribution of any sort you will exercise at least that degree of care used to prevent disclosure, publication or dissemination of your own proprietary information, provided that degree of care is at least reasonable.

## See Also ##

* [Colorado Municipal Boundaries](https://data.openwaterfoundation.org/state/co/dola/municipalit-boundaries) dataset
