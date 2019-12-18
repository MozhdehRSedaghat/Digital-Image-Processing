//Mozhdeh Rouhsedaghat
//2726554211
//rouhseda@usc.edu
//1/22/2019

#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <math.h>

using namespace std;

int main(int argc, char *argv[])
{

    int size1=300,
        size2=390,
        sizerose=400,
        BytesPerPixel=1,
        BytesPerPixel3=3,
        i,j,k,m,n,temp;
    FILE *file;
    unsigned char Imagedata[size1][size2][BytesPerPixel],
             outputImagedata[size1][size2][BytesPerPixel3],
             outputImagedata2[size1][size2][BytesPerPixel3],
             inputrose1[sizerose][sizerose][BytesPerPixel],
             inputrose2[sizerose][sizerose][BytesPerPixel],
             inputrose3[sizerose][sizerose][BytesPerPixel],
             outputrose1[sizerose][sizerose][BytesPerPixel],
             outputrose2[sizerose][sizerose][BytesPerPixel],
             outputrose3[sizerose][sizerose][BytesPerPixel];

    int extendedImagedata[size1+4][size2+4][BytesPerPixel],rosecopy[sizerose][sizerose][BytesPerPixel];

    int pdf1[256]= {0}, pdf2[256]= {0}, cdf1[256]= {0}, cdf2[256]= {0}, pdf3[256]= {0}, cdf3[256]= {0}, sortedByPixelVal[400*400*2]= {0};

    char strInputFile[]  = "cat.raw";
    char strOutputFile1[] = "outputcat1.raw";
    char strOutputFile2[] = "outputcat2.raw";
    char strInputFile2[] = "rose_dark.raw";
    char strInputFile3[] = "rose_bright.raw";
    char strOutputFile3[] = "outputrose_dark_tf.raw";
    char strOutputFile4[] = "outputrose_dark_cp.raw";
    char strOutputFile5[] = "outputrose_bright_tf.raw";
    char strOutputFile6[] = "outputrose_bright_cp.raw";
    char strInputFile7[] = "rose_mix.raw";
    char strOutputFile8[] = "outputrose_mix_tf.raw";
    char strOutputFile9[] = "outputrose_mix_cp.raw";



    if (!(file=fopen(strInputFile,"rb")))//reading the input file
    {
        cout << "Cannot open file: " << strInputFile <<endl;
        exit(1);
    }
    fread(Imagedata, sizeof(unsigned char), size1*size2*1, file);
    fclose(file);

    for(i=2; i<=size1+1; i++)//creating extended image data
    {
        for(j=2; j<=size2+1; j++)
        {
            extendedImagedata[i][j][0]=Imagedata[i-2][j-2][0];
        }
    }
    for(i=2; i<=size1+1; i++)
    {
        extendedImagedata[i][0][0]=Imagedata[i-2][2][0];
        extendedImagedata[i][1][0]=Imagedata[i-2][1][0];
        extendedImagedata[i][size2+2][0]=Imagedata[i-2][size2-2][0];
        extendedImagedata[i][size2+3][0]=Imagedata[i-2][size2-3][0];
    }
    for(j=2; j<=size2+1; j++)
    {
        extendedImagedata[0][j][0]=Imagedata[2][j-2][0];
        extendedImagedata[1][j][0]=Imagedata[1][j-2][0];
        extendedImagedata[size1+2][j][0]=Imagedata[size1-2][j-2][0];
        extendedImagedata[size1+3][j][0]=Imagedata[size1-3][j-2][0];
    }


    for(i=0; i<size1; i++)//red channel creation
    {
        if(i%2==0)
        {
            for(j=0; j<size2; j++)
            {
                if(j%2==0)
                    outputImagedata[i][j][0]=(extendedImagedata[i+2][j+1][0]+extendedImagedata[i+2][j+3][0])/2;
                else
                    outputImagedata[i][j][0]=extendedImagedata[i+2][j+2][0];
            }
        }
        else
        {
            for(j=0; j<size2; j++)
            {
                if(j%2==0)
                    outputImagedata[i][j][0]=(extendedImagedata[i+1][j+3][0]+
                                              extendedImagedata[i+1][j+1][0]+
                                              extendedImagedata[i+3][j+3][0]+
                                              extendedImagedata[i+3][j+1][0])/4;
                else
                    outputImagedata[i][j][0]=(extendedImagedata[i+1][j+2][2]+extendedImagedata[i+3][j+2][2])/2;
            }
        }
    }
    for(i=0; i<size1; i++)//green channel creation
    {
        if(i%2==0)
        {
            for(j=0; j<size2; j++)
            {
                if(j%2==0)
                    outputImagedata[i][j][1]=extendedImagedata[i+2][j+2][0];
                else
                    outputImagedata[i][j][1]=(extendedImagedata[i+1][j+2][0]+
                                              extendedImagedata[i+2][j+1][0]+
                                              extendedImagedata[i+2][j+3][0]+
                                              extendedImagedata[i+3][j+2][0])/4;
            }
        }
        else
        {
            for(j=0; j<size2; j++)
            {
                if(j%2==0)
                    outputImagedata[i][j][1]=(extendedImagedata[i+1][j+2][0]+
                                              extendedImagedata[i+2][j+1][0]+
                                              extendedImagedata[i+2][j+3][0]+
                                              extendedImagedata[i+3][j+2][0])/4;
                else
                    outputImagedata[i][j][1]=extendedImagedata[i+2][j+2][0];
            }
        }
    }
    for(i=0; i<size1; i++)//blue channel creation
    {
        if(i%2==0)
        {
            for(j=0; j<size2; j++)
            {
                if(j%2==0)
                    outputImagedata[i][j][2]=(extendedImagedata[i+1][j+2][0]+extendedImagedata[i+3][j+2][0])/2;
                else
                    outputImagedata[i][j][2]=(extendedImagedata[i+1][j+3][0]+
                                              extendedImagedata[i+1][j+1][0]+
                                              extendedImagedata[i+3][j+3][0]+
                                              extendedImagedata[i+3][j+1][0])/4;/////////
            }
        }
        else
        {
            for(j=0; j<size2; j++)
            {
                if(j%2==0)
                    outputImagedata[i][j][2]=extendedImagedata[i+2][j+2][0];
                else
                    outputImagedata[i][j][2]=(extendedImagedata[i+2][j+1][0]+extendedImagedata[i+2][j+3][0])/2;
            }
        }
    }


    if (!(file=fopen(strOutputFile1,"wb")))//writing to the output file
    {
        cout << "Cannot open file: " << strOutputFile1 << endl;
        exit(1);
    }
    fwrite(outputImagedata, sizeof(unsigned char), size1*size2*BytesPerPixel3, file);
    fclose(file);

///////////////////////*****PARTB******//////////////////////////

    for(i=0; i<size1; i++)//red channel creation
    {
        if(i%2==0)
        {
            for(j=0; j<size2; j++)
            {
                if(j%2==0)
                    outputImagedata2[i][j][0]=abs(4*extendedImagedata[i+2][j+1][0]+
                                                  4*extendedImagedata[i+2][j+3][0]+
                                                  5*extendedImagedata[i+2][j+2][0]-
                                                  extendedImagedata[i+1][j+1][0]-
                                                  extendedImagedata[i+3][j+1][0]-
                                                  extendedImagedata[i+1][j+3][0]-
                                                  extendedImagedata[i+3][j+3][0]-
                                                  extendedImagedata[i+2][j][0]-
                                                  extendedImagedata[i+2][j+4][0]+
                                                  .5*extendedImagedata[i][j+2][0]+
                                                  .5*extendedImagedata[i+4][j+2][0])/8;
                else
                    outputImagedata2[i][j][0]=extendedImagedata[i+2][j+2][0];
            }
        }
        else
        {
            for(j=0; j<size2; j++)
            {
                if(j%2==0)
                    outputImagedata2[i][j][0]=abs(2*extendedImagedata[i+1][j+3][0]+
                                                  2*extendedImagedata[i+1][j+1][0]+
                                                  2*extendedImagedata[i+3][j+3][0]+
                                                  2*extendedImagedata[i+3][j+1][0]+
                                                  6*extendedImagedata[i+2][j+2][0]-
                                                  1.5*extendedImagedata[i][j+2][0]-
                                                  1.5*extendedImagedata[i+2][j][0]-
                                                  1.5*extendedImagedata[i+4][j+2][0]-
                                                  1.5*extendedImagedata[i+2][j+4][0])/8;
                else
                    outputImagedata2[i][j][0]=abs(4*extendedImagedata[i+1][j+2][2]+4*extendedImagedata[i+3][j+2][2]+
                                                  5*extendedImagedata[i+2][j+2][0]-
                                                  extendedImagedata[i+1][j+1][0]-
                                                  extendedImagedata[i+3][j+1][0]-
                                                  extendedImagedata[i+1][j+3][0]-
                                                  extendedImagedata[i+3][j+3][0]+
                                                  .5*extendedImagedata[i+2][j][0]+
                                                  .5*extendedImagedata[i+2][j+4][0]-
                                                  extendedImagedata[i][j+2][0]-
                                                  extendedImagedata[i+4][j+2][0])/8;

            }
        }
    }
    for(i=0; i<size1; i++)//green channel creation
    {
        if(i%2==0)
        {
            for(j=0; j<size2; j++)
            {
                if(j%2==0)
                    outputImagedata2[i][j][1]=extendedImagedata[i+2][j+2][0];
                else
                    outputImagedata2[i][j][1]=abs(2*extendedImagedata[i+1][j+2][0]+
                                                  2*extendedImagedata[i+2][j+1][0]+
                                                  2*extendedImagedata[i+2][j+3][0]+
                                                  2*extendedImagedata[i+3][j+2][0]+
                                                  4*extendedImagedata[i+2][j+2][0]-
                                                  extendedImagedata[i+2][j][0]-
                                                  extendedImagedata[i][j+2][0]-
                                                  extendedImagedata[i+2][j+4][0]-
                                                  extendedImagedata[i+4][j+2][0])/8;
            }
        }
        else
        {
            for(j=0; j<size2; j++)
            {
                if(j%2==0)
                    outputImagedata2[i][j][1]=abs(2*extendedImagedata[i+1][j+2][0]+
                                                  2*extendedImagedata[i+2][j+1][0]+
                                                  2*extendedImagedata[i+2][j+3][0]+
                                                  2*extendedImagedata[i+3][j+2][0]+
                                                  4*extendedImagedata[i+2][j+2][0]-
                                                  extendedImagedata[i+2][j][0]-
                                                  extendedImagedata[i][j+2][0]-
                                                  extendedImagedata[i+2][j+4][0]-
                                                  extendedImagedata[i+4][j+2][0])/8;
                else
                    outputImagedata2[i][j][1]=extendedImagedata[i+2][j+2][0];
            }
        }
    }
    for(i=0; i<size1; i++)//blue channel creation
    {
        if(i%2==0)
        {
            for(j=0; j<size2; j++)
            {
                if(j%2==0)
                    outputImagedata2[i][j][2]=abs(4*extendedImagedata[i+1][j+2][0]+4*extendedImagedata[i+3][j+2][0]+
                                                  5*extendedImagedata[i+2][j+2][0]-
                                                  extendedImagedata[i+1][j+1][0]-
                                                  extendedImagedata[i+3][j+1][0]-
                                                  extendedImagedata[i+1][j+3][0]-
                                                  extendedImagedata[i+3][j+3][0]+
                                                  .5*extendedImagedata[i+2][j][0]+
                                                  .5*extendedImagedata[i+2][j+4][0]-
                                                  extendedImagedata[i][j+2][0]-
                                                  extendedImagedata[i+4][j+2][0])/8;
                else
                    outputImagedata2[i][j][2]=abs(2*extendedImagedata[i+1][j+3][0]+
                                                  2*extendedImagedata[i+1][j+1][0]+
                                                  2*extendedImagedata[i+3][j+3][0]+
                                                  2*extendedImagedata[i+3][j+1][0]+
                                                  6*extendedImagedata[i+2][j+2][0]-
                                                  1.5*extendedImagedata[i][j+2][0]-
                                                  1.5*extendedImagedata[i+2][j][0]-
                                                  1.5*extendedImagedata[i+4][j+2][0]-
                                                  1.5*extendedImagedata[i+2][j+4][0])/8;/////////
            }
        }
        else
        {
            for(j=0; j<size2; j++)
            {
                if(j%2==0)
                    outputImagedata2[i][j][2]=extendedImagedata[i+2][j+2][0];
                else
                    outputImagedata2[i][j][2]=abs(4*extendedImagedata[i+2][j+1][0]+4*extendedImagedata[i+2][j+3][0]+
                                                  5*extendedImagedata[i+2][j+2][0]-
                                                  extendedImagedata[i+1][j+1][0]-
                                                  extendedImagedata[i+3][j+1][0]-
                                                  extendedImagedata[i+1][j+3][0]-
                                                  extendedImagedata[i+3][j+3][0]-
                                                  extendedImagedata[i+2][j][0]-
                                                  extendedImagedata[i+2][j+4][0]+
                                                  .5*extendedImagedata[i][j+2][0]+
                                                  .5*extendedImagedata[i+4][j+2][0])/8;
            }
        }
    }


    if (!(file=fopen(strOutputFile2,"wb")))//writing to the output file
    {
        cout << "Cannot open file: " << strOutputFile2 << endl;
        exit(1);
    }
    fwrite(outputImagedata2, sizeof(unsigned char), size1*size2*BytesPerPixel3, file);
    fclose(file);

///////////////////////*****PARTC******//////////////////////////

    if (!(file=fopen(strInputFile2,"rb")))//reading the input file
    {
        cout << "Cannot open file: " << strInputFile2 <<endl;
        exit(1);
    }
    fread(inputrose1, sizeof(unsigned char), sizerose*sizerose*1, file);
    fclose(file);

    if (!(file=fopen(strInputFile3,"rb")))//reading the input file
    {
        cout << "Cannot open file: " << strInputFile3 <<endl;
        exit(1);
    }
    fread(inputrose2, sizeof(unsigned char), sizerose*sizerose*1, file);
    fclose(file);

    for(i=0; i<256; i++)//calculating pdf and cdf for dark rose
        for(j=0; j<sizerose; j++)
            for(k=0; k<sizerose; k++)
                if(inputrose1[j][k][0]==i)
                    pdf1[i]++;
    cdf1[0]=pdf1[0];
    for(i=1; i<256; i++)
        cdf1[i]=cdf1[i-1]+pdf1[i];


    for(i=0; i<256; i++)//calculating pdf and cdf for bright rose
        for(j=0; j<sizerose; j++)
            for(k=0; k<sizerose; k++)
                if(inputrose2[j][k][0]==i)
                    pdf2[i]++;
    cdf2[0]=pdf2[0];
    for(i=1; i<256; i++)
        cdf2[i]=cdf2[i-1]+pdf2[i];

    for(i=0; i<256; i++)//calculating output of method1 for dark rose
    {
        temp=round(((double)cdf1[i]-cdf1[0])*255/(sizerose*sizerose-cdf1[0]));
        for(j=0; j<sizerose; j++)
            for(k=0; k<sizerose; k++)
                if(inputrose1[j][k][0]==i)
                    outputrose1[j][k][0]=temp;
    }

    for(i=0; i<256; i++)//calculating output of method1 for bright rose
    {
        temp=round(((double)cdf2[i]-cdf2[0])*255/(sizerose*sizerose-cdf2[0]));
        for(j=0; j<sizerose; j++)
            for(k=0; k<sizerose; k++)
                if(inputrose2[j][k][0]==i)
                    outputrose2[j][k][0]=temp;
    }


    if (!(file=fopen(strOutputFile3,"wb")))//writing the output of applying method1 for dark rose to the output file
    {
        cout << "Cannot open file: " << strOutputFile3 << endl;
        exit(1);
    }
    fwrite(outputrose1, sizeof(unsigned char), sizerose*sizerose*BytesPerPixel, file);
    fclose(file);


    if (!(file=fopen(strOutputFile5,"wb")))//writing the output of applying method1 for bright rose to the output file
    {
        cout << "Cannot open file: " << strOutputFile5 << endl;
        exit(1);
    }
    fwrite(outputrose2, sizeof(unsigned char), sizerose*sizerose*BytesPerPixel, file);
    fclose(file);

    //calculating calculating output of method2 for dark rose
    /* m=0,n=0;
     for(k=0;k<256;k++)
     {
     temp=0;
     for(;cdf1[m]<(k+1)*625;m++)
     {
     for(i=0; i<sizerose; i++)
     for(j=0; j<sizerose; j++)
     if(inputrose1[i][j][0]==m)
         {outputrose1[i][j][0]=k;
         temp++
         break;
         }
     }

     }*/
    for(i=0; i<sizerose; i++)//copying image
        for(j=0; j<sizerose; j++)
            rosecopy[i][j][0]=inputrose1[i][j][0];

    //sort in sortedByPixelVal
    m=-1,n=-1;
    for(k=0; k<sizerose*sizerose; k++)
    {
        temp=256;
        for(i=0; i<sizerose; i++)
            for(j=0; j<sizerose; j++)
                if(rosecopy[i][j][0]<temp)
                {

                    temp=rosecopy[i][j][0];
                    m=i;
                    n=j;
                }
        rosecopy[m][n][0]=256;
        sortedByPixelVal[2*k]=m;
        sortedByPixelVal[2*k+1]=n;
    }

    for(i=0; i<256; i++)
        for(j=0; j<625; j++)
        {
            m=sortedByPixelVal[2*(i*625+j)];
            n=sortedByPixelVal[2*(i*625+j)+1];
            outputrose1[m][n][0]=i;
        }

    for(i=0; i<sizerose; i++)//copying image
        for(j=0; j<sizerose; j++)
            rosecopy[i][j][0]=inputrose2[i][j][0];

//sort in sortedByPixelVal
    m=-1,n=-1;
    for(k=0; k<sizerose*sizerose; k++)
    {
        temp=256;
        for(i=0; i<sizerose; i++)
            for(j=0; j<sizerose; j++)
                if(rosecopy[i][j][0]<temp)
                {

                    temp=rosecopy[i][j][0];
                    m=i;
                    n=j;
                }
        rosecopy[m][n][0]=256;
        sortedByPixelVal[2*k]=m;
        sortedByPixelVal[2*k+1]=n;
    }
    for(i=0; i<256; i++)
        for(j=0; j<625; j++)
        {
            m=sortedByPixelVal[2*(i*625+j)];
            n=sortedByPixelVal[2*(i*625+j)+1];
            outputrose2[m][n][0]=i;
        }


    if (!(file=fopen(strOutputFile4,"wb")))//writing output of method1 for dark rose to the output file
    {
        cout << "Cannot open file: " << strOutputFile4 << endl;
        exit(1);
    }
    fwrite(outputrose1, sizeof(unsigned char), sizerose*sizerose*BytesPerPixel, file);
    fclose(file);

    if (!(file=fopen(strOutputFile6,"wb")))//writing output of method1 for dark rose to the output file
    {
        cout << "Cannot open file: " << strOutputFile6 << endl;
        exit(1);
    }
    fwrite(outputrose2, sizeof(unsigned char), sizerose*sizerose*BytesPerPixel, file);
    fclose(file);




    if (!(file=fopen(strInputFile7,"rb")))//reading the input file
    {
        cout << "Cannot open file: " << strInputFile3 <<endl;
        exit(1);
    }
    fread(inputrose3, sizeof(unsigned char), sizerose*sizerose*1, file);
    fclose(file);

    for(i=0; i<256; i++)//calculating pdf and cdf for mix rose
        for(j=0; j<sizerose; j++)
            for(k=0; k<sizerose; k++)
                if(inputrose3[j][k][0]==i)
                    pdf3[i]++;
    cdf3[0]=pdf3[0];
    for(i=1; i<256; i++)
        cdf3[i]=cdf3[i-1]+pdf3[i];

    for(i=0; i<256; i++)//calculating output of method1 for mix rose
    {
        temp=round(((double)cdf3[i]-cdf3[0])*255/(sizerose*sizerose-cdf3[0]));
        for(j=0; j<sizerose; j++)
            for(k=0; k<sizerose; k++)
                if(inputrose3[j][k][0]==i)
                    outputrose3[j][k][0]=temp;
    }

    if (!(file=fopen(strOutputFile8,"wb")))//writing output of method1 for dark rose to the output file
    {
        cout << "Cannot open file: " << strOutputFile8 << endl;
        exit(1);
    }
    fwrite(outputrose3, sizeof(unsigned char), sizerose*sizerose*BytesPerPixel, file);
    fclose(file);

    for(i=0; i<sizerose; i++)//copying image
        for(j=0; j<sizerose; j++)
            rosecopy[i][j][0]=inputrose3[i][j][0];

    //sort in sortedByPixelVal
    m=-1,n=-1;
    for(k=0; k<sizerose*sizerose; k++)
    {
        temp=256;
        for(i=0; i<sizerose; i++)
            for(j=0; j<sizerose; j++)
                if(rosecopy[i][j][0]<temp)
                {

                    temp=rosecopy[i][j][0];
                    m=i;
                    n=j;
                }
        rosecopy[m][n][0]=256;
        sortedByPixelVal[2*k]=m;
        sortedByPixelVal[2*k+1]=n;
    }

    for(i=0; i<256; i++)
        for(j=0; j<625; j++)
        {
            m=sortedByPixelVal[2*(i*625+j)];
            n=sortedByPixelVal[2*(i*625+j)+1];
            outputrose3[m][n][0]=i;
        }

    if (!(file=fopen(strOutputFile9,"wb")))//writing output of method2 for mix rose to the output file
    {
        cout << "Cannot open file: " << strOutputFile9 << endl;
        exit(1);
    }
    fwrite(outputrose3, sizeof(unsigned char), sizerose*sizerose*BytesPerPixel, file);
    fclose(file);
    return 0;
}
