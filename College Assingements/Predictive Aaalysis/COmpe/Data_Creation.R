library(oro.dicom)
library(EBImage)

#setting my code to work to sample directory
setwd("C:/Users/mnave/Desktop/train") #path
header_data <- read.csv(file = "sample_header.csv",header = TRUE) #path
image_df=data.frame()
header_df=data.frame()


for(k in 1:length(patient_list))
{  
  
patient_list=list.files("./sample_images/") #path
images_list=list.files(paste("./sample_images/",patient_list[k],sep = "")) #path
z=array(dim=c(length(images_list),32,32))


for (i in 1:length(images_list))
{
  dicom_image=paste("./sample_images/",patient_list[k],"/",images_list[i],sep="") #path
  mydata=readDICOMFile(dicom_image)
  y=resize(t(mydata$img), w=32,h=32) 
  z[i,,]=imageData(y)
  names(z[i,,])=images_list[i]
  rm(mydata)
  rm(y)
}

header_df <- data.frame()
#clubbing header and image files
for (j in 1:length(images_list))
{
  
temp<-header_data[header_data$image_id==images_list[j],c("PatientID","SliceLocation","image_id")]
  row.names(temp)<- NULL
  header_df <- rbind(header_df,temp)
}

if(k==1)
{ p2=as.data.frame(z)
colnames(header_df)<-c("PatientID","SliceLocation","image_id") 
p2 <- cbind(header_df,p2)
p1=p2
}
else
{
  p2=as.data.frame(z)
  p2 <- cbind(header_df,p2)
  p1=rbind(p1,p2)
}
  




#header_data[header_data$image_id==p,c("PatientID","SliceLocation","image_id")]
}
write.csv(p1,"C:\\Users\\mnave\\Desktop\\test.csv")















