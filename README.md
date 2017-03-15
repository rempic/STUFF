# TEST_GIT
Itroduce the subject (a machine learning platform for drug and genetic phenotypic screen)

Why is importatnt ?

What is new?

HOW TO DO IT?

1. Image acquisition, preparation (change name), remove background, etc.... To use images from High content acquisition fo whole slide.
   For the whole slide acquisition I will use OpenSlide library to devide a big acquired area in tails at different magnification.
   
2. Image segmentation to measure the features related to single cells and and multiple cells in different contexts (mitotic cells, cells at the edge, intercellular distance, cellur compaction, neighbouring cells, etc...). I use tassellation of the entire cell population from nuclear segmentation. I use a KD-tree data structure to have an efficient retrieval (log) and spatial retivial of the  the segmented tassellation (voronoi diagram)  

3. measurement of the features , the number of features will be measured from single segmented tassell and contained nuclear segmentation. the data are stored in an SQL database. The feature calculated for a single tassel are:

a. 
b.
c. 


3. Data managment.  clean data, logical organization,  normalization, rescaling  etc

4. machine learning for classification of the tassels in different categories
a. mitotic cells 
b. cells at the edges
c. apoptotic cells  (to do)

The classification task depends on the specific experiment. In this Toy project I will determine hte mitotic cells and cells at the edges. In the first case I will use a neural network and in the second case a logistic regression algorithm. 
The implementation will be done in matlab 

Bias analysis and variance 

validation

4. data analysis and results







To measure the sigle cell features in a large group of screened cells I first segmented the cell nuclei used a tassellation algorithm (i.e., voronoi and ...)

Cellular nuclear marker are widely used to identify ... (show picture)





![Screenshot](screenshot.png)

plot((1:100))
