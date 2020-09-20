# Download Continental Divide layer from Feature Web Service and clip to individual states.
# State clip boundaries were copied from the following:
#   [JoshuaCarroll/wkt_all_states.txt](https://gist.github.com/JoshuaCarroll/49630cbeeb254a49986e939a26672e9c)
#
# ====================================================
# Full query to retrieve full layer
# - could read directly into a layer but use WebGet to help with troubleshooting
#
# The following
# - does not work as is, requires some type of where, but where=1=1 does not seem to work
#WebGet(URL="https://services.arcgis.com/jIL9msH9OI208GCb/ArcGIS/rest/services/Continental_Divide/FeatureServer/0/query?where=#1%3D1&outFields=*&geometryPrecision=6&f=geojson",OutputFile="../data/continental-divide-us.geojson")
# Query that limits to features intersecting an envelope, for example for Colorado, can use:
#WebGet(URL="https://services.arcgis.com/jIL9msH9OI208GCb/ArcGIS/rest/services/Continental_Divide/FeatureServer/0/query?geometry=-109.05%2C37%2C-102.05%2C41&geometryType=esriGeometryEnvelope&inSR=4326&spatialRel=esriSpatialRelIntersects&outFields=*&geometryPrecision=6&f=geojson",OutputFile="../data/continental-divide-us.geojson")
# Full layer using an envelope that includes the full layer
WebGet(URL="https://services.arcgis.com/jIL9msH9OI208GCb/ArcGIS/rest/services/Continental_Divide/FeatureServer/0/query?geometry=-117%2C30%2C101%2C50&geometryType=esriGeometryEnvelope&inSR=4326&spatialRel=esriSpatialRelContains&outFields=*&geometryPrecision=6&f=geojson",OutputFile="../data/continental-divide-us.geojson")
#
# ====================================================
# Process states north to south
# - first read the US layer
ReadGeoLayerFromGeoJSON(InputFile="../data/continental-divide-us.geojson",GeoLayerID="ContinentalDivideUsLayer",Name="Continental Divide (US)",Description="Continental divide based on Hydrologic Unit Code basins")
#
# ====================================================
# Clip to Montana
# - use a simple WKT geometry for the clip
CreateGeoLayerFromGeometry(NewGeoLayerID="ClipMtLayer",Name="Clip Layer for Montana",Description="Clip layer representing Montana boundary",GeometryFormat="WKT",GeometryData="POLYGON((-111.0512 44.4750,-111.3684 44.7311,-111.5071 44.6198,-111.4673 44.5386,-111.8285 44.5151,-111.8848 44.5592,-112.1127 44.5229,-112.3270 44.5367,-112.3901 44.4475,-112.7293 44.4896,-112.8296 44.4181,-112.8529 44.3563,-113.0205 44.4857,-113.0713 44.5905,-113.1152 44.7389,-113.2471 44.8091,-113.3459 44.7887,-113.4970 44.9386,-113.4229 45.0269,-113.7085 45.2749,-113.7964 45.4447,-113.8403 45.6140,-113.9722 45.6908,-114.1315 45.5631,-114.2358 45.5525,-114.3347 45.4592,-114.4652 45.5439,-114.5668 45.5583,-114.5215 45.6755,-114.5641 45.7733,-114.4391 45.8613,-114.4817 45.9989,-114.5132 46.1237,-114.4652 46.2577,-114.4171 46.3441,-114.3896 46.4530,-114.3484 46.5069,-114.3279 46.6504,-114.4652 46.6334,-114.5929 46.6362,-114.7659 46.7003,-114.9307 46.8423,-115.1147 47.0402,-115.2933 47.1888,-115.3290 47.2569,-115.5267 47.3025,-115.7547 47.4253,-115.7533 47.5487,-115.6956 47.5793,-116.0458 47.9771,-116.0458 48.9991,-104.0501 48.9991,-104.0186 45.0269,-104.0186 45.0153,-104.0199 44.9978,-111.0498 44.9959,-111.0512 44.4750,-111.0512 44.4750))",CRS="EPSG:4326")
ClipGeoLayer(InputGeoLayerID="ContinentalDivideUsLayer",ClippingGeoLayerID="ClipMtLayer",OutputGeoLayerID="ContinentalDivideMtLayer",Name="Continental Divide for Montana",Description="Continental divide for Montana",IfGeoLayerIDExists="Warn")
WriteGeoLayerToGeoJSON(GeoLayerID="ContinentalDivideMtLayer",OutputFile="../data/continental-divide-mt.geojson")
#
# ====================================================
# Clip to Idaho
# - use a simple WKT geometry for the clip
CreateGeoLayerFromGeometry(NewGeoLayerID="ClipIdLayer",Name="Clip Layer for Idaho",Description="Clip layer representing Idaho boundary",GeometryFormat="WKT",GeometryData="POLYGON((-117.0319 49.0000,-116.0486 49.0018,-116.0445 47.9752,-115.6915 47.5765,-115.7574 47.5487,-115.7595 47.4239,-115.5350 47.3109,-115.3235 47.2606,-115.2878 47.1888,-115.2493 47.1542,-115.0433 46.9728,-114.9472 46.8677,-114.7865 46.7201,-114.7549 46.6984,-114.5874 46.6325,-114.4638 46.6325,-114.3279 46.6466,-114.3430 46.5135,-114.3896 46.4530,-114.4144 46.3488,-114.4611 46.2682,-114.5105 46.1227,-114.4418 45.8585,-114.5654 45.7742,-114.5229 45.6745,-114.5654 45.5621,-114.4666 45.5439,-114.3375 45.4601,-114.2441 45.5468,-114.1342 45.5631,-113.9708 45.6889,-113.8403 45.6102,-113.7978 45.4409,-113.7085 45.2720,-113.4256 45.0260,-113.4998 44.9405,-113.3459 44.7887,-113.2471 44.8062,-113.1180 44.7350,-113.0246 44.4887,-112.8502 44.3592,-112.8310 44.4151,-112.7266 44.4887,-112.3901 44.4504,-112.3270 44.5347,-112.1127 44.5220,-111.8848 44.5582,-111.8271 44.5132,-111.4645 44.5396,-111.5057 44.6198,-111.3684 44.7292,-111.0539 44.4759,-111.0471 43.8623,-111.0471 42.0013,-112.1663 41.9962,-113.8458 41.9871,-114.0422 41.9942,-114.8222 42.0013,-115.9126 41.9973,-117.0140 41.9962,-117.0264 42.0013,-117.0277 43.7820,-117.0325 43.8330,-117.0030 43.8632,-116.9776 43.9073,-116.9302 44.0244,-116.9735 44.0491,-116.9330 44.1014,-116.8945 44.1561,-116.9714 44.1965,-116.9810 44.2442,-117.0339 44.2486,-117.0525 44.2304,-117.0895 44.2585,-117.1122 44.2806,-117.1541 44.2590,-117.2255 44.2973,-117.1994 44.3445,-117.2372 44.3813,-117.2269 44.4769,-117.1836 44.5234,-117.1458 44.5376,-117.0442 44.7423,-116.9316 44.7921,-116.8980 44.8568,-116.8327 44.9356,-116.8513 44.9624,-116.8554 44.9896,-116.8417 45.0313,-116.7819 45.0968,-116.7229 45.1627,-116.7105 45.2178,-116.6741 45.3213,-116.6185 45.3984,-116.5883 45.4433,-116.5553 45.4630,-116.5334 45.5371,-116.4640 45.6140,-116.5354 45.6904,-116.5354 45.7340,-116.5594 45.7541,-116.6357 45.7843,-116.5965 45.7781,-116.6597 45.7805,-116.7105 45.8259,-116.7586 45.8159,-116.7908 45.8341,-116.8046 45.8642,-116.8595 45.9053,-116.8739 45.9545,-116.8925 45.9769,-116.9302 46.0218,-116.9838 46.0932,-116.9344 46.1385,-116.9268 46.1727,-116.9646 46.2007,-116.9591 46.2435,-116.9920 46.2782,-117.0209 46.3152,-117.0511 46.3446,-117.0408 46.4270,-117.0394 46.9451,-117.0319 48.9996,-117.0319 49.0000))",CRS="EPSG:4326")
ClipGeoLayer(InputGeoLayerID="ContinentalDivideUsLayer",ClippingGeoLayerID="ClipIdLayer",OutputGeoLayerID="ContinentalDivideIdLayer",Name="Continental Divide for Idaho",Description="Continental divide for Idaho",IfGeoLayerIDExists="Warn")
WriteGeoLayerToGeoJSON(GeoLayerID="ContinentalDivideIdLayer",OutputFile="../data/continental-divide-id.geojson")
#
# ====================================================
# Clip to Wyoming
# - use a simple WKT geometry for the clip
CreateGeoLayerFromGeometry(NewGeoLayerID="ClipWyLayer",Name="Clip Layer for Wyoming",Description="Clip layer representing Wyoming boundary",GeometryFormat="WKT",GeometryData="POLYGON((-104.0556 41.0037,-104.0584 44.9949,-111.0539 44.9998,-111.0457 40.9986,-104.0556 41.0006,-104.0556 41.0037))",CRS="EPSG:4326")
ClipGeoLayer(InputGeoLayerID="ContinentalDivideUsLayer",ClippingGeoLayerID="ClipWyLayer",OutputGeoLayerID="ContinentalDivideWyLayer",Name="Continental Divide for Wyoming",Description="Continental divide for Wyoming",IfGeoLayerIDExists="Warn")
WriteGeoLayerToGeoJSON(GeoLayerID="ContinentalDivideWyLayer",OutputFile="../data/continental-divide-wy.geojson")
#
# ====================================================
# Clip to Colorado
# - use a simple WKT geometry for the clip
CreateGeoLayerFromGeometry(NewGeoLayerID="ClipCoLayer",Name="Clip Layer for Colorado",Description="Clip layer representing Colorado boundary",GeometryFormat="WKT",GeometryData="POLYGON((-109.0448 37.00,-102.0424 37.00,-102.0534 41.0,-109.0489 41.0,-109.0448 37.0,-109.0448 37.0))",CRS="EPSG:4326")
ClipGeoLayer(InputGeoLayerID="ContinentalDivideUsLayer",ClippingGeoLayerID="ClipCoLayer",OutputGeoLayerID="ContinentalDivideCoLayer",Name="Continental Divide for Colorado",Description="Continental divide for Colorado",IfGeoLayerIDExists="Warn")
WriteGeoLayerToGeoJSON(GeoLayerID="ContinentalDivideCoLayer",OutputFile="../data/continental-divide-co.geojson")
#
# ====================================================
# Clip to New Mexico
# - use a simple WKT geometry for the clip
CreateGeoLayerFromGeometry(NewGeoLayerID="ClipNmLayer",Name="Clip Layer",Description="Clip layer representing New Mexico boundary",GeometryFormat="WKT",GeometryData="POLYGON((-109.0448 36.9971,-109.0489 31.3337,-108.2140 31.3349,-108.2071 31.7795,-106.5317 31.7830,-106.6223 32.0034,-103.0696 31.9999,-103.0023 36.9982,-109.0475 36.9982,-109.0448 36.9971))",CRS="EPSG:4326")
ClipGeoLayer(InputGeoLayerID="ContinentalDivideUsLayer",ClippingGeoLayerID="ClipNmLayer",OutputGeoLayerID="ContinentalDivideNmLayer",Name="Continental Divide for New Mexico",Description="Continental divide for New Mexico",IfGeoLayerIDExists="Warn")
WriteGeoLayerToGeoJSON(GeoLayerID="ContinentalDivideNmLayer",OutputFile="../data/continental-divide-nm.geojson")
