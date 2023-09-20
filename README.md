# GDFusion
Gaussian of Differences: a simple and efficient general image fusion method

Rifat Kurban, rifat.kurban@agu.edu.tr

Please cite this study as:

Kurban, R. (2023). Gaussian of Differences: A Simple and Efficient General Image Fusion Method. Entropy, 25(8), 1215. https://doi.org/10.3390/e25081215

<b>GDFusion_matlabcodes</b> folder contains the Matlab codes of the GD fusion method and image dataset used in the manuscript.

<b>supplementary_materials</b> folder contains the fused images of the dataset and numerical metrics.

Abstract: The separate analysis of images obtained from a single source using different camera settings or spectral bands, whether from one or more than one sensor, is quite difficult. To solve this problem, a single image containing all of the distinctive pieces of information in each source image is generally created by combining the images, a process called image fusion. In this paper, a simple and efficient, pixel-based image fusion method is proposed that relies on weighting the edge information associated with each pixel of all of the source images proportional to the distance from their neighbors by employing a Gaussian filter. The proposed method, Gaussian of differences (GD), was evaluated using multi-modal medical images, multi-sensor visible and infrared images, multi-focus images, and multi-exposure images, and was compared to existing state-of-the-art fusion methods by utilizing objective fusion quality metrics. The parameters of the GD method are further enhanced by employing the pattern search (PS) algorithm, resulting in an adaptive optimization strategy. Extensive experiments illustrated that the proposed GD fusion method ranked better on average than others in terms of objective quality metrics and CPU time consumption.
