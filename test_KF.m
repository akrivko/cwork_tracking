clear
clc


result_file = 'C:\Users\ART\Documents\GitHub\cwork_tracking\out.avi';
writer = avifile(result_file, 'compression', 'None');

video = mmreader('C:\Users\ART\Documents\GitHub\cwork_tracking\test_video.avi');
video_width  = video.Width;
video_height = video.Height;
frameRate = video.FrameRate;
numOfFrames = video.NumberOfFrames;
frameNo = 400;
frame = read( video, frameNo);
frame = im2double(frame);
frame_gray1 = zeros(video_height, video_width);
for i = 1:1:video_height
    for j = 1:1:video_width
        frame_gray1(i,j) = (frame(i,j,1) + frame(i,j,2) + frame(i,j,3))/(3) ; 
    end;
end;




for number_frame = 401:1:500
    
    frame = read( video, number_frame);
    frame = im2double(frame);
    frame_gray2 = zeros(video_height, video_width);
    for i = 1:1:video_height
        for j = 1:1:video_width
            frame_gray2(i,j) = (frame(i,j,1) + frame(i,j,2) + frame(i,j,3))/(3) ; 
        end;
    end;
    
    RI = frame_gray1;
    CI = frame_gray2;

    [height,width] = size(RI);
    
    res2video=zeros();
    
    ResI = frame_gray2;
    
    for i = 9:8:height-20
        for j = 9:8:width-20
            MRI = calc_mean(RI, i,j,i+8,j+8);
            MCI = calc_mean(CI, i-8,j-8,i+8,j+8);
            KFmax = 0;
            imax = 0;
            jmax = 0;
            for d_i = -8:1:8
                for d_j = -8:1:8
                    KF = 0;
                    for k = 1:1:8
                        for m = 1:1:8                            
%                             KF = KF + abs(RI(i+k,j+m)-CI(i+k+d_i, j+m+d_j)); %(RI(i+k,j+m)-MRI)*(CI(i+k+d_i, j+m+d_j)-MCI);
                              KF = KF + (RI(i+k,j+m)-MRI)*(CI(i+k+d_i, j+m+d_j)-MCI);
                        end;
                    end;
                    if (KF > KFmax)
                        KFmax = KF;
                        imax = d_i;
                        jmax = d_j;
                    end;
                end;
            end;
            if (KFmax > 0.5)
    %             ResI(i+4,j+4) = 0.5;
    %             ResI(i+4+imax,j+4+jmax) = 1;           
                ResI = line2(ResI, 1, i+4, i+4+imax, j+4, j+4+jmax );
            end;
        end;
    end;
    number_frame    
    frame_gray1 = frame_gray2;
    
    for l=1:1:height
        for m=1:1:width
            res2video(l,m,1) = ResI(l,m);
            res2video(l,m,2) = ResI(l,m);
            res2video(l,m,3) = ResI(l,m);
        end;
    end;
    writer = addframe(writer, res2video);
end;


writer = close(writer);

s = '������'









    













