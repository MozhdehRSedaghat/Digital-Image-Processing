#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <cmath>

using namespace std;

int median(int filter[],int N)
{
    int i,j,temp;

    for(i=0; i<N; i++)
        for(j=0; j<N-1; j++)
            if(filter[j]>filter[j+1])
            {
                temp=filter[j];
                filter[j]=filter[j+1];
                filter[j+1]=temp;
            }

    if(N%2==1)
        return filter[(N-1)/2];
    else
        return (filter[(N-1)/2] + filter[N/2])/2;
}

int main()
{
    int size1=256,
        size2=256,
        BytesPerPixel=1,
        BytesPerPixel3=3,
        i,j,m,n,N,Nn,n1,n2;
    double temp,num,Oc,Os,w,h,a;

    FILE *file;

    unsigned char Imagedata0[size1][size2][BytesPerPixel],
             Imagedata[size1][size2][BytesPerPixel],
             outImagedata[size1][size2][BytesPerPixel],
             Imagedata0color[size1][size2][BytesPerPixel3],
             Imagedatacolor[size1][size2][BytesPerPixel3],
             Imagedatacolor2[size1][size2][BytesPerPixel3],
             outImagedatacolor[size1][size2][BytesPerPixel3];

    double data [size1][size2],data2 [size1][size2];

    char strInputFile0[]  = "pepper.raw";
    char strInputFile1[]  = "pepper_uni.raw";
    char strOutputFile1[] = "pepper_denoised_uni1.raw";
    char strOutputFile2[] = "pepper_denoised_uni2.raw";
    char strOutputFile3[] = "pepper_denoised_uni3.raw";
    char strOutputFile4[] = "pepper_denoised_gau1.raw";
    char strOutputFile5[] = "pepper_denoised_gau2.raw";
    char strOutputFile6[] = "pepper_denoised_gau3.raw";
    char strOutputFile7[] = "pepper_denoised_gau4.raw";
    char strOutputFile8[] = "pepper_denoised_bilateral.raw";
    char strOutputFile9[] = "pepper_denoised_NLM.raw";
    char strInputFile2[]  = "rose_color.raw";
    char strInputFile3[]  = "rose_color_noise.raw";
    char strOutputFile10[] = "rose_denoise.raw";
    char strInputFile4[] =  "pepper_dark.raw";
    char strInputFile5[] =  "pepper_dark_noise.raw";
    char strOutputFile11[] = "pepper_dark_denoised.raw";

    if (!(file=fopen(strInputFile1,"rb")))//reading the input file
    {
        cout << "Cannot open file: " << strInputFile1 <<endl;
        exit(1);
    }
    fread(Imagedata, sizeof(unsigned char), size1*size2*BytesPerPixel, file);
    fclose(file);

    if (!(file=fopen(strInputFile0,"rb")))//reading the input file
    {
        cout << "Cannot open file: " << strInputFile0 <<endl;
        exit(1);
    }
    fread(Imagedata0, sizeof(unsigned char), size1*size2*BytesPerPixel, file);
    fclose(file);

    //computing PSNR
    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((Imagedata[i][j][0]-Imagedata0[i][j][0]),2);
    temp=temp/(double)(size1*size2);
    cout<<"PSNR of the initial noisy image: "<<10*log10(255.0*255.0/temp)<<endl;

    ///////////////Mean Filter///////////////
    N=3;

    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            data[i][j]=0;

    for(i=0; i<size1; i++)
    {
        for(j=0; j<size2; j++)
        {
            num=0;
            for(m=-(N-1)/2; m<=(N-1)/2; m++)
                for(n=-(N-1)/2; n<=(N-1)/2; n++)
                    if(i+m>=0&&j+n>=0&&i+m<=size1-1&&j+n<=size2-1)
                    {
                        data[i][j]+=Imagedata[i+m][j+n][0];
                        num++;
                    }
            data[i][j]/=num;

        }
    }

    //copying
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            outImagedata[i][j][0]=data[i][j];

    //computing PSNR
    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((outImagedata[i][j][0]-Imagedata0[i][j][0]),2);
    temp=temp/(double)(size1*size2);
    cout<<"PSNR after applying the mean filter with N=3:    "<<10*log10(255.0*255.0/temp)<<endl;

    //writing to the output file
    if (!(file=fopen(strOutputFile1,"wb")))
    {
        cout << "Cannot open file: " << strOutputFile1 << endl;
        exit(1);
    }
    fwrite(outImagedata, sizeof(unsigned char), size1*size2*BytesPerPixel, file);
    fclose(file);

    /////////////////***////////////////////

    N=5;

    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            data[i][j]=0;

    for(i=0; i<size1; i++)
    {
        for(j=0; j<size2; j++)
        {
            num=0;
            for(m=-(N-1)/2; m<=(N-1)/2; m++)
                for(n=-(N-1)/2; n<=(N-1)/2; n++)
                    if(i+m>=0&&j+n>=0&&i+m<=size1-1&&j+n<=size2-1)
                    {
                        data[i][j]+=Imagedata[i+m][j+n][0];
                        num++;
                    }

            data[i][j]=data[i][j]/num;

        }
    }

    //copying
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            outImagedata[i][j][0]=data[i][j];

    //computing PSNR
    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((outImagedata[i][j][0]-Imagedata0[i][j][0]),2);
    temp=temp/(double)(size1*size2);
    cout<<"PSNR after applying the mean filter with N=5:    "<<10*log10(255.0*255.0/temp)<<endl;

    if (!(file=fopen(strOutputFile2,"wb")))//writing to the output file
    {
        cout << "Cannot open file: " << strOutputFile2 << endl;
        exit(1);
    }
    fwrite(outImagedata, sizeof(unsigned char), size1*size2*BytesPerPixel, file);
    fclose(file);

    /////////////////***/////////////////
    N=7;

    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            data[i][j]=0;

    for(i=0; i<size1; i++)
    {
        for(j=0; j<size2; j++)
        {
            num=0;
            for(m=-(N-1)/2; m<=(N-1)/2; m++)
                for(n=-(N-1)/2; n<=(N-1)/2; n++)
                    if(i+m>=0&&j+n>=0&&i+m<=size1-1&&j+n<=size2-1)
                    {
                        data[i][j]+=Imagedata[i+m][j+n][0];
                        num++;
                    }
            data[i][j]/=num;

        }
    }

    //copying
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            outImagedata[i][j][0]=data[i][j];

    //computing PSNR
    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((outImagedata[i][j][0]-Imagedata0[i][j][0]),2);
    temp=temp/(double)(size1*size2);
    cout<<"PSNR after applying the mean filter with N=7:    "<<10*log10(255.0*255.0/temp)<<endl<<endl;

    if (!(file=fopen(strOutputFile3,"wb")))//writing to the output file
    {
        cout << "Cannot open file: " << strOutputFile3 << endl;
        exit(1);
    }
    fwrite(outImagedata, sizeof(unsigned char), size1*size2*BytesPerPixel, file);
    fclose(file);


    ///////////////Mean Filter-Guassian///////////////
    N=3;//omega=1

    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            data[i][j]=0;

    for(i=0; i<size1; i++)
    {
        for(j=0; j<size2; j++)
        {
            num=0;
            for(m=-(N-1)/2; m<=(N-1)/2; m++)
                for(n=-(N-1)/2; n<=(N-1)/2; n++)
                    if(i+m>=0&&j+n>=0&&i+m<=size1-1&&j+n<=size2-1)
                    {
                        if(m==0&&n==0)
                        {
                            data[i][j]+=41*Imagedata[i+m][j+n][0];
                            num+=41;
                        }
                        else if((m==1||m==-1)&&(n==1||n==-1))
                        {
                            data[i][j]+=16*Imagedata[i+m][j+n][0];
                            num+=16;
                        }
                        else if(((m==1||m==-1)&&(n==0))||((m==0)&&(n==1||n==-1)))
                        {
                            data[i][j]+=26*Imagedata[i+m][j+n][0];
                            num+=26;
                        }
                    }
            data[i][j]/=num;

        }
    }

    //copying
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            outImagedata[i][j][0]=data[i][j];

    //computing PSNR
    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((outImagedata[i][j][0]-Imagedata0[i][j][0]),2);
    temp=temp/(double)(size1*size2);
    cout<<"PSNR after applying the guassian filter with N=3 Omega=1:    "<<10*log10(255.0*255.0/temp)<<endl;

    if (!(file=fopen(strOutputFile4,"wb")))//writing to the output file
    {
        cout << "Cannot open file: " << strOutputFile4 << endl;
        exit(1);
    }
    fwrite(outImagedata, sizeof(unsigned char), size1*size2*BytesPerPixel, file);
    fclose(file);
    /////////////////***/////////////////
    N=5;//omega=1

    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            data[i][j]=0;

    for(i=0; i<size1; i++)
    {
        for(j=0; j<size2; j++)
        {
            num=0;
            for(m=-(N-1)/2; m<=(N-1)/2; m++)
                for(n=-(N-1)/2; n<=(N-1)/2; n++)
                    if(i+m>=0&&j+n>=0&&i+m<=size1-1&&j+n<=size2-1)
                    {
                        if(m==0&&n==0)
                        {
                            data[i][j]+=41*Imagedata[i+m][j+n][0];
                            num+=41;
                        }
                        else if((m==1||m==-1)&&(n==1||n==-1))
                        {
                            data[i][j]+=16*Imagedata[i+m][j+n][0];
                            num+=16;
                        }
                        else if(((m==1||m==-1)&&(n==0))||((m==0)&&(n==1||n==-1)))
                        {
                            data[i][j]+=26*Imagedata[i+m][j+n][0];
                            num+=26;
                        }
                        else if(((m==-2||m==2)&&(n==-1||n==1))||((m==-1||m==1)&&(n==2||n==-2)))
                        {
                            data[i][j]+=4*Imagedata[i+m][j+n][0];
                            num+=4;
                        }
                        else if(((m==2||m==-2)&&(n==0))||((m==0)&&(n==2||n==-2)))
                        {
                            data[i][j]+=7*Imagedata[i+m][j+n][0];
                            num+=7;
                        }
                        else if((m==2||m==-2)&&(n==-2||n==2))
                        {
                            data[i][j]+=1*Imagedata[i+m][j+n][0];
                            num+=1;
                        }
                    }
            data[i][j]/=num;

        }
    }

    //copying
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            outImagedata[i][j][0]=data[i][j];

    //computing PSNR
    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((outImagedata[i][j][0]-Imagedata0[i][j][0]),2);
    temp=temp/(double)(size1*size2);
    cout<<"PSNR after applying the guassian filter with N=5 Omega=1:    "<<10*log10(255.0*255.0/temp)<<endl;

    if (!(file=fopen(strOutputFile5,"wb")))//writing to the output file
    {
        cout << "Cannot open file: " << strOutputFile5 << endl;
        exit(1);
    }
    fwrite(outImagedata, sizeof(unsigned char), size1*size2*BytesPerPixel, file);
    fclose(file);

    /////////////////***/////////////////

    N=3;//omega=1.5

    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            data[i][j]=0;

    for(i=0; i<size1; i++)
    {
        for(j=0; j<size2; j++)
        {
            num=0;
            for(m=-(N-1)/2; m<=(N-1)/2; m++)
                for(n=-(N-1)/2; n<=(N-1)/2; n++)
                    if(i+m>=0&&j+n>=0&&i+m<=size1-1&&j+n<=size2-1)
                    {
                        if(m==0&&n==0)
                        {
                            data[i][j]+=100*Imagedata[i+m][j+n][0];
                            num+=100;
                        }
                        else if((m==1||m==-1)&&(n==1||n==-1))
                        {
                            data[i][j]+=64*Imagedata[i+m][j+n][0];
                            num+=64;
                        }
                        else if(((m==1||m==-1)&&(n==0))||((m==0)&&(n==1||n==-1)))
                        {
                            data[i][j]+=80*Imagedata[i+m][j+n][0];
                            num+=80;
                        }
                    }
            data[i][j]/=num;

        }
    }

    //copying
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            outImagedata[i][j][0]=data[i][j];

    //computing PSNR
    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((outImagedata[i][j][0]-Imagedata0[i][j][0]),2);
    temp=temp/(double)(size1*size2);
    cout<<"PSNR after applying the guassian filter with N=3 Omega=1.5:    "<<10*log10(255.0*255.0/temp)<<endl;

    if (!(file=fopen(strOutputFile6,"wb")))//writing to the output file
    {
        cout << "Cannot open file: " << strOutputFile6 << endl;
        exit(1);
    }
    fwrite(outImagedata, sizeof(unsigned char), size1*size2*BytesPerPixel, file);
    fclose(file);
    /////////////////***/////////////////
    N=5;
    Oc=1.2;

    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            data[i][j]=0;

    for(i=0; i<size1; i++)
    {
        for(j=0; j<size2; j++)
        {
            num=0;
            for(m=-(N-1)/2; m<=(N-1)/2; m++)
                for(n=-(N-1)/2; n<=(N-1)/2; n++)
                    if(i+m>=0&&j+n>=0&&i+m<=size1-1&&j+n<=size2-1)
                    {
                        data[i][j]+=exp(-((pow(m,2)+pow(n,2))/(2*pow(Oc,2))))*Imagedata[i+m][j+n][0];
                        num+=exp(-((pow(m,2)+pow(n,2))/(2*pow(Oc,2))));

                    }
            data[i][j]/=num;

        }
    }

    //copying
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            outImagedata[i][j][0]=data[i][j];

    //computing PSNR
    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((outImagedata[i][j][0]-Imagedata0[i][j][0]),2);
    temp=temp/(double)(size1*size2);
    cout<<"PSNR after applying the guassian filter with N=5 Omega=1.2:    "<<10*log10(255.0*255.0/temp)<<endl<<endl;

    if (!(file=fopen(strOutputFile7,"wb")))//writing to the output file
    {
        cout << "Cannot open file: " << strOutputFile7 << endl;
        exit(1);
    }
    fwrite(outImagedata, sizeof(unsigned char), size1*size2*BytesPerPixel, file);
    fclose(file);


    ///////////////Bilateral filter///////////////


    N=5;//omega=1.5
    Oc=1.3,Os=200;//200
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            data[i][j]=0;

    for(i=0; i<size1; i++)
    {
        for(j=0; j<size2; j++)
        {
            num=0;
            for(m=-(N-1)/2; m<=(N-1)/2; m++)
                for(n=-(N-1)/2; n<=(N-1)/2; n++)
                    if(i+m>=0&&j+n>=0&&i+m<=size1-1&&j+n<=size2-1)
                    {
                        data[i][j]+=exp(-((pow(m,2)+pow(n,2))/(2*pow(Oc,2)))-(pow(Imagedata[i][j][0]-Imagedata[m][n][0],2)/(2*pow(Os,2))))*Imagedata[i+m][j+n][0];
                        num+=exp(-((pow(m,2)+pow(n,2))/(2*pow(Oc,2)))-(pow(Imagedata[i][j][0]-Imagedata[m][n][0],2)/(2*pow(Os,2))));
                    }
            data[i][j]/=num;

        }
    }

    //copying
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            outImagedata[i][j][0]=data[i][j];

    //computing PSNR
    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((outImagedata[i][j][0]-Imagedata0[i][j][0]),2);
    temp=temp/(double)(size1*size2);
    cout<<"PSNR after applying the bilateral filter with N=5 Oc=1.3 Os=200:    "<<10*log10(255.0*255.0/temp)<<endl<<endl;

    if (!(file=fopen(strOutputFile8,"wb")))//writing to the output file
    {
        cout << "Cannot open file: " << strOutputFile8 << endl;
        exit(1);
    }
    fwrite(outImagedata, sizeof(unsigned char), size1*size2*BytesPerPixel, file);
    fclose(file);

    ///////////////Non Local Mean filter///////////////


    N=7;
    Nn=5;
    h=100;//500
    a=1.4;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            data[i][j]=0;

    for(i=0; i<size1; i++)
    {
        for(j=0; j<size2; j++)
        {
            num=0;
            for(m=-(N-1)/2; m<=(N-1)/2; m++)
                for(n=-(N-1)/2; n<=(N-1)/2; n++)
                    if(i+m>=0&&j+n>=0&&i+m<=size1-1&&j+n<=size2-1)
                    {
                    w=0;
                           for(n1=-(Nn-1)/2; n1<=(Nn-1)/2; n1++)//computing w
                           for(n2=-(Nn-1)/2; n2<=(Nn-1)/2; n2++)
                               if(i+m+n1>=0 && i+m+n1<=size1-1 && j+n+n2>=0 && j+n+n2<=size2-1 &&
                                i+n1>=0 && i+n1<=size1-1 && j+n2>=0 && j+n2<=size2-1 )
                               {
                               w+=exp(-((pow(n1,2)+pow(n2,2))/(2*pow(a,2))))/(sqrt(2*3.14)*a)*pow(Imagedata[i+n1][j+n2][0]-Imagedata[i+m+n1][j+n+n2][0],2);
                               }

                        data[i][j]+=exp(-w/pow(h,2))*Imagedata[i+m][j+n][0];
                        num+=exp(-w/pow(h,2));
                    }
            data[i][j]/=num;

        }
    }

    //copying
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            outImagedata[i][j][0]=data[i][j];

    //computing PSNR
    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((outImagedata[i][j][0]-Imagedata0[i][j][0]),2);
    temp=temp/(double)(size1*size2);
    cout<<"PSNR after applying the non-local mean filter with N=7 Nn=5 h=100 a=1.4:    "<<10*log10(255.0*255.0/temp)<<endl;

    if (!(file=fopen(strOutputFile9,"wb")))//writing to the output file
    {
        cout << "Cannot open file: " << strOutputFile9 << endl;
        exit(1);
    }
    fwrite(outImagedata, sizeof(unsigned char), size1*size2*BytesPerPixel, file);
    fclose(file);


    ///////////////Color Image Denoiseing///////////////
    cout<<"\n\nCOLOR IMAGE DENOISING"<<endl;

    if (!(file=fopen(strInputFile2,"rb")))//reading the input file
    {
        cout << "Cannot open file: " << strInputFile2 <<endl;
        exit(1);
    }
    fread(Imagedata0color, sizeof(unsigned char), size1*size2*BytesPerPixel3, file);
    fclose(file);

    if (!(file=fopen(strInputFile3,"rb")))//reading the input file
    {
        cout << "Cannot open file: " << strInputFile3 <<endl;
        exit(1);
    }
    fread(Imagedatacolor, sizeof(unsigned char), size1*size2*BytesPerPixel3, file);
    fclose(file);

    //computing PSNR
    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((Imagedatacolor[i][j][0]-Imagedata0color[i][j][0]),2);
    temp=temp/(double)(size1*size2);
    cout<<"PSNR of red channel:"<<10*log10(255.0*255.0/temp)<<endl;

    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((Imagedatacolor[i][j][1]-Imagedata0color[i][j][1]),2);
    temp=temp/(double)(size1*size2);
    cout<<"PSNR of green channel:"<<10*log10(255.0*255.0/temp)<<endl;

    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((Imagedatacolor[i][j][2]-Imagedata0color[i][j][2]),2);
    temp=temp/(double)(size1*size2);
    cout<<"PSNR of blue channel:"<<10*log10(255.0*255.0/temp)<<endl;

    /////Medain filter////

    N=7;
    int filter[N*N];//median filter

    for(i=0; i<size1; i++)//red-green-blue channel
    {
        for(j=0; j<size2; j++)
        {
            for(n1=0; n1<N*N; n1++)//clear filter
            {
                filter[n1]=0;
            }
            n2=0;
            for(m=-(N-1)/2; m<=(N-1)/2; m++)//put the elments inside the filter
                for(n=-(N-1)/2; n<=(N-1)/2; n++)
                {
                    if(i+m>=0 && j+n>=0&& i+m<=size1-1 && j+n<=size2-1)
                    {
                        filter[n2]=Imagedatacolor[i+m][j+n][0];
                        n2=n2+1;
                    }
                }
            Imagedatacolor2[i][j][0]=median(filter,n2);


            for(n1=0; n1<N*N; n1++)//clear filter
            {
                filter[n1]=0;
            }
            n2=0;
            for(m=-(N-1)/2; m<=(N-1)/2; m++)//put the elments inside the filter
                for(n=-(N-1)/2; n<=(N-1)/2; n++)
                {
                    if(i+m>=0 && j+n>=0&& i+m<=size1-1 && j+n<=size2-1)
                    {
                        filter[n2]=Imagedatacolor[i+m][j+n][1];
                        n2=n2+1;
                    }
                }
            Imagedatacolor2[i][j][1]=median(filter,n2);

            for(n1=0; n1<N*N; n1++)//clear filter
            {
                filter[n1]=0;
            }
            n2=0;
            for(m=-(N-1)/2; m<=(N-1)/2; m++)//put the elments inside the filter
                for(n=-(N-1)/2; n<=(N-1)/2; n++)
                {
                    if(i+m>=0 && j+n>=0&& i+m<=size1-1 && j+n<=size2-1)
                    {
                        filter[n2]=Imagedatacolor[i+m][j+n][2];
                        n2=n2+1;
                    }
                }
            Imagedatacolor2[i][j][2]=median(filter,n2);
        }
    }




    N=5;//omega=1.5
    Oc=25;

    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            data[i][j]=0;

    for(i=0; i<size1; i++)
    {
        for(j=0; j<size2; j++)
        {
            num=0;
            for(m=-(N-1)/2; m<=(N-1)/2; m++)
                for(n=-(N-1)/2; n<=(N-1)/2; n++)
                    if(i+m>=0&&j+n>=0&&i+m<=size1-1&&j+n<=size2-1)
                    {
                        data[i][j]+=exp(-((pow(m,2)+pow(n,2))/(2*pow(Oc,2))))*Imagedatacolor2[i+m][j+n][0];
                        num+=exp(-((pow(m,2)+pow(n,2))/(2*pow(Oc,2))));

                    }
            data[i][j]/=num;

        }
    }

    //copying
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            outImagedatacolor[i][j][0]=data[i][j];

    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            data[i][j]=0;

    for(i=0; i<size1; i++)
    {
        for(j=0; j<size2; j++)
        {
            num=0;
            for(m=-(N-1)/2; m<=(N-1)/2; m++)
                for(n=-(N-1)/2; n<=(N-1)/2; n++)
                    if(i+m>=0&&j+n>=0&&i+m<=size1-1&&j+n<=size2-1)
                    {
                        data[i][j]+=exp(-((pow(m,2)+pow(n,2))/(2*pow(Oc,2))))*Imagedatacolor2[i+m][j+n][1];
                        num+=exp(-((pow(m,2)+pow(n,2))/(2*pow(Oc,2))));

                    }
            data[i][j]/=num;

        }
    }

    //copying
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            outImagedatacolor[i][j][1]=data[i][j];

    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            data[i][j]=0;

    for(i=0; i<size1; i++)
    {
        for(j=0; j<size2; j++)
        {
            num=0;
            for(m=-(N-1)/2; m<=(N-1)/2; m++)
                for(n=-(N-1)/2; n<=(N-1)/2; n++)
                    if(i+m>=0&&j+n>=0&&i+m<=size1-1&&j+n<=size2-1)
                    {
                        data[i][j]+=exp(-((pow(m,2)+pow(n,2))/(2*pow(Oc,2))))*Imagedatacolor2[i+m][j+n][2];
                        num+=exp(-((pow(m,2)+pow(n,2))/(2*pow(Oc,2))));

                    }
            data[i][j]/=num;

        }
    }

    //copying
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            outImagedatacolor[i][j][2]=data[i][j];

    //computing PSNR
    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((outImagedatacolor[i][j][0]-Imagedata0color[i][j][0]),2);
    temp=temp/(double)(size1*size2);
    cout<<"PSNR of red channel after median and guassian filters:"<<10*log10(255.0*255.0/temp)<<endl;

    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((outImagedatacolor[i][j][1]-Imagedata0color[i][j][1]),2);
    temp=temp/(double)(size1*size2);
    cout<<"PSNR of green channel after median and guassian filters:"<<10*log10(255.0*255.0/temp)<<endl;

    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((outImagedatacolor[i][j][2]-Imagedata0color[i][j][2]),2);
    temp=temp/(double)(size1*size2);
    cout<<"PSNR of blue channel after median and guassian filters:"<<10*log10(255.0*255.0/temp)<<endl;

    N=5;//omega=1.5
    Oc=25,Os=200;//200
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            data[i][j]=0;

    for(i=0; i<size1; i++)
    {
        for(j=0; j<size2; j++)
        {
            num=0;
            for(m=-(N-1)/2; m<=(N-1)/2; m++)
                for(n=-(N-1)/2; n<=(N-1)/2; n++)
                    if(i+m>=0&&j+n>=0&&i+m<=size1-1&&j+n<=size2-1)
                    {
                        data[i][j]+=exp(-((pow(m,2)+pow(n,2))/(2*pow(Oc,2)))-(pow(Imagedatacolor2[i][j][0]-Imagedatacolor2[m][n][0],2)/(2*pow(Os,2))))*Imagedatacolor2[i+m][j+n][0];
                        num+=exp(-((pow(m,2)+pow(n,2))/(2*pow(Oc,2)))-(pow(Imagedatacolor2[i][j][0]-Imagedatacolor2[m][n][0],2)/(2*pow(Os,2))));
                    }
            data[i][j]/=num;

        }
    }

    //copying
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            outImagedatacolor[i][j][0]=data[i][j];

    N=5;//omega=1.5
    Oc=25,Os=200;//200
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            data[i][j]=0;

    for(i=0; i<size1; i++)
    {
        for(j=0; j<size2; j++)
        {
            num=0;
            for(m=-(N-1)/2; m<=(N-1)/2; m++)
                for(n=-(N-1)/2; n<=(N-1)/2; n++)
                    if(i+m>=0&&j+n>=0&&i+m<=size1-1&&j+n<=size2-1)
                    {
                        data[i][j]+=exp(-((pow(m,2)+pow(n,2))/(2*pow(Oc,2)))-(pow(Imagedatacolor2[i][j][1]-Imagedatacolor2[m][n][1],2)/(2*pow(Os,2))))*Imagedatacolor2[i+m][j+n][1];
                        num+=exp(-((pow(m,2)+pow(n,2))/(2*pow(Oc,2)))-(pow(Imagedatacolor2[i][j][1]-Imagedatacolor2[m][n][1],2)/(2*pow(Os,2))));
                    }
            data[i][j]/=num;

        }
    }

    //copying
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            outImagedatacolor[i][j][1]=data[i][j];

    N=5;//omega=1.5
    Oc=25,Os=200;//200
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            data[i][j]=0;

    for(i=0; i<size1; i++)
    {
        for(j=0; j<size2; j++)
        {
            num=0;
            for(m=-(N-1)/2; m<=(N-1)/2; m++)
                for(n=-(N-1)/2; n<=(N-1)/2; n++)
                    if(i+m>=0&&j+n>=0&&i+m<=size1-1&&j+n<=size2-1)
                    {
                        data[i][j]+=exp(-((pow(m,2)+pow(n,2))/(2*pow(Oc,2)))-(pow(Imagedatacolor2[i][j][2]-Imagedatacolor2[m][n][2],2)/(2*pow(Os,2))))*Imagedatacolor2[i+m][j+n][2];
                        num+=exp(-((pow(m,2)+pow(n,2))/(2*pow(Oc,2)))-(pow(Imagedatacolor2[i][j][2]-Imagedatacolor2[m][n][2],2)/(2*pow(Os,2))));
                    }
            data[i][j]/=num;

        }
    }

    //copying
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            outImagedatacolor[i][j][2]=data[i][j];


    //computing PSNR
    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((outImagedatacolor[i][j][0]-Imagedata0color[i][j][0]),2);
    temp=temp/(double)(size1*size2);
    cout<<"PSNR of red channel after median and bilateral filters:"<<10*log10(255.0*255.0/temp)<<endl;

    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((outImagedatacolor[i][j][1]-Imagedata0color[i][j][1]),2);
    temp=temp/(double)(size1*size2);
    cout<<"PSNR of green channel after median and bilateral filters:"<<10*log10(255.0*255.0/temp)<<endl;

    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((outImagedatacolor[i][j][2]-Imagedata0color[i][j][2]),2);
    temp=temp/(double)(size1*size2);
    cout<<"PSNR of blue channel after median and bilateral filters:"<<10*log10(255.0*255.0/temp)<<endl;


    N=7;
    Nn=5;
    h=60;
    a=1.9;//1.4
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            data[i][j]=0;

    for(i=0; i<size1; i++)
    {
        for(j=0; j<size2; j++)
        {
            num=0;
            for(m=-(N-1)/2; m<=(N-1)/2; m++)
                for(n=-(N-1)/2; n<=(N-1)/2; n++)
                    if(i+m>=0&&j+n>=0&&i+m<=size1-1&&j+n<=size2-1)
                    {
                    w=0;
                           for(n1=-(Nn-1)/2; n1<=(Nn-1)/2; n1++)//computing w
                           for(n2=-(Nn-1)/2; n2<=(Nn-1)/2; n2++)
                               if(i+m+n1>=0 && i+m+n1<=size1-1 && j+n+n2>=0 && j+n+n2<=size2-1 &&
                                i+n1>=0 && i+n1<=size1-1 && j+n2>=0 && j+n2<=size2-1 )
                               {
                               w+=exp(-((pow(n1,2)+pow(n2,2))/(2*pow(a,2))))/(sqrt(2*3.14)*a)*pow(Imagedatacolor2[i+n1][j+n2][0]-Imagedatacolor2[i+m+n1][j+n+n2][0],2);
                               }

                        data[i][j]+=exp(-w/pow(h,2))*Imagedatacolor2[i+m][j+n][0];
                        num+=exp(-w/pow(h,2));
                    }
            data[i][j]/=num;

        }
    }

    //copying
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            outImagedatacolor[i][j][0]=data[i][j];

    N=7;
    Nn=5;
    h=80;//500
    a=1.4;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            data[i][j]=0;

    for(i=0; i<size1; i++)
    {
        for(j=0; j<size2; j++)
        {
            num=0;
            for(m=-(N-1)/2; m<=(N-1)/2; m++)
                for(n=-(N-1)/2; n<=(N-1)/2; n++)
                    if(i+m>=0&&j+n>=0&&i+m<=size1-1&&j+n<=size2-1)
                    {
                    w=0;
                           for(n1=-(Nn-1)/2; n1<=(Nn-1)/2; n1++)//computing w
                           for(n2=-(Nn-1)/2; n2<=(Nn-1)/2; n2++)
                               if(i+m+n1>=0 && i+m+n1<=size1-1 && j+n+n2>=0 && j+n+n2<=size2-1 &&
                                i+n1>=0 && i+n1<=size1-1 && j+n2>=0 && j+n2<=size2-1 )
                               {
                               w+=exp(-((pow(n1,2)+pow(n2,2))/(2*pow(a,2))))/(sqrt(2*3.14)*a)*pow(Imagedatacolor2[i+n1][j+n2][1]-Imagedatacolor2[i+m+n1][j+n+n2][1],2);
                               }

                        data[i][j]+=exp(-w/pow(h,2))*Imagedatacolor2[i+m][j+n][1];
                        num+=exp(-w/pow(h,2));
                    }
            data[i][j]/=num;

        }
    }

    //copying
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            outImagedatacolor[i][j][1]=data[i][j];

    N=7;
    Nn=5;
    h=80;//500
    a=1.7;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            data[i][j]=0;

    for(i=0; i<size1; i++)
    {
        for(j=0; j<size2; j++)
        {
            num=0;
            for(m=-(N-1)/2; m<=(N-1)/2; m++)
                for(n=-(N-1)/2; n<=(N-1)/2; n++)
                    if(i+m>=0&&j+n>=0&&i+m<=size1-1&&j+n<=size2-1)
                    {
                    w=0;
                           for(n1=-(Nn-1)/2; n1<=(Nn-1)/2; n1++)//computing w
                           for(n2=-(Nn-1)/2; n2<=(Nn-1)/2; n2++)
                               if(i+m+n1>=0 && i+m+n1<=size1-1 && j+n+n2>=0 && j+n+n2<=size2-1 &&
                                i+n1>=0 && i+n1<=size1-1 && j+n2>=0 && j+n2<=size2-1 )
                               {
                               w+=exp(-((pow(n1,2)+pow(n2,2))/(2*pow(a,2))))/(sqrt(2*3.14)*a)*pow(Imagedatacolor2[i+n1][j+n2][2]-Imagedatacolor2[i+m+n1][j+n+n2][2],2);
                               }

                        data[i][j]+=exp(-w/pow(h,2))*Imagedatacolor2[i+m][j+n][2];
                        num+=exp(-w/pow(h,2));
                    }
            data[i][j]/=num;

        }
    }

    //copying
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            outImagedatacolor[i][j][2]=data[i][j];

    //computing PSNR
    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((outImagedatacolor[i][j][0]-Imagedata0color[i][j][0]),2);
    temp=temp/(double)(size1*size2);
    cout<<"PSNR of red channel after median and NLM filters:"<<10*log10(255.0*255.0/temp)<<endl;

    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((outImagedatacolor[i][j][1]-Imagedata0color[i][j][1]),2);
    temp=temp/(double)(size1*size2);
    cout<<"PSNR of green channel after median and NLM filters:"<<10*log10(255.0*255.0/temp)<<endl;

    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((outImagedatacolor[i][j][2]-Imagedata0color[i][j][2]),2);
    temp=temp/(double)(size1*size2);
    cout<<"PSNR of blue channel after median and NLM filters:"<<10*log10(255.0*255.0/temp)<<endl;

    if (!(file=fopen(strOutputFile10,"wb")))//writing to the output file
    {
        cout << "Cannot open file: " << strOutputFile10 << endl;
        exit(1);
    }
    fwrite(outImagedatacolor, sizeof(unsigned char), size1*size2*BytesPerPixel3, file);
    fclose(file);

    ///////////////Shot Noise///////////////
    cout<<"\n\nSHOT NOISE REMOVAL"<<endl;

    if (!(file=fopen(strInputFile4,"rb")))//reading the input file
    {
        cout << "Cannot open file: " << strInputFile4 <<endl;
        exit(1);
    }
    fread(Imagedata0, sizeof(unsigned char), size1*size2*BytesPerPixel, file);
    fclose(file);

    if (!(file=fopen(strInputFile5,"rb")))//reading the input file
    {
        cout << "Cannot open file: " << strInputFile5 <<endl;
        exit(1);
    }
    fread(Imagedata, sizeof(unsigned char), size1*size2*BytesPerPixel, file);
    fclose(file);

    //computing PSNR
    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((Imagedata[i][j][0]-Imagedata0[i][j][0]),2);
    temp=temp/(double)(size1*size2);
    cout<<10*log10(255.0*255.0/temp)<<endl;

   for(i=0; i<size1; i++)
    {
        for(j=0; j<size2; j++)
        {
            data[i][j]=2*sqrt(Imagedata[i][j][0]+3/8);
        }
    }


    N=3;
    Oc=.8;

    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            data2[i][j]=0;

    for(i=0; i<size1; i++)
    {
        for(j=0; j<size2; j++)
        {
            num=0;
            for(m=-(N-1)/2; m<=(N-1)/2; m++)
                for(n=-(N-1)/2; n<=(N-1)/2; n++)
                    if(i+m>=0&&j+n>=0&&i+m<=size1-1&&j+n<=size2-1)
                    {
                        data2[i][j]+=exp(-((pow(m,2)+pow(n,2))/(2*pow(Oc,2))))*data[i+m][j+n];
                        num+=exp(-((pow(m,2)+pow(n,2))/(2*pow(Oc,2))));

                    }
            data2[i][j]/=num;

        }
    }


    for(i=0; i<size1; i++)
    {
        for(j=0; j<size2; j++)
        {
            Imagedata[i][j][0]=pow(data2[i][j],2)/4.0-3/8;
        }
    }

    //computing PSNR
    temp=0;
    for(i=0; i<size1; i++)
        for(j=0; j<size2; j++)
            temp+=pow((Imagedata[i][j][0]-Imagedata0[i][j][0]),2);
    temp=temp/(double)(size1*size2);
    cout<<10*log10(255.0*255.0/temp)<<endl;

    if (!(file=fopen(strOutputFile11,"wb")))//writing to the output file
    {
        cout << "Cannot open file: " << strOutputFile11 << endl;
        exit(1);
    }
    fwrite(Imagedata, sizeof(unsigned char), size1*size2*BytesPerPixel, file);
    fclose(file);


    return 0;
}
