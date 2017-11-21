a = imaqhwinfo;
[camera_name, camera_id, format] = getCameraInfo(a);
% Ugh global variables
global numClicks;       % Used for keeping track number of clicks
global xPos yPos;       % Used to get rectangle coordinates

% Initialize number of clicks to 0
setGlobalNumClicks(0);

% Capture the video frames using the videoinput function
% You have to replace the resolution & your installed adaptor name.
vid = videoinput(camera_name, camera_id, format);

% Set the properties of the video object
set(vid, 'FramesPerTrigger', Inf);
set(vid, 'ReturnedColorspace', 'rgb')
vid.FrameGrabInterval = 2;              % Get images faster though if processing is too much it's slow

% Get the resolution in a 1x2 matrix
vidSize = vid.VideoResolution; 

%start the video aquisition here
start(vid)

% Create a Videoplayer object
huePlayer = vision.VideoPlayer('Position', [100 100 [vidSize(1,1), vidSize(1,2)]+30]);

% Create a figure with title
figure, title('Demo 4');

% Get currect Figure (GCF) and create a callback interrupt
set(gcf,'WindowButtonDownFcn',@mouseClickCallBack)

% Set a loop that stop after 100 frames of aquisition
while(vid.FramesAcquired<=150)
    
    % Get the snapshot of the current frame
    data = getsnapshot(vid);
    % Convert snapshot image to hsv for camshift
    [huechannel,~,~] = rgb2hsv(data);
    hold on
    
    % These will check if numClicks have been done yet
    if numClicks == 1
        % Get starting point with values from moustMotion callback global
        % variables
        startPnt = [xPos yPos];
        % Display the image
        imshow(data)
    else
        % Display the image
        imshow(data)
    end
    
    % If numClicks == 2 create a rectangle at these points
    if numClicks == 2
        % Get end point click position from mouse click call back
        endPnt = [xPos yPos];
        % Make a rectangle [x y w h] at x,y with width w and height h
        rectangle('Position', [startPnt(1) startPnt(2) (endPnt(1)-startPnt(1)) (endPnt(2)-startPnt(2))],'EdgeColor','r','LineWidth',2)
        imshow(data);
    end
    
    % Use a video player object so that I can keep the figure
    step(huePlayer, huechannel);
    
    hold off
end
% Both the loops end here.

% Stop the video aquisition.
stop(vid);

% Flush all the image data stored in the memory buffer.
flushdata(vid);


% Clear all variables
clear all
sprintf('%s','That was all about Image tracking, Guess that was pretty easy :) ')






