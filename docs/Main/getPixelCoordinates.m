% IMPORTANT
% DO VID = WEBCAM BEFORE STARTING

%function [convertArrayX, convertArrayY] = getPixelCoordinates(data)
arrayOfX = {}; % Hold all the x pixel coordinates of edges
arrayOfY = {}; % Hold all the y pixel coordinates of edges

skippedArrayX = {};     % Hold every other x pixel coordinates of edges
skippedArrayY = {};     % Hold every other y pixel coordinates of edges

convertArrayY = {};     % Hold x coordinate converted to robot workspace
convertArrayX = {};     % Hold y coordinate converted to robot workspace

%data = snapshot(vid);    % Take a single image

[rows, columns, z]=size(data); % Get resolution of image

bwData = im2bw(data);    % Convert image to black and white

%Use a median filter to filter out noise
diff_im = medfilt2(bwData, [3 3]);
   
edges = edge(diff_im);  % Get edges of images

% Check every element for a 1(White pixel)
for r = 1: rows
      for c = 1: columns
        % Save x and y coordinates in these arrays dynamically
        if edges(r,c) == 1
            arrayOfX = [arrayOfX; r];
            arrayOfY = [arrayOfY; c];
        end

      end
       
end
numOfPixels = size(arrayOfX);   % Get total number of white pixels

arrayOfX = cell2mat(arrayOfX);  % Convert to numeric cell arrays
arrayOfY = cell2mat(arrayOfY);  % Convert to numeric cell arrays
  
% Perform x and y conversions to robot workspace
for l = 1: numOfPixels
   convertArrayX = [convertArrayX; ((arrayOfX(l)-320) * 5 / 320)];  % 320 used as center or 0 line for x axis
   convertArrayY = [convertArrayY; (arrayOfY(l) * 6 / 480)];

end
   
convertArrayX = cell2mat(convertArrayX);
convertArrayY = cell2mat(convertArrayY);

%end

% skip = 14;  % Skip every other # of pixels
% 
% for k = 1:numOfPixels
%    if mod(k, skip) == 1 % Starting from 1 skip every # pixel
%        skippedArrayX = [skippedArrayX; arrayOfX(k,1)];
%        skippedArrayY = [skippedArrayY; arrayOfY(k,1)];
%    end    
% end
% % Just output number of pixels seen, and then number of pixels after
% % skipping
% numOfPixels
% numOfPixels / skip
% 
% skippedArrayX = cell2mat(skippedArrayX);
% skippedArrayY = cell2mat(skippedArrayY);
% 
% subplot(2,2,1); title('Regular edges'); imshow(edges)
% subplot(2,2,2); title('Regular x y '); scatter(arrayOfY, arrayOfX, '.')
% set(gca,'Ydir','reverse')
% subplot(2,2,3); title('Skipped picture'); scatter(skippedArrayY, skippedArrayX, '.')
% set(gca,'Ydir','reverse')
% subplot(2,2,4); scatter(convertArrayY, convertArrayX)
% set(gca,'Ydir','reverse')


   


%    hold on
%    for i = 1:size(arrayOfX)
%        plot(arrayOfX(i,1), arrayOfY(i,1))
%    end
%    hold off
%    subplot(2,2,1); scatter(arrayOfY, arrayOfX)
%    subplot(2,2,2); scatter(skippedArrayY, skippedArrayX)
%
%    subplot(2,2,1); imshow(data)
%    subplot(2,2,2); imshow(bwData)
%    subplot(2,2,3); imshow(diff_im)
%    subplot(2,2,4); imshow(edges)
   
