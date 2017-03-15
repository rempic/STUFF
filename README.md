# TEST_GIT
Itroduce the subject (a machine learning platform for drug and genetic phenotypic screen)

Why is importatnt ?

What is new?

HOW TO DO IT?

1. Image acquisition, preparation (change name), remove background, etc.... To use images from High content acquisition fo whole slide.
   For the whole slide acquisition I will use OpenSlide library to devide a big acquired area in tails at different magnification.
   
2. Image segmentation to measure the features related to single cells and and multiple cells in different contexts (mitotic cells, cells at the edge, intercellular distance, cellur compaction, neighbouring cells, etc...). I use tassellation of the entire cell population from nuclear segmentation

3. measurement of the features , the number of features will be measured from single segmented tassell and contained nuclear segmentation. The feature calculated for a single tassel are:

a. 
b.
c. 





To measure the sigle cell features in a large group of screened cells I first segmented the cell nuclei used a tassellation algorithm (i.e., voronoi and ...)

Cellular nuclear marker are widely used to identify ... (show picture)





![Screenshot](screenshot.png)

plot((1:100))
