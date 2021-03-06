clear
clc
% 
% video = mmreader('test_video.mp4');
% 
% width  = video.Width;
% 
% height = video.Height;
% 
% frameRate = video.FrameRate;
% 
% numOfFrames = video.NumberOfFrames;
% 
% frameNo = 400;
% frame = read( video, frameNo);
% 
% frame = im2double(frame);
% for i = 1:1:height
%     for j = 1:1:width
%         frame2(i,j) = (frame(i,j,1) + frame(i,j,2) + frame(i,j,3))/(3) ; 
%     end;
% end;
% 
% imshow(frame2);
% imsave

% nFrames = 200;
% 
% mov(1:nFrames) = struct('cdata', [], 'colormap', []);
% 
% for k = 1 : nFrames
%     mov(k).cdata = read(video, k);
% end
% 
% hf = figure;
% set(hf, 'position', [150 150 video.Width video.Height])
% movie(hf, mov, 1, video.FrameRate);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filename = 'F:\MA\Alberto Gallazzi - TACFIT Survival\1.avi';
result_file = 'C:\Users\ART\Documents\GitHub\tracking\out.avi';
video = mmreader(filename);
writer = avifile(result_file, 'compression', 'None');
se = strel('rectangle', [3 3]);

for k = 700:1:900
    frame = read(video, k);
%     for i = 1:1:360
%         for j = 1:1:450
%             frame_gray2(i,j) = (frame(i,j,1) + frame(i,j,2) + frame(i,j,3))/(3) ; 
%         end;
%     end;
%     for l=1:1:height
%         for m=1:1:width
%             res2video(l,m,1) = frame_gray2(l,m);
%             res2video(l,m,2) = frame_gray2(l,m);
%             res2video(l,m,3) = frame_gray2(l,m);
%         end;
%     end;
frame = imdilate(frame, se);
    writer = addframe(writer, frame);
end;

writer = close(writer);

s = '������'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% filename = 'F:\MA\Alberto Gallazzi - TACFIT Survival\1.avi';
% video = mmreader(filename);
% nFrames = 200;
% 
% % �������������� ��������� � ������� ����� ��������� ����������
% mov(1:nFrames) = struct('cdata', [], 'colormap', []);
% 
% % ������ � ������������ ������ 200 ������ �����
% se = strel('rectangle', [3 3]);
% for k = 1 : nFrames
%     frame = read(video, k);
%     mov(k).cdata = imdilate(frame, se);
% end
% 
% 
% movie2avi(mov, 'C:\Users\ART\Documents\GitHub\tracking\out.avi', 'compression', 'Cinepak', 'fps', 25);
