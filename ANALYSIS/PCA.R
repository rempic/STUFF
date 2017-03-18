data(iris)
head(iris, 3)


# log transform 
log.ir <- log(iris[, 1:4])
ir.species <- iris[, 5]

# apply PCA - scale. = TRUE is highly 
# advisable, but default is FALSE. 
ir.pca <- prcomp(log.ir,
                 center = TRUE,
                 scale. = TRUE) 
print(ir.pca)

#####
setwd("/Users/Remi/Dropbox/1_WORK/2015/1 - EXPERIMENTS/1 - PROGRESS/20170116_SMAD2_ACTIV_HIGH_CONT/ANALYSIS2/R")

#LOAD DATA
DT0 <- read.delim("statisticsT0.xls", row.names=NULL, quote="")
DT10 <- read.delim("statisticsT10.xls", row.names=NULL, quote="")
DT30 <- read.delim("statisticsT30.xls", row.names=NULL, quote="")
DT60 <- read.delim("statisticsT60.xls", row.names=NULL, quote="")

log.DT60 <- log(DT60[, 39:68])


# total number of attributes/columns
DT =log.DT60
num_cols = dim(DT)[2]

# report the columns with elements to correct
count_numeric_attributes=0
found_attributes = c('')

for(i in 1:num_cols){
  a = is.finite(DT[,i])
  if(length(a[a==FALSE])>0){
    count_numeric_attributes = count_numeric_attributes +1
    found_attributes[count_numeric_attributes] = names(DT[i])
  }
}

print(paste('Number of found attributes with special characters:', count_numeric_attributes))
print(found_attributes)


# total number of attributes/columns
num_cols = dim(DT)[2]

# report the columns with elements to correct
for(i in 1:num_cols){
  if(class(DT[,i])=='numeric' || class(DT[,i])=='integer'){
    a = is.finite(DT[,i])
    DT[,i][a==FALSE]=0
  }
}


DT.pca <- prcomp(DT,center = TRUE,scale. = TRUE) 
DT.species = DT60[,4]

print(DT.pca)

plot(DT.pca, type = "l")
summary(DT.pca)
predict(DT.pca, newdata=tail(DT, 2))


library(devtools)
install_github("ggbiplot", "vqv")

library(ggbiplot)
g <- ggbiplot(DT.pca, obs.scale = 4, var.scale = 4, groups = DT.species, ellipse = TRUE, circle = TRUE)

g <- g + scale_color_discrete(name = '')
g <- g + theme(legend.direction = 'horizontal', 
               legend.position = 'top')
print(g)



require(caret)
trans = preProcess(iris[,1:4], 
                   method=c("BoxCox", "center", 
                            "scale", "pca"))
PC = predict(trans, iris[,1:4])





library("plot3D")
plotPCA <- function(x, nGroup) {
  n <- ncol(x) 
  if(!(n %in% c(2,3))) { # check if 2d or 3d
    stop("x must have either 2 or 3 columns")
  }
  
  fit <- hclust(dist(x), method="complete") # cluster
  groups <- cutree(fit, k=nGroup)
  
  if(n == 3) { # 3d plot
    plot3d(x, col=groups, type="s", size=1, axes=F)
    axes3d(edges=c("x--", "y--", "z"), lwd=3, axes.len=2, labels=FALSE)
    grid3d("x")
    grid3d("y")
    grid3d("z")
  } else { # 2d plot
    maxes <- apply(abs(x), 2, max)
    rangeX <- c(-maxes[1], maxes[1])
    rangeY <- c(-maxes[2], maxes[2])
    plot(x, col=groups, pch=19, xlab=colnames(x)[1], ylab=colnames(x)[2], xlim=rangeX, ylim=rangeY)
    lines(c(0,0), rangeX*2)
    lines(rangeY*2, c(0,0))
  }
}


plotPCA(DT.pca$x[,1:3],DT.species)
