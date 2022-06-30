# owf-data-us-continental-divide

GeoJSON files for US continental divide, full layer and for each state.
These are useful to directly add the layer to a web application map without processing.

* [Overview](#overview)
* [Repository Contents](#repository-contents)
* [Published Dataset](#published-dataset)
* [Workflow](#workflow)
* [Credits](#credits)
* [License](#license)

------------

## Overiew ##

This is a simple repository containing GeoJSON files for the continental divide,
including the full layer and split out by state.
The layer is created from Hydrologic Unit Code basin boundaries.

## Repository Contents ##

The following are the files in this repository:

```
data/
   continental-divide-co.geojson   Continental divide, in Colorado.
   continental-divide-id.geojson   Continental divide, in Idaho. **ERROR GENERATING**
   continental-divide-mt.geojson   Continental divide, in Montana. **DATASET INCOMPLETE**
   continental-divide-nm.geojson   Continental divide, in New Mexico.
   continental-divide-us.geojson   Continental divide, for US.
   continental-divide-wy.geojson   Continental divide, in Wyoming.
workflow/                          Workflow command files.
   create-layers.gp                GeoProcessor file to create GeoJSON files.
```

## Published Dataset ##

The published dataset files are available in the `data` folder of this repository and also the
[Open Water Foundation data site](https://data.openwaterfoundation.org/country/us/continental-divide/).

## Workflow ##

The following is a summary of the
[OWF GeoProcessor software](http://software.openwaterfoundation.org/)
workflow used to process the data (see the `workflow` folder):

1. The original data layer is retrieved from:
[ArcGIS Web Feature Service](https://www.arcgis.com/home/item.html?id=d704a7555b474b47919695f821d1d18c)
and saved to GeoJSON.
2. The full layer is clipped to each state's boundary and saved as separate GeoJSON files
in the `data` folder.

**This workflow may be updated in the future to create GeoPackage files and other formats.**

## Credits ##

* Original continental divide data, before clipping to state boundaries:
[Continental Divide dataset](https://www.arcgis.com/home/item.html?id=d704a7555b474b47919695f821d1d18c)
* State boundaries for clipping:
[JoshuaCarroll/wkt_all_states.txt](https://gist.github.com/JoshuaCarroll/49630cbeeb254a49986e939a26672e9c)

## License ##

[Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
